/****************************************************************************
* Title                 :   DHT11  DRIVER
* Filename              :   Dht11.c
* Author                :   SuperNach
* Origin Date           :   20/08/2021
* Version               :   1.0.0
* Compiler              :   Cosmic C
* Target                :   STM8
* Copyright             :   
* All Rights Reserved
*
* AQUI VA DECLARACIONES DERECHOS
*
*******************************************************************************/
/****************************************************************************
* Doxygen C Template
* Copyright (c) 2013 - Jacob Beningo - All Rights Reserved
*
* Feel free to use this Doxygen Code Template at your own risk for your own
* purposes.  The latest license and updates for this Doxygen C template can be
* found at www.beningo.com or by contacting Jacob at jacob@beningo.com.
*
* For updates, free software, training and to stay up to date on the latest
* embedded software techniques sign-up for Jacobs newsletter at
* http://www.beningo.com/814-2/
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Template.
*
*****************************************************************************/
/*************** SOURCE REVISION LOG *****************************************
*
*    Date    Version   Author         Description
*  20/08/21   1.0.0   SuperNach       Initial Release.
*  
*
*******************************************************************************/
/** @file Dht11.h
 *  @brief Configura y proporciona acceso a la lectura del sensor de temperatura
 *         y humedad DHT11
 */

/** @addtogroup DRIVERS
  * @{
  */
/** @addtogroup DHT11
  * @{
  */
/******************************************************************************
* Includes
*******************************************************************************/
#include <dht11.h>

/******************************************************************************
* Module Preprocessor Constants
*******************************************************************************/

/******************************************************************************
* Module Preprocessor Macros
*******************************************************************************/

/******************************************************************************
* Module Typedefs
*******************************************************************************/

/******************************************************************************
* Module Variable Definitions
*******************************************************************************/

/******************************************************************************
* Function Prototypes
*******************************************************************************/

static @inline uint8_t leerByte( DHT11_t_ptr dht11 )
{
	uint8_t contador = 0;
	uint8_t temp = 0;
	uint8_t bitLeido = 0;
	
	for( contador; contador < 8; contador++ )
	{
		Timeout_Start( dht11->Timeout, TIMEOUT_1MS );
		while( !NHALgpio_Read( &dht11->Config.HW ) && ( dht11->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) ) //Espera nuevo bit
		{
		
		}
		if( dht11->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
		{
			dht11->Datos.Estado = dht11_TIMEOUT;
		}
		Timeout_Stop( dht11->Timeout );
		
		if( dht11->Datos.Estado != dht11_TIMEOUT )
		{
			_delay_us( 40 ); //Espero para comprobar nivel de la gpio +30us = 1 ; -30us = 0
	
			bitLeido = 0;
			if( NHALgpio_Read( &dht11->Config.HW ) )
			{
				bitLeido = 1;
			}
			else
			{
				bitLeido = 0;
			}
		
			temp |= bitLeido;
			if( contador < 7 )
			{
				temp <<=  1;
			}
			
			while( NHALgpio_Read( &dht11->Config.HW ) ) //Si el bit=1 espero a que baje señal
			{
			
			}
		}
	}
	
	return temp;
}

static @inline bool dht11_ComenzarTransmision( DHT11_t_ptr sensor )
{
	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
	NHALgpio_Init( &sensor->Config.HW ); 
	
	NHALgpio_Write( &sensor->Config.HW, false );
	
	sensor->Datos.Estado = dht11_COMUNICANDO;
	_delay_ms( 18 ); //Espero tiempo puesta en marcha dht11
	
	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_IN_PU_NO_IT); //Configuro como entrada para leer
	NHALgpio_Init( &sensor->Config.HW ); 
	_delay_us( 40 );
	
	Timeout_Start( sensor->Timeout, TIMEOUT_1MS );
	while( !NHALgpio_Read( &sensor->Config.HW ) && ( sensor->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) )
	{
		sensor->Datos.Estado = dht11_ESPERA_BAJO;
	}
	
	if( sensor->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
	{
		sensor->Datos.Estado = dht11_TIMEOUT;
	}
	Timeout_Stop( sensor->Timeout );

	
	if( sensor->Datos.Estado != dht11_TIMEOUT )
	{
		Timeout_Start( sensor->Timeout, TIMEOUT_1MS );
		while( NHALgpio_Read( &sensor->Config.HW ) && ( sensor->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) )
		{
			sensor->Datos.Estado = dht11_ESPERA_ALTO;
		}
		if( sensor->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
		{
			sensor->Datos.Estado = dht11_TIMEOUT;
		}
		Timeout_Stop( sensor->Timeout );
	
		if( sensor->Datos.Estado != dht11_TIMEOUT )
		{
			sensor->Datos.Estado = dht11_CONEXION_OK;
			return true;
		}
		else
		{
			return false;
		}
	}
	else
	{
		return false;
	}
}

static @inline DHT11_SI_t dht11_LeerDatos( DHT11_t_ptr sensor )
{
	uint16_t checkCRC = 0;
	uint8_t mask = 0b11111111;
	
	DHT11_SI_t semilla = { 0, 0, 0, 0, 0 };
	
	sensor->Datos.Estado = dht11_MIDIENDO_H;
	semilla.H_Entero = leerByte( sensor );
	
	sensor->Datos.Estado = dht11_MIDIENDO_H;
	semilla.H_Decimal = leerByte( sensor );
	
	sensor->Datos.Estado = dht11_MIDIENDO_T;
	semilla.T_Entero = leerByte( sensor );
	
	sensor->Datos.Estado = dht11_MIDIENDO_T;
	semilla.T_Decimal = leerByte( sensor );
	
	semilla.CRC = leerByte( sensor );
	
	checkCRC = semilla.H_Entero + semilla.H_Decimal + semilla.T_Entero + semilla.T_Decimal;
	checkCRC &= mask;
	
	if( checkCRC == semilla.CRC )
	{
		sensor->Datos.Estado = dht11_LECTURA_OK;
		return semilla;
	}
	else
	{
		sensor->Datos.Estado = dht11_FALLO_AL_LEER;
		return semilla;
	}
}

static @inline void dht11_CerrarConexion( DHT11_t_ptr sensor )
{
	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
	NHALgpio_Init( &sensor->Config.HW );
	
	NHALgpio_Write( &sensor->Config.HW, true );
	
	if( sensor->Datos.Estado == dht11_CERRANDO_CONEXION )
	{
		sensor->Datos.Estado = dht11_SLEEP;
	}	
}

/******************************************************************************
* Function : DHT11_Init()
*//**
* \b Description:
*
* Inicializa valores y funciones del sensor
*
* PRE-CONDITION: Clock habilitado
* PRE-CONDITION: Configuracion de la gpio creada
* PRE-CONDITION: funcion callback d electura creada
*
* POST-CONDITION: El sensor esta listo para usarse
* 
* @param			Sensor a inicializar
* @param			Funcion callback de lectura
*
* @return 		void
*
* \b Example Ejemplo:
* @code
*		DHT11_Init( &dht11, &dht11_Lectura );
* @endcode
*
* @see DHT11_t
* @see DHT11_fPtr
*
* <br><b> - CHANGELOG - </b>
*
* <table align="left" style="width:800px">
* <tr><td> Fecha       </td><td> Software Version </td><td> Creador </td><td> Descripcion </td></tr>
* <tr><td> 20/08/2021  </td><td> 1.0.0            </td><td> SN      </td><td> Primera edicion </td></tr>
* </table><br><br>
* <hr>
*
*******************************************************************************/
void DHT11_Init( DHT11_t_ptr dht11, DHT11_fPtr Lectura, Timeout_t_ptr Timeout )
{
	dht11->Lectura = Lectura;
	
	dht11->Timeout = Timeout;
	
	dht11->Datos.UltimaLectura.CRC = 0;
	dht11->Datos.UltimaLectura.T_Decimal = 0;
	dht11->Datos.UltimaLectura.T_Entero = 0;
	dht11->Datos.UltimaLectura.H_Decimal = 0;
	dht11->Datos.UltimaLectura.H_Entero = 0;
	
	NHALgpioConfig_SetType( &dht11->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
	NHALgpio_Init( &dht11->Config.HW );
	
	NHALgpio_Write( &dht11->Config.HW, true );
	
	dht11->Datos.Estado = dht11_INICIALIZADO;
	
}

/******************************************************************************
* Function : dht11_Lectura(()
*//**
* \b Description:
*
* Realiza y devuelve el valor de la lectura de temperatura y humedad
*
* PRE-CONDITION: Dht11 inicializado
* 
*
* POST-CONDITION: Lectura valida o fallo
* 
* @param			Sensor sobre el que realizar la lectura
*
* @return 		Lectura
*
* \b Example Ejemplo:
* @code
*		DHT11_Init( &dht11, &dht11_Lectura );
*		dht11.Datos.UltimaLectura = dht11.Lectura( &dht11 );
* @endcode
*
* @see DHT11_SI_t
* @see DHT11_t
*
* <br><b> - CHANGELOG - </b>
*
* <table align="left" style="width:800px">
* <tr><td> Fecha       </td><td> Software Version </td><td> Creador </td><td> Descripcion </td></tr>
* <tr><td> 20/08/2021  </td><td> 1.0.0            </td><td> SN      </td><td> Primera edicion </td></tr>
* </table><br><br>
* <hr>
*
*******************************************************************************/
DHT11_SI_t dht11_Lectura( DHT11_t_ptr dht11 )
{
	DHT11_SI_t lectura = { 0, 0, 0, 0, 0 };
	
	if( dht11_ComenzarTransmision( dht11 ) )
	{
		lectura = dht11_LeerDatos( dht11 );
		dht11_CerrarConexion( dht11 );
		
		return lectura;
	}
	else
	{
		dht11->Datos.Estado = dht11_FALLO_AL_COMUNICAR;
		dht11_CerrarConexion( dht11 );
		
		return lectura;
	}
}


/**
  * @}
  */
/**
  * @}
  */	





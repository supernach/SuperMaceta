/****************************************************************************
* Title                 :   HX711  DRIVER
* Filename              :   Hx711.c
* Author                :   SuperNach
* Origin Date           :   9/09/2021
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
*  9/09/21   1.0.0   SuperNach       Initial Release.
*  
*
*******************************************************************************/
/** @file Hx711.c
 *  @brief Configura y proporciona acceso a la lectura del sensor adc de 24 bits
 */
/******************************************************************************
* Includes
*******************************************************************************/
#include <hx711.h>

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
static @inline void initPtrFunciones( HX711_t_ptr hx711, HX711_fPtr Lectura, HX711_fPtr Tarar )
{
	hx711->Lectura = Lectura;
	hx711->Tarar = Tarar;
}

static @inline void initVariables( HX711_t_ptr hx711 )
{
	hx711->Datos.UltimaLectura = 0;
	hx711->Config.ValorTara = 0;
	hx711->Config.ValorConversion = 1;
	hx711->Config.Ganancia = CHANNELA_128;
}

static @inline void initDOUT( Gpio_Config_t* dout )
{
	NHALgpioConfig_SetType( dout,GPIO_MODE_IN_PU_NO_IT );
	NHALgpio_Init( dout );
}

static @inline void initPDSCK( Gpio_Config_t* pdsck )
{
	NHALgpioConfig_SetType( pdsck, GPIO_MODE_OUT_PP_LOW_FAST );
	NHALgpio_Init( pdsck );
}

static @inline void chequearValorConversion( HX711_t_ptr hx711 )
{
	if( ( hx711->Config.ValorConversion ) == 0 )
	{
		hx711->Config.ValorConversion = 1;
		hx711->Datos.Estado = SINVALORCONVERSION;
	}
	else
	{
		hx711->Datos.Estado = INICIALIZADO;
	}
}

static @inline void aDormir( HX711_t_ptr hx711 )
{
	NHALgpio_Write( &hx711->Config.PD_SCK, true );
	_delay_us( HX711_TIEMPOCLOCKSLEEP );
	
	if( hx711->Datos.Estado != SINVALORCONVERSION )
	{
		hx711->Datos.Estado = SLEEP;
	}
	else
	{
	}
}

static @inline void pulsoReloj( HX711_t_ptr hx711, bool estado )
{
	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
	_delay_us( HX711_TIEMPOCLOCK );
}

static @inline void fijarGanancia( HX711_t_ptr hx711 )
{
	switch( hx711->Config.Ganancia )
	{
		case CHANNELA_128:
			pulsoReloj( hx711, true );
			pulsoReloj( hx711, false );
		break;
		
		case CHANNELA_64:
			pulsoReloj( hx711, true );
			pulsoReloj( hx711, false );
			
			pulsoReloj( hx711, true );
			pulsoReloj( hx711, false );
			
			pulsoReloj( hx711, true );
			pulsoReloj( hx711, false );
		break;
		
		case CHANNELB_32:
			pulsoReloj( hx711, true );
			pulsoReloj( hx711, false );
			
			pulsoReloj( hx711, true );
			pulsoReloj( hx711, false );
		break;
		default:
		
		;
	}
}

static @inline void esperoDatosDisponibles( HX711_t_ptr hx711 )
{
	if( hx711->Timeout != NULL )
	{
		Timeout_Start( hx711->Timeout, 40 );
		while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) || ( hx711->Timeout->Config.Notificacion( ) == 0 ) )
		{
		
		}
		
		if( hx711->Timeout->Config.Notificacion( ) )
		{
			hx711->Datos.Estado = TIMEOUT;
		}
		Timeout_Stop( hx711->Timeout );
	}
	else
	{
		while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) )
		{
		
		}
	}
	_delay_us( HX711_TIEMPOCLOCK );
}

static @inline uint32_t leer( HX711_t_ptr hx711 )
{
	uint32_t semilla = 0;
	uint8_t contadorBucle = 0;
	
	if( hx711->Datos.Estado != SINVALORCONVERSION )
	{
		// Despierto el chip
		pulsoReloj( hx711, false );
		
		/*** Inicio recepcion **/
		esperoDatosDisponibles( hx711 );
	
		/*** Lectura de la trama 24 bits **/
		while( contadorBucle < HX711_LONGITUDTRAMA ) 
		{
			// Señal reloj en alto para iniciar recepcion  bit
			pulsoReloj( hx711, true );
			
			// Agregamos el estado del nuevo bit a la trama
			semilla |= NHALgpio_Read( &hx711->Config.DOUT );
			semilla <<= 1;
		
			contadorBucle++;
			
			// Señal reloj a low para finalizar recepcion del bit
			pulsoReloj( hx711, false );
		}
		
		fijarGanancia( hx711 );
		
		if( hx711->Datos.Estado != TIMEOUT )
		{
			hx711->Datos.Estado = NUEVA_LECTURA;
		}
	}
		return semilla;
}

/******************************************************************************
* Function : HX711_Init()
*//**
* \b Description:
*
* Inicializa valores y funciones del sensor
*
* PRE-CONDITION: Clock habilitado
* PRE-CONDITION: Configuracion de la gpio creada
* PRE-CONDITION: funcion callback de lectura creada
* PRE-CONDITION: funcion callback de Tara creada
*
* POST-CONDITION: El sensor esta listo para usarse
* 
* @param			Sensor a inicializar
* @param			Funcion callback de lectura
* @param			Funcion callback de Tara
*
* @return 		void
*
* \b Example Ejemplo:
* @code
*		HX711_Init( &hx711, &hx711_Lectura );
* @endcode
*
* @see HX711_t
* @see HX711_fPtr
*
* <br><b> - CHANGELOG - </b>
*
* <table align="left" style="width:800px">
* <tr><td> Fecha       </td><td> Software Version </td><td> Creador </td><td> Descripcion </td></tr>
* <tr><td> 9/09/2021  </td><td> 1.0.0            </td><td> SN      </td><td> Primera edicion </td></tr>
* </table><br><br>
* <hr>
*
*******************************************************************************/
void HX711_Init( HX711_t_ptr hx711, HX711_fPtr Lectura, HX711_fPtr Tarar, Timeout_t_ptr Timeout )
{
	initPtrFunciones( hx711, Lectura, Tarar );

	hx711->Timeout = Timeout;
	
	initVariables( hx711 );
	
	initDOUT( &hx711->Config.DOUT );
	initPDSCK( &hx711->Config.PD_SCK );
	
	chequearValorConversion( hx711 );
	
	aDormir( hx711 );
}

/******************************************************************************
* Function : hx711_Lectura()
*//**
* \b Description:
*
* Realiza y devuelve el valor de la lectura de 24bits
*
* PRE-CONDITION: hx711 inicializado
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
*		HX711_Init( &hx711, &hx711_Lectura );
*		hx711.Datos.UltimaLectura = hx711.Lectura( &hx711 );
* @endcode
*
* @see HX711_t
*
* <br><b> - CHANGELOG - </b>
*
* <table align="left" style="width:800px">
* <tr><td> Fecha       </td><td> Software Version </td><td> Creador </td><td> Descripcion </td></tr>
* <tr><td> 9/09/2021  </td><td> 1.0.0            </td><td> SN      </td><td> Primera edicion </td></tr>
* </table><br><br>
* <hr>
*
*******************************************************************************/
uint16_t hx711_Lectura( HX711_t_ptr hx711 )
{
	uint32_t semilla = 0;
	
	semilla = leer( hx711 );
	aDormir( hx711 );
	
	if( ( semilla > hx711->Config.ValorZero ) )
	{
		return ( ( semilla - hx711->Config.ValorZero ) / hx711->Config.ValorConversion );
	}
	else
	{
		return 0;
	}
}

/******************************************************************************
* Function : hx711_Tarar()
*//**
* \b Description:
*
* Realiza 4 lecturas y devuelve el valor medio para establecerlo como tara
*
* PRE-CONDITION: hx711 inicializado
* 
*
* POST-CONDITION: Tara valida o fallo
* 
* @param			Sensor sobre el que realizar la lectura
*
* @return 		Tara
*
* \b Example Ejemplo:
* @code
*		HX711_Init( &hx711, &hx711_Lectura, &hx711_Tarar );
*		hx711.Config.ValorTara = hx711.Tarar( &hx711 );
* @endcode
*
* @see HX711_t
*
* <br><b> - CHANGELOG - </b>
*
* <table align="left" style="width:800px">
* <tr><td> Fecha       </td><td> Software Version </td><td> Creador </td><td> Descripcion </td></tr>
* <tr><td> 9/09/2021  </td><td> 1.0.0            </td><td> SN      </td><td> Primera edicion </td></tr>
* </table><br><br>
* <hr>
*
*******************************************************************************/
uint16_t hx711_Tarar( HX711_t_ptr hx711 )
{
	uint32_t valorMedio = 0;
	uint8_t repeticiones = 4;
	
	while( ( repeticiones > 0 ) )
	{
		valorMedio = valorMedio + leer( hx711 );
		--repeticiones;
	}
	repeticiones = 4;
	
	return valorMedio/repeticiones;
}








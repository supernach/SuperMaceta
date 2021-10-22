/****************************************************************************
* Title                 :   Gestor Ordenes Comm
* Filename              :   Gestor_ordenes.c
* Author                :   SuperNach
* Origin Date           :   26/09/2021
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
/** @file Gestor_Ordenes.c
 *  @brief 
 */
/** @addtogroup PLANTILLA
  * @{
  */
/******************************************************************************
* Includes
*******************************************************************************/
#include <gestor_ordenes.h>

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
/******************************************************************************
* Function : LimpiarDatos
*//**
* \b Description:
*
* plantilla descripcion
*
* PRE-CONDITION: 
* PRE-CONDITION: 
* PRE-CONDITION: 
*
* POST-CONDITION: 
* 
* @param			
* @param			
*
* @return 		void
*
* \b Example Ejemplo:
* @code
*		
* @endcode
*
* @see 
* @see 
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
static @inline void LimpiarDatos( Gestor_Ordenes_t_ptr gestor )
{
	gestor->nNodo = 0;
	
	gestor->ordenDHT11.Ejecutada = false;
	gestor->ordenDHT11.Orden.Funcion = 0;
	gestor->ordenDHT11.Orden.Comando = 0;
	gestor->ordenHX711.Ejecutada = false;
	gestor->ordenHX711.Orden.Funcion = 0;
	gestor->ordenHX711.Orden.Comando = 0;
	
	gestor->DatosEnvio.Dht11.EnvioPreparado = false;
	gestor->DatosEnvio.Dht11.T_Entero = 0;
	gestor->DatosEnvio.Dht11.T_Decimal = 0;
	gestor->DatosEnvio.Dht11.H_Entero = 0;
	gestor->DatosEnvio.Dht11.H_Decimal = 0;
	gestor->DatosEnvio.Hx711.EnvioPreparado = false;
	gestor->DatosEnvio.Hx711.Medida = 0;
}
/******************************************************************************
* Function : GO_Init
*//**
* \b Description:
*
* plantilla descripcion
*
* PRE-CONDITION: 
* PRE-CONDITION: 
* PRE-CONDITION: 
*
* POST-CONDITION: 
* 
* @param			
* @param			
*
* @return 		void
*
* \b Example Ejemplo:
* @code
*		
* @endcode
*
* @see 
* @see 
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
void GO_Init( Gestor_Ordenes_t_ptr gestor, struct GO_Dispositivos dispositivos, RS485_t_ptr sujeto )
{
	LimpiarDatos( gestor );
	
	gestor->Dispositivos = dispositivos;
	gestor->rs485 = sujeto;
	
	Observador_Init( &gestor->GO_Observador, RECEPCION, &GO_evRecepcion );
	
	sujeto->Sujeto.SetSubscriptor( &sujeto->Sujeto, &gestor->GO_Observador );
}

/******************************************************************************
* Function : ParsearTrama
*//**
* \b Description:
*
* plantilla descripcion
*
* PRE-CONDITION: 
* PRE-CONDITION: 
* PRE-CONDITION: 
*
* POST-CONDITION: 
* 
* @param			
* @param			
*
* @return 		void
*
* \b Example Ejemplo:
* @code
*		
* @endcode
*
* @see 
* @see 
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
static @inline void ParsearTrama( Gestor_Ordenes_t_ptr gestor, Trama_RX_t* rx )
{
	gestor->nNodo = WordToInt( rx->buffer[0], rx->buffer[1] );
	
	gestor->ordenDHT11.Orden.Funcion = ByteToInt( rx->buffer[2] );
	gestor->ordenDHT11.Orden.Comando = ByteToInt( rx->buffer[3] );
	
	gestor->ordenHX711.Orden.Funcion = ByteToInt( rx->buffer[4] );
	gestor->ordenHX711.Orden.Comando = ByteToInt( rx->buffer[5] );
}

/******************************************************************************
* Function : ChequearNumeroNodo
*//**
* \b Description:
*
* plantilla descripcion
*
* PRE-CONDITION: 
* PRE-CONDITION: 
* PRE-CONDITION: 
*
* POST-CONDITION: 
* 
* @param			
* @param			
*
* @return 		void
*
* \b Example Ejemplo:
* @code
*		
* @endcode
*
* @see 
* @see 
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
static @inline bool ChequearNumeroNodo( Gestor_Ordenes_t_ptr gestor )
{
	if( gestor->nNodo == NUMERO_NODO_COMUNICACION )
	{
		return true;
	}
	else
	{
		return false;
	}
}
/******************************************************************************
* Function : FuncionesDHT11
*//**
* \b Description:
*
* plantilla descripcion
*
* PRE-CONDITION: 
* PRE-CONDITION: 
* PRE-CONDITION: 
*
* POST-CONDITION: 
* 
* @param			
* @param			
*
* @return 		void
*
* \b Example Ejemplo:
* @code
*		
* @endcode
*
* @see 
* @see 
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
static @inline void FuncionesDHT11( Gestor_Ordenes_t_ptr gestor )
{
	if( gestor->ordenDHT11.Orden.Funcion == 1 ) // FUNCIONES DEL DISPOSITIVO
	{
		switch( gestor->ordenDHT11.Orden.Comando )
		{
			case 0: // SIN COMANDO
				gestor->ordenDHT11.Ejecutada = false;
			break;
			case 1: // LECTURA
				gestor->DatosEnvio.Dht11.T_Entero = gestor->Dispositivos.Dht11->Datos.UltimaLectura.T_Entero;
				gestor->DatosEnvio.Dht11.T_Decimal = gestor->Dispositivos.Dht11->Datos.UltimaLectura.T_Decimal;
				gestor->DatosEnvio.Dht11.H_Entero = gestor->Dispositivos.Dht11->Datos.UltimaLectura.H_Entero;
				gestor->DatosEnvio.Dht11.H_Decimal = gestor->Dispositivos.Dht11->Datos.UltimaLectura.H_Decimal;
				gestor->ordenDHT11.Ejecutada = true;
				gestor->DatosEnvio.Dht11.EnvioPreparado = true;
			break;
			case 2:
				gestor->ordenDHT11.Ejecutada = false;
			break;
			case 3:
				gestor->ordenDHT11.Ejecutada = false;
			break;
			case 4:
				gestor->ordenDHT11.Ejecutada = false;
			break;
			case 5:
				gestor->ordenDHT11.Ejecutada = false;
			break;
			case 6:
				gestor->ordenDHT11.Ejecutada = false;
			break;
			case 7:
				gestor->ordenDHT11.Ejecutada = false;
			break;
			case 8:
				gestor->ordenDHT11.Ejecutada = false;
			break;
			case 9:
				gestor->ordenDHT11.Ejecutada = false;
			break;
			
		}
	}
	else if( gestor->ordenDHT11.Orden.Funcion == 9 ) // FUNCIONES DEL DISPOSITIVO led check
	{
		switch( gestor->ordenDHT11.Orden.Comando )
		{
			case 0: // APAGAR
				gestor->Dispositivos.LedCheck->Estado.bitEstado.ComandoRecibido = false;
				gestor->ordenDHT11.Ejecutada = false;
			break;
			case 1: // ENCENDER
				gestor->Dispositivos.LedCheck->Estado.bitEstado.ComandoRecibido = true;
				gestor->ordenDHT11.Ejecutada = false;
			break;
		}
	}
}
/******************************************************************************
* Function : FuncionesHX711
*//**
* \b Description:
*
* plantilla descripcion
*
* PRE-CONDITION: 
* PRE-CONDITION: 
* PRE-CONDITION: 
*
* POST-CONDITION: 
* 
* @param			
* @param			
*
* @return 		void
*
* \b Example Ejemplo:
* @code
*		
* @endcode
*
* @see 
* @see 
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
static @inline void FuncionesHX711( Gestor_Ordenes_t_ptr gestor )
{
	if( gestor->ordenHX711.Orden.Funcion == 1 ) // FUNCIONES DEL DISPOSITIVO
	{
		switch( gestor->ordenHX711.Orden.Comando )
		{
			case 0: // SIN COMANDO
				gestor->ordenHX711.Ejecutada = false;
			break;
			case 1: // LECTURA
				gestor->DatosEnvio.Hx711.Medida = gestor->Dispositivos.Hx711->Datos.UltimaLectura;
				gestor->ordenHX711.Ejecutada = true;
				gestor->DatosEnvio.Hx711.EnvioPreparado = true;
			break;
			case 2: // TARAR
				gestor->Dispositivos.Hx711->Config.ValorTara = gestor->Dispositivos.Hx711->Tarar( gestor->Dispositivos.Hx711 );
				gestor->ordenHX711.Ejecutada = true;
			break;
			case 3: // VALOR ZERO
				gestor->Dispositivos.Hx711->Config.ValorZero = gestor->Dispositivos.Hx711->Tarar( gestor->Dispositivos.Hx711 );
				gestor->ordenHX711.Ejecutada = true;
			break;
			case 4:
				gestor->ordenHX711.Ejecutada = false;
			break;
			case 5:
				gestor->ordenHX711.Ejecutada = false;
			break;
			case 6:
				gestor->ordenHX711.Ejecutada = false;
			break;
			case 7:
				gestor->ordenHX711.Ejecutada = false;
			break;
			case 8:
				gestor->ordenHX711.Ejecutada = false;
			break;
			case 9:
				gestor->ordenHX711.Ejecutada = false;
			break;
		}
	}
}

/******************************************************************************
* Function : GO_Auxiliar_evRecepcion
*//**
* \b Description:
*
* plantilla descripcion
*
* PRE-CONDITION: 
* PRE-CONDITION: 
* PRE-CONDITION: 
*
* POST-CONDITION: 
* 
* @param			
* @param			
*
* @return 		void
*
* \b Example Ejemplo:
* @code
*		
* @endcode
*
* @see 
* @see 
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
static @inline void GO_Auxiliar_evRecepcion( Gestor_Ordenes_t_ptr gestor, Trama_RX_t* rx )
{
	ParsearTrama( gestor, rx);
	
	if( ChequearNumeroNodo( gestor ) )
	{
		FuncionesDHT11( gestor );
		FuncionesHX711( gestor );
		
		if( gestor->DatosEnvio.Dht11.EnvioPreparado == true )
		{
			gestor->rs485->Buffer.Tx.buffer[0] = NUMERO_NODO_COMUNICACION;
			gestor->rs485->Buffer.Tx.buffer[1] = gestor->DatosEnvio.Dht11.T_Entero;
			gestor->rs485->Buffer.Tx.buffer[2] = gestor->DatosEnvio.Dht11.T_Decimal;
			gestor->rs485->Buffer.Tx.buffer[3] = gestor->DatosEnvio.Dht11.H_Entero;
			gestor->rs485->Buffer.Tx.buffer[4] = gestor->DatosEnvio.Dht11.H_Decimal;
			
			gestor->rs485->Flags.bit.EnvioPreparado = 1;
		}
		else
		{
			gestor->rs485->Buffer.Tx.buffer[1] = 0;
			gestor->rs485->Buffer.Tx.buffer[2] = 0;
			gestor->rs485->Buffer.Tx.buffer[3] = 0;
			gestor->rs485->Buffer.Tx.buffer[4] = 0;
		}
		
		if( gestor->DatosEnvio.Hx711.EnvioPreparado == true )
		{
			gestor->rs485->Buffer.Tx.buffer[0] = NUMERO_NODO_COMUNICACION;
			gestor->rs485->Buffer.Tx.buffer[5] = gestor->DatosEnvio.Hx711.Bytes.alto;
			gestor->rs485->Buffer.Tx.buffer[6] = gestor->DatosEnvio.Hx711.Bytes.bajo;
			
			gestor->rs485->Flags.bit.EnvioPreparado = 1;
		}
		else
		{
			gestor->rs485->Buffer.Tx.buffer[5] = 0;
			gestor->rs485->Buffer.Tx.buffer[6] = 0;
		}
	}
	else
	{
		LimpiarDatos( gestor );
	}
}
/******************************************************************************
* Function : GO_evRecepcion
*//**
* \b Description:
*
* plantilla descripcion
*
* PRE-CONDITION: 
* PRE-CONDITION: 
* PRE-CONDITION: 
*
* POST-CONDITION: 
* 
* @param			
* @param			
*
* @return 		void
*
* \b Example Ejemplo:
* @code
*		
* @endcode
*
* @see 
* @see 
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
void GO_evRecepcion( Trama_RX_t* rx )
{
	GO_Auxiliar_evRecepcion( &GestorRS485, rx );
}

/**
  * @}
  */
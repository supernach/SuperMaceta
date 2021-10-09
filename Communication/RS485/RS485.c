/****************************************************************************
* Title                 :   RS485 COMM
* Filename              :   RS485.c
* Author                :   SuperNach
* Origin Date           :   20/09/2021
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
*  20/09/21   1.0.0   SuperNach       Initial Release.
*  
*
*******************************************************************************/
/** @file RS485.c
 *  @brief 
 */
/** @addtogroup COMMUNICATION
  * @{
  */
/** @addtogroup RS485
  * @{
  */  
/******************************************************************************
* Includes
*******************************************************************************/
#include <RS485.h>

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
* Function : BufferInit
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
* @param	RS485_t_ptr			
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
static @inline void BufferInit( Buffer_Tramas_t_ptr buffer )
{
	// INICIALIZAR BUFFERs
	// BROADCAST
	//buffer->Broadcast.nNodo = 0;
	//buffer->Broadcast.Orden.Funcion = 0;
	//buffer->Broadcast.Orden.Comando = 0;
	
	
	// TX BUFFER
	buffer->Tx.buffer[0] = 0;
	buffer->Tx.buffer[1] = 0;
	buffer->Tx.buffer[2] = 0;
	buffer->Tx.buffer[3] = 0;
	buffer->Tx.buffer[4] = 0;
	buffer->Tx.buffer[5] = 0;
	buffer->Tx.buffer[6] = 0;
	buffer->Tx.buffer[7] = 0;
	buffer->Tx.buffer[8] = 0;
	buffer->Tx.buffer[9] = 0;
	buffer->Tx.ptrBuffer = 0;
	// RX BUFFER
	buffer->Rx.buffer[0] = 0;
	buffer->Rx.buffer[1] = 0;
	buffer->Rx.buffer[2] = 0;
	buffer->Rx.buffer[3] = 0;
	buffer->Rx.buffer[4] = 0;
	buffer->Rx.buffer[5] = 0;
	buffer->Rx.ptrBuffer = 0;
}

/******************************************************************************
* Function : ResetFlagsEnvio
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
* @param	RS485_t_ptr			
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
static @inline void ResetFlagsEnvio( RS485_t_ptr rs485 )
{
	rs485->Flags.bit.NuevoEnvio = 0;
	rs485->Flags.bit.EnvioPreparado = 0;
}

/******************************************************************************
* Function : notificarObservadores
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
* @param	RS485_t_ptr			
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
static @inline void notificarObservadores( RS485_t_ptr rs485 )
{
	uint8_t auxiliar = 0;
	// NOTIFICACION A LOS SUBSCRIPTORES
	while( auxiliar < rs485->Sujeto.MaxSubscritos )
	{
		if( rs485->Sujeto.Observadores[auxiliar]->TipoNotificacion == RECEPCION )
		{
			rs485->Sujeto.Observadores[auxiliar]->Notificacion( &rs485->Buffer.Rx );
		}
		auxiliar = auxiliar + 1;
	}
	auxiliar = 0;
}

/******************************************************************************
* Function : cogerDatosBufferRX
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
* @param	RS485_t_ptr			
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
static @inline void cogerDatosBufferRX( RS485_t_ptr rs485 )
{
	struct bufferRX_s tempBuffer;
	
	tempBuffer = getBufferRX( );
			
	rs485->Buffer.Rx.buffer[0] = tempBuffer.temp[0];
	rs485->Buffer.Rx.buffer[1] = tempBuffer.temp[1];
	rs485->Buffer.Rx.buffer[2] = tempBuffer.temp[2];
	rs485->Buffer.Rx.buffer[3] = tempBuffer.temp[3];
	rs485->Buffer.Rx.buffer[4] = tempBuffer.temp[4];
	rs485->Buffer.Rx.buffer[5] = tempBuffer.temp[5];
}

/******************************************************************************
* Function : RS485_Init()
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
* @param	RS485_t_ptr			
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
void RS485_Init( RS485_t_ptr rs485 )
{
	rs485->Flags.flags = 0;
	
	BufferInit( &rs485->Buffer );
	
	Sujeto_Init( &rs485->Sujeto, &cbRS485_SetSubscriptor, 1 );
	
	rs485->Recibir = &cbRS485_Recibir;
	rs485->Run = &cbRS485_Run;
	rs485->Enviar = &cbRS485_Enviar;
	
	Nhal_UART_Init( &rs485->Config.UART );
	
	rs485->Flags.bit.Inicializado = 1;
	rs485->Flags.bit.Standby = 1;
	rs485->Error = RS485_SIN_FALLO;
}

/******************************************************************************
* Function : RS485_Recibir
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
void cbRS485_Recibir( RS485_t_ptr rs485 )
{
	if( getFlagUartRXNE( )  == ( RS485_BYTES_BUFFER_RX ) )
	{
		rs485->Flags.bit.NuevaRecepcion = true;
		rs485->Flags.bit.Standby = false;
		
		cogerDatosBufferRX( rs485 );
		
		rs485->Buffer.Rx.ptrBuffer = 0;
			
		notificarObservadores( rs485 );
		
		rs485->Flags.bit.NuevaRecepcion = false;
		rs485->Flags.bit.Standby = true;
		setFlagUartRXNE( 0 );
	}
}

/******************************************************************************
* Function : cbRS485_Run
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
void cbRS485_Run( RS485_t_ptr rs485 )
{
	cbRS485_Recibir( rs485 );
	cbRS485_Enviar( rs485 );
}
/******************************************************************************
* Function : cbRS485_SetSubscriptor
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
void cbRS485_SetSubscriptor( Sujeto_t_ptr sujeto, Observador_t_ptr observador )
{
	if( sujeto->NumeroSuscritos < sujeto->MaxSubscritos )
	{
		if( sujeto->Observadores[sujeto->NumeroSuscritos]->Notificacion == NULL )
		{
			sujeto->Observadores[sujeto->NumeroSuscritos] = observador;
			sujeto->NumeroSuscritos = sujeto->NumeroSuscritos + 1;
		}
	}
}

/******************************************************************************
* Function : cbRS485_Enviar
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
void cbRS485_Enviar( RS485_t_ptr rs485 )
{
	if( rs485->Flags.bit.EnvioPreparado || rs485->Flags.bit.NuevoEnvio )
	{
		if( rs485->Buffer.Tx.ptrBuffer == 0 )
		{
			rs485->Flags.bit.NuevoEnvio = 1;
			rs485->Flags.bit.Standby = 0;
			
			UART_Limpiar_IT( TXE );
			
			UART_Enviar_8( rs485->Buffer.Tx.buffer[rs485->Buffer.Tx.ptrBuffer] );
			
			rs485->Buffer.Tx.ptrBuffer = rs485->Buffer.Tx.ptrBuffer + 1;
			
			UART_Habilitar_IT( TXE );
		}
		
		if( getFlagUartTXE( ) > 0 )
		{
			UART_Enviar_8( rs485->Buffer.Tx.buffer[rs485->Buffer.Tx.ptrBuffer] );
		
			rs485->Buffer.Tx.ptrBuffer = rs485->Buffer.Tx.ptrBuffer + 1;
			
			
			// SI TRANSMISION COMPLETA
			if( rs485->Buffer.Tx.ptrBuffer == ( RS485_BYTES_BUFFER_TX ) )
			{
				rs485->Buffer.Tx.ptrBuffer = 0;
				
				ResetFlagsEnvio( rs485 );
				
				rs485->Flags.bit.Standby = 1;
				UART_Limpiar_IT( TXE );
				UART_Deshabilitar_IT( TXE );
			}
			else
			{
				UART_Habilitar_IT( TXE );
			}
		}
	}
}

/**
  * @}
  */
/**
  * @}
  */
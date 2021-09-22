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
void RS485_Init( RS485_t_ptr rs485 )
{
	// CONFIGURO PARAMETROS COMUNICACION SERIE
	rs485->Config.UART.StopBit = UART1_STOPBITS_1;
	rs485->Config.UART.Paridad = UART1_PARITY_NO;
	rs485->Config.UART.Bits = UART1_WORDLENGTH_8D;
	rs485->Config.UART.Baudios = 115200;
	rs485->Config.UART.Modo = UART1_MODE_RX_ENABLE;
	rs485->Config.UART.TipoInterrupcion = UART1_IT_RXNE;
	
	// CONFIGURO E INICIALIZO PIN RX
	rs485->Config.UART.P_RX.Puerto = GPIOD;
	rs485->Config.UART.P_RX.Pin = GPIO_PIN_6;
	rs485->Config.UART.P_RX.Tipo = GPIO_MODE_IN_PU_IT; 
	NHALgpio_Init( &rs485->Config.UART.P_RX ); 
	
	// CONFIGURO E INICIALIZO PIN TX
	rs485->Config.UART.P_TX.Puerto = GPIOD;
	rs485->Config.UART.P_TX.Pin = GPIO_PIN_5;
	rs485->Config.UART.P_TX.Tipo = GPIO_MODE_OUT_PP_HIGH_FAST;
	NHALgpio_Init( &rs485->Config.UART.P_TX );

	// INICIALIZAR BUFFERs
	// BROADCAST
	rs485->Buffer.Broadcast.nNodo = 0;
	rs485->Buffer.Broadcast.Orden.Funcion = 0;
	rs485->Buffer.Broadcast.Orden.Comando = 0;
	// TX
	rs485->Buffer.Tx.nNodo = 0;
	rs485->Buffer.Tx.LecturaDHT11 = 0;
	rs485->Buffer.Tx.LecturaHX711 = 0;
	// RX BUFFER
	rs485->Buffer.Rx.buffer[0] = 0;
	rs485->Buffer.Rx.buffer[1] = 0;
	rs485->Buffer.Rx.buffer[2] = 0;
	rs485->Buffer.Rx.buffer[3] = 0;
	rs485->Buffer.Rx.buffer[4] = 0;
	rs485->Buffer.Rx.buffer[5] = 0;
	rs485->Buffer.Rx.ptrBuffer = 0;
	//// FSM DE LA RECEPCION
	rs485->Buffer.Rx.Secuencia.pasoActual = 0;
	////// PASO 0 = LECTURA NUMERO NODO
	rs485->Buffer.Rx.Secuencia.LecturaNodo.nPasoSiguiente = 1;
	rs485->Buffer.Rx.Secuencia.LecturaNodo.BytesaLeer = RS485_BYTES_N_NODO;
	////// PASO 1 = LECTURA ORDEN DHT11
	rs485->Buffer.Rx.Secuencia.LecturaOrdenDHT11.nPasoSiguiente = 2;
	rs485->Buffer.Rx.Secuencia.LecturaOrdenDHT11.BytesaLeer = RS485_ORDENES_BYTES;
	////// PASO 2 = LECTURA ORDEN HX711
	rs485->Buffer.Rx.Secuencia.LecturaOrdenHX711.nPasoSiguiente = 0;
	rs485->Buffer.Rx.Secuencia.LecturaOrdenHX711.BytesaLeer = RS485_ORDENES_BYTES;
	
	
	
	UART1_DeInit();
	UART1_ITConfig( UART1_IT_RXNE, DISABLE );
	
	// INCIALIZO UART1
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);
	UART1_Init( rs485->Config.UART.Baudios, rs485->Config.UART.Bits, rs485->Config.UART.StopBit, rs485->Config.UART.Paridad, UART1_SYNCMODE_CLOCK_DISABLE, rs485->Config.UART.Modo );
	// HABILITO INTERRUPCION BUFFER RX CON DATOS
	UART1_ITConfig( UART1_IT_RXNE, ENABLE );
	UART1_Cmd(ENABLE);
	
	
	// LIMPIO FLAGS INTERRUPCION
	UART1_ClearFlag( UART1_FLAG_RXNE );
	enableInterrupts();
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


/**
  * @}
  */
/**
  * @}
  */
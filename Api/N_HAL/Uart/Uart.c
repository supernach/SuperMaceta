/****************************************************************************
* Title                 :   plantilla
* Filename              :   plantilla.c
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
/** @file uart.c
 *  @brief 
 */
/** @addtogroup PLANTILLA
  * @{
  */
/******************************************************************************
* Includes
*******************************************************************************/
#include <uart.h>

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
* Function : UART_init_config
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
static @inline void UART_init_config( UART_Config_t_ptr uart )
{
	// CONFIGURO PARAMETROS COMUNICACION SERIE
	uart->StopBit = UART1_STOPBITS_1;
	uart->Paridad = UART1_PARITY_NO;
	uart->Bits = UART1_WORDLENGTH_8D;
	uart->Baudios = 115200;
	uart->Modo = UART1_MODE_TXRX_ENABLE;
	uart->TipoInterrupcion = UART1_IT_RXNE;
}

/******************************************************************************
* Function : UART_init_rx
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
static @inline void UART_init_rx( UART_Config_t_ptr uart )
{
	// CONFIGURO E INICIALIZO PIN RX
	uart->P_RX.Puerto = GPIOD;
	uart->P_RX.Pin = GPIO_PIN_6;
	uart->P_RX.Tipo = GPIO_MODE_IN_PU_IT; 
	NHALgpio_Init( &uart->P_RX ); 
}

/******************************************************************************
* Function : UART_init_tx
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
static @inline void UART_init_tx( UART_Config_t_ptr uart )
{
	// CONFIGURO E INICIALIZO PIN TX
	uart->P_TX.Puerto = GPIOD;
	uart->P_TX.Pin = GPIO_PIN_5;
	uart->P_TX.Tipo = GPIO_MODE_OUT_PP_HIGH_FAST;
	NHALgpio_Init( &uart->P_TX );
}

/******************************************************************************
* Function : UART_disable_it
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
static @inline void UART_disable_it( void )
{
	UART1_ITConfig( UART1_IT_RXNE, DISABLE );
	
	UART1_ITConfig( UART1_IT_TXE, DISABLE );
}

/******************************************************************************
* Function : UART_limpiar_flags_it
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
static @inline void UART_limpiar_flags_it( void )
{
	setFlagUartRXNE( 0 );
	setFlagUartTXE( 0 );
	// LIMPIO FLAGS INTERRUPCION
	UART1_ClearFlag( UART1_FLAG_RXNE );
	UART1_ClearFlag( UART1_FLAG_TXE );
}

/******************************************************************************
* Function : Nhal_UART_Init
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
void Nhal_UART_Init( UART_Config_t_ptr uart )
{
	UART_init_config( uart );
	
	UART_init_rx( uart );
	
	UART_init_tx( uart );
	
	UART1_DeInit();
	
	UART_disable_it( );
	
	HabilitarRelojPeriferico( CLK_PERIPHERAL_UART1 );
	
	UART1_Init( uart->Baudios, uart->Bits, uart->StopBit, uart->Paridad, UART1_SYNCMODE_CLOCK_DISABLE, uart->Modo );
	
	UART1_ITConfig( UART1_IT_RXNE, ENABLE );
	UART1_Cmd(ENABLE);

	UART_limpiar_flags_it( );
}

/******************************************************************************
* Function : UART_Limpiar_IT
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
void UART_Limpiar_IT( UART_IT_FLAG_e flag )
{
	switch( flag )
	{
		case TXE:
			setFlagUartTXE( 0 );
			UART1_ClearITPendingBit( UART1_IT_TXE );
			UART1_ClearFlag( UART1_FLAG_TXE );
		break;
	}
}

/******************************************************************************
* Function : UART_Habilitar_IT
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
void UART_Habilitar_IT( UART_IT_FLAG_e flag )
{
	switch( flag )
	{
		case TXE:
			setFlagUartTXE( 0 );
			UART1_ITConfig( UART1_IT_TXE, ENABLE );
		break;
	}
}

/******************************************************************************
* Function : UART_Deshabilitar_IT
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
void UART_Deshabilitar_IT( UART_IT_FLAG_e flag )
{
	switch( flag )
	{
		case TXE:
			UART1_ITConfig( UART1_IT_TXE, DISABLE );
		break;
	}
}

/******************************************************************************
* Function : UART_Enviar_8
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
void UART_Enviar_8( uint8_t dato )
{
	UART1_SendData8( dato );
}
/**
  * @}
  */
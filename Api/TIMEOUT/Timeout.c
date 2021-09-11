/****************************************************************************
* Title                 :   Timeout API
* Filename              :   Timeout.c
* Author                :   SuperNach
* Origin Date           :   09/09/2021
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
/** @file Timeout.c
 *  @brief 
 */
/******************************************************************************
* Includes
*******************************************************************************/
#include <timeout.h>

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
static @inline uint16_t tick1us( void )
{
	//return ( FCLK ) / ( 1000000 - 1 );
	return 15;
}

/******************************************************************************
* Function : Timeout_Init()
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
void Timeout_Init( Timeout_t_ptr timeout, Timeout_Notificacion tm_Notificacion )
{
	timeout->Config.Timer.Numero = TIMER1;
	timeout->Config.Timer.Canal = CANAL1;
	timeout->Config.Notificacion = tm_Notificacion;
	timeout->Estado = INACTIVO;
	timeout->ValorDesborde = 1;
}


/******************************************************************************
* Function : Timeout_Start()
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
void Timeout_Start( Timeout_t_ptr timeout, uint16_t us )
{
	if( timeout->Estado == INACTIVO )
	{
		TIM1_ITConfig( TIM1_IT_UPDATE, DISABLE );
		TIM1_Cmd( DISABLE );
	
		TIM1_TimeBaseInit( 15, TIM1_COUNTERMODE_UP, us, 0);
		TIM1_ITConfig( TIM1_IT_UPDATE, ENABLE );
		TIM1_Cmd( ENABLE );
		enableInterrupts();
	
		timeout->ValorDesborde = us;
		timeout->Estado = ACTIVO;
	}
}

/******************************************************************************
* Function : Timeout_Stop()
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
void Timeout_Stop( Timeout_t_ptr timeout )
{
	TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
	TIM1_ClearFlag(TIM1_FLAG_UPDATE);
	TIM1_ITConfig( TIM1_IT_UPDATE, DISABLE );
	
	TIM1_Cmd( DISABLE );

	setFlagTimer1( 0 );
	timeout->ValorDesborde = 0;
	timeout->Estado = INACTIVO;
}

/******************************************************************************
* Function : Timeout_Check()
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
void Timeout_Check( Timeout_t_ptr timeout )
{
	volatile uint16_t ticks = 0;
	ticks = TIM1_GetCounter();
	
	if(  ticks >= timeout->ValorDesborde )
	{
		timeout->Estado = DISPARADO;
	}
	else
	{
		
	}
}


/****************************************************************************
* Title                 :   Timer API
* Filename              :   Timer.c
* Author                :   SuperNach
* Origin Date           :   11/09/2021
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
*  11/09/21   1.0.0   SuperNach       Initial Release.
*  
*
*******************************************************************************/
/** @file Timer.c
 *  @brief Implementacion de las acciones del timer
 */
/** @addtogroup API
  * @{
  */
/** @addtogroup N_HAL
  * @{
  */
/** @addtogroup TIMER
  * @{
  */  
/******************************************************************************
* Includes
*******************************************************************************/
#include <timer.h>

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
* Function : Timer_Init()
*//**
* \b Description:
*
* Al pasarle una variable timer, se chequea su configuracion y dependiendo
* de eso se inicializan una sparte u otras del timer.
*
* PRE-CONDITION: Configuracion del timer creada
* 
*
* POST-CONDITION: El timer esta inicializado segun la configuracion
* 
* @param	timer	Puntero hacia un dato tipo Timer_t			
*			
*
* @return 		void
*
* \b Example Ejemplo:
* @code
*		Timer_Config_Init( &timer.Config, TIMER1, CANAL1, COUNTERUP, SI, 1 );
*	  Timer_Init( &timer );
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
void Timer_Init( Timer_t_ptr timer )
{
	if( timer->Config.Timer == TIMER1 )
	{
		if( timer->Config.IT == SI )
		{
			TIM1_ITConfig( TIM1_IT_UPDATE, DISABLE );
		}
		TIM1_Cmd( DISABLE );
	
		TIM1_TimeBaseInit( 15, TIM1_COUNTERMODE_UP, timer->Config.Tiempo, 0);
		
		if( timer->Config.IT == SI )
		{
			TIM1_ITConfig( TIM1_IT_UPDATE, ENABLE );
		}
		TIM1_Cmd( ENABLE );
	}
	enableInterrupts();
}

/******************************************************************************
* Function : Timer_Config_Init()
*//**
* \b Description:
*
* Se encarga de rellenar la estructura de configuracion del timer
* segun los parametros asignados a la funcion
*
* PRE-CONDITION: Parametros de configuracion elegidos
*
*
* POST-CONDITION: La configuracion esta inicializada.
* 
* @param	timerConfig	Puntero a  la configuracion del timer		
* @param	timer	Numero del timer usado
* @param	canal	Canal del timer utilizado
* @param	modo	Modo de trabajo del timer
* @param	it	define si el timer usa interrupcion
*	
*
* @return 		void
*
* \b Example Ejemplo:
* @code
*		Timer_Config_Init( &timer.Config, TIMER1, CANAL1, COUNTERUP, SI, 1 );
* @endcode
*
* @see Timer_Config_t_ptr
* @see Timer_Numero_e
* @see Timer_Canal_e
* @see Timer_Modo_e
* @see Timer_Interrupcion_e
*
*
* <br><b> - CHANGELOG - </b>
*
* <table align="left" style="width:800px">
* <tr><td> Fecha       </td><td> Software Version </td><td> Creador </td><td> Descripcion </td></tr>
* <tr><td> 18/09/2021  </td><td> 1.0.0            </td><td> SN      </td><td> Primera edicion </td></tr>
* </table><br><br>
* <hr>
*
*******************************************************************************/
void Timer_Config_Init( Timer_Config_t_ptr timerConfig, Timer_Numero_e timer, Timer_Canal_e canal, Timer_Modo_e modo, Timer_Interrupcion_e it, uint16_t tiempo )
{
	timerConfig->Timer = timer ;
	timerConfig->Canal = canal ;
	timerConfig->Modo = modo ;
	timerConfig->IT = it ;
	timerConfig->Tiempo = tiempo ;
}

/******************************************************************************
* Function : Timer_DeInit()
*//**
* \b Description:
*
* Deinicializa el timer elegido, si usa interrupcion limpia flags
*
* PRE-CONDITION: El timer esta inicializado
*
*
* POST-CONDITION: El timer esta desinicializado
* 
* @param	timer  Timer que hay que deinicializar		
*	
*
* @return 		void
*
* \b Example Ejemplo:
* @code
*		Timer_DeInit( &timer );
* @endcode
*
* @see Timer_t_ptr
*
*
* <br><b> - CHANGELOG - </b>
*
* <table align="left" style="width:800px">
* <tr><td> Fecha       </td><td> Software Version </td><td> Creador </td><td> Descripcion </td></tr>
* <tr><td> 18/09/2021  </td><td> 1.0.0            </td><td> SN      </td><td> Primera edicion </td></tr>
* </table><br><br>
* <hr>
*
*******************************************************************************/
void Timer_DeInit( Timer_t_ptr timer )
{
	if( timer->Config.Timer == TIMER1 )
	{
		if( timer->Config.IT == SI )
		{
			TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
			TIM1_ClearFlag(TIM1_FLAG_UPDATE);
			TIM1_SetCounter( 0 );
			TIM1_ITConfig( TIM1_IT_UPDATE, DISABLE );
		}
		TIM1_Cmd( DISABLE );
	}
}

/**
  * @}
  */
/**
  * @}
	*/
/**
  * @}
*/
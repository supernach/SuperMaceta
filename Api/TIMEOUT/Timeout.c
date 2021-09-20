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
 /** @addtogroup API
  * @{
  */
/** @addtogroup TIMEOUT
  * @{
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
void Timeout_Init( Timeout_t_ptr timeout, Timer_t_ptr timer, Timeout_Notificacion isr_Notificacion, Timeout_ResetNotificacion isr_Reset )
{
	timeout->Config.Notificacion = isr_Notificacion;
	timeout->Config.ResetNotificacion = isr_Reset;
	timeout->Config.Timer = timer;
	timeout->Estado = INACTIVO;
	timeout->ValorDesborde = timer->Config.Tiempo;
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
void Timeout_Start( Timeout_t_ptr timeout, uint16_t microsegundos )
{
	if( timeout->Estado == INACTIVO )
	{
		timeout->Config.Timer->Config.Tiempo = microsegundos;
		Timer_Init( timeout->Config.Timer );
	
		timeout->ValorDesborde = timeout->Config.Timer->Config.Tiempo;
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
	Timer_DeInit( timeout->Config.Timer );

	timeout->Config.ResetNotificacion( 0 );
	timeout->ValorDesborde = 0;
	timeout->Estado = INACTIVO;
}

/**
  * @}
  */
/**
  * @}
  */	


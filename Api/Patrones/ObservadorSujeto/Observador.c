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
/** @file plantilla.c
 *  @brief 
 */
/** @addtogroup PLANTILLA
  * @{
  */
/******************************************************************************
* Includes
*******************************************************************************/
#include <observador.h>

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
* Function : plantilla()
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
void Observador_Init( Observador_t_ptr observador, Observador_Tipo_Notificacion_e tipoNotificacion, Notificacion_fPtr  notificacion )
{
	observador->TipoNotificacion = tipoNotificacion;
	observador->Notificacion = notificacion;
}

/**
  * @}
  */
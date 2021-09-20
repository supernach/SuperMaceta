#ifndef TIMEOUT_CONFIG_H
#define TIMEOUT_CONFIG_H

/****************************************************************************
* Title                 :   Timeout_Config API
* Filename              :   Timeout_Config.h
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
/** @file Timeout_Config.h
 *  @brief 
 */
 /** @addtogroup API
  * @{
  */
/** @addtogroup TIMEOUT
  * @{
  */
/** @addtogroup TIMEOUT_CONFIG
  * @{
  */
/******************************************************************************
* Includes
*******************************************************************************/
#include <stm8s.h>

/******************************************************************************
* Constants
*******************************************************************************/

/******************************************************************************
* Configuration
*******************************************************************************/

/******************************************************************************
* Macros
*******************************************************************************/

/******************************************************************************
* Typedefs
*******************************************************************************/
/**
* @typedef Timeout_Config_t
* @brief <descripcion>
*
* @see <referencias>
*/
typedef struct Timeout_Config Timeout_Config_t;

/**
* @typedef Timeout_Notificacion
* @brief <descripcion>
*
* @see <referencias>
*/
typedef volatile uint16_t( *Timeout_Notificacion )( void );

/**
* @typedef Timeout_ResetNotificacion
* @brief <descripcion>
*
* @see <referencias>
*/
typedef void( *Timeout_ResetNotificacion )( uint16_t );

/******************************************************************************
* Struct
*******************************************************************************/
/**
* @struct Timeout_Config
* @brief 
*
* @see
*/
struct Timeout_Config
{
	Timer_t_ptr Timer;
	Timeout_Notificacion Notificacion;
	Timeout_ResetNotificacion ResetNotificacion;
};

/******************************************************************************
* Variables
*******************************************************************************/
/**
* @var 
* @brief 
*
* @see
*/

/******************************************************************************
* Function Prototypes
*******************************************************************************/
#ifdef __cplusplus
extern "C"{
#endif



#ifdef __cplusplus
} // extern "C"
#endif 

#endif

/**
  * @}
  */
/**
  * @}
  */	
/**
  * @}
  */
#ifndef NHAL_TIMER_H
#define NHAL_TIMER_H

/****************************************************************************
* Title                 :   Timar API
* Filename              :   Timer.h
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
/** @file Timer.h
 *  @brief 
 */
/******************************************************************************
* Includes
*******************************************************************************/
#include <stm8s.h>
#include <timer_config.h>

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
* @typedef Timer_t
* @brief <descripcion>
*
* @see <referencias>
*/
typedef struct Timer Timer_t;

/**
* @typedef Timer_t_ptr
* @brief <descripcion>
*
* @see <referencias>
*/
typedef Timer_t* Timer_t_ptr;

/******************************************************************************
* Struct
*******************************************************************************/
/**
* @struct Timer
* @brief 
*
* @see
*/
struct Timer
{
	Timer_Config_t Config;
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

void Timer_Init( Timer_t_ptr timer );

#ifdef __cplusplus
} // extern "C"
#endif 

#endif
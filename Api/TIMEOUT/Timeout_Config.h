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
* @typedef Timeout_Config_Timer_t
* @brief <descripcion>
*
* @see <referencias>
*/
typedef struct Timeout_Config_Timer Timeout_Config_Timer_t;

/**
* @typedef Timeout_Config_Timer_e
* @brief <descripcion>
*
* @see <referencias>
*/
typedef enum
{
	TIMER1,
	TIMER2
}Timeout_Config_Timer_e;

/**
* @typedef Timeout_Config_Canal_e
* @brief <descripcion>
*
* @see <referencias>
*/
typedef enum
{
	CANAL1,
	CANAL2
}Timeout_Config_Canal_e;

/******************************************************************************
* Struct
*******************************************************************************/
/**
* @struct Timeout_Config
* @brief 
*
* @see
*/
struct Timeout_Config_Timer
{
	Timeout_Config_Timer_e Numero;
	Timeout_Config_Canal_e Canal;
};

/**
* @struct Timeout_Config
* @brief 
*
* @see
*/
struct Timeout_Config
{
	Timeout_Config_Timer_t Timer;
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

//void Timeout_Config_Init( Timeout_Config_t* timeout_config );

#ifdef __cplusplus
} // extern "C"
#endif 

#endif
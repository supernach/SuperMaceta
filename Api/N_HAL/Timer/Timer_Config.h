#ifndef NHAL_TIMER_CONFIG_H
#define NHAL_TIMER_CONFIG_H

/****************************************************************************
* Title                 :   Timer Config API
* Filename              :   Timer_Config.h
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
* @typedef Timer_Modo_e
* @brief <descripcion>
*
* @see <referencias>
*/
typedef struct Timer_Config Timer_Config_t;


/**
* @typedef Timer_Config_t_ptr
* @brief <descripcion>
*
* @see <referencias>
*/
typedef Timer_Config_t* Timer_Config_t_ptr;

/**
* @typedef Timer_Modo_e
* @brief <descripcion>
*
* @see <referencias>
*/
typedef enum
{
	COUNTERUP
}Timer_Modo_e;

/**
* @typedef Timer_Interrupcion_e
* @brief <descripcion>
*
* @see <referencias>
*/
typedef enum
{
	SI,
	NO
}Timer_Interrupcion_e;

/**
* @typedef Timer_BaseTiempo_e
* @brief <descripcion>
*
* @see <referencias>
*/
/*typedef enum
{
	MICROSEGUNDOS
}Timer_BaseTiempo_e;*/

/**
* @typedef Timer_Numero_e
* @brief <descripcion>
*
* @see <referencias>
*/
typedef enum
{
	TIMER1
}Timer_Numero_e;

/**
* @typedef Timer_Canal_e
* @brief <descripcion>
*
* @see <referencias>
*/
typedef enum
{
	CANAL1
}Timer_Canal_e;

/******************************************************************************
* Struct
*******************************************************************************/
/**
* @struct 
* @brief 
*
* @see
*/
struct Timer_Config
{
	Timer_Numero_e Timer;
	Timer_Canal_e Canal;
	Timer_Modo_e Modo;
	Timer_Interrupcion_e IT;
	uint16_t Tiempo;
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
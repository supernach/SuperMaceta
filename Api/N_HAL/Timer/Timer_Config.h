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
 *  @brief Ofrece funciones referidas al TIMER1 para abtraerse de la SPL
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
/** @addtogroup TIMER_CONFIG
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
* @typedef Timer_Config_t
* @brief Tipo que contiene distintas opciones de configuracion del timer
*
* @see Timer_Config
*/
typedef struct Timer_Config Timer_Config_t;


/**
* @typedef Timer_Config_t_ptr
* @brief Puntero a la estructura de ocnfiguracion del timer
*
* @see Timer_Config_t*
*/
typedef Timer_Config_t* Timer_Config_t_ptr;

/**
* @typedef Timer_Modo_e
* @brief Distintos modos en los que puede trabajar el timer
*
* 
*/
typedef enum
{
	COUNTERUP	/**< Modo trabajo: Contador ascendente */
}Timer_Modo_e;

/**
* @typedef Timer_Interrupcion_e
* @brief Definimos si el timer usa interrupcion
*
* 
*/
typedef enum
{
	SI,	/**< Con interrupcion */
	NO	/**< Sin interrupcion */
}Timer_Interrupcion_e;

/**
* @typedef Timer_Numero_e
* @brief Numero del timer utilizado
*
* 
*/
typedef enum
{
	TIMER1	/**< Timer1 del stm8s */
}Timer_Numero_e;

/**
* @typedef Timer_Canal_e
* @brief Canal del timer utilizado
*
* 
*/
typedef enum
{
	CANAL1	/**< Numero del canal del timer usado */
}Timer_Canal_e;

/******************************************************************************
* Struct
*******************************************************************************/
/**
* @struct Timer_Config
* @brief Estructura tipo para la definicion de la configuracion del timer
*
* @see Timer_Numero_e
* @see Timer_Canal_e
* @see Timer_Modo_e
* @see Timer_Interrupcion_e
*/
struct Timer_Config
{
	Timer_Numero_e Timer;	/**< Timer fisico usado */
	Timer_Canal_e Canal;	/**< Canal del time rusadp */
	Timer_Modo_e Modo;	/**< Modo de trabajo del timer */
	Timer_Interrupcion_e IT;	/**< Seleccion uso interrupcion */
	uint16_t Tiempo;	/**< Tiempo contaje */
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
/**
  * @}
*/
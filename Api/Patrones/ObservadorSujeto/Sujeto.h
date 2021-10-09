#ifndef PATRONES_SUJETO_H
#define PATRONES_SUJETO_H

/****************************************************************************
* Title                 :   plantilla
* Filename              :   plantilla.h
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
/** @file sujeto.h
 *  @brief 
 */

/** @addtogroup PLANTILLA
  * @{
  */
/******************************************************************************
* Includes
*******************************************************************************/
#include <stm8s.h>
#include <utils.h>
#include <observador.h>

/******************************************************************************
* Constants
*******************************************************************************/
/**
* @var SUJETO_MAX_OBSERVADORES
* @brief 
*
* @see	Trama_RX
*/
#define SUJETO_MAX_OBSERVADORES 1

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
* @typedef <name>
* @brief <descripcion>
*
* @see <referencias>
*/
typedef struct Sujeto Sujeto_t;

/**
* @typedef Sujeto_t_ptr
* @brief <descripcion>
*
* @see <referencias>
*/
typedef Sujeto_t* Sujeto_t_ptr;

/**
* @typedef   RS485_SetSubscriptor_fPtr 
* @brief 		 Puntero a funcion para definir las acciones del sensor
*				 		 asociadas a lecturas
*/
typedef void(*SetSubscriptor_fPtr)(Sujeto_t_ptr, Observador_t_ptr);

/******************************************************************************
* Struct
*******************************************************************************/
/**
* @struct 
* @brief 
*
* @see
*/

/**
* @struct RS485_Sujeto
* @brief 
*
* @see
*/
struct Sujeto
{
	uint8_t NumeroSuscritos;
	uint8_t MaxSubscritos;
	Observador_t_ptr Observadores[SUJETO_MAX_OBSERVADORES];
	
	SetSubscriptor_fPtr  SetSubscriptor;
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

void Sujeto_Init( Sujeto_t_ptr sujeto, SetSubscriptor_fPtr  setSubscriptor, uint8_t maxSubscritos );

#ifdef __cplusplus
} // extern "C"
#endif 

#endif

/**
  * @}
  */
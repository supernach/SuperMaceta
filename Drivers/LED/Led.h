#ifndef LED_H
#define LED_H

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
/** @file Led.h
 *  @brief 
 */

/** @addtogroup PLANTILLA
  * @{
  */
/******************************************************************************
* Includes
*******************************************************************************/
#include <stm8s.h>
#include <gpio.h>

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
* @typedef Led_t
* @brief <descripcion>
*
* @see Led
*/
typedef struct Led Led_t;

/**
* @typedef Led_t_ptr
* @brief <descripcion>
*
* @see Led_t
*/
typedef Led_t* Led_t_ptr;

/**
* @typedef SetLed_fPtr
* @brief <descripcion>
*
* @see <referencias>
*/
typedef void(*SetLed_fPtr)(Led_t_ptr, uint8_t);

/**
* @typedef Led_Estado_u
* @brief <descripcion>
*
* @see <referencias>
*/
typedef union
{
	uint8_t Estado;
	struct flagEstado
  {
    uint8_t Encendido : 1; /**<  */
    uint8_t Apagado : 1; /**<  */
    uint8_t ComandoRecibido : 1; /**<  */
    uint8_t bit3 : 1; /**<  */
    uint8_t bit4 : 1; /**<  */
    uint8_t bit5 : 1; /**<  */
    uint8_t bit6 : 1; /**<  */
    uint8_t bit7 : 1; /**<  */
  } bitEstado; 
}Led_Estado_u;

/******************************************************************************
* Struct
*******************************************************************************/
/**
* @struct Led
* @brief 
*
* @see
*/
struct Led
{
	Led_Estado_u Estado;
	Gpio_Config_t HW;
	SetLed_fPtr SetLed;
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

void Led_Init( Led_t_ptr led );
void cbSetLed( Led_t_ptr led, uint8_t estado );

#ifdef __cplusplus
} // extern "C"
#endif 

#endif

/**
  * @}
  */
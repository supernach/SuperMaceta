#ifndef NHAL_UART_H
#define NHAL_UART_H

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
/** @file plantilla.h
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
#include <clock.h>

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
* @typedef UART_Config_t
* @brief <descripcion>
*
* @see UART_Config
*/
typedef struct UART_Config UART_Config_t;

/**
* @typedef UART_Config_t_ptr
* @brief <descripcion>
*
* @see UART_Config_t
*/
typedef UART_Config_t* UART_Config_t_ptr;

/******************************************************************************
* Struct
*******************************************************************************/
/**
* @struct UART_Config
* @brief 
*
* @see
*/
struct UART_Config
{
	UART1_StopBits_TypeDef StopBit; /**<  */
	UART1_Parity_TypeDef Paridad; /**<  */
	UART1_WordLength_TypeDef Bits; /**<  */
	uint32_t Baudios; /**<  */
	UART1_Mode_TypeDef Modo; /**<  */
	UART1_IT_TypeDef TipoInterrupcion; /**<  */
	Gpio_Config_t P_RX; /**<  */
	Gpio_Config_t P_TX; /**<  */
};
/**
* @struct UART_IT_FLAG_e
* @brief 
*
* @see
*/
typedef enum
{
	TXE
}UART_IT_FLAG_e;

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

void Nhal_UART_Init( UART_Config_t_ptr uart );
void UART_Limpiar_IT( UART_IT_FLAG_e flag );
void UART_Habilitar_IT( UART_IT_FLAG_e flag );
void UART_Deshabilitar_IT( UART_IT_FLAG_e flag );
void UART_Enviar_8( uint8_t dato );

#ifdef __cplusplus
} // extern "C"
#endif 

#endif

/**
  * @}
  */
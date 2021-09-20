#ifndef RS485_CONFIG_H
#define RS485_CONFIG_H

/****************************************************************************
* Title                 :   RS48_Config COMM
* Filename              :   RS485_Config.h
* Author                :   SuperNach
* Origin Date           :   20/09/2021
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
*  20/09/21   1.0.0   SuperNach       Initial Release.
*  
*
*******************************************************************************/
/** @file  RS485_Config.h
 *  @brief 
 */

/** @addtogroup COMMUNICATION
  * @{
  */
/** @addtogroup RS485
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
* @typedef RS485_Config_t
* @brief <descripcion>
*
* @see RS48_Config
*/
typedef struct RS485_Config RS485_Config_t;

/**
* @typedef RS485_Config_t_ptr
* @brief <descripcion>
*
* @see RS485_Config_t*
*/
typedef RS485_Config_t* RS485_Config_t_ptr;


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
	UART1_StopBits_TypeDef StopBit;
	UART1_Parity_TypeDef Paridad;
	UART1_WordLength_TypeDef Bits;
	uint32_t Baudios;
	UART1_Mode_TypeDef Modo;
	UART1_IT_TypeDef TipoInterrupcion;
};

/**
* @struct RS485_Config
* @brief 
*
* @see
*/
struct RS485_Config
{
	struct UART_Config UART;
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
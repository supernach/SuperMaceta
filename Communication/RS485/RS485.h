#ifndef RS485_H
#define RS485_H

/****************************************************************************
* Title                 :   RS485 COMM
* Filename              :   RS485.h
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
*  19/09/21   1.0.0   SuperNach       Initial Release.
*  
*
*******************************************************************************/
/** @file RS485.h
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
#include <RS485_Config.h>

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
* @typedef RS485_t
* @brief <descripcion>
*
* @see RS485
*/
typedef struct RS485 RS485_t;

/**
* @typedef RS485_t_ptr
* @brief <descripcion>
*
* @see RS485_t*
*/
typedef RS485_t* RS485_t_ptr;

/******************************************************************************
* Struct
*******************************************************************************/
/**
* @struct RS485
* @brief 
*
* @see
*/
struct RS485
{
	RS485_Config_t Config;
	Buffer_Tramas_t Buffer;
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

void RS485_Init( RS485_t_ptr rs485 );

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
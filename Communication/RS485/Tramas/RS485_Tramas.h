#ifndef RS485_TRAMAS_H
#define RS485_TRAMAS_H

/****************************************************************************
* Title                 :   plantilla
* Filename              :   plantilla.h
* Author                :   SuperNach
* Origin Date           :   19/09/2021
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
/** @file RS485_Tramas.h
 *  @brief 
 */
/** @addtogroup COMMUNICATION
  * @{
  */
/** @addtogroup RS485
  * @{
  */
/** @addtogroup TRAMAS
  * @{
  */
/******************************************************************************
* Includes
*******************************************************************************/
#include <stm8s.h>
#include <rs485_ordenes.h>

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
* @typedef Trama_RX_t
* @brief <descripcion>
*
* @see <referencias>
*/
typedef struct Trama_RX Trama_RX_t;

/**
* @typedef Trama_TX_t
* @brief <descripcion>
*
* @see <referencias>
*/
typedef struct Trama_TX Trama_TX_t;

/**
* @typedef Trama_BROADCAST_t
* @brief <descripcion>
*
* @see <referencias>
*/
typedef struct Trama_BROADCAST Trama_BROADCAST_t;

/******************************************************************************
* Struct
*******************************************************************************/
/**
* @struct Trama_RX
* @brief 
*
* @see
*/
struct Trama_RX
{
	uint8_t nNodo;
	RS485_Orden_t OrdenDHT11;
	RS485_Orden_t OrdenHX711;
};

/**
* @struct Trama_TX
* @brief 
*
* @see
*/
struct Trama_TX
{
	uint8_t nNodo;
	uint32_t LecturaDHT11;
	uint32_t LecturaHX711;
};

/**
* @struct Trama_BROADCAST 
* @brief 
*
* @see
*/
struct Trama_BROADCAST
{
	uint8_t nNodo;
	RS485_Orden_t Orden;
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
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

/******************************************************************************
* Constants
*******************************************************************************/
/**
* @var RS485_BYTES_BUFFER_RX
* @brief 
*
* @see	Trama_RX
*/
#define RS485_BYTES_BUFFER_RX 6

/**
* @var RS485_BYTES_BUFFER_TX
* @brief 
*
* @see	Trama_TX
*/
#define RS485_BYTES_BUFFER_TX 7

/**
* @var RS485_BYTES_BUFFER_BROADCAST
* @brief 
*
* @see	Trama_TX
*/
#define RS485_BYTES_BUFFER_BROADCAST 4

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

/**
* @typedef Buffer_Tramas_t
* @brief <descripcion>
*
* @see Buffer_Tramas
*/
typedef struct Buffer_Tramas Buffer_Tramas_t;

/**
* @typedef Buffer_Tramas_t_ptr
* @brief <descripcion>
*
* @see Buffer_Tramas
*/
typedef Buffer_Tramas_t* Buffer_Tramas_t_ptr;

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
	uint8_t buffer[RS485_BYTES_BUFFER_RX];
	uint8_t ptrBuffer;
};

/**
* @struct Trama_TX
* @brief 
*
* @see
*/
struct Trama_TX
{
	uint8_t buffer[RS485_BYTES_BUFFER_TX];
	uint8_t ptrBuffer;
};

/**
* @struct Trama_BROADCAST 
* @brief 
*
* @see
*/
struct Trama_BROADCAST
{
	uint8_t buffer[RS485_BYTES_BUFFER_BROADCAST];
	uint8_t ptrBuffer;
};

/**
* @struct Buffer_Tramas 
* @brief 
*
* @see
*/
struct Buffer_Tramas
{
	//Trama_BROADCAST_t Broadcast;
	Trama_TX_t Tx;
	Trama_RX_t Rx;
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
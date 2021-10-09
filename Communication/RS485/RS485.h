#ifndef RS485_H
#define RS485_H

/****************************************************************************
* Title                 :   RS485 COMM
* Filename              :   RS485.h
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
#include <sujeto.h>
#include <utils.h>
#include <RS485_Config.h>
#include <RS485_Tramas.h>


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

/**
* @typedef   RS485_Recibir_fPtr 
* @brief 		 Puntero a funcion para definir las acciones del sensor
*				 		 asociadas a lecturas
*/
typedef void(*RS485_Recibir_fPtr)( RS485_t_ptr );

/**
* @typedef   RS485_Enviar_fPtr 
* @brief 		 
*				 		
*/
typedef void(*RS485_Enviar_fPtr)( RS485_t_ptr );

/**
* @typedef   RS485_Run_fPtr
* @brief 		 
*				 		
*/
typedef void(*RS485_Run_fPtr)( RS485_t_ptr );

/**
* @typedef RS485_Flags_u
* @brief <descripcion>
*
* @see 
*/
typedef union
{
  uint8_t flags; /**<  */
  struct flagBit
  {
    uint8_t NuevaRecepcion : 1; /**<  */
    uint8_t Inicializado : 1; /**<  */
    uint8_t Standby : 1; /**<  */
    uint8_t NuevoEnvio : 1; /**<  */
    uint8_t EnvioPreparado : 1; /**<  */
    uint8_t bit5 : 1; /**<  */
    uint8_t bit6 : 1; /**<  */
    uint8_t bit7 : 1; /**<  */
  } bit;
}RS485_Flags_u;

/**
* @typedef RS485_CodError_e
* @brief <descripcion>
*
* @see 
*/
typedef enum
{
	RS485_SIN_FALLO,
	RS485_NO_CONEXION
}RS485_CodError_e;



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
	RS485_Config_t Config; /**<  */
	Buffer_Tramas_t Buffer; /**<  */
	RS485_Flags_u Flags; /**<  */
	RS485_CodError_e Error; /**<  */
	
	RS485_Recibir_fPtr Recibir;	/**<  */
	RS485_Enviar_fPtr Enviar;
	RS485_Run_fPtr Run;
	
	Sujeto_t Sujeto; /**<  */
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

void cbRS485_Recibir( RS485_t_ptr rs485 );
void cbRS485_Enviar( RS485_t_ptr rs485 );
void cbRS485_Run( RS485_t_ptr rs485 );

void cbRS485_SetSubscriptor( Sujeto_t_ptr sujeto, Observador_t_ptr observador );


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
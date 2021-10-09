#ifndef PATRONES_OBSERVADOR_H
#define PATRONES_OBSERVADOR_H

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
/** @file observador.h
 *  @brief 
 */

/** @addtogroup PLANTILLA
  * @{
  */
/******************************************************************************
* Includes
*******************************************************************************/
#include <stm8s.h>
#include <rs485_tramas.h>

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
* @typedef <name>
* @brief <descripcion>
*
* @see <referencias>
*/
typedef struct Observador Observador_t;

/**
* @typedef <name>
* @brief <descripcion>
*
* @see <referencias>
*/
typedef Observador_t* Observador_t_ptr;

/**
* @typedef   Notificacion_fPtr 
* @brief 		 
*				 		 
*/
typedef void(*Notificacion_fPtr)( Trama_RX_t* );

/**
* @typedef Observador_Tipo_Notificacion_e
* @brief <descripcion>
*
* @see 
*/
typedef enum 
{
	SINNOTIFICACION,
	RECEPCION
}Observador_Tipo_Notificacion_e;

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
* @struct Observador
* @brief 
*
* @see	RS485_NotificacionObs_fPtr
*/
struct Observador
{
	Observador_Tipo_Notificacion_e TipoNotificacion;
	Notificacion_fPtr  Notificacion;	/**<  */
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

void Observador_Init( Observador_t_ptr observador, Observador_Tipo_Notificacion_e tipoNotificacion, Notificacion_fPtr  notificacion );

#ifdef __cplusplus
} // extern "C"
#endif 

#endif

/**
  * @}
  */
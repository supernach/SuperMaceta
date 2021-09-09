#ifndef TIMEOUT_H
#define TIMEOUT_H

/****************************************************************************
* Title                 :   Timeout API
* Filename              :   Timeout.h
* Author                :   SuperNach
* Origin Date           :   9/09/2021
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
*  9/09/21   1.0.0   SuperNach       Initial Release.
*  
*
*******************************************************************************/
/** @file plantilla.h
 *  @brief 
 */
/******************************************************************************
* Includes
*******************************************************************************/
#include <stm8s.h>
#include <utils.h>
#include <Timeout_Config.h>

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
* @typedef Timeout_t
* @brief <descripcion>
*
* @see <referencias>
*/
typedef struct Timeout Timeout_t;

/**
* @typedef Timeout_t_ptr
* @brief <descripcion>
*
* @see <referencias>
*/
typedef Timeout_t* Timeout_t_ptr;

/**
* @typedef Timeout_Estado_e
* @brief <descripcion>
*
* @see <referencias>
*/
typedef enum
{
	INACTIVO,
	ACTIVO,
	DISPARADO
}Timeout_Estado_e;

/******************************************************************************
* Struct
*******************************************************************************/
/**
* @struct Timeout
* @brief 
*
* @see
*/
struct Timeout
{
	Timeout_Config_t Config;
	Timeout_Estado_e Estado;
	uint16_t ValorDesborde;
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

void Timeout_Init( Timeout_t_ptr timeout );
void Timeout_Start( Timeout_t_ptr timeout, uint16_t us );
void Timeout_Stop( Timeout_t_ptr timeout );
void Timeout_Check( Timeout_t_ptr timeout );

#ifdef __cplusplus
} // extern "C"
#endif 

#endif
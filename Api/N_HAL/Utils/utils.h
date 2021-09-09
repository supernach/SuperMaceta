#ifndef UTILS_H
#define UTILS_H

/****************************************************************************
* Title                 :   Utils NHAL
* Filename              :   Utils.h
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
/** @file  Utils.h
 *  @brief Define distintas funciones, macros utiles
 */

/******************************************************************************
* Includes
*******************************************************************************/
#include <stm8s.h>

/******************************************************************************
* Constants
*******************************************************************************/
#define FCLK 16000000 /**< Velocidad frecuencia cpu(depende de la configuracion) */

/******************************************************************************
* Configuration
*******************************************************************************/

/******************************************************************************
* Macros
*******************************************************************************/
#define NULL (void*)0 /**< Definicion de puntero nulo */
#define IS_NULL(val) ((val == NULL) ? true : false) /**< Chequeo puntero nulo */

#ifndef FCLK /**< Comprobacion que esta establecida la velocidad en Hz del reloj */
	#error FCLK is not defined! 
#endif
/******************************************************************************
* Typedefs
*******************************************************************************/

/******************************************************************************
* Variables
*******************************************************************************/

/******************************************************************************
* Function Prototypes
*******************************************************************************/
#ifdef __cplusplus
extern "C"{
#endif


static @inline void _delay_cycl( unsigned short __ticks )
{
	#define T_COUNT(x) (( x * (FCLK / 1000000UL) )-3)/3)
	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
}


static @inline void _delay_us( const unsigned short __us )
{
	_delay_cycl( (unsigned short)( T_COUNT(__us) );
}

static @inline void _delay_ms( unsigned short __ms )
{
	while ( __ms-- )
	{
		_delay_us( 1000 );
	}
}

#ifdef __cplusplus
} // extern "C"
#endif 

#endif 
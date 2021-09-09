#ifndef DHT11_H
#define DHT11_H

/****************************************************************************
* Title                 :   DHT11  DRIVER
* Filename              :   Dht11.h
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
/** @file Dht11.h
 *  @brief Configura y proporciona acceso a la lectura del sensor de temperatura
 *         y humedad DHT11
 */
/******************************************************************************
* Includes
*******************************************************************************/
#include <utils.h>
#include <Gpio.h>

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
typedef struct DHT11 DHT11_t;
typedef struct DHT11_Config DHT11_Config_t;
typedef struct sDht11_SI DHT11_SI_t;
typedef struct sDht11Datos DHT11_Datos_t;

typedef DHT11_SI_t ( *DHT11_fPtr )( DHT11_t* );
typedef DHT11_t* DHT11_t_ptr;

typedef enum
{
	dht11_INICIALIZADO,
	dht11_COMUNICANDO,
	dht11_CONEXION_OK,
	dht11_MIDIENDO_H,
	dht11_MIDIENDO_T,
	dht11_CERRANDO_CONEXION,
	dht11_SLEEP,
	dht11_ESPERA_BAJO,
	dht11_ESPERA_ALTO,
	dht11_FALLO_AL_LEER,
	dht11_FALLO_AL_COMUNICAR,
	dht11_LECTURA_OK
} DHT11_Estado_e;
/******************************************************************************
* Struct
*******************************************************************************/
struct sDht11_SI
{
	uint8_t CRC;
	uint8_t T_Decimal;
	uint8_t T_Entero;
	uint8_t H_Decimal;
	uint8_t H_Entero;
};

struct sDht11Datos
{
	DHT11_SI_t UltimaLectura;
	DHT11_Estado_e Estado;
};


struct DHT11_Config
{
	Gpio_Config_t HW;
};


struct DHT11
{
	DHT11_Config_t Config;
	DHT11_Datos_t Datos;
	
	DHT11_fPtr Lectura;
};

/******************************************************************************
* Variables
*******************************************************************************/

/******************************************************************************
* Function Prototypes
*******************************************************************************/
#ifdef __cplusplus
extern "C"{
#endif

void DHT11_Init( DHT11_t_ptr dht11 );
DHT11_SI_t dht11_Lectura( DHT11_t_ptr sensor );

#ifdef __cplusplus
} // extern "C"
#endif 

#endif
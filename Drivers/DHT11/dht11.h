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

#define DHT11_TIMEOUT_SI 1
#ifdef DHT11_TIMEOUT_SI
	#include <timeout.h>
#endif

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
* @typedef DHT11_t
* @brief Tipo que define el objeto principal DHT11
*
* @see DHT11
*/
typedef struct DHT11 DHT11_t;

/**
* @typedef DHT11_Config_t
* @brief Tipo que define la configuracion del sensor
*
* @see DHT11
*/
typedef struct DHT11_Config DHT11_Config_t;

/**
* @typedef DHT11_SI_t
* @brief Tipo que define la trama recibida del sensor
*
* @see sDht11_SI
*/
typedef struct sDht11_SI DHT11_SI_t;

/**
* @typedef DHT11_Datos_t
* @brief Tipo que define el esquema de datos del sensor
*
* @see sDht11Datos
*/
typedef struct sDht11Datos DHT11_Datos_t;

/**
* @typedef DHT11_t_ptr
* @brief Puntero a un objeto DHT11
*
* @see DHT11_t
*/
typedef DHT11_t* DHT11_t_ptr;

/**
* @typedef DHT11_fPtr
* @brief Puntero a una funcion para realizar acciones de lectura
*
* @see DHT11_SI_t
* @see DHT11_t_ptr
*/
typedef DHT11_SI_t ( *DHT11_fPtr )( DHT11_t_ptr );

/**
* @typedef DHT11_Estado_e
* @brief Distintos estados en los qu epuede encontrarse el sensor
*
* 
*/
typedef enum
{
	dht11_INICIALIZADO,				/**< En proceso de inicializar */
	dht11_COMUNICANDO,				/**< Comunicando con el sensor */
	dht11_CONEXION_OK,				/**< Sensor y conexion ok */
	dht11_MIDIENDO_H,					/**< Recibiendo valor humedad */
	dht11_MIDIENDO_T,					/**< Recibiendo valor temperatura */
	dht11_CERRANDO_CONEXION,	/**< Cerrando conexion con sensor */
	dht11_SLEEP,							/**< Sensor dormido */
	dht11_ESPERA_BAJO,				/**< Recibiendo datos. Espero sensor en bajo */
	dht11_ESPERA_ALTO,				/**< Recibiendo datos. Espero sensor en alto */
	dht11_FALLO_AL_LEER,			/**< Datos recibidos y crc no concuerdan */
	dht11_FALLO_AL_COMUNICAR,	/**< Sensor no responde */
	dht11_LECTURA_OK,					/**< Datos recibidos y crc concuerdan */
	dht11_TIMEOUT
} DHT11_Estado_e;

/******************************************************************************
* Struct
*******************************************************************************/
/**
* @struct sDht11_SI
* @brief Define el esquema de la trama recibida al leer el sensor
*
* 
*/
struct sDht11_SI
{
	uint8_t CRC;				/**< CRC recibido */
	uint8_t T_Decimal;	/**< Temperatura, parte decimal */
	uint8_t T_Entero;		/**< Temperatura, parte entera */
	uint8_t H_Decimal;	/**< Humedad, parte decimal */
	uint8_t H_Entero;		/**< Humedad, parte entera */
};

/**
* @struct sDht11Datos
* @brief Define la composicion de datos del sensor
*
* @see DHT11_SI_t
* @see DHT11_Estado_e
*/
struct sDht11Datos
{
	DHT11_SI_t UltimaLectura;	/**< Buffer de la ultima lectura */
	DHT11_Estado_e Estado;		/**< Estado del sensor */
};

/**
* @struct DHT11_Config
* @brief Define los pines elegidos para comunicar con el sensor
*
* @see Gpio_Config_t
*/
struct DHT11_Config
{
	Gpio_Config_t HW;	/**< Configuracion de los pine */
};

/**
* @struct DHT11
* @brief Define el objeto principal para interactuar con un sensor DHT11
*
* @see DHT11_Config_t
* @see DHT11_Datos_t
* @see DHT11_fPtr
*/
struct DHT11
{
	DHT11_Config_t Config;	/**< Configuracion del sensor */
	DHT11_Datos_t Datos;		/**< Datos del sensor */
	Timeout_t_ptr Timeout;  /**< Sin descripcion */
	
	DHT11_fPtr Lectura;			/**< Puntero a la funcion de lectura */
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

void DHT11_Init( DHT11_t_ptr dht11, DHT11_fPtr Lectura, Timeout_t_ptr timeout );
DHT11_SI_t dht11_Lectura( DHT11_t_ptr sensor );

#ifdef __cplusplus
} // extern "C"
#endif 

#endif
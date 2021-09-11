#ifndef HX711_H
#define HX711_H

/****************************************************************************
* Title                 :   HX711  DRIVER
* Filename              :   Hx711.h
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
/** @file Hx711.h
 *  @brief Configura y proporciona acceso a la lectura del sensor adc de 24 bits
 */
/******************************************************************************
* Includes
*******************************************************************************/
#include <utils.h>
#include <gpio.h>
#include <timeout.h>

/******************************************************************************
* Constants
*******************************************************************************/
/**
* @var   uint8_t  HX711_LONGITUDTRAMA
* @brief Define los bits a leer
*/
static const uint8_t HX711_LONGITUDTRAMA = 24;

/**
* @var   uint8_t  HX711_TIEMPOCLOCK
* @brief Define la espera entre acciones hacia y desde el hx711
*/
static const uint8_t HX711_TIEMPOCLOCK = 3;

/**
* @var   uint8_t  HX711_TIEMPOCLOCKSLEEP
* @brief Define el tiempo para poner en modo sleep el hx711
*/
static const uint8_t HX711_TIEMPOCLOCKSLEEP = 70;

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
* @typedef struct  HX711 HX711_t
* @brief	Crea un tipo de dato HX711 para trabajar sobre el
*					Contiene toda la funcionalidad del sensor
*/
typedef struct HX711 HX711_t;

/**
* @typedef   struct  _Config HX711_Config_t
* @brief 		 Tipo de dato para definir la configuracion del hx711
*/
typedef struct HX711_Config HX711_Config_t;

/**
* @typedef   struct  HX711_Datos HX711_Datos_t
* @brief 		 Tipo de dato para definir la informacion a almacenar
*/
typedef struct HX711_Datos HX711_Datos_t;

/**
* @typedef   uint16_t( *HX711_fPtr )( HX711_t* )  
* @brief 		 Puntero a funcion para definir las acciones del sensor
*				 		 asociadas a lecturas
*/
typedef uint16_t( *HX711_fPtr )( HX711_t* );

/**
* @typedef   HX711_t* HX711_t_ptr  
* @brief 		 Puntero al tipo HX711_t
*/
typedef HX711_t* HX711_t_ptr;

/**
* @typedef   enum HX711_Estado_e 
* @brief 		 Estados en los que puede encontrarse el HX711
*/
typedef enum
{
	INICIALIZADO, 			/**< hx711 listo  */
	SINVALORCONVERSION, /**< hx711 sin calibrar */
	SLEEP,							/**< hx711 durmiendo */
	NUEVA_LECTURA,			/**< hx711 nueva lectura disponible */
	TIMEOUT							/**< Timeout ocurrido */
} HX711_Estado_e;

/**
* @typedef   HX711_Ganancia_e  
* @brief 		 La ganancia que queremos definir para las lecturas
*/
typedef enum
{
	CHANNELA_128,	/**< ganancia de 128 */
	CHANNELA_64,	/**< ganancia de 64 */
	CHANNELB_32		/**< ganancia de 32 CanalB */
} HX711_Ganancia_e;

/******************************************************************************
* Struct
*******************************************************************************/
/**
* @struct HX711_Datos
* @brief 	Contiene los datos que podemos obtener dle hx711
*
* @see		HX711_Estado_e
*/
struct HX711_Datos
{
	uint32_t UltimaLectura;	/**< Resultado de la ultima lectura */
	HX711_Estado_e Estado;	/**< Como se encuentra */
};

/**
* @struct HX711_Config
* @brief 	Contiene elementos de configuracion para el hx711 y sus funciones
*
* @see		Gpio_Config_t
* @see		HX711_Ganancia_e
*/
struct HX711_Config
{
	Gpio_Config_t DOUT;					/**< Pin DOUT del hx711. Por aqui recibimos info */
	Gpio_Config_t PD_SCK;				/**< Pin PD_SCK del hx711. Señal de reloj para desplazar bits leidos */
	
	HX711_Ganancia_e Ganancia;	/**< Ganacia que queremos para el hx711 */
	uint16_t ValorConversion;		/**< Valor de calibracion con peso conocido. Usado para calcular respuesta lectura
															*		 TODO: Guardar en eeprom
															*/
	uint16_t ValorZero;					/**< Valor unico de cada grupo de 4 celulas de carga. Grabado en cada unidad
															* 	 TODO:Guardar en eeprom y por programa. No modificable
															*/
	uint16_t ValorTara;					/**< Valor guardado al ejecutar la funcion de taraje */
};

/**
* @struct  HX711 
* @brief 	 Objeto principal para interactuar con el hx711
*
* @see		HX711_Config_t
* @see		HX711_Datos_t
* @see		HX711_fPtr
*/
struct HX711
{
	HX711_Config_t Config;	/**< Configuracion del objeto hx711 */
	HX711_Datos_t Datos;		/**< Datos del objeto hx711 */
	Timeout_t* Timeout;
	
	HX711_fPtr Lectura;			/**< Puntero hacia la funcion de lectura */
	HX711_fPtr Tarar;				/**< Puntero hacia la funcion de taraje */
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

void HX711_Init( HX711_t_ptr hx711, HX711_fPtr Lectura, HX711_fPtr Tarar, Timeout_t_ptr Timeout );
uint16_t hx711_Lectura( HX711_t_ptr hx711 );
uint16_t hx711_Tarar( HX711_t_ptr hx711 );

#ifdef __cplusplus
} // extern "C"
#endif 

#endif
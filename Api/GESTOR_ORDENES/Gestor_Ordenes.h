#ifndef GESTOR_ORDENES_H
#define GESTOR_ORDENES_H

/****************************************************************************
* Title                 :   Gestor Ordenes Comm
* Filename              :   Gestor_ordenes.h
* Author                :   SuperNach
* Origin Date           :   26/09/2021
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
/** @file Gestor_Ordenes.h
 *  @brief 
 */

/** @addtogroup GESTOR_ORDENES
  * @{
  */
/******************************************************************************
* Includes
*******************************************************************************/
#include <stm8s.h>
#include <rs485.h>
#include <observador.h>
#include <utils.h>
#include <dht11.h>
#include <hx711.h>


/******************************************************************************
* Constants
*******************************************************************************/
/**
* @var GO_ORDENES_BYTES
* @brief 
*
* @see
*/
#define GO_ORDENES_BYTES 2

/**
* @var NUMERO_NODO_COMUNICACION
* @brief 
*
* @see
*/
#define NUMERO_NODO_COMUNICACION 1

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
* @typedef Gestor_Ordenes_t
* @brief <descripcion>
*
* @see Gestor_Ordenes
*/
typedef struct Gestor_Ordenes Gestor_Ordenes_t;

/**
* @typedef Gestor_Ordenes_t_ptr
* @brief <descripcion>
*
* @see Gestor_Ordenes_t
*/
typedef Gestor_Ordenes_t* Gestor_Ordenes_t_ptr;
/******************************************************************************
* Struct
*******************************************************************************/
/**
* @struct GO_NumeroNodo
* @brief 
*
* @see
*/
struct GO_NumeroNodo
{
	uint8_t Decena;
	uint8_t Unidad;
};

/**
* @struct GO_Orden
* @brief 
*
* @see
*/
struct GO_Orden
{
	uint8_t Funcion;
	uint8_t Comando;
};

/**
* @struct GO_Dispositivos
* @brief 
*
* @see	DHT11_t
* @see	HX711_t
*/
struct GO_Dispositivos
{
	DHT11_t* Dht11;
	HX711_t* Hx711;
};

/**
* @struct GO_Orden_DHT11
* @brief 
*
* @see	GO_Orden
*/
struct GO_Orden_DHT11
{
	bool Ejecutada;
	struct GO_Orden Orden;
};

/**
* @struct GO_Orden_HX711
* @brief 
*
* @see	GO_Orden Orden
*/
struct GO_Orden_HX711
{
	bool Ejecutada;
	struct GO_Orden Orden;
};

/**
* @struct GO_Datos_DHT11
* @brief 
*
* @see	
*/
struct GO_Datos_DHT11
{
	bool EnvioPreparado;
	uint8_t T_Entero;	/**< Temperatura, parte decimal */
	uint8_t T_Decimal;		/**< Temperatura, parte entera */
	uint8_t H_Entero;	/**< Humedad, parte decimal */
	uint8_t H_Decimal;	
};

/**
* @struct GO_Datos_HX711
* @brief 
*
* @see	
*/
struct GO_Datos_HX711
{
	bool EnvioPreparado;
	
	union
	{
		uint16_t Medida;
		struct
		{
			uint8_t alto;
			uint8_t bajo;
		}Bytes;
	};
};

/**
* @struct GO_Datos_Envio
* @brief 
*
* @see	GO_Datos_DHT11
* @see	GO_Datos_HX711
*/
struct GO_Datos_Envio
{
	struct GO_Datos_DHT11 Dht11;
	struct GO_Datos_HX711 Hx711;
};

/**
* @struct Gestor_Ordenes
* @brief 
*
* @see	GO_Orden_DHT11
* @see	GO_Orden_HX711
* @see	GO_Dispositivos
* @see	GO_Datos_Envio
* @see	Observador_t
* @see	RS485_t_ptr
*/
struct Gestor_Ordenes
{
	uint8_t nNodo;
	struct GO_Orden_DHT11 ordenDHT11;
	struct GO_Orden_HX711 ordenHX711;
	struct GO_Dispositivos Dispositivos;
	struct GO_Datos_Envio DatosEnvio;
	Observador_t GO_Observador;
	RS485_t_ptr rs485;
};

/******************************************************************************
* Variables
*******************************************************************************/
/**
* @var GestorRS485
* @brief 
*
* @see
*/
extern Gestor_Ordenes_t GestorRS485;

/******************************************************************************
* Function Prototypes
*******************************************************************************/
#ifdef __cplusplus
extern "C"{
#endif

void GO_Init( Gestor_Ordenes_t_ptr gestor, struct GO_Dispositivos dispositivos, RS485_t_ptr busComm );

void GO_evRecepcion( Trama_RX_t* );

#ifdef __cplusplus
} // extern "C"
#endif 

#endif

/**
  * @}
  */
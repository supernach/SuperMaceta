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

/******************************************************************************
* Constants
*******************************************************************************/
static const uint8_t LONGITUDTRAMA = 24;
static const uint8_t HX711_TIEMPOCLOCK = 3;

/******************************************************************************
* Configuration
*******************************************************************************/

/******************************************************************************
* Macros
*******************************************************************************/

/******************************************************************************
* Typedefs
*******************************************************************************/
typedef struct HX711 HX711_t;
typedef struct HX711_Config HX711_Config_t;
typedef struct HX711_Datos HX711_Datos_t;

typedef uint16_t( *HX711_fPtr )( HX711_t* );
typedef HX711_t* HX711_t_ptr;

typedef enum
{
	INICIALIZADO,
	SINVALORCONVERSION,
	SLEEP,
	NUEVA_LECTURA
} HX711_Estado_e;

typedef enum
{
	CHANNELA_128,
	CHANNELA_64,
	CHANNELB_32
} HX711_Ganancia_e;

/******************************************************************************
* Struct
*******************************************************************************/
struct HX711_Datos
{
	uint32_t UltimaLectura;
	HX711_Estado_e Estado;
};


struct HX711_Config
{
	Gpio_Config_t DOUT;
	Gpio_Config_t PD_SCK;
	
	HX711_Ganancia_e Ganancia;
	//Calcularlo poniendo un peso conocido. Luego dividir lectura entre 
	//peso en gramos para tener lectura en gramos. Asi queda calibrada.
	//Deberia guardarla en eeprom?
	uint16_t ValorConversion;
	//Valor sin peso...idealmente 0.
	uint16_t ValorZero;
	uint16_t ValorTara;
};


struct HX711
{
	HX711_Config_t Config;
	HX711_Datos_t Datos;
	
	HX711_fPtr Lectura;
	HX711_fPtr Tarar;
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

void HX711_Init( HX711_t_ptr hx711, HX711_fPtr Lectura, HX711_fPtr Tarar );
uint16_t hx711_Lectura( HX711_t_ptr hx711 );
uint16_t hx711_Tarar( HX711_t_ptr hx711 );

#ifdef __cplusplus
} // extern "C"
#endif 

#endif
#ifndef APPCONFIG_H
#define APPCONFIG_H

/****************************************************************************
* Title                 :   AppConfig
* Filename              :   AppConfig.h
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
/** @file  AppConfig.h
 *  @brief Archivo de configuracion para la aplicacion. Se declaran los componentes
 *         necesarios para su funcionamiento.
 */
/** @addtogroup APLICACION
  * @{
  */
/** @addtogroup CONFIGURACION
  * @{
  */
/** @addtogroup APPCONFIG
  * @{
  */
/******************************************************************************
* Includes
*******************************************************************************/
#include <stm8s.h>
#include <Clock.h>
#include <Gpio.h>
#include <timer_config.h>
#include <Dht11.h>
#include <Hx711.h>
#include <rs485.h>
#include <utils.h>


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

/******************************************************************************
* Variables
*******************************************************************************/
/**
* @var DHT11_t SensorTempHum
* @brief
*
* @see DHT11_t
*/
DHT11_t SensorTempHum;

/**
* @var HX711_t SensorPesaje
* @brief
*
* @see HX711_t
*/
HX711_t SensorPesaje;

/**
* @var tConfig_Timeout
* @brief
*
* @see Timeout_t
*/
Timer_t timer_Timeout;

/**
* @var Timeout
* @brief
*
* @see Timeout_t
*/
Timeout_t Timeout;

/**
* @var Comunicacion
* @brief
*
* @see RS485_t
*/
RS485_t Comunicacion;

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
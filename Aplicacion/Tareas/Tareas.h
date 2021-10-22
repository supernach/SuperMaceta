#ifndef TAREAS_H
#define TAREAS_H

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
/** @file plantilla.h
 *  @brief 
 */

/** @addtogroup PLANTILLA
  * @{
  */
/******************************************************************************
* Includes
*******************************************************************************/
#include <stm8s.h>
#include <utils.h>
#include <timer.h>
#include <hx711.h>
#include <dht11.h>
#include <led.h>


/******************************************************************************
* Constants
*******************************************************************************/
/**
* @var 
* @brief 
*
* @see
*/




/******************************************************************************
* Configuration
*******************************************************************************/
/**
* @var TAREAS_MAX
* @brief 
*
* @see
*/
#define TAREAS_MAX 4

/******************************************************************************
* Macros
*******************************************************************************/

/******************************************************************************
* Typedefs
*******************************************************************************/
/**
* @typedef Tarea_Tiempo_t
* @brief 
*
* @see Tarea_Tiempo
*/
typedef struct Tarea_Tiempo Tarea_Tiempo_t;

/**
* @typedef Tareas_t
* @brief <descripcion>
*
* @see Tareas
*/
typedef struct Tareas Tareas_t;

/**
* @typedef Tareas_t_ptr
* @brief <descripcion>
*
* @see Tareas_t
*/
typedef Tareas_t* Tareas_t_ptr;

/**
* @typedef Tarea_Tipo_e
* @brief <descripcion>
*
* @see <referencias>
*/
typedef enum 
{
	TAREA_NULL,
	TAREA_LECTURA,
	TAREA_LED_TOGGLE
}Tarea_Tipo_e;

/**
* @typedef Tarea_Tipo_Dispositivo_e
* @brief <descripcion>
*
* @see <referencias>
*/
typedef enum
{
	NODISP,
	HX711,
	DHT11,
	LED
}Tarea_Tipo_Dispositivo_e;

/**
* @typedef Tarea_Dispositivo_u
* @brief <descripcion>
*
* @see <referencias>
*/
typedef union
{
	void* Dispositivo;
	union
	{
		HX711_t_ptr Tarea_HX711;
		DHT11_t_ptr Tarea_DHT11;
		Led_t* Tarea_LedCheck;
	};
}Tarea_Dispositivo_u;




/******************************************************************************
* Struct
*******************************************************************************/
/**
* @struct Tarea_Tiempo
* @brief 
*
* @see
*/
struct Tarea_Tiempo
{
	uint16_t Actual;
	uint16_t Ejecucion;
};

/**
* @struct TareaConfig
* @brief 
*
* @see
*/
struct TareaConfig
{
	Tarea_Tiempo_t Tiempo;
	Tarea_Tipo_e TipoTarea;
	Tarea_Tipo_Dispositivo_e TipoDispositivo;
	Tarea_Dispositivo_u Tarea;
};

/**
* @struct Tareas
* @brief 
*
* @see
*/
struct Tareas
{
	uint8_t NumeroTareas;
	struct TareaConfig Tareas[TAREAS_MAX];
};



/******************************************************************************
* Variables
*******************************************************************************/
/**
* @var timerTick
* @brief 
*
* @see Timer_t
*/
static Timer_t timerTick;
/**
* @var timerTick_Config
* @brief 
*
* @see Timer_Config_t
*/
static Timer_Config_t timerTick_Config;

/******************************************************************************
* Function Prototypes
*******************************************************************************/
#ifdef __cplusplus
extern "C"{
#endif

void Tareas_Init( Tareas_t_ptr tareas );
void Tareas_Registrar( Tareas_t_ptr tareas, Tarea_Dispositivo_u dispositivo, uint16_t tiempo, Tarea_Tipo_e tipoTarea, Tarea_Tipo_Dispositivo_e tipoDispositivo );
void Tareas_Run( Tareas_t_ptr tareas );

#ifdef __cplusplus
} // extern "C"
#endif 

#endif

/**
  * @}
  */
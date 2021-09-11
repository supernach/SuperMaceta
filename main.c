/****************************************************************************
* Title                 :   MAIN
* Filename              :   main.c
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
/** @file main.c
 * @brief Ejecucion del trabajo a realizar
 */
/******************************************************************************
* Includes
*******************************************************************************/
#include <stm8s.h>
#include <AppConfig.h>


/**
/* @fn void DeInitAllGPIO
/* @brief Resetear todos los puertos perifericos
/*
/*
*/

static @inline void DeInitAllGPIO(void)
{
	GPIO_DeInit(GPIOA);
	GPIO_DeInit(GPIOB);
	GPIO_DeInit(GPIOC);
	GPIO_DeInit(GPIOD);
}

/**
/* @fn void Pin_Init
/* @brief Inicializacion de los pines fisicos asociados a sensores
/*        a traves del tipo Pin.
/*
/*
*/

static @inline void Pin_Init(void)
{
	// Configuracion sensor temperatura y humedad
	SensorTempHum.Config.HW.Puerto = GPIOA;
	SensorTempHum.Config.HW.Pin = GPIO_PIN_3;
	
	// Configuracion celula de carga
	SensorPesaje.Config.DOUT.Puerto = GPIOD;
	SensorPesaje.Config.DOUT.Pin = GPIO_PIN_2;
	
	SensorPesaje.Config.PD_SCK.Puerto = GPIOD;
	SensorPesaje.Config.PD_SCK.Pin = GPIO_PIN_3;
}

/**
/* @fn void InicializacionGPIO
/* @brief Inicializacion completa de las GPIO. Por ultimo
/*        la IO se configura segun se necesite.
/*
/*
*/

static @inline void InicializacionGPIO(void)
{
	Pin_Init();
}

/**
/* @fn void InicializacionCLK
/* @brief Inicializacion del reloj de sistema y cpu.
/*
/*
*/

static @inline void InicializacionCLK(void)
{
	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
}

/**
/* @fn void InicializacionComponentes
/* @brief Inicializacion componentes del sistema
/*
/*
*/
static @inline void InicializacionComponentes(void)
{
	timer_Timeout.Config.Timer = TIMER1;
	timer_Timeout.Config.Canal = CANAL1;
	timer_Timeout.Config.Modo = COUNTERUP;
	timer_Timeout.Config.IT = SI;
	timer_Timeout.Config.Tiempo = 1;
	
	Timeout_Init( &Timeout, &timer_Timeout, &getFlagTimer1, &setFlagTimer1 );
	DHT11_Init( &SensorTempHum, &dht11_Lectura );
	HX711_Init( &SensorPesaje, &hx711_Lectura, &hx711_Tarar, &Timeout );
}

/**
/* @fn void Inicializacion_Total
/* @brief Resumen de todas las anteriores inicializaciones
/*
/*
*/
static @inline void Inicializacion_Total(void)
{
	DeInitAllGPIO();
	InicializacionCLK();
	InicializacionGPIO();
	
	InicializacionComponentes();
}

/**
/*
/* @brief Rutina principal
/*
/*
*/

int main()
{
	Inicializacion_Total();
	
	SensorPesaje.Config.ValorZero = SensorPesaje.Tarar( &SensorPesaje );
	while (1)
	{
		//SensorTempHum.Datos.UltimaLectura = SensorTempHum.Lectura( &SensorTempHum );
		
		SensorPesaje.Datos.UltimaLectura = SensorPesaje.Lectura( &SensorPesaje );
		
		//_delay_ms( 1000 );
	}
}
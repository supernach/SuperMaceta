/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include <stm8s.h>
#include <AppConfig.h>

/**
/*
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
/*
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
/*
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
/*
/* @brief Inicializacion del reloj de sistema y cpu.
/*
/*
*/

static @inline void InicializacionCLK(void)
{
	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
}

static @inline void InicializacionComponentes(void)
{
	DHT11_Init( &SensorTempHum, &dht11_Lectura );
	HX711_Init( &SensorPesaje, &hx711_Lectura, &hx711_Tarar );
}

/**
/*
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
		SensorTempHum.Datos.UltimaLectura = SensorTempHum.Lectura( &SensorTempHum );
		
		SensorPesaje.Datos.UltimaLectura = SensorPesaje.Lectura( &SensorPesaje );
		
		_delay_ms( 1000 );
	}
}
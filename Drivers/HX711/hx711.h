#ifndef HX711_H
#define HX711_H

#include <utils.h>
#include <gpio.h>

typedef struct HX711 HX711_t;
typedef struct HX711_Config HX711_Config_t;
typedef struct HX711_Datos HX711_Datos_t;

typedef uint16_t( *HX711_fPtr )( HX711_t* );
typedef HX711_t* HX711_t_ptr;

static const uint8_t LONGITUDTRAMA = 24;

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



typedef struct HX711_Datos
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

void HX711_Init( HX711_t_ptr hx711, HX711_fPtr Lectura, HX711_fPtr Tarar );
uint16_t hx711_Lectura( HX711_t_ptr hx711 );
uint16_t hx711_Tarar( HX711_t_ptr hx711 );




#endif
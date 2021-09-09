#ifndef DHT11_H
#define DHT11_H

#include <utils.h>
#include <Gpio.h>

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

void DHT11_Init( DHT11_t_ptr dht11 );
DHT11_SI_t dht11_Lectura( DHT11_t_ptr sensor );




#endif
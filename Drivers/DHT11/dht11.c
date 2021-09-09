#include <dht11.h>

static @inline uint8_t leerByte( Gpio_Config_t* gpio )
{
	uint8_t contador = 0;
	uint8_t temp = 0;
	uint8_t bitLeido = 0;
	
	for( contador; contador < 8; contador++ )
	{
		while( !NHALgpio_Read( gpio ) ) //Espera nuevo bit
		{
		
		}
		_delay_us( 40 ); //Espero para comprobar nivel de la gpio +30us = 1 ; -30us = 0
	
		bitLeido = 0;
		if( NHALgpio_Read( gpio ) )
		{
			bitLeido = 1;
		}
		else
		{
			bitLeido = 0;
		}
		
		temp |= bitLeido;
		if( contador < 7 )
		{
			temp <<=  1;
		}
		
		while( NHALgpio_Read( gpio ) ) //Si el bit=1 espero a que baje señal
		{
			
		}
	}
	
	return temp;
}

static @inline bool dht11_ComenzarTransmision( DHT11_t_ptr sensor )
{
	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
	NHALgpio_Init( &sensor->Config.HW ); 
	
	NHALgpio_Write( &sensor->Config.HW, false );
	
	sensor->Datos.Estado = dht11_COMUNICANDO;
	_delay_ms( 18 ); //Espero tiempo puesta en marcha dht11
	
	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_IN_PU_NO_IT); //Configuro como entrada para leer
	NHALgpio_Init( &sensor->Config.HW ); 
	_delay_us( 40 );
	
	while( !NHALgpio_Read( &sensor->Config.HW ) )
	{
		sensor->Datos.Estado = dht11_ESPERA_BAJO;
	}
	
	
	while( NHALgpio_Read( &sensor->Config.HW ) )
	{
		sensor->Datos.Estado = dht11_ESPERA_ALTO;
	}
	
	
	sensor->Datos.Estado = dht11_CONEXION_OK;
	return true;
}

static @inline DHT11_SI_t dht11_LeerDatos( DHT11_t_ptr sensor )
{
	uint16_t checkCRC = 0;
	uint8_t mask = 0b11111111;
	
	DHT11_SI_t semilla = { 0, 0, 0, 0, 0 };
	
	sensor->Datos.Estado = dht11_MIDIENDO_H;
	semilla.H_Entero = leerByte(&sensor->Config.HW);
	
	sensor->Datos.Estado = dht11_MIDIENDO_H;
	semilla.H_Decimal = leerByte(&sensor->Config.HW);
	
	sensor->Datos.Estado = dht11_MIDIENDO_T;
	semilla.T_Entero = leerByte(&sensor->Config.HW);
	
	sensor->Datos.Estado = dht11_MIDIENDO_T;
	semilla.T_Decimal = leerByte(&sensor->Config.HW);
	
	semilla.CRC = leerByte(&sensor->Config.HW);
	
	checkCRC = semilla.H_Entero + semilla.H_Decimal + semilla.T_Entero + semilla.T_Decimal;
	checkCRC &= mask;
	
	if( checkCRC == semilla.CRC )
	{
		sensor->Datos.Estado = dht11_LECTURA_OK;
		return semilla;
	}
	else
	{
		sensor->Datos.Estado = dht11_FALLO_AL_LEER;
		return semilla;
	}
}

static @inline void dht11_CerrarConexion( DHT11_t_ptr sensor )
{
	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
	NHALgpio_Init( &sensor->Config.HW );
	
	NHALgpio_Write( &sensor->Config.HW, true );
	
	if( sensor->Datos.Estado == dht11_CERRANDO_CONEXION )
	{
		sensor->Datos.Estado = dht11_SLEEP;
	}	
}


void DHT11_Init( DHT11_t_ptr dht11 )
{
	dht11->Lectura = &dht11_Lectura;
	
	dht11->Datos.UltimaLectura.CRC = 0;
	dht11->Datos.UltimaLectura.T_Decimal = 0;
	dht11->Datos.UltimaLectura.T_Entero = 0;
	dht11->Datos.UltimaLectura.H_Decimal = 0;
	dht11->Datos.UltimaLectura.H_Entero = 0;
	
	NHALgpioConfig_SetType( &dht11->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
	NHALgpio_Init( &dht11->Config.HW );
	
	NHALgpio_Write( &dht11->Config.HW, true );
	
	dht11->Datos.Estado = dht11_INICIALIZADO;
	
}

DHT11_SI_t dht11_Lectura( DHT11_t_ptr dht11 )
{
	DHT11_SI_t lectura = { 0, 0, 0, 0, 0 };
	
	if( dht11_ComenzarTransmision( dht11 ) )
	{
		lectura = dht11_LeerDatos( dht11 );
		dht11_CerrarConexion( dht11 );
		
		return lectura;
	}
	else
	{
		dht11->Datos.Estado = dht11_FALLO_AL_COMUNICAR;
		dht11_CerrarConexion( dht11 );
		
		return lectura;
	}
}








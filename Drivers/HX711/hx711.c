#include <hx711.h>

#define HX711_TIEMPOCLOCK 3

static @inline void initPtrFunciones( HX711_t_ptr hx711, HX711_fPtr Lectura, HX711_fPtr Tarar )
{
	hx711->Lectura = Lectura;
	hx711->Tarar = Tarar;
}

static @inline void initVariables( HX711_t_ptr hx711 )
{
	hx711->Datos.UltimaLectura = 0;
	hx711->Config.ValorTara = 0;
	hx711->Config.ValorConversion = 1;
	hx711->Config.Ganancia = CHANNELA_128;
}

static @inline void initDOUT( Gpio_Config_t* dout )
{
	NHALgpioConfig_SetType( dout,GPIO_MODE_IN_PU_NO_IT );
	NHALgpio_Init( dout );
}

static @inline void initPDSCK( Gpio_Config_t* pdsck )
{
	NHALgpioConfig_SetType( pdsck, GPIO_MODE_OUT_PP_LOW_FAST );
	NHALgpio_Init( pdsck );
}

static @inline void chequearValorConversion( HX711_t_ptr hx711 )
{
	if( ( hx711->Config.ValorConversion ) == 0 )
	{
		hx711->Config.ValorConversion = 1;
		hx711->Datos.Estado = SINVALORCONVERSION;
	}
	else
	{
		hx711->Datos.Estado = INICIALIZADO;
	}
}

static @inline void aDormir( HX711_t_ptr hx711 )
{
	NHALgpio_Write( &hx711->Config.PD_SCK, true );
	_delay_us( 70 );
	
	if( hx711->Datos.Estado != SINVALORCONVERSION )
	{
		hx711->Datos.Estado = SLEEP;
	}
	else
	{
	}
}

static @inline void pulsoReloj( HX711_t_ptr hx711, bool estado )
{
	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
	_delay_us( HX711_TIEMPOCLOCK );
}

static @inline void fijarGanancia( HX711_t_ptr hx711 )
{
	switch( hx711->Config.Ganancia )
	{
		case CHANNELA_128:
			pulsoReloj( hx711, true );
			pulsoReloj( hx711, false );
		break;
		
		case CHANNELA_64:
			pulsoReloj( hx711, true );
			pulsoReloj( hx711, false );
			
			pulsoReloj( hx711, true );
			pulsoReloj( hx711, false );
			
			pulsoReloj( hx711, true );
			pulsoReloj( hx711, false );
		break;
		
		case CHANNELB_32:
			pulsoReloj( hx711, true );
			pulsoReloj( hx711, false );
			
			pulsoReloj( hx711, true );
			pulsoReloj( hx711, false );
		break;
		default:
		
		;
	}
}

static @inline void esperoDatosDisponibles( HX711_t_ptr hx711 )
{
	while( NHALgpio_Read( &hx711->Config.DOUT ) == true )
		{
		}
		_delay_us( HX711_TIEMPOCLOCK );
}

static @inline uint32_t leer( HX711_t_ptr hx711 )
{
	uint32_t semilla = 0;
	uint8_t contadorBucle = 0;
	
	if( hx711->Datos.Estado != SINVALORCONVERSION )
	{
		// Despierto el chip
		pulsoReloj( hx711, false );
		
		/*** Inicio recepcion **/
		esperoDatosDisponibles( hx711 );
	
		/*** Lectura de la trama 24 bits **/
		while( contadorBucle < LONGITUDTRAMA ) 
		{
			// Señal reloj en alto para iniciar recepcion  bit
			pulsoReloj( hx711, true );
			
			// Agregamos el estado del nuevo bit a la trama
			semilla |= NHALgpio_Read( &hx711->Config.DOUT );
			semilla <<= 1;
		
			contadorBucle++;
			
			// Señal reloj a low para finalizar recepcion del bit
			pulsoReloj( hx711, false );
		}
		
		fijarGanancia( hx711 );
		
		hx711->Datos.Estado = NUEVA_LECTURA;
	}
		return semilla;
}




void HX711_Init( HX711_t_ptr hx711, HX711_fPtr Lectura, HX711_fPtr Tarar )
{
	initPtrFunciones( hx711, Lectura, Tarar );
	
	initVariables( hx711 );
	
	initDOUT( &hx711->Config.DOUT );
	initPDSCK( &hx711->Config.PD_SCK );
	
	chequearValorConversion( hx711 );
	
	aDormir( hx711 );
}

uint16_t hx711_Lectura( HX711_t_ptr hx711 )
{
	uint32_t semilla = 0;
	
	semilla = leer( hx711 );
	aDormir( hx711 );
		
	return ( semilla / hx711->Config.ValorConversion );
}

uint16_t hx711_Tarar( HX711_t_ptr hx711 )
{
	uint32_t valorMedio = 0;
	uint8_t repeticiones = 4;
	
	while( ( repeticiones > 0 ) )
	{
		valorMedio = valorMedio + leer( hx711 );
		
		--repeticiones;
	}
	repeticiones = 4;
	
	return valorMedio/repeticiones;
}








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


/******************************************************************************
* Function : DeInitAllGPIO()
*//**
* \b Description: 
*
* Pone en estado de fabrica los puertos
*
* POST-CONDITION: Los puertos estan incializados de fabrica
* 
* @param	void				
*
* @return 		void
*
* \b Example Ejemplo:
* @code
*		DeInitAllGPIO( );
* @endcode
* 
*
* <br><b> - CHANGELOG - </b>
*
* <table align="left" style="width:800px">
* <tr><td> Fecha       </td><td> Software Version </td><td> Creador </td><td> Descripcion </td></tr>
* <tr><td> 20/08/2021  </td><td> 1.0.0            </td><td> SuperNach  </td><td> Primera edicion </td></tr>
* </table><br><br>
* <hr>
*
*******************************************************************************/
static @inline void DeInitAllGPIO(void)
{
	GPIO_DeInit(GPIOA);
	GPIO_DeInit(GPIOB);
	GPIO_DeInit(GPIOC);
	GPIO_DeInit(GPIOD);
}

/******************************************************************************
* Function : Pin_Init()
*//**
* \b Description:
*
* Asignamos las direcciones fisicas de los puertos a los dispositivos
* utilizados en el sistema
*
*
* PRE-CONDITION: Saber que pines hay que inicializar
*
* POST-CONDITION: Los dispositivos pueden inicializar su parte fisica
* 
*			
*
* @return 		void
*
* \b Example Ejemplo:
* @code
*		Pin_Init( );
* @endcode
*
* @see 
* @see 
*
* <br><b> - CHANGELOG - </b>
*
* <table align="left" style="width:800px">
* <tr><td> Fecha       </td><td> Software Version </td><td> Creador </td><td> Descripcion </td></tr>
* <tr><td> 20/08/2021  </td><td> 1.0.0            </td><td> SuperNach      </td><td> Primera edicion </td></tr>
* </table><br><br>
* <hr>
*
*******************************************************************************/
static @inline void Pin_Init(void)
{
	Led_Check.HW.Puerto = GPIOB;
	Led_Check.HW.Pin = GPIO_PIN_5;

	// Configuracion sensor temperatura y humedad
	SensorTempHum.Config.HW.Puerto = GPIOA;
	SensorTempHum.Config.HW.Pin = GPIO_PIN_3;
	
	// Configuracion celula de carga
	SensorPesaje.Config.DOUT.Puerto = GPIOD;
	SensorPesaje.Config.DOUT.Pin = GPIO_PIN_2;
	
	SensorPesaje.Config.PD_SCK.Puerto = GPIOD;
	SensorPesaje.Config.PD_SCK.Pin = GPIO_PIN_3;
}

/******************************************************************************
* Function : InicializacionGPIO()
*//**
* \b Description:
*
* Ejecuta la inicializacion fisica de los pines
*
* PRE-CONDITION: Pin_Init( ) configurado
*
*
*
* 
*			
*
* @return 		void
*
* \b Example Ejemplo:
* @code
*		InicializacionGPIO( );
* @endcode
*
* @see 
* @see 
*
* <br><b> - CHANGELOG - </b>
*
* <table align="left" style="width:800px">
* <tr><td> Fecha       </td><td> Software Version </td><td> Creador </td><td> Descripcion </td></tr>
* <tr><td> 20/08/2021  </td><td> 1.0.0            </td><td> SuperNach      </td><td> Primera edicion </td></tr>
* </table><br><br>
* <hr>
*
*******************************************************************************/
static @inline void InicializacionGPIO(void)
{
	Pin_Init();
}

/******************************************************************************
* Function : InicializacionCLK()
*//**
* \b Description:
*
* Ejecuto la inicializacion del reloj de la cpu
*
* 
*
* POST-CONDITION: El reloj ha sido configurado a la velocidad elegida
* 
* @param			
* @param			
*
* @return 		void
*
* \b Example Ejemplo:
* @code
*		
* @endcode
*
* @see 
* @see 
*
* <br><b> - CHANGELOG - </b>
*
* <table align="left" style="width:800px">
* <tr><td> Fecha       </td><td> Software Version </td><td> Creador </td><td> Descripcion </td></tr>
* <tr><td> 20/08/2021  </td><td> 1.0.0            </td><td> SN      </td><td> Primera edicion </td></tr>
* </table><br><br>
* <hr>
*
*******************************************************************************/
static @inline void InicializacionCLK(void)
{
	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
}

/******************************************************************************
* Function : plantilla()
*//**
* \b Description:
*
* plantilla descripcion
*
* PRE-CONDITION: 
* PRE-CONDITION: 
* PRE-CONDITION: 
*
* POST-CONDITION: 
* 
* @param			
* @param			
*
* @return 		void
*
* \b Example Ejemplo:
* @code
*		
* @endcode
*
* @see 
* @see 
*
* <br><b> - CHANGELOG - </b>
*
* <table align="left" style="width:800px">
* <tr><td> Fecha       </td><td> Software Version </td><td> Creador </td><td> Descripcion </td></tr>
* <tr><td> 20/08/2021  </td><td> 1.0.0            </td><td> SN      </td><td> Primera edicion </td></tr>
* </table><br><br>
* <hr>
*
*******************************************************************************/
static @inline void InicializarTareas( void )
{
	Tarea_Dispositivo_u dispositivoAuxiliar;
	
	Tareas_Init( &GestorTareas );
	
	dispositivoAuxiliar.Dispositivo = &SensorPesaje;
	Tareas_Registrar( &GestorTareas, dispositivoAuxiliar, 200, TAREA_LECTURA, HX711 );
	
	dispositivoAuxiliar.Dispositivo = &SensorTempHum;
	Tareas_Registrar( &GestorTareas, dispositivoAuxiliar, 1000, TAREA_LECTURA, DHT11 );
	
	dispositivoAuxiliar.Dispositivo = &Led_Check;
	Tareas_Registrar( &GestorTareas, dispositivoAuxiliar, 650, TAREA_LED_TOGGLE, LED );
}

/******************************************************************************
* Function : plantilla()
*//**
* \b Description:
*
* plantilla descripcion
*
* PRE-CONDITION: 
* PRE-CONDITION: 
* PRE-CONDITION: 
*
* POST-CONDITION: 
* 
* @param			
* @param			
*
* @return 		void
*
* \b Example Ejemplo:
* @code
*		
* @endcode
*
* @see 
* @see 
*
* <br><b> - CHANGELOG - </b>
*
* <table align="left" style="width:800px">
* <tr><td> Fecha       </td><td> Software Version </td><td> Creador </td><td> Descripcion </td></tr>
* <tr><td> 20/08/2021  </td><td> 1.0.0            </td><td> SN      </td><td> Primera edicion </td></tr>
* </table><br><br>
* <hr>
*
*******************************************************************************/
static @inline void InicializarGestorOrdenes( void )
{
	struct GO_Dispositivos dispositivos;
	
	dispositivos.Dht11 = &SensorTempHum;
	dispositivos.Hx711 = &SensorPesaje;
	dispositivos.LedCheck = &Led_Check;
	GO_Init( &GestorRS485, dispositivos , &Comunicacion );
}

/******************************************************************************
* Function : plantilla()
*//**
* \b Description:
*
* plantilla descripcion
*
* PRE-CONDITION: 
* PRE-CONDITION: 
* PRE-CONDITION: 
*
* POST-CONDITION: 
* 
* @param			
* @param			
*
* @return 		void
*
* \b Example Ejemplo:
* @code
*		
* @endcode
*
* @see 
* @see 
*
* <br><b> - CHANGELOG - </b>
*
* <table align="left" style="width:800px">
* <tr><td> Fecha       </td><td> Software Version </td><td> Creador </td><td> Descripcion </td></tr>
* <tr><td> 20/08/2021  </td><td> 1.0.0            </td><td> SN      </td><td> Primera edicion </td></tr>
* </table><br><br>
* <hr>
*
*******************************************************************************/
static @inline void InicializacionComponentes(void)
{
	Timer_Config_Init( &timer_Timeout.Config, TIMER1, CANAL1, COUNTERUP, SI, 1 );
	Timeout_Init( &Timeout, &timer_Timeout, &getFlagTimer1, &setFlagTimer1 );
	
	DHT11_Init( &SensorTempHum, &dht11_Lectura, &Timeout );
	HX711_Init( &SensorPesaje, &hx711_Lectura, &hx711_Tarar, &Timeout );
	Led_Init( &Led_Check );
	
	RS485_Init( &Comunicacion );
	
	InicializarGestorOrdenes( );

	InicializarTareas( );
}

/******************************************************************************
* Function : plantilla()
*//**
* \b Description:
*
* plantilla descripcion
*
* PRE-CONDITION: 
* PRE-CONDITION: 
* PRE-CONDITION: 
*
* POST-CONDITION: 
* 
* @param			
* @param			
*
* @return 		void
*
* \b Example Ejemplo:
* @code
*		
* @endcode
*
* @see 
* @see 
*
* <br><b> - CHANGELOG - </b>
*
* <table align="left" style="width:800px">
* <tr><td> Fecha       </td><td> Software Version </td><td> Creador </td><td> Descripcion </td></tr>
* <tr><td> 20/08/2021  </td><td> 1.0.0            </td><td> SN      </td><td> Primera edicion </td></tr>
* </table><br><br>
* <hr>
*
*******************************************************************************/
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
		Comunicacion.Run( &Comunicacion );
		
		Tareas_Run( &GestorTareas );
		
	}
}
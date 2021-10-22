/****************************************************************************
* Title                 :   plantilla
* Filename              :   plantilla.c
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
/** @file plantilla.c
 *  @brief 
 */
/** @addtogroup PLANTILLA
  * @{
  */
/******************************************************************************
* Includes
*******************************************************************************/
#include <tareas.h>

/******************************************************************************
* Module Preprocessor Constants
*******************************************************************************/

/******************************************************************************
* Module Preprocessor Macros
*******************************************************************************/

/******************************************************************************
* Module Typedefs
*******************************************************************************/

/******************************************************************************
* Module Variable Definitions
*******************************************************************************/

/******************************************************************************
* Function Prototypes
*******************************************************************************/
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
static @inline void Tarea_Null( void )
{
	
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
static @inline void Tarea_Lectura( Tareas_t_ptr tareas, uint8_t indice )
{
	switch( tareas->Tareas[indice].TipoDispositivo )
	{
		case HX711:
			tareas->Tareas[indice].Tarea.Tarea_HX711->Datos.UltimaLectura = tareas->Tareas[indice].Tarea.Tarea_HX711->Lectura( tareas->Tareas[indice].Tarea.Tarea_HX711 );
		break;
		
		case DHT11:
			tareas->Tareas[indice].Tarea.Tarea_DHT11->Datos.UltimaLectura = tareas->Tareas[indice].Tarea.Tarea_DHT11->Lectura( tareas->Tareas[indice].Tarea.Tarea_DHT11 );
		break;
		
		case NODISP:
		break;
	}
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
static @inline void Tarea_Led_Toggle( Tareas_t_ptr tareas, uint8_t indice )
{
	if( tareas->Tareas[indice].Tarea.Tarea_LedCheck->Estado.bitEstado.ComandoRecibido == true )
	{
		if( tareas->Tareas[indice].Tarea.Tarea_LedCheck->Estado.bitEstado.Encendido == true )
		{
			tareas->Tareas[indice].Tarea.Tarea_LedCheck->SetLed( tareas->Tareas[indice].Tarea.Tarea_LedCheck, true );
		}
		else
		{
			tareas->Tareas[indice].Tarea.Tarea_LedCheck->SetLed( tareas->Tareas[indice].Tarea.Tarea_LedCheck, false );
		}
	}
	else
	{
		tareas->Tareas[indice].Tarea.Tarea_LedCheck->SetLed( tareas->Tareas[indice].Tarea.Tarea_LedCheck, true );
	}
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
static @inline void TareaTick_1ms_Init( void )
{
	Timer_Config_Init( &timerTick.Config, TIMER2, SINCANAL, COUNTERUP, SI, 1000 );
	Timer_Init( &timerTick );
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
void Tareas_Init( Tareas_t_ptr tareas )
{
	uint8_t auxiliar = 0;
	
	TareaTick_1ms_Init( );
	
	tareas->NumeroTareas = 0;
	
	while( auxiliar < TAREAS_MAX )
	{
		tareas->Tareas[auxiliar].Tiempo.Actual = 0;
		tareas->Tareas[auxiliar].Tiempo.Ejecucion = 0;
		tareas->Tareas[auxiliar].TipoTarea = TAREA_NULL;
		tareas->Tareas[auxiliar].Tarea.Dispositivo = NULL;
		auxiliar++;
	}
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
void Tareas_Registrar( Tareas_t_ptr tareas, Tarea_Dispositivo_u dispositivo, uint16_t tiempo, Tarea_Tipo_e tipoTarea, Tarea_Tipo_Dispositivo_e tipoDispositivo )
{
	if( tareas->NumeroTareas < TAREAS_MAX )
	{
		if( dispositivo.Dispositivo != NULL )
		{
			if( tareas->Tareas[tareas->NumeroTareas].Tarea.Dispositivo == NULL )
			{
				tareas->Tareas[tareas->NumeroTareas].TipoDispositivo = tipoDispositivo;
				
				switch( tipoDispositivo )
				{
					case HX711:
						tareas->Tareas[tareas->NumeroTareas].Tarea.Tarea_HX711 = dispositivo.Tarea_HX711;
					break;
					
					case DHT11:
						tareas->Tareas[tareas->NumeroTareas].Tarea.Tarea_DHT11 = dispositivo.Tarea_DHT11;
					break;
					
					case LED:
						tareas->Tareas[tareas->NumeroTareas].Tarea.Tarea_LedCheck = dispositivo.Tarea_LedCheck;
					break;
					
					case NODISP:
						tareas->Tareas[tareas->NumeroTareas].Tarea.Dispositivo = NULL;
					break;
				}
				
				tareas->Tareas[tareas->NumeroTareas].Tiempo.Ejecucion = tiempo;
				tareas->Tareas[tareas->NumeroTareas].Tiempo.Actual = 0;
				tareas->Tareas[tareas->NumeroTareas].TipoTarea = tipoTarea;
				tareas->NumeroTareas = tareas->NumeroTareas + 1;
			}
		}
	}
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
void Tareas_Run( Tareas_t_ptr tareas )
{
	uint8_t auxiliar = 0;
	
	if( getFlagTimer2( ) > 0 ) // compruebo cuantos ticks ha habido
	{
		while( auxiliar <  tareas->NumeroTareas )// sumo ticks
		{
			tareas->Tareas[auxiliar].Tiempo.Actual = tareas->Tareas[auxiliar].Tiempo.Actual + getFlagTimer2( );
			auxiliar = auxiliar + 1;
		}
		auxiliar = 0;
		setFlagTimer2( 0 );
	}
	
	while( auxiliar < tareas->NumeroTareas )
	{
		if( tareas->Tareas[auxiliar].Tiempo.Actual >= tareas->Tareas[auxiliar].Tiempo.Ejecucion ) //ejecutar tarea
		{
			switch (  tareas->Tareas[auxiliar].TipoTarea )
			{
				case TAREA_NULL:
					Tarea_Null( );
				break;
				
				case TAREA_LECTURA:
					Tarea_Lectura( tareas, auxiliar );
					tareas->Tareas[auxiliar].Tiempo.Actual = 1;
				break;
				
				case TAREA_LED_TOGGLE:
					Tarea_Led_Toggle( tareas, auxiliar );
					tareas->Tareas[auxiliar].Tiempo.Actual = 1;
				break;
			}
		}
		auxiliar = auxiliar + 1;
	}
	auxiliar = 0;
}


/**
  * @}
  */
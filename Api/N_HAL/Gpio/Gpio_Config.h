#ifndef GPIO_CONFIG_H
#define GPIO_CONFIG_H

/**

@file Gpio_Config.h
@brief 
			 
@author Supernach
@date 8/2021

*/
			 

#include <stm8s.h>

typedef struct Gpio_Config_t Gpio_Config_t;
struct Gpio_Config_t
{
	GPIO_TypeDef* Puerto;
	GPIO_Pin_TypeDef Pin;
	GPIO_Mode_TypeDef Tipo;
};

/**<TODO: Mejorar abstraccion del parametro tipo */
void NHALgpioConfig_SetType( Gpio_Config_t* gpio, GPIO_Mode_TypeDef tipo );


#endif
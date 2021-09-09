   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
 345                     ; 99 void NHALgpioConfig_SetType( Gpio_Config_t* gpio, GPIO_Mode_TypeDef nuevoTipo )
 345                     ; 100 {
 347                     .text:	section	.text,new
 348  0000               _NHALgpioConfig_SetType:
 350       fffffffe      OFST: set -2
 353                     ; 101 	gpio->Tipo = nuevoTipo;
 355  0000 7b03          	ld	a,(OFST+5,sp)
 356  0002 e703          	ld	(3,x),a
 357                     ; 102 }
 360  0004 81            	ret	
 373                     	xdef	_NHALgpioConfig_SetType
 392                     	end

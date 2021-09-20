   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
 376                     ; 111 void NHALgpioConfig_SetType( Gpio_Config_t* gpio, GPIO_Mode_TypeDef nuevoTipo )
 376                     ; 112 {
 378                     .text:	section	.text,new
 379  0000               _NHALgpioConfig_SetType:
 381       fffffffe      OFST: set -2
 384                     ; 113 	gpio->Tipo = nuevoTipo;
 386  0000 7b03          	ld	a,(OFST+5,sp)
 387  0002 e703          	ld	(3,x),a
 388                     ; 114 }
 391  0004 81            	ret	
 404                     	xdef	_NHALgpioConfig_SetType
 423                     	end

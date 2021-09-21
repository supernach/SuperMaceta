   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  21  0002               L5_flagUartRXNE:
  22  0002 00            	dc.b	0
 387                     ; 111 void NHALgpioConfig_SetType( Gpio_Config_t* gpio, GPIO_Mode_TypeDef nuevoTipo )
 387                     ; 112 {
 389                     .text:	section	.text,new
 390  0000               _NHALgpioConfig_SetType:
 392       fffffffe      OFST: set -2
 395                     ; 113 	gpio->Tipo = nuevoTipo;
 397  0000 7b03          	ld	a,(OFST+5,sp)
 398  0002 e703          	ld	(3,x),a
 399                     ; 114 }
 402  0004 81            	ret	
 415                     	xdef	_NHALgpioConfig_SetType
 434                     	end

   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  21  0002               L5_flagUartRXNE:
  22  0002 00            	dc.b	0
  23  0003               L11_flagUartTXE:
  24  0003 00            	dc.b	0
 398                     ; 111 void NHALgpioConfig_SetType( Gpio_Config_t* gpio, GPIO_Mode_TypeDef nuevoTipo )
 398                     ; 112 {
 400                     .text:	section	.text,new
 401  0000               _NHALgpioConfig_SetType:
 403       fffffffe      OFST: set -2
 406                     ; 113 	gpio->Tipo = nuevoTipo;
 408  0000 7b03          	ld	a,(OFST+5,sp)
 409  0002 e703          	ld	(3,x),a
 410                     ; 114 }
 413  0004 81            	ret	
 426                     	xdef	_NHALgpioConfig_SetType
 445                     	end

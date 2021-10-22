   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  21  0002               L5_flagTimer2:
  22  0002 0000          	dc.w	0
  23  0004               L7_flagUartRXNE:
  24  0004 00            	dc.b	0
  25  0005               L31_flagUartTXE:
  26  0005 00            	dc.b	0
 409                     ; 111 void NHALgpioConfig_SetType( Gpio_Config_t* gpio, GPIO_Mode_TypeDef nuevoTipo )
 409                     ; 112 {
 411                     .text:	section	.text,new
 412  0000               _NHALgpioConfig_SetType:
 414       fffffffe      OFST: set -2
 417                     ; 113 	gpio->Tipo = nuevoTipo;
 419  0000 7b03          	ld	a,(OFST+5,sp)
 420  0002 e703          	ld	(3,x),a
 421                     ; 114 }
 424  0004 81            	ret	
 437                     	xdef	_NHALgpioConfig_SetType
 456                     	end

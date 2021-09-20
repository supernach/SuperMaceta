   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
 380                     ; 106 void RS485_Init( RS485_t_ptr rs485 )
 380                     ; 107 {
 382                     .text:	section	.text,new
 383  0000               _RS485_Init:
 387                     ; 108 	rs485->Config.UART.StopBit = UART1_STOPBITS_1;
 389  0000 7f            	clr	(x)
 390                     ; 109 	rs485->Config.UART.Paridad = UART1_PARITY_NO;
 392  0001 6f01          	clr	(1,x)
 393                     ; 110 	rs485->Config.UART.Bits = UART1_WORDLENGTH_8D;
 395  0003 6f02          	clr	(2,x)
 396                     ; 111 	rs485->Config.UART.Baudios = 9600;
 398  0005 a680          	ld	a,#128
 399  0007 e706          	ld	(6,x),a
 400  0009 a625          	ld	a,#37
 401  000b e705          	ld	(5,x),a
 402  000d 4f            	clr	a
 403  000e e704          	ld	(4,x),a
 404  0010 e703          	ld	(3,x),a
 405                     ; 112 	rs485->Config.UART.Modo = UART1_MODE_RX_ENABLE;
 407  0012 a608          	ld	a,#8
 408  0014 e707          	ld	(7,x),a
 409                     ; 113 	rs485->Config.UART.TipoInterrupcion = UART1_FLAG_RXNE;
 411  0016 90ae0020      	ldw	y,#32
 412  001a ef08          	ldw	(8,x),y
 413                     ; 114 }
 416  001c 81            	ret	
 429                     	xdef	_RS485_Init
 448                     	end

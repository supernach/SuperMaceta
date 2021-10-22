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
 193                     ; 103 void Observador_Init( Observador_t_ptr observador, Observador_Tipo_Notificacion_e tipoNotificacion, Notificacion_fPtr  notificacion )
 193                     ; 104 {
 195                     .text:	section	.text,new
 196  0000               _Observador_Init:
 198       fffffffe      OFST: set -2
 201                     ; 105 	observador->TipoNotificacion = tipoNotificacion;
 203  0000 7b03          	ld	a,(OFST+5,sp)
 204  0002 f7            	ld	(x),a
 205                     ; 106 	observador->Notificacion = notificacion;
 207  0003 1604          	ldw	y,(OFST+6,sp)
 208  0005 ef01          	ldw	(1,x),y
 209                     ; 107 }
 212  0007 81            	ret	
 225                     	xdef	_Observador_Init
 244                     	end

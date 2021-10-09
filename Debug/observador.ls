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
 182                     ; 103 void Observador_Init( Observador_t_ptr observador, Observador_Tipo_Notificacion_e tipoNotificacion, Notificacion_fPtr  notificacion )
 182                     ; 104 {
 184                     .text:	section	.text,new
 185  0000               _Observador_Init:
 187       fffffffe      OFST: set -2
 190                     ; 105 	observador->TipoNotificacion = tipoNotificacion;
 192  0000 7b03          	ld	a,(OFST+5,sp)
 193  0002 f7            	ld	(x),a
 194                     ; 106 	observador->Notificacion = notificacion;
 196  0003 1604          	ldw	y,(OFST+6,sp)
 197  0005 ef01          	ldw	(1,x),y
 198                     ; 107 }
 201  0007 81            	ret	
 214                     	xdef	_Observador_Init
 233                     	end

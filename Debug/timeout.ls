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
 406                     ; 113 void Timeout_Init( Timeout_t_ptr timeout, Timer_t_ptr timer, Timeout_Notificacion isr_Notificacion, Timeout_ResetNotificacion isr_Reset )
 406                     ; 114 {
 408                     .text:	section	.text,new
 409  0000               _Timeout_Init:
 411  0000 89            	pushw	x
 412       00000000      OFST:	set	0
 415                     ; 115 	timeout->Config.Notificacion = isr_Notificacion;
 417  0001 1607          	ldw	y,(OFST+7,sp)
 418  0003 ef02          	ldw	(2,x),y
 419                     ; 116 	timeout->Config.ResetNotificacion = isr_Reset;
 421  0005 1609          	ldw	y,(OFST+9,sp)
 422  0007 ef04          	ldw	(4,x),y
 423                     ; 117 	timeout->Config.Timer = timer;
 425  0009 1605          	ldw	y,(OFST+5,sp)
 426  000b ff            	ldw	(x),y
 427                     ; 118 	timeout->Estado = INACTIVO;
 429  000c 6f06          	clr	(6,x)
 430                     ; 119 	timeout->ValorDesborde = timer->Config.Tiempo;
 432  000e 93            	ldw	x,y
 433  000f 1601          	ldw	y,(OFST+1,sp)
 434  0011 ee04          	ldw	x,(4,x)
 435  0013 90ef07        	ldw	(7,y),x
 436                     ; 120 }
 439  0016 85            	popw	x
 440  0017 81            	ret	
 487                     ; 158 void Timeout_Start( Timeout_t_ptr timeout, uint16_t microsegundos )
 487                     ; 159 {
 488                     .text:	section	.text,new
 489  0000               _Timeout_Start:
 491  0000 89            	pushw	x
 492       00000000      OFST:	set	0
 495                     ; 160 	if( timeout->Estado == INACTIVO )
 497  0001 e606          	ld	a,(6,x)
 498  0003 261a          	jrne	L713
 499                     ; 162 		timeout->Config.Timer->Config.Tiempo = microsegundos;
 501  0005 fe            	ldw	x,(x)
 502  0006 1605          	ldw	y,(OFST+5,sp)
 503  0008 ef04          	ldw	(4,x),y
 504                     ; 163 		Timer_Init( timeout->Config.Timer );
 506  000a 1e01          	ldw	x,(OFST+1,sp)
 507  000c fe            	ldw	x,(x)
 508  000d cd0000        	call	_Timer_Init
 510                     ; 165 		timeout->ValorDesborde = timeout->Config.Timer->Config.Tiempo;
 512  0010 1e01          	ldw	x,(OFST+1,sp)
 513  0012 fe            	ldw	x,(x)
 514  0013 1601          	ldw	y,(OFST+1,sp)
 515  0015 ee04          	ldw	x,(4,x)
 516  0017 90ef07        	ldw	(7,y),x
 517                     ; 166 		timeout->Estado = ACTIVO;
 519  001a 93            	ldw	x,y
 520  001b a601          	ld	a,#1
 521  001d e706          	ld	(6,x),a
 522  001f               L713:
 523                     ; 168 }
 526  001f 85            	popw	x
 527  0020 81            	ret	
 565                     ; 205 void Timeout_Stop( Timeout_t_ptr timeout )
 565                     ; 206 {
 566                     .text:	section	.text,new
 567  0000               _Timeout_Stop:
 569  0000 89            	pushw	x
 570       00000000      OFST:	set	0
 573                     ; 207 	Timer_DeInit( timeout->Config.Timer );
 575  0001 fe            	ldw	x,(x)
 576  0002 cd0000        	call	_Timer_DeInit
 578                     ; 209 	timeout->Config.ResetNotificacion( 0 );
 580  0005 1601          	ldw	y,(OFST+1,sp)
 581  0007 5f            	clrw	x
 582  0008 90ee04        	ldw	y,(4,y)
 583  000b 90fd          	call	(y)
 585                     ; 210 	timeout->ValorDesborde = 0;
 587  000d 1e01          	ldw	x,(OFST+1,sp)
 588  000f 905f          	clrw	y
 589  0011 ef07          	ldw	(7,x),y
 590                     ; 211 	timeout->Estado = INACTIVO;
 592  0013 6f06          	clr	(6,x)
 593                     ; 212 }
 596  0015 85            	popw	x
 597  0016 81            	ret	
 610                     	xdef	_Timeout_Stop
 611                     	xdef	_Timeout_Start
 612                     	xdef	_Timeout_Init
 613                     	xref	_Timer_DeInit
 614                     	xref	_Timer_Init
 633                     	end

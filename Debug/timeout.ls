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
 381                     ; 113 void Timeout_Init( Timeout_t_ptr timeout, Timer_t_ptr timer, Timeout_Notificacion isr_Notificacion, Timeout_ResetNotificacion isr_Reset )
 381                     ; 114 {
 383                     .text:	section	.text,new
 384  0000               _Timeout_Init:
 386  0000 89            	pushw	x
 387       00000000      OFST:	set	0
 390                     ; 115 	timeout->Config.Notificacion = isr_Notificacion;
 392  0001 1607          	ldw	y,(OFST+7,sp)
 393  0003 ef02          	ldw	(2,x),y
 394                     ; 116 	timeout->Config.ResetNotificacion = isr_Reset;
 396  0005 1609          	ldw	y,(OFST+9,sp)
 397  0007 ef04          	ldw	(4,x),y
 398                     ; 117 	timeout->Config.Timer = timer;
 400  0009 1605          	ldw	y,(OFST+5,sp)
 401  000b ff            	ldw	(x),y
 402                     ; 118 	timeout->Estado = INACTIVO;
 404  000c 6f06          	clr	(6,x)
 405                     ; 119 	timeout->ValorDesborde = timer->Config.Tiempo;
 407  000e 93            	ldw	x,y
 408  000f 1601          	ldw	y,(OFST+1,sp)
 409  0011 ee04          	ldw	x,(4,x)
 410  0013 90ef07        	ldw	(7,y),x
 411                     ; 120 }
 414  0016 85            	popw	x
 415  0017 81            	ret	
 462                     ; 158 void Timeout_Start( Timeout_t_ptr timeout, uint16_t microsegundos )
 462                     ; 159 {
 463                     .text:	section	.text,new
 464  0000               _Timeout_Start:
 466  0000 89            	pushw	x
 467       00000000      OFST:	set	0
 470                     ; 160 	if( timeout->Estado == INACTIVO )
 472  0001 e606          	ld	a,(6,x)
 473  0003 261a          	jrne	L503
 474                     ; 162 		timeout->Config.Timer->Config.Tiempo = microsegundos;
 476  0005 fe            	ldw	x,(x)
 477  0006 1605          	ldw	y,(OFST+5,sp)
 478  0008 ef04          	ldw	(4,x),y
 479                     ; 163 		Timer_Init( timeout->Config.Timer );
 481  000a 1e01          	ldw	x,(OFST+1,sp)
 482  000c fe            	ldw	x,(x)
 483  000d cd0000        	call	_Timer_Init
 485                     ; 165 		timeout->ValorDesborde = timeout->Config.Timer->Config.Tiempo;
 487  0010 1e01          	ldw	x,(OFST+1,sp)
 488  0012 fe            	ldw	x,(x)
 489  0013 1601          	ldw	y,(OFST+1,sp)
 490  0015 ee04          	ldw	x,(4,x)
 491  0017 90ef07        	ldw	(7,y),x
 492                     ; 166 		timeout->Estado = ACTIVO;
 494  001a 93            	ldw	x,y
 495  001b a601          	ld	a,#1
 496  001d e706          	ld	(6,x),a
 497  001f               L503:
 498                     ; 168 }
 501  001f 85            	popw	x
 502  0020 81            	ret	
 540                     ; 205 void Timeout_Stop( Timeout_t_ptr timeout )
 540                     ; 206 {
 541                     .text:	section	.text,new
 542  0000               _Timeout_Stop:
 544  0000 89            	pushw	x
 545       00000000      OFST:	set	0
 548                     ; 207 	Timer_DeInit( timeout->Config.Timer );
 550  0001 fe            	ldw	x,(x)
 551  0002 cd0000        	call	_Timer_DeInit
 553                     ; 209 	timeout->Config.ResetNotificacion( 0 );
 555  0005 1601          	ldw	y,(OFST+1,sp)
 556  0007 5f            	clrw	x
 557  0008 90ee04        	ldw	y,(4,y)
 558  000b 90fd          	call	(y)
 560                     ; 210 	timeout->ValorDesborde = 0;
 562  000d 1e01          	ldw	x,(OFST+1,sp)
 563  000f 905f          	clrw	y
 564  0011 ef07          	ldw	(7,x),y
 565                     ; 211 	timeout->Estado = INACTIVO;
 567  0013 6f06          	clr	(6,x)
 568                     ; 212 }
 571  0015 85            	popw	x
 572  0016 81            	ret	
 585                     	xdef	_Timeout_Stop
 586                     	xdef	_Timeout_Start
 587                     	xdef	_Timeout_Init
 588                     	xref	_Timer_DeInit
 589                     	xref	_Timer_Init
 608                     	end

   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  21  0002               L5_flagUartRXNE:
  22  0002 00            	dc.b	0
 370                     ; 113 void Timeout_Init( Timeout_t_ptr timeout, Timer_t_ptr timer, Timeout_Notificacion isr_Notificacion, Timeout_ResetNotificacion isr_Reset )
 370                     ; 114 {
 372                     .text:	section	.text,new
 373  0000               _Timeout_Init:
 375  0000 89            	pushw	x
 376       00000000      OFST:	set	0
 379                     ; 115 	timeout->Config.Notificacion = isr_Notificacion;
 381  0001 1607          	ldw	y,(OFST+7,sp)
 382  0003 ef02          	ldw	(2,x),y
 383                     ; 116 	timeout->Config.ResetNotificacion = isr_Reset;
 385  0005 1609          	ldw	y,(OFST+9,sp)
 386  0007 ef04          	ldw	(4,x),y
 387                     ; 117 	timeout->Config.Timer = timer;
 389  0009 1605          	ldw	y,(OFST+5,sp)
 390  000b ff            	ldw	(x),y
 391                     ; 118 	timeout->Estado = INACTIVO;
 393  000c 6f06          	clr	(6,x)
 394                     ; 119 	timeout->ValorDesborde = timer->Config.Tiempo;
 396  000e 93            	ldw	x,y
 397  000f 1601          	ldw	y,(OFST+1,sp)
 398  0011 ee04          	ldw	x,(4,x)
 399  0013 90ef07        	ldw	(7,y),x
 400                     ; 120 }
 403  0016 85            	popw	x
 404  0017 81            	ret	
 451                     ; 158 void Timeout_Start( Timeout_t_ptr timeout, uint16_t microsegundos )
 451                     ; 159 {
 452                     .text:	section	.text,new
 453  0000               _Timeout_Start:
 455  0000 89            	pushw	x
 456       00000000      OFST:	set	0
 459                     ; 160 	if( timeout->Estado == INACTIVO )
 461  0001 e606          	ld	a,(6,x)
 462  0003 261a          	jrne	L172
 463                     ; 162 		timeout->Config.Timer->Config.Tiempo = microsegundos;
 465  0005 fe            	ldw	x,(x)
 466  0006 1605          	ldw	y,(OFST+5,sp)
 467  0008 ef04          	ldw	(4,x),y
 468                     ; 163 		Timer_Init( timeout->Config.Timer );
 470  000a 1e01          	ldw	x,(OFST+1,sp)
 471  000c fe            	ldw	x,(x)
 472  000d cd0000        	call	_Timer_Init
 474                     ; 165 		timeout->ValorDesborde = timeout->Config.Timer->Config.Tiempo;
 476  0010 1e01          	ldw	x,(OFST+1,sp)
 477  0012 fe            	ldw	x,(x)
 478  0013 1601          	ldw	y,(OFST+1,sp)
 479  0015 ee04          	ldw	x,(4,x)
 480  0017 90ef07        	ldw	(7,y),x
 481                     ; 166 		timeout->Estado = ACTIVO;
 483  001a 93            	ldw	x,y
 484  001b a601          	ld	a,#1
 485  001d e706          	ld	(6,x),a
 486  001f               L172:
 487                     ; 168 }
 490  001f 85            	popw	x
 491  0020 81            	ret	
 529                     ; 205 void Timeout_Stop( Timeout_t_ptr timeout )
 529                     ; 206 {
 530                     .text:	section	.text,new
 531  0000               _Timeout_Stop:
 533  0000 89            	pushw	x
 534       00000000      OFST:	set	0
 537                     ; 207 	Timer_DeInit( timeout->Config.Timer );
 539  0001 fe            	ldw	x,(x)
 540  0002 cd0000        	call	_Timer_DeInit
 542                     ; 209 	timeout->Config.ResetNotificacion( 0 );
 544  0005 1601          	ldw	y,(OFST+1,sp)
 545  0007 5f            	clrw	x
 546  0008 90ee04        	ldw	y,(4,y)
 547  000b 90fd          	call	(y)
 549                     ; 210 	timeout->ValorDesborde = 0;
 551  000d 1e01          	ldw	x,(OFST+1,sp)
 552  000f 905f          	clrw	y
 553  0011 ef07          	ldw	(7,x),y
 554                     ; 211 	timeout->Estado = INACTIVO;
 556  0013 6f06          	clr	(6,x)
 557                     ; 212 }
 560  0015 85            	popw	x
 561  0016 81            	ret	
 574                     	xdef	_Timeout_Stop
 575                     	xdef	_Timeout_Start
 576                     	xdef	_Timeout_Init
 577                     	xref	_Timer_DeInit
 578                     	xref	_Timer_Init
 597                     	end

   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
 359                     ; 113 void Timeout_Init( Timeout_t_ptr timeout, Timer_t_ptr timer, Timeout_Notificacion isr_Notificacion, Timeout_ResetNotificacion isr_Reset )
 359                     ; 114 {
 361                     .text:	section	.text,new
 362  0000               _Timeout_Init:
 364  0000 89            	pushw	x
 365       00000000      OFST:	set	0
 368                     ; 115 	timeout->Config.Notificacion = isr_Notificacion;
 370  0001 1607          	ldw	y,(OFST+7,sp)
 371  0003 ef02          	ldw	(2,x),y
 372                     ; 116 	timeout->Config.ResetNotificacion = isr_Reset;
 374  0005 1609          	ldw	y,(OFST+9,sp)
 375  0007 ef04          	ldw	(4,x),y
 376                     ; 117 	timeout->Config.Timer = timer;
 378  0009 1605          	ldw	y,(OFST+5,sp)
 379  000b ff            	ldw	(x),y
 380                     ; 118 	timeout->Estado = INACTIVO;
 382  000c 6f06          	clr	(6,x)
 383                     ; 119 	timeout->ValorDesborde = timer->Config.Tiempo;
 385  000e 93            	ldw	x,y
 386  000f 1601          	ldw	y,(OFST+1,sp)
 387  0011 ee04          	ldw	x,(4,x)
 388  0013 90ef07        	ldw	(7,y),x
 389                     ; 120 }
 392  0016 85            	popw	x
 393  0017 81            	ret	
 440                     ; 158 void Timeout_Start( Timeout_t_ptr timeout, uint16_t microsegundos )
 440                     ; 159 {
 441                     .text:	section	.text,new
 442  0000               _Timeout_Start:
 444  0000 89            	pushw	x
 445       00000000      OFST:	set	0
 448                     ; 160 	if( timeout->Estado == INACTIVO )
 450  0001 e606          	ld	a,(6,x)
 451  0003 261a          	jrne	L362
 452                     ; 162 		timeout->Config.Timer->Config.Tiempo = microsegundos;
 454  0005 fe            	ldw	x,(x)
 455  0006 1605          	ldw	y,(OFST+5,sp)
 456  0008 ef04          	ldw	(4,x),y
 457                     ; 163 		Timer_Init( timeout->Config.Timer );
 459  000a 1e01          	ldw	x,(OFST+1,sp)
 460  000c fe            	ldw	x,(x)
 461  000d cd0000        	call	_Timer_Init
 463                     ; 165 		timeout->ValorDesborde = timeout->Config.Timer->Config.Tiempo;
 465  0010 1e01          	ldw	x,(OFST+1,sp)
 466  0012 fe            	ldw	x,(x)
 467  0013 1601          	ldw	y,(OFST+1,sp)
 468  0015 ee04          	ldw	x,(4,x)
 469  0017 90ef07        	ldw	(7,y),x
 470                     ; 166 		timeout->Estado = ACTIVO;
 472  001a 93            	ldw	x,y
 473  001b a601          	ld	a,#1
 474  001d e706          	ld	(6,x),a
 475  001f               L362:
 476                     ; 168 }
 479  001f 85            	popw	x
 480  0020 81            	ret	
 518                     ; 205 void Timeout_Stop( Timeout_t_ptr timeout )
 518                     ; 206 {
 519                     .text:	section	.text,new
 520  0000               _Timeout_Stop:
 522  0000 89            	pushw	x
 523       00000000      OFST:	set	0
 526                     ; 207 	Timer_DeInit( timeout->Config.Timer );
 528  0001 fe            	ldw	x,(x)
 529  0002 cd0000        	call	_Timer_DeInit
 531                     ; 209 	timeout->Config.ResetNotificacion( 0 );
 533  0005 1601          	ldw	y,(OFST+1,sp)
 534  0007 5f            	clrw	x
 535  0008 90ee04        	ldw	y,(4,y)
 536  000b 90fd          	call	(y)
 538                     ; 210 	timeout->ValorDesborde = 0;
 540  000d 1e01          	ldw	x,(OFST+1,sp)
 541  000f 905f          	clrw	y
 542  0011 ef07          	ldw	(7,x),y
 543                     ; 211 	timeout->Estado = INACTIVO;
 545  0013 6f06          	clr	(6,x)
 546                     ; 212 }
 549  0015 85            	popw	x
 550  0016 81            	ret	
 563                     	xdef	_Timeout_Stop
 564                     	xdef	_Timeout_Start
 565                     	xdef	_Timeout_Init
 566                     	xref	_Timer_DeInit
 567                     	xref	_Timer_Init
 586                     	end

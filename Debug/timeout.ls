   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
 359                     ; 106 void Timeout_Init( Timeout_t_ptr timeout, Timer_t_ptr timer, Timeout_Notificacion isr_Notificacion, Timeout_ResetNotificacion isr_Reset )
 359                     ; 107 {
 361                     .text:	section	.text,new
 362  0000               _Timeout_Init:
 364  0000 89            	pushw	x
 365       00000000      OFST:	set	0
 368                     ; 108 	timeout->Config.Notificacion = isr_Notificacion;
 370  0001 1607          	ldw	y,(OFST+7,sp)
 371  0003 ef02          	ldw	(2,x),y
 372                     ; 109 	timeout->Config.ResetNotificacion = isr_Reset;
 374  0005 1609          	ldw	y,(OFST+9,sp)
 375  0007 ef04          	ldw	(4,x),y
 376                     ; 110 	timeout->Config.Timer = timer;
 378  0009 1605          	ldw	y,(OFST+5,sp)
 379  000b ff            	ldw	(x),y
 380                     ; 111 	timeout->Estado = INACTIVO;
 382  000c 6f06          	clr	(6,x)
 383                     ; 112 	timeout->ValorDesborde = timer->Config.Tiempo;
 385  000e 93            	ldw	x,y
 386  000f 1601          	ldw	y,(OFST+1,sp)
 387  0011 ee04          	ldw	x,(4,x)
 388  0013 90ef07        	ldw	(7,y),x
 389                     ; 113 }
 392  0016 85            	popw	x
 393  0017 81            	ret	
 440                     ; 151 void Timeout_Start( Timeout_t_ptr timeout, uint16_t microsegundos )
 440                     ; 152 {
 441                     .text:	section	.text,new
 442  0000               _Timeout_Start:
 444  0000 89            	pushw	x
 445       00000000      OFST:	set	0
 448                     ; 153 	if( timeout->Estado == INACTIVO )
 450  0001 e606          	ld	a,(6,x)
 451  0003 261a          	jrne	L362
 452                     ; 155 		timeout->Config.Timer->Config.Tiempo = microsegundos;
 454  0005 fe            	ldw	x,(x)
 455  0006 1605          	ldw	y,(OFST+5,sp)
 456  0008 ef04          	ldw	(4,x),y
 457                     ; 156 		Timer_Init( timeout->Config.Timer );
 459  000a 1e01          	ldw	x,(OFST+1,sp)
 460  000c fe            	ldw	x,(x)
 461  000d cd0000        	call	_Timer_Init
 463                     ; 158 		timeout->ValorDesborde = timeout->Config.Timer->Config.Tiempo;
 465  0010 1e01          	ldw	x,(OFST+1,sp)
 466  0012 fe            	ldw	x,(x)
 467  0013 1601          	ldw	y,(OFST+1,sp)
 468  0015 ee04          	ldw	x,(4,x)
 469  0017 90ef07        	ldw	(7,y),x
 470                     ; 159 		timeout->Estado = ACTIVO;
 472  001a 93            	ldw	x,y
 473  001b a601          	ld	a,#1
 474  001d e706          	ld	(6,x),a
 475  001f               L362:
 476                     ; 161 }
 479  001f 85            	popw	x
 480  0020 81            	ret	
 522                     ; 198 void Timeout_Stop( Timeout_t_ptr timeout )
 522                     ; 199 {
 523                     .text:	section	.text,new
 524  0000               _Timeout_Stop:
 526  0000 89            	pushw	x
 527       00000000      OFST:	set	0
 530                     ; 200 	TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
 532  0001 a601          	ld	a,#1
 533  0003 cd0000        	call	_TIM1_ClearITPendingBit
 535                     ; 201 	TIM1_ClearFlag(TIM1_FLAG_UPDATE);
 537  0006 ae0001        	ldw	x,#1
 538  0009 cd0000        	call	_TIM1_ClearFlag
 540                     ; 202 	TIM1_SetCounter( 0 );
 542  000c 5f            	clrw	x
 543  000d cd0000        	call	_TIM1_SetCounter
 545                     ; 203 	TIM1_ITConfig( TIM1_IT_UPDATE, DISABLE );
 547  0010 ae0100        	ldw	x,#256
 548  0013 cd0000        	call	_TIM1_ITConfig
 550                     ; 205 	TIM1_Cmd( DISABLE );
 552  0016 4f            	clr	a
 553  0017 cd0000        	call	_TIM1_Cmd
 555                     ; 207 	timeout->Config.ResetNotificacion( 0 );
 557  001a 1601          	ldw	y,(OFST+1,sp)
 558  001c 5f            	clrw	x
 559  001d 90ee04        	ldw	y,(4,y)
 560  0020 90fd          	call	(y)
 562                     ; 208 	timeout->ValorDesborde = 0;
 564  0022 1e01          	ldw	x,(OFST+1,sp)
 565  0024 905f          	clrw	y
 566  0026 ef07          	ldw	(7,x),y
 567                     ; 209 	timeout->Estado = INACTIVO;
 569  0028 6f06          	clr	(6,x)
 570                     ; 210 }
 573  002a 85            	popw	x
 574  002b 81            	ret	
 587                     	xdef	_Timeout_Stop
 588                     	xdef	_Timeout_Start
 589                     	xdef	_Timeout_Init
 590                     	xref	_Timer_Init
 591                     	xref	_TIM1_ClearITPendingBit
 592                     	xref	_TIM1_ClearFlag
 593                     	xref	_TIM1_SetCounter
 594                     	xref	_TIM1_ITConfig
 595                     	xref	_TIM1_Cmd
 614                     	end

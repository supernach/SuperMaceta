   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 00            	dc.b	0
 283                     ; 106 void Timeout_Init( Timeout_t_ptr timeout, Timeout_Notificacion isr_Notificacion, Timeout_ResetNotificacion isr_Reset )
 283                     ; 107 {
 285                     .text:	section	.text,new
 286  0000               _Timeout_Init:
 288       fffffffe      OFST: set -2
 291                     ; 108 	timeout->Config.Timer.Numero = TIMER1;
 293  0000 7f            	clr	(x)
 294                     ; 109 	timeout->Config.Timer.Canal = CANAL1;
 296  0001 6f01          	clr	(1,x)
 297                     ; 110 	timeout->Config.Notificacion = isr_Notificacion;
 299  0003 1603          	ldw	y,(OFST+5,sp)
 300  0005 ef02          	ldw	(2,x),y
 301                     ; 111 	timeout->Config.ResetNotificacion = isr_Reset;
 303  0007 1605          	ldw	y,(OFST+7,sp)
 304  0009 ef04          	ldw	(4,x),y
 305                     ; 112 	timeout->Estado = INACTIVO;
 307  000b 6f06          	clr	(6,x)
 308                     ; 113 	timeout->ValorDesborde = 1;
 310  000d 90ae0001      	ldw	y,#1
 311  0011 ef07          	ldw	(7,x),y
 312                     ; 114 }
 315  0013 81            	ret	
 365                     ; 152 void Timeout_Start( Timeout_t_ptr timeout, uint16_t us )
 365                     ; 153 {
 366                     .text:	section	.text,new
 367  0000               _Timeout_Start:
 369  0000 89            	pushw	x
 370       00000000      OFST:	set	0
 373                     ; 154 	if( timeout->Estado == INACTIVO )
 375  0001 e606          	ld	a,(6,x)
 376  0003 262f          	jrne	L712
 377                     ; 156 		TIM1_ITConfig( TIM1_IT_UPDATE, DISABLE );
 379  0005 ae0100        	ldw	x,#256
 380  0008 cd0000        	call	_TIM1_ITConfig
 382                     ; 157 		TIM1_Cmd( DISABLE );
 384  000b 4f            	clr	a
 385  000c cd0000        	call	_TIM1_Cmd
 387                     ; 159 		TIM1_TimeBaseInit( 15, TIM1_COUNTERMODE_UP, us, 0);
 389  000f 4b00          	push	#0
 390  0011 1e06          	ldw	x,(OFST+6,sp)
 391  0013 89            	pushw	x
 392  0014 4b00          	push	#0
 393  0016 ae000f        	ldw	x,#15
 394  0019 cd0000        	call	_TIM1_TimeBaseInit
 396  001c 5b04          	addw	sp,#4
 397                     ; 160 		TIM1_ITConfig( TIM1_IT_UPDATE, ENABLE );
 399  001e ae0101        	ldw	x,#257
 400  0021 cd0000        	call	_TIM1_ITConfig
 402                     ; 161 		TIM1_Cmd( ENABLE );
 404  0024 a601          	ld	a,#1
 405  0026 cd0000        	call	_TIM1_Cmd
 407                     ; 162 		enableInterrupts();
 410  0029 9a            	rim	
 412                     ; 164 		timeout->ValorDesborde = us;
 415  002a 1e01          	ldw	x,(OFST+1,sp)
 416  002c 1605          	ldw	y,(OFST+5,sp)
 417  002e ef07          	ldw	(7,x),y
 418                     ; 165 		timeout->Estado = ACTIVO;
 420  0030 a601          	ld	a,#1
 421  0032 e706          	ld	(6,x),a
 422  0034               L712:
 423                     ; 167 }
 426  0034 85            	popw	x
 427  0035 81            	ret	
 468                     ; 204 void Timeout_Stop( Timeout_t_ptr timeout )
 468                     ; 205 {
 469                     .text:	section	.text,new
 470  0000               _Timeout_Stop:
 472  0000 89            	pushw	x
 473       00000000      OFST:	set	0
 476                     ; 206 	TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
 478  0001 a601          	ld	a,#1
 479  0003 cd0000        	call	_TIM1_ClearITPendingBit
 481                     ; 207 	TIM1_ClearFlag(TIM1_FLAG_UPDATE);
 483  0006 ae0001        	ldw	x,#1
 484  0009 cd0000        	call	_TIM1_ClearFlag
 486                     ; 208 	TIM1_ITConfig( TIM1_IT_UPDATE, DISABLE );
 488  000c ae0100        	ldw	x,#256
 489  000f cd0000        	call	_TIM1_ITConfig
 491                     ; 210 	TIM1_Cmd( DISABLE );
 493  0012 4f            	clr	a
 494  0013 cd0000        	call	_TIM1_Cmd
 496                     ; 212 	timeout->Config.ResetNotificacion( 0 );
 498  0016 1e01          	ldw	x,(OFST+1,sp)
 499  0018 4f            	clr	a
 500  0019 ee04          	ldw	x,(4,x)
 501  001b fd            	call	(x)
 503                     ; 213 	timeout->ValorDesborde = 0;
 505  001c 1e01          	ldw	x,(OFST+1,sp)
 506  001e 905f          	clrw	y
 507  0020 ef07          	ldw	(7,x),y
 508                     ; 214 	timeout->Estado = INACTIVO;
 510  0022 6f06          	clr	(6,x)
 511                     ; 215 }
 514  0024 85            	popw	x
 515  0025 81            	ret	
 562                     ; 252 void Timeout_Check( Timeout_t_ptr timeout )
 562                     ; 253 {
 563                     .text:	section	.text,new
 564  0000               _Timeout_Check:
 566  0000 89            	pushw	x
 567  0001 89            	pushw	x
 568       00000002      OFST:	set	2
 571                     ; 254 	volatile uint16_t ticks = 0;
 573  0002 5f            	clrw	x
 574  0003 1f01          	ldw	(OFST-1,sp),x
 576                     ; 255 	ticks = TIM1_GetCounter();
 578  0005 cd0000        	call	_TIM1_GetCounter
 580  0008 1f01          	ldw	(OFST-1,sp),x
 582                     ; 257 	if(  ticks >= timeout->ValorDesborde )
 584  000a 1e03          	ldw	x,(OFST+1,sp)
 585  000c ee07          	ldw	x,(7,x)
 586  000e 1301          	cpw	x,(OFST-1,sp)
 587  0010 2206          	jrugt	L762
 588                     ; 259 		timeout->Estado = DISPARADO;
 590  0012 1e03          	ldw	x,(OFST+1,sp)
 591  0014 a602          	ld	a,#2
 592  0016 e706          	ld	(6,x),a
 594  0018               L762:
 595                     ; 265 }
 598  0018 5b04          	addw	sp,#4
 599  001a 81            	ret	
 612                     	xdef	_Timeout_Check
 613                     	xdef	_Timeout_Stop
 614                     	xdef	_Timeout_Start
 615                     	xdef	_Timeout_Init
 616                     	xref	_TIM1_ClearITPendingBit
 617                     	xref	_TIM1_ClearFlag
 618                     	xref	_TIM1_GetCounter
 619                     	xref	_TIM1_ITConfig
 620                     	xref	_TIM1_Cmd
 621                     	xref	_TIM1_TimeBaseInit
 640                     	end

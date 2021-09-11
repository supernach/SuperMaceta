   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 00            	dc.b	0
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
 521                     ; 198 void Timeout_Stop( Timeout_t_ptr timeout )
 521                     ; 199 {
 522                     .text:	section	.text,new
 523  0000               _Timeout_Stop:
 525  0000 89            	pushw	x
 526       00000000      OFST:	set	0
 529                     ; 200 	TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
 531  0001 a601          	ld	a,#1
 532  0003 cd0000        	call	_TIM1_ClearITPendingBit
 534                     ; 201 	TIM1_ClearFlag(TIM1_FLAG_UPDATE);
 536  0006 ae0001        	ldw	x,#1
 537  0009 cd0000        	call	_TIM1_ClearFlag
 539                     ; 202 	TIM1_ITConfig( TIM1_IT_UPDATE, DISABLE );
 541  000c ae0100        	ldw	x,#256
 542  000f cd0000        	call	_TIM1_ITConfig
 544                     ; 204 	TIM1_Cmd( DISABLE );
 546  0012 4f            	clr	a
 547  0013 cd0000        	call	_TIM1_Cmd
 549                     ; 206 	timeout->Config.ResetNotificacion( 0 );
 551  0016 1e01          	ldw	x,(OFST+1,sp)
 552  0018 4f            	clr	a
 553  0019 ee04          	ldw	x,(4,x)
 554  001b fd            	call	(x)
 556                     ; 207 	timeout->ValorDesborde = 0;
 558  001c 1e01          	ldw	x,(OFST+1,sp)
 559  001e 905f          	clrw	y
 560  0020 ef07          	ldw	(7,x),y
 561                     ; 208 	timeout->Estado = INACTIVO;
 563  0022 6f06          	clr	(6,x)
 564                     ; 209 }
 567  0024 85            	popw	x
 568  0025 81            	ret	
 615                     ; 246 void Timeout_Check( Timeout_t_ptr timeout )
 615                     ; 247 {
 616                     .text:	section	.text,new
 617  0000               _Timeout_Check:
 619  0000 89            	pushw	x
 620  0001 89            	pushw	x
 621       00000002      OFST:	set	2
 624                     ; 248 	volatile uint16_t ticks = 0;
 626  0002 5f            	clrw	x
 627  0003 1f01          	ldw	(OFST-1,sp),x
 629                     ; 249 	ticks = TIM1_GetCounter();
 631  0005 cd0000        	call	_TIM1_GetCounter
 633  0008 1f01          	ldw	(OFST-1,sp),x
 635                     ; 251 	if(  ticks >= timeout->ValorDesborde )
 637  000a 1e03          	ldw	x,(OFST+1,sp)
 638  000c ee07          	ldw	x,(7,x)
 639  000e 1301          	cpw	x,(OFST-1,sp)
 640  0010 2206          	jrugt	L333
 641                     ; 253 		timeout->Estado = DISPARADO;
 643  0012 1e03          	ldw	x,(OFST+1,sp)
 644  0014 a602          	ld	a,#2
 645  0016 e706          	ld	(6,x),a
 647  0018               L333:
 648                     ; 259 }
 651  0018 5b04          	addw	sp,#4
 652  001a 81            	ret	
 665                     	xdef	_Timeout_Check
 666                     	xdef	_Timeout_Stop
 667                     	xdef	_Timeout_Start
 668                     	xdef	_Timeout_Init
 669                     	xref	_Timer_Init
 670                     	xref	_TIM1_ClearITPendingBit
 671                     	xref	_TIM1_ClearFlag
 672                     	xref	_TIM1_GetCounter
 673                     	xref	_TIM1_ITConfig
 674                     	xref	_TIM1_Cmd
 693                     	end

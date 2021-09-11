   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 00            	dc.b	0
 261                     ; 106 void Timeout_Init( Timeout_t_ptr timeout, Timeout_Notificacion tm_Notificacion )
 261                     ; 107 {
 263                     .text:	section	.text,new
 264  0000               _Timeout_Init:
 266       fffffffe      OFST: set -2
 269                     ; 108 	timeout->Config.Timer.Numero = TIMER1;
 271  0000 7f            	clr	(x)
 272                     ; 109 	timeout->Config.Timer.Canal = CANAL1;
 274  0001 6f01          	clr	(1,x)
 275                     ; 110 	timeout->Config.Notificacion = tm_Notificacion;
 277  0003 1603          	ldw	y,(OFST+5,sp)
 278  0005 ef02          	ldw	(2,x),y
 279                     ; 111 	timeout->Estado = INACTIVO;
 281  0007 6f04          	clr	(4,x)
 282                     ; 112 	timeout->ValorDesborde = 1;
 284  0009 90ae0001      	ldw	y,#1
 285  000d ef05          	ldw	(5,x),y
 286                     ; 113 }
 289  000f 81            	ret	
 339                     ; 151 void Timeout_Start( Timeout_t_ptr timeout, uint16_t us )
 339                     ; 152 {
 340                     .text:	section	.text,new
 341  0000               _Timeout_Start:
 343  0000 89            	pushw	x
 344       00000000      OFST:	set	0
 347                     ; 153 	if( timeout->Estado == INACTIVO )
 349  0001 e604          	ld	a,(4,x)
 350  0003 262f          	jrne	L702
 351                     ; 155 		TIM1_ITConfig( TIM1_IT_UPDATE, DISABLE );
 353  0005 ae0100        	ldw	x,#256
 354  0008 cd0000        	call	_TIM1_ITConfig
 356                     ; 156 		TIM1_Cmd( DISABLE );
 358  000b 4f            	clr	a
 359  000c cd0000        	call	_TIM1_Cmd
 361                     ; 158 		TIM1_TimeBaseInit( 15, TIM1_COUNTERMODE_UP, us, 0);
 363  000f 4b00          	push	#0
 364  0011 1e06          	ldw	x,(OFST+6,sp)
 365  0013 89            	pushw	x
 366  0014 4b00          	push	#0
 367  0016 ae000f        	ldw	x,#15
 368  0019 cd0000        	call	_TIM1_TimeBaseInit
 370  001c 5b04          	addw	sp,#4
 371                     ; 159 		TIM1_ITConfig( TIM1_IT_UPDATE, ENABLE );
 373  001e ae0101        	ldw	x,#257
 374  0021 cd0000        	call	_TIM1_ITConfig
 376                     ; 160 		TIM1_Cmd( ENABLE );
 378  0024 a601          	ld	a,#1
 379  0026 cd0000        	call	_TIM1_Cmd
 381                     ; 161 		enableInterrupts();
 384  0029 9a            	rim	
 386                     ; 163 		timeout->ValorDesborde = us;
 389  002a 1e01          	ldw	x,(OFST+1,sp)
 390  002c 1605          	ldw	y,(OFST+5,sp)
 391  002e ef05          	ldw	(5,x),y
 392                     ; 164 		timeout->Estado = ACTIVO;
 394  0030 a601          	ld	a,#1
 395  0032 e704          	ld	(4,x),a
 396  0034               L702:
 397                     ; 166 }
 400  0034 85            	popw	x
 401  0035 81            	ret	
 443                     ; 203 void Timeout_Stop( Timeout_t_ptr timeout )
 443                     ; 204 {
 444                     .text:	section	.text,new
 445  0000               _Timeout_Stop:
 447  0000 89            	pushw	x
 448       00000000      OFST:	set	0
 451                     ; 205 	TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
 453  0001 a601          	ld	a,#1
 454  0003 cd0000        	call	_TIM1_ClearITPendingBit
 456                     ; 206 	TIM1_ClearFlag(TIM1_FLAG_UPDATE);
 458  0006 ae0001        	ldw	x,#1
 459  0009 cd0000        	call	_TIM1_ClearFlag
 461                     ; 207 	TIM1_ITConfig( TIM1_IT_UPDATE, DISABLE );
 463  000c ae0100        	ldw	x,#256
 464  000f cd0000        	call	_TIM1_ITConfig
 466                     ; 209 	TIM1_Cmd( DISABLE );
 468  0012 4f            	clr	a
 469  0013 cd0000        	call	_TIM1_Cmd
 471                     ; 211 	setFlagTimer1( 0 );
 473  0016 4f            	clr	a
 474  0017 cd0000        	call	_setFlagTimer1
 476                     ; 212 	timeout->ValorDesborde = 0;
 478  001a 1e01          	ldw	x,(OFST+1,sp)
 479  001c 905f          	clrw	y
 480  001e ef05          	ldw	(5,x),y
 481                     ; 213 	timeout->Estado = INACTIVO;
 483  0020 6f04          	clr	(4,x)
 484                     ; 214 }
 487  0022 85            	popw	x
 488  0023 81            	ret	
 535                     ; 251 void Timeout_Check( Timeout_t_ptr timeout )
 535                     ; 252 {
 536                     .text:	section	.text,new
 537  0000               _Timeout_Check:
 539  0000 89            	pushw	x
 540  0001 89            	pushw	x
 541       00000002      OFST:	set	2
 544                     ; 253 	volatile uint16_t ticks = 0;
 546  0002 5f            	clrw	x
 547  0003 1f01          	ldw	(OFST-1,sp),x
 549                     ; 254 	ticks = TIM1_GetCounter();
 551  0005 cd0000        	call	_TIM1_GetCounter
 553  0008 1f01          	ldw	(OFST-1,sp),x
 555                     ; 256 	if(  ticks >= timeout->ValorDesborde )
 557  000a 1e03          	ldw	x,(OFST+1,sp)
 558  000c ee05          	ldw	x,(5,x)
 559  000e 1301          	cpw	x,(OFST-1,sp)
 560  0010 2206          	jrugt	L752
 561                     ; 258 		timeout->Estado = DISPARADO;
 563  0012 1e03          	ldw	x,(OFST+1,sp)
 564  0014 a602          	ld	a,#2
 565  0016 e704          	ld	(4,x),a
 567  0018               L752:
 568                     ; 264 }
 571  0018 5b04          	addw	sp,#4
 572  001a 81            	ret	
 585                     	xdef	_Timeout_Check
 586                     	xdef	_Timeout_Stop
 587                     	xdef	_Timeout_Start
 588                     	xdef	_Timeout_Init
 589                     	xref	_TIM1_ClearITPendingBit
 590                     	xref	_TIM1_ClearFlag
 591                     	xref	_TIM1_GetCounter
 592                     	xref	_TIM1_ITConfig
 593                     	xref	_TIM1_Cmd
 594                     	xref	_TIM1_TimeBaseInit
 595                     	xref	_setFlagTimer1
 614                     	end

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
 277                     ; 110 void Timer_Init( Timer_t_ptr timer )
 277                     ; 111 {
 279                     .text:	section	.text,new
 280  0000               _Timer_Init:
 282  0000 89            	pushw	x
 283       00000000      OFST:	set	0
 286                     ; 112 	if( timer->Config.Timer == TIMER1 )
 288  0001 f6            	ld	a,(x)
 289  0002 263b          	jrne	L761
 290                     ; 114 		CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
 292  0004 ae0701        	ldw	x,#1793
 293  0007 cd0000        	call	_CLK_PeripheralClockConfig
 295                     ; 115 		if( timer->Config.IT == SI )
 297  000a 1e01          	ldw	x,(OFST+1,sp)
 298  000c e603          	ld	a,(3,x)
 299  000e 2606          	jrne	L171
 300                     ; 117 			TIM1_ITConfig( TIM1_IT_UPDATE, DISABLE );
 302  0010 ae0100        	ldw	x,#256
 303  0013 cd0000        	call	_TIM1_ITConfig
 305  0016               L171:
 306                     ; 119 		TIM1_Cmd( DISABLE );
 308  0016 4f            	clr	a
 309  0017 cd0000        	call	_TIM1_Cmd
 311                     ; 121 		TIM1_TimeBaseInit( 15, TIM1_COUNTERMODE_UP, timer->Config.Tiempo, 0);
 313  001a 4b00          	push	#0
 314  001c 1e02          	ldw	x,(OFST+2,sp)
 315  001e ee04          	ldw	x,(4,x)
 316  0020 89            	pushw	x
 317  0021 4b00          	push	#0
 318  0023 ae000f        	ldw	x,#15
 319  0026 cd0000        	call	_TIM1_TimeBaseInit
 321  0029 5b04          	addw	sp,#4
 322                     ; 123 		if( timer->Config.IT == SI )
 324  002b 1e01          	ldw	x,(OFST+1,sp)
 325  002d e603          	ld	a,(3,x)
 326  002f 2607          	jrne	L371
 327                     ; 125 			TIM1_ITConfig( TIM1_IT_UPDATE, ENABLE );
 329  0031 ae0101        	ldw	x,#257
 330  0034 cd0000        	call	_TIM1_ITConfig
 332                     ; 126 			enableInterrupts();
 335  0037 9a            	rim	
 338  0038               L371:
 339                     ; 128 		TIM1_Cmd( ENABLE );
 341  0038 a601          	ld	a,#1
 342  003a cd0000        	call	_TIM1_Cmd
 345  003d 2036          	jra	L571
 346  003f               L761:
 347                     ; 130 	else if( timer->Config.Timer == TIMER2 )
 349  003f 4a            	dec	a
 350  0040 2633          	jrne	L571
 351                     ; 132 		CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
 353  0042 ae0501        	ldw	x,#1281
 354  0045 cd0000        	call	_CLK_PeripheralClockConfig
 356                     ; 133 		if( timer->Config.IT == SI )
 358  0048 1e01          	ldw	x,(OFST+1,sp)
 359  004a e603          	ld	a,(3,x)
 360  004c 2606          	jrne	L102
 361                     ; 135 			TIM2_ITConfig( TIM2_IT_UPDATE, DISABLE );
 363  004e ae0100        	ldw	x,#256
 364  0051 cd0000        	call	_TIM2_ITConfig
 366  0054               L102:
 367                     ; 137 		TIM2_Cmd( DISABLE );
 369  0054 4f            	clr	a
 370  0055 cd0000        	call	_TIM2_Cmd
 372                     ; 139 		TIM2_TimeBaseInit( TIM2_PRESCALER_16, timer->Config.Tiempo);
 374  0058 1e01          	ldw	x,(OFST+1,sp)
 375  005a ee04          	ldw	x,(4,x)
 376  005c 89            	pushw	x
 377  005d a604          	ld	a,#4
 378  005f cd0000        	call	_TIM2_TimeBaseInit
 380  0062 85            	popw	x
 381                     ; 141 		if( timer->Config.IT == SI )
 383  0063 1e01          	ldw	x,(OFST+1,sp)
 384  0065 e603          	ld	a,(3,x)
 385  0067 2607          	jrne	L302
 386                     ; 143 			TIM2_ITConfig( TIM2_IT_UPDATE, ENABLE );
 388  0069 ae0101        	ldw	x,#257
 389  006c cd0000        	call	_TIM2_ITConfig
 391                     ; 144 			enableInterrupts();
 394  006f 9a            	rim	
 397  0070               L302:
 398                     ; 146 		TIM2_Cmd( ENABLE );
 400  0070 a601          	ld	a,#1
 401  0072 cd0000        	call	_TIM2_Cmd
 403  0075               L571:
 404                     ; 149 }
 407  0075 85            	popw	x
 408  0076 81            	ret	
 494                     ; 194 void Timer_Config_Init( Timer_Config_t_ptr timerConfig, Timer_Numero_e timer, Timer_Canal_e canal, Timer_Modo_e modo, Timer_Interrupcion_e it, uint16_t tiempo )
 494                     ; 195 {
 495                     .text:	section	.text,new
 496  0000               _Timer_Config_Init:
 498       fffffffe      OFST: set -2
 501                     ; 196 	timerConfig->Timer = timer ;
 503  0000 7b03          	ld	a,(OFST+5,sp)
 504  0002 f7            	ld	(x),a
 505                     ; 197 	timerConfig->Canal = canal ;
 507  0003 7b04          	ld	a,(OFST+6,sp)
 508  0005 e701          	ld	(1,x),a
 509                     ; 198 	timerConfig->Modo = modo ;
 511  0007 7b05          	ld	a,(OFST+7,sp)
 512  0009 e702          	ld	(2,x),a
 513                     ; 199 	timerConfig->IT = it ;
 515  000b 7b06          	ld	a,(OFST+8,sp)
 516  000d e703          	ld	(3,x),a
 517                     ; 200 	timerConfig->Tiempo = tiempo ;
 519  000f 1607          	ldw	y,(OFST+9,sp)
 520  0011 ef04          	ldw	(4,x),y
 521                     ; 201 }
 524  0013 81            	ret	
 570                     ; 237 void Timer_DeInit( Timer_t_ptr timer )
 570                     ; 238 {
 571                     .text:	section	.text,new
 572  0000               _Timer_DeInit:
 574  0000 89            	pushw	x
 575       00000000      OFST:	set	0
 578                     ; 239 	if( timer->Config.Timer == TIMER1 )
 580  0001 f6            	ld	a,(x)
 581  0002 261a          	jrne	L172
 582                     ; 241 		if( timer->Config.IT == SI )
 584  0004 6d03          	tnz	(3,x)
 585  0006 2631          	jrne	L103
 586                     ; 243 			TIM1_ClearITPendingBit( TIM1_IT_UPDATE );
 588  0008 4c            	inc	a
 589  0009 cd0000        	call	_TIM1_ClearITPendingBit
 591                     ; 244 			TIM1_ClearFlag( TIM1_FLAG_UPDATE );
 593  000c ae0001        	ldw	x,#1
 594  000f cd0000        	call	_TIM1_ClearFlag
 596                     ; 245 			TIM1_SetCounter( 0 );
 598  0012 5f            	clrw	x
 599  0013 cd0000        	call	_TIM1_SetCounter
 601                     ; 246 			TIM1_ITConfig( TIM1_IT_UPDATE, DISABLE );
 603  0016 ae0100        	ldw	x,#256
 604  0019 cd0000        	call	_TIM1_ITConfig
 606                     ; 248 		TIM1_Cmd( DISABLE );
 609  001c 201b          	jp	L103
 610  001e               L172:
 611                     ; 250 	else if( timer->Config.Timer == TIMER2 )
 613  001e 4a            	dec	a
 614  001f 261c          	jrne	L572
 615                     ; 252 		if( timer->Config.IT == SI )
 617  0021 6d03          	tnz	(3,x)
 618  0023 2614          	jrne	L103
 619                     ; 254 			TIM2_ClearITPendingBit( TIM2_IT_UPDATE );
 621  0025 4c            	inc	a
 622  0026 cd0000        	call	_TIM2_ClearITPendingBit
 624                     ; 255 			TIM2_ClearFlag( TIM2_FLAG_UPDATE );
 626  0029 ae0001        	ldw	x,#1
 627  002c cd0000        	call	_TIM2_ClearFlag
 629                     ; 256 			TIM2_SetCounter( 0 );
 631  002f 5f            	clrw	x
 632  0030 cd0000        	call	_TIM2_SetCounter
 634                     ; 257 			TIM2_ITConfig( TIM2_IT_UPDATE, DISABLE );
 636  0033 ae0100        	ldw	x,#256
 637  0036 cd0000        	call	_TIM2_ITConfig
 639  0039               L103:
 640                     ; 259 		TIM1_Cmd( DISABLE );
 643  0039 4f            	clr	a
 644  003a cd0000        	call	_TIM1_Cmd
 646  003d               L572:
 647                     ; 261 }
 650  003d 85            	popw	x
 651  003e 81            	ret	
 664                     	xdef	_Timer_DeInit
 665                     	xdef	_Timer_Config_Init
 666                     	xdef	_Timer_Init
 667                     	xref	_TIM2_ClearITPendingBit
 668                     	xref	_TIM2_ClearFlag
 669                     	xref	_TIM2_SetCounter
 670                     	xref	_TIM2_ITConfig
 671                     	xref	_TIM2_Cmd
 672                     	xref	_TIM2_TimeBaseInit
 673                     	xref	_TIM1_ClearITPendingBit
 674                     	xref	_TIM1_ClearFlag
 675                     	xref	_TIM1_SetCounter
 676                     	xref	_TIM1_ITConfig
 677                     	xref	_TIM1_Cmd
 678                     	xref	_TIM1_TimeBaseInit
 679                     	xref	_CLK_PeripheralClockConfig
 698                     	end

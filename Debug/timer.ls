   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 00            	dc.b	0
 225                     ; 100 void Timer_Init( Timer_t_ptr timer )
 225                     ; 101 {
 227                     .text:	section	.text,new
 228  0000               _Timer_Init:
 230  0000 89            	pushw	x
 231       00000000      OFST:	set	0
 234                     ; 102 	if( timer->Config.Timer == TIMER1 )
 236  0001 f6            	ld	a,(x)
 237  0002 2630          	jrne	L731
 238                     ; 104 		if( timer->Config.IT == SI )
 240  0004 e603          	ld	a,(3,x)
 241  0006 2606          	jrne	L141
 242                     ; 106 			TIM1_ITConfig( TIM1_IT_UPDATE, DISABLE );
 244  0008 ae0100        	ldw	x,#256
 245  000b cd0000        	call	_TIM1_ITConfig
 247  000e               L141:
 248                     ; 108 		TIM1_Cmd( DISABLE );
 250  000e 4f            	clr	a
 251  000f cd0000        	call	_TIM1_Cmd
 253                     ; 110 		TIM1_TimeBaseInit( 15, TIM1_COUNTERMODE_UP, timer->Config.Tiempo, 0);
 255  0012 4b00          	push	#0
 256  0014 1e02          	ldw	x,(OFST+2,sp)
 257  0016 ee04          	ldw	x,(4,x)
 258  0018 89            	pushw	x
 259  0019 4b00          	push	#0
 260  001b ae000f        	ldw	x,#15
 261  001e cd0000        	call	_TIM1_TimeBaseInit
 263  0021 5b04          	addw	sp,#4
 264                     ; 112 		if( timer->Config.IT == SI )
 266  0023 1e01          	ldw	x,(OFST+1,sp)
 267  0025 e603          	ld	a,(3,x)
 268  0027 2606          	jrne	L341
 269                     ; 114 			TIM1_ITConfig( TIM1_IT_UPDATE, ENABLE );
 271  0029 ae0101        	ldw	x,#257
 272  002c cd0000        	call	_TIM1_ITConfig
 274  002f               L341:
 275                     ; 116 		TIM1_Cmd( ENABLE );
 277  002f a601          	ld	a,#1
 278  0031 cd0000        	call	_TIM1_Cmd
 280  0034               L731:
 281                     ; 118 	enableInterrupts();
 284  0034 9a            	rim	
 286                     ; 119 }
 290  0035 85            	popw	x
 291  0036 81            	ret	
 304                     	xdef	_Timer_Init
 305                     	xref	_TIM1_ITConfig
 306                     	xref	_TIM1_Cmd
 307                     	xref	_TIM1_TimeBaseInit
 326                     	end

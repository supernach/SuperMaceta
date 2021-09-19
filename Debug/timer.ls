   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
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
 377                     ; 156 void Timer_Config_Init( Timer_Config_t_ptr timerConfig, Timer_Numero_e timer, Timer_Canal_e canal, Timer_Modo_e modo, Timer_Interrupcion_e it, uint16_t tiempo )
 377                     ; 157 {
 378                     .text:	section	.text,new
 379  0000               _Timer_Config_Init:
 381       fffffffe      OFST: set -2
 384                     ; 158 	timerConfig->Timer = timer ;
 386  0000 7b03          	ld	a,(OFST+5,sp)
 387  0002 f7            	ld	(x),a
 388                     ; 159 	timerConfig->Canal = canal ;
 390  0003 7b04          	ld	a,(OFST+6,sp)
 391  0005 e701          	ld	(1,x),a
 392                     ; 160 	timerConfig->Modo = modo ;
 394  0007 7b05          	ld	a,(OFST+7,sp)
 395  0009 e702          	ld	(2,x),a
 396                     ; 161 	timerConfig->IT = it ;
 398  000b 7b06          	ld	a,(OFST+8,sp)
 399  000d e703          	ld	(3,x),a
 400                     ; 162 	timerConfig->Tiempo = tiempo ;
 402  000f 1607          	ldw	y,(OFST+9,sp)
 403  0011 ef04          	ldw	(4,x),y
 404                     ; 163 }
 407  0013 81            	ret	
 420                     	xdef	_Timer_Config_Init
 421                     	xdef	_Timer_Init
 422                     	xref	_TIM1_ITConfig
 423                     	xref	_TIM1_Cmd
 424                     	xref	_TIM1_TimeBaseInit
 443                     	end

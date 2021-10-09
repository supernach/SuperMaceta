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
 247                     ; 110 void Timer_Init( Timer_t_ptr timer )
 247                     ; 111 {
 249                     .text:	section	.text,new
 250  0000               _Timer_Init:
 252  0000 89            	pushw	x
 253       00000000      OFST:	set	0
 256                     ; 112 	if( timer->Config.Timer == TIMER1 )
 258  0001 f6            	ld	a,(x)
 259  0002 2630          	jrne	L551
 260                     ; 114 		if( timer->Config.IT == SI )
 262  0004 e603          	ld	a,(3,x)
 263  0006 2606          	jrne	L751
 264                     ; 116 			TIM1_ITConfig( TIM1_IT_UPDATE, DISABLE );
 266  0008 ae0100        	ldw	x,#256
 267  000b cd0000        	call	_TIM1_ITConfig
 269  000e               L751:
 270                     ; 118 		TIM1_Cmd( DISABLE );
 272  000e 4f            	clr	a
 273  000f cd0000        	call	_TIM1_Cmd
 275                     ; 120 		TIM1_TimeBaseInit( 15, TIM1_COUNTERMODE_UP, timer->Config.Tiempo, 0);
 277  0012 4b00          	push	#0
 278  0014 1e02          	ldw	x,(OFST+2,sp)
 279  0016 ee04          	ldw	x,(4,x)
 280  0018 89            	pushw	x
 281  0019 4b00          	push	#0
 282  001b ae000f        	ldw	x,#15
 283  001e cd0000        	call	_TIM1_TimeBaseInit
 285  0021 5b04          	addw	sp,#4
 286                     ; 122 		if( timer->Config.IT == SI )
 288  0023 1e01          	ldw	x,(OFST+1,sp)
 289  0025 e603          	ld	a,(3,x)
 290  0027 2606          	jrne	L161
 291                     ; 124 			TIM1_ITConfig( TIM1_IT_UPDATE, ENABLE );
 293  0029 ae0101        	ldw	x,#257
 294  002c cd0000        	call	_TIM1_ITConfig
 296  002f               L161:
 297                     ; 126 		TIM1_Cmd( ENABLE );
 299  002f a601          	ld	a,#1
 300  0031 cd0000        	call	_TIM1_Cmd
 302  0034               L551:
 303                     ; 128 	enableInterrupts();
 306  0034 9a            	rim	
 308                     ; 129 }
 312  0035 85            	popw	x
 313  0036 81            	ret	
 399                     ; 174 void Timer_Config_Init( Timer_Config_t_ptr timerConfig, Timer_Numero_e timer, Timer_Canal_e canal, Timer_Modo_e modo, Timer_Interrupcion_e it, uint16_t tiempo )
 399                     ; 175 {
 400                     .text:	section	.text,new
 401  0000               _Timer_Config_Init:
 403       fffffffe      OFST: set -2
 406                     ; 176 	timerConfig->Timer = timer ;
 408  0000 7b03          	ld	a,(OFST+5,sp)
 409  0002 f7            	ld	(x),a
 410                     ; 177 	timerConfig->Canal = canal ;
 412  0003 7b04          	ld	a,(OFST+6,sp)
 413  0005 e701          	ld	(1,x),a
 414                     ; 178 	timerConfig->Modo = modo ;
 416  0007 7b05          	ld	a,(OFST+7,sp)
 417  0009 e702          	ld	(2,x),a
 418                     ; 179 	timerConfig->IT = it ;
 420  000b 7b06          	ld	a,(OFST+8,sp)
 421  000d e703          	ld	(3,x),a
 422                     ; 180 	timerConfig->Tiempo = tiempo ;
 424  000f 1607          	ldw	y,(OFST+9,sp)
 425  0011 ef04          	ldw	(4,x),y
 426                     ; 181 }
 429  0013 81            	ret	
 471                     ; 217 void Timer_DeInit( Timer_t_ptr timer )
 471                     ; 218 {
 472                     .text:	section	.text,new
 473  0000               _Timer_DeInit:
 477                     ; 219 	if( timer->Config.Timer == TIMER1 )
 479  0000 f6            	ld	a,(x)
 480  0001 261c          	jrne	L742
 481                     ; 221 		if( timer->Config.IT == SI )
 483  0003 6d03          	tnz	(3,x)
 484  0005 2614          	jrne	L152
 485                     ; 223 			TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
 487  0007 4c            	inc	a
 488  0008 cd0000        	call	_TIM1_ClearITPendingBit
 490                     ; 224 			TIM1_ClearFlag(TIM1_FLAG_UPDATE);
 492  000b ae0001        	ldw	x,#1
 493  000e cd0000        	call	_TIM1_ClearFlag
 495                     ; 225 			TIM1_SetCounter( 0 );
 497  0011 5f            	clrw	x
 498  0012 cd0000        	call	_TIM1_SetCounter
 500                     ; 226 			TIM1_ITConfig( TIM1_IT_UPDATE, DISABLE );
 502  0015 ae0100        	ldw	x,#256
 503  0018 cd0000        	call	_TIM1_ITConfig
 505  001b               L152:
 506                     ; 228 		TIM1_Cmd( DISABLE );
 508  001b 4f            	clr	a
 509  001c cd0000        	call	_TIM1_Cmd
 511  001f               L742:
 512                     ; 230 }
 515  001f 81            	ret	
 528                     	xdef	_Timer_DeInit
 529                     	xdef	_Timer_Config_Init
 530                     	xdef	_Timer_Init
 531                     	xref	_TIM1_ClearITPendingBit
 532                     	xref	_TIM1_ClearFlag
 533                     	xref	_TIM1_SetCounter
 534                     	xref	_TIM1_ITConfig
 535                     	xref	_TIM1_Cmd
 536                     	xref	_TIM1_TimeBaseInit
 555                     	end

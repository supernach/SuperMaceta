   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  21  0002               L5_flagUartRXNE:
  22  0002 00            	dc.b	0
 236                     ; 110 void Timer_Init( Timer_t_ptr timer )
 236                     ; 111 {
 238                     .text:	section	.text,new
 239  0000               _Timer_Init:
 241  0000 89            	pushw	x
 242       00000000      OFST:	set	0
 245                     ; 112 	if( timer->Config.Timer == TIMER1 )
 247  0001 f6            	ld	a,(x)
 248  0002 2630          	jrne	L541
 249                     ; 114 		if( timer->Config.IT == SI )
 251  0004 e603          	ld	a,(3,x)
 252  0006 2606          	jrne	L741
 253                     ; 116 			TIM1_ITConfig( TIM1_IT_UPDATE, DISABLE );
 255  0008 ae0100        	ldw	x,#256
 256  000b cd0000        	call	_TIM1_ITConfig
 258  000e               L741:
 259                     ; 118 		TIM1_Cmd( DISABLE );
 261  000e 4f            	clr	a
 262  000f cd0000        	call	_TIM1_Cmd
 264                     ; 120 		TIM1_TimeBaseInit( 15, TIM1_COUNTERMODE_UP, timer->Config.Tiempo, 0);
 266  0012 4b00          	push	#0
 267  0014 1e02          	ldw	x,(OFST+2,sp)
 268  0016 ee04          	ldw	x,(4,x)
 269  0018 89            	pushw	x
 270  0019 4b00          	push	#0
 271  001b ae000f        	ldw	x,#15
 272  001e cd0000        	call	_TIM1_TimeBaseInit
 274  0021 5b04          	addw	sp,#4
 275                     ; 122 		if( timer->Config.IT == SI )
 277  0023 1e01          	ldw	x,(OFST+1,sp)
 278  0025 e603          	ld	a,(3,x)
 279  0027 2606          	jrne	L151
 280                     ; 124 			TIM1_ITConfig( TIM1_IT_UPDATE, ENABLE );
 282  0029 ae0101        	ldw	x,#257
 283  002c cd0000        	call	_TIM1_ITConfig
 285  002f               L151:
 286                     ; 126 		TIM1_Cmd( ENABLE );
 288  002f a601          	ld	a,#1
 289  0031 cd0000        	call	_TIM1_Cmd
 291  0034               L541:
 292                     ; 128 	enableInterrupts();
 295  0034 9a            	rim	
 297                     ; 129 }
 301  0035 85            	popw	x
 302  0036 81            	ret	
 388                     ; 174 void Timer_Config_Init( Timer_Config_t_ptr timerConfig, Timer_Numero_e timer, Timer_Canal_e canal, Timer_Modo_e modo, Timer_Interrupcion_e it, uint16_t tiempo )
 388                     ; 175 {
 389                     .text:	section	.text,new
 390  0000               _Timer_Config_Init:
 392       fffffffe      OFST: set -2
 395                     ; 176 	timerConfig->Timer = timer ;
 397  0000 7b03          	ld	a,(OFST+5,sp)
 398  0002 f7            	ld	(x),a
 399                     ; 177 	timerConfig->Canal = canal ;
 401  0003 7b04          	ld	a,(OFST+6,sp)
 402  0005 e701          	ld	(1,x),a
 403                     ; 178 	timerConfig->Modo = modo ;
 405  0007 7b05          	ld	a,(OFST+7,sp)
 406  0009 e702          	ld	(2,x),a
 407                     ; 179 	timerConfig->IT = it ;
 409  000b 7b06          	ld	a,(OFST+8,sp)
 410  000d e703          	ld	(3,x),a
 411                     ; 180 	timerConfig->Tiempo = tiempo ;
 413  000f 1607          	ldw	y,(OFST+9,sp)
 414  0011 ef04          	ldw	(4,x),y
 415                     ; 181 }
 418  0013 81            	ret	
 460                     ; 217 void Timer_DeInit( Timer_t_ptr timer )
 460                     ; 218 {
 461                     .text:	section	.text,new
 462  0000               _Timer_DeInit:
 466                     ; 219 	if( timer->Config.Timer == TIMER1 )
 468  0000 f6            	ld	a,(x)
 469  0001 261c          	jrne	L732
 470                     ; 221 		if( timer->Config.IT == SI )
 472  0003 6d03          	tnz	(3,x)
 473  0005 2614          	jrne	L142
 474                     ; 223 			TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
 476  0007 4c            	inc	a
 477  0008 cd0000        	call	_TIM1_ClearITPendingBit
 479                     ; 224 			TIM1_ClearFlag(TIM1_FLAG_UPDATE);
 481  000b ae0001        	ldw	x,#1
 482  000e cd0000        	call	_TIM1_ClearFlag
 484                     ; 225 			TIM1_SetCounter( 0 );
 486  0011 5f            	clrw	x
 487  0012 cd0000        	call	_TIM1_SetCounter
 489                     ; 226 			TIM1_ITConfig( TIM1_IT_UPDATE, DISABLE );
 491  0015 ae0100        	ldw	x,#256
 492  0018 cd0000        	call	_TIM1_ITConfig
 494  001b               L142:
 495                     ; 228 		TIM1_Cmd( DISABLE );
 497  001b 4f            	clr	a
 498  001c cd0000        	call	_TIM1_Cmd
 500  001f               L732:
 501                     ; 230 }
 504  001f 81            	ret	
 517                     	xdef	_Timer_DeInit
 518                     	xdef	_Timer_Config_Init
 519                     	xdef	_Timer_Init
 520                     	xref	_TIM1_ClearITPendingBit
 521                     	xref	_TIM1_ClearFlag
 522                     	xref	_TIM1_SetCounter
 523                     	xref	_TIM1_ITConfig
 524                     	xref	_TIM1_Cmd
 525                     	xref	_TIM1_TimeBaseInit
 544                     	end

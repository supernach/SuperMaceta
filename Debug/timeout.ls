   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
 208                     ; 106 void Timeout_Init( Timeout_t_ptr timeout )
 208                     ; 107 {
 210                     .text:	section	.text,new
 211  0000               _Timeout_Init:
 215                     ; 108 	timeout->Config.Timer.Numero = TIMER1;
 217  0000 7f            	clr	(x)
 218                     ; 109 	timeout->Config.Timer.Canal = CANAL1;
 220  0001 6f01          	clr	(1,x)
 221                     ; 110 	timeout->Estado = INACTIVO;
 223  0003 6f02          	clr	(2,x)
 224                     ; 111 	timeout->ValorDesborde = 1;
 226  0005 90ae0001      	ldw	y,#1
 227  0009 ef03          	ldw	(3,x),y
 228                     ; 112 }
 231  000b 81            	ret	
 281                     ; 149 void Timeout_Start( Timeout_t_ptr timeout, uint16_t us )
 281                     ; 150 {
 282                     .text:	section	.text,new
 283  0000               _Timeout_Start:
 285  0000 89            	pushw	x
 286       00000000      OFST:	set	0
 289                     ; 151 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
 291  0001 ae0701        	ldw	x,#1793
 292  0004 cd0000        	call	_CLK_PeripheralClockConfig
 294                     ; 152 	TIM1_DeInit();
 296  0007 cd0000        	call	_TIM1_DeInit
 298                     ; 153 	TIM1_TimeBaseInit( 15, TIM1_COUNTERMODE_UP, 0xFFFF, 0);
 300  000a 4b00          	push	#0
 301  000c aeffff        	ldw	x,#65535
 302  000f 89            	pushw	x
 303  0010 4b00          	push	#0
 304  0012 ae000f        	ldw	x,#15
 305  0015 cd0000        	call	_TIM1_TimeBaseInit
 307  0018 5b04          	addw	sp,#4
 308                     ; 155 	TIM1_Cmd( ENABLE );
 310  001a a601          	ld	a,#1
 311  001c cd0000        	call	_TIM1_Cmd
 313                     ; 156 	timeout->ValorDesborde = us;
 315  001f 1e01          	ldw	x,(OFST+1,sp)
 316  0021 1605          	ldw	y,(OFST+5,sp)
 317  0023 ef03          	ldw	(3,x),y
 318                     ; 157 	timeout->Estado = ACTIVO;
 320  0025 a601          	ld	a,#1
 321  0027 e702          	ld	(2,x),a
 322                     ; 158 }
 325  0029 85            	popw	x
 326  002a 81            	ret	
 366                     ; 160 void Timeout_Stop( Timeout_t_ptr timeout )
 366                     ; 161 {
 367                     .text:	section	.text,new
 368  0000               _Timeout_Stop:
 370  0000 89            	pushw	x
 371       00000000      OFST:	set	0
 374                     ; 162 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 376  0001 ae0700        	ldw	x,#1792
 377  0004 cd0000        	call	_CLK_PeripheralClockConfig
 379                     ; 163 	TIM1_Cmd( DISABLE );
 381  0007 4f            	clr	a
 382  0008 cd0000        	call	_TIM1_Cmd
 384                     ; 164 	TIM1_DeInit();
 386  000b cd0000        	call	_TIM1_DeInit
 388                     ; 166 	timeout->ValorDesborde = 0;
 390  000e 1e01          	ldw	x,(OFST+1,sp)
 391  0010 905f          	clrw	y
 392  0012 ef03          	ldw	(3,x),y
 393                     ; 167 	timeout->Estado = INACTIVO;
 395  0014 6f02          	clr	(2,x)
 396                     ; 168 }
 399  0016 85            	popw	x
 400  0017 81            	ret	
 438                     ; 170 void Timeout_Check( Timeout_t_ptr timeout )
 438                     ; 171 {
 439                     .text:	section	.text,new
 440  0000               _Timeout_Check:
 442  0000 89            	pushw	x
 443       00000000      OFST:	set	0
 446                     ; 172 	if(  TIM1_GetCounter() >= timeout->ValorDesborde )
 448  0001 cd0000        	call	_TIM1_GetCounter
 450  0004 1601          	ldw	y,(OFST+1,sp)
 451  0006 90e303        	cpw	x,(3,y)
 452  0009 2505          	jrult	L322
 453                     ; 174 		timeout->Estado = DISPARADO;
 455  000b 93            	ldw	x,y
 456  000c a602          	ld	a,#2
 457  000e e702          	ld	(2,x),a
 459  0010               L322:
 460                     ; 180 }
 463  0010 85            	popw	x
 464  0011 81            	ret	
 477                     	xdef	_Timeout_Check
 478                     	xdef	_Timeout_Stop
 479                     	xdef	_Timeout_Start
 480                     	xdef	_Timeout_Init
 481                     	xref	_TIM1_GetCounter
 482                     	xref	_TIM1_Cmd
 483                     	xref	_TIM1_TimeBaseInit
 484                     	xref	_TIM1_DeInit
 485                     	xref	_CLK_PeripheralClockConfig
 504                     	end

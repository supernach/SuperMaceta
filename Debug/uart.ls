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
 723                     ; 323 void Nhal_UART_Init( UART_Config_t_ptr uart )
 723                     ; 324 {
 725                     .text:	section	.text,new
 726  0000               _Nhal_UART_Init:
 728  0000 89            	pushw	x
 729  0001 89            	pushw	x
 730       00000002      OFST:	set	2
 733                     ; 325 	UART_init_config( uart );
 737                     ; 106 	uart->StopBit = UART1_STOPBITS_1;
 739  0002 7f            	clr	(x)
 740                     ; 107 	uart->Paridad = UART1_PARITY_NO;
 742  0003 6f01          	clr	(1,x)
 743                     ; 108 	uart->Bits = UART1_WORDLENGTH_8D;
 745  0005 6f02          	clr	(2,x)
 746                     ; 109 	uart->Baudios = 115200;
 748  0007 4f            	clr	a
 749  0008 e706          	ld	(6,x),a
 750  000a a6c2          	ld	a,#194
 751  000c e705          	ld	(5,x),a
 752  000e a601          	ld	a,#1
 753  0010 e704          	ld	(4,x),a
 754  0012 4f            	clr	a
 755  0013 e703          	ld	(3,x),a
 756                     ; 110 	uart->Modo = UART1_MODE_TXRX_ENABLE;
 758  0015 a60c          	ld	a,#12
 759  0017 e707          	ld	(7,x),a
 760                     ; 111 	uart->TipoInterrupcion = UART1_IT_RXNE;
 762  0019 90ae0255      	ldw	y,#597
 763  001d ef08          	ldw	(8,x),y
 764                     ; 327 	UART_init_rx( uart );
 767  001f 1f01          	ldw	(OFST-1,sp),x
 769                     ; 152 	uart->P_RX.Puerto = GPIOD;
 771  0021 90ae500f      	ldw	y,#20495
 772  0025 ef0a          	ldw	(10,x),y
 773                     ; 153 	uart->P_RX.Pin = GPIO_PIN_6;
 775  0027 a640          	ld	a,#64
 776  0029 e70c          	ld	(12,x),a
 777                     ; 154 	uart->P_RX.Tipo = GPIO_MODE_IN_PU_IT; 
 779  002b a660          	ld	a,#96
 780  002d e70d          	ld	(13,x),a
 781                     ; 155 	NHALgpio_Init( &uart->P_RX ); 
 783  002f 1c000a        	addw	x,#10
 784  0032 cd0000        	call	_NHALgpio_Init
 786                     ; 329 	UART_init_tx( uart );
 789  0035 1e03          	ldw	x,(OFST+1,sp)
 790  0037 1f01          	ldw	(OFST-1,sp),x
 792                     ; 196 	uart->P_TX.Puerto = GPIOD;
 794  0039 90ae500f      	ldw	y,#20495
 795  003d ef0e          	ldw	(14,x),y
 796                     ; 197 	uart->P_TX.Pin = GPIO_PIN_5;
 798  003f a620          	ld	a,#32
 799  0041 e710          	ld	(16,x),a
 800                     ; 198 	uart->P_TX.Tipo = GPIO_MODE_OUT_PP_HIGH_FAST;
 802  0043 a6f0          	ld	a,#240
 803  0045 e711          	ld	(17,x),a
 804                     ; 199 	NHALgpio_Init( &uart->P_TX );
 806  0047 1c000e        	addw	x,#14
 807  004a cd0000        	call	_NHALgpio_Init
 809                     ; 331 	UART1_DeInit();
 811  004d cd0000        	call	_UART1_DeInit
 813                     ; 239 	UART1_ITConfig( UART1_IT_RXNE, DISABLE );
 816  0050 4b00          	push	#0
 817  0052 ae0255        	ldw	x,#597
 818  0055 cd0000        	call	_UART1_ITConfig
 820  0058 84            	pop	a
 821                     ; 241 	UART1_ITConfig( UART1_IT_TXE, DISABLE );
 823  0059 4b00          	push	#0
 824  005b ae0277        	ldw	x,#631
 825  005e cd0000        	call	_UART1_ITConfig
 827  0061 84            	pop	a
 828                     ; 335 	HabilitarRelojPeriferico( CLK_PERIPHERAL_UART1 );
 830  0062 a603          	ld	a,#3
 831  0064 cd0000        	call	_HabilitarRelojPeriferico
 833                     ; 337 	UART1_Init( uart->Baudios, uart->Bits, uart->StopBit, uart->Paridad, UART1_SYNCMODE_CLOCK_DISABLE, uart->Modo );
 835  0067 1e03          	ldw	x,(OFST+1,sp)
 836  0069 e607          	ld	a,(7,x)
 837  006b 88            	push	a
 838  006c 4b80          	push	#128
 839  006e 1e05          	ldw	x,(OFST+3,sp)
 840  0070 e601          	ld	a,(1,x)
 841  0072 88            	push	a
 842  0073 1e06          	ldw	x,(OFST+4,sp)
 843  0075 f6            	ld	a,(x)
 844  0076 88            	push	a
 845  0077 1e07          	ldw	x,(OFST+5,sp)
 846  0079 e602          	ld	a,(2,x)
 847  007b 88            	push	a
 848  007c 1e08          	ldw	x,(OFST+6,sp)
 849  007e 9093          	ldw	y,x
 850  0080 ee05          	ldw	x,(5,x)
 851  0082 89            	pushw	x
 852  0083 93            	ldw	x,y
 853  0084 ee03          	ldw	x,(3,x)
 854  0086 89            	pushw	x
 855  0087 cd0000        	call	_UART1_Init
 857  008a 5b09          	addw	sp,#9
 858                     ; 339 	UART1_ITConfig( UART1_IT_RXNE, ENABLE );
 860  008c 4b01          	push	#1
 861  008e ae0255        	ldw	x,#597
 862  0091 cd0000        	call	_UART1_ITConfig
 864  0094 84            	pop	a
 865                     ; 340 	UART1_Cmd(ENABLE);
 867  0095 a601          	ld	a,#1
 868  0097 cd0000        	call	_UART1_Cmd
 870                     ; 281 	setFlagUartRXNE( 0 );
 873  009a 4f            	clr	a
 874  009b cd0000        	call	_setFlagUartRXNE
 876                     ; 282 	setFlagUartTXE( 0 );
 878  009e 4f            	clr	a
 879  009f cd0000        	call	_setFlagUartTXE
 881                     ; 284 	UART1_ClearFlag( UART1_FLAG_RXNE );
 883  00a2 ae0020        	ldw	x,#32
 884  00a5 cd0000        	call	_UART1_ClearFlag
 886                     ; 285 	UART1_ClearFlag( UART1_FLAG_TXE );
 888  00a8 ae0080        	ldw	x,#128
 889  00ab cd0000        	call	_UART1_ClearFlag
 891                     ; 343 }
 894  00ae 5b04          	addw	sp,#4
 895  00b0 81            	ret	
 946                     ; 380 void UART_Limpiar_IT( UART_IT_FLAG_e flag )
 946                     ; 381 {
 947                     .text:	section	.text,new
 948  0000               _UART_Limpiar_IT:
 952                     ; 382 	switch( flag )
 954  0000 4d            	tnz	a
 955  0001 260f          	jrne	L374
 958                     ; 384 		case TXE:
 958                     ; 385 			setFlagUartTXE( 0 );
 960  0003 cd0000        	call	_setFlagUartTXE
 962                     ; 386 			UART1_ClearITPendingBit( UART1_IT_TXE );
 964  0006 ae0277        	ldw	x,#631
 965  0009 cd0000        	call	_UART1_ClearITPendingBit
 967                     ; 387 			UART1_ClearFlag( UART1_FLAG_TXE );
 969  000c ae0080        	ldw	x,#128
 970  000f cd0000        	call	_UART1_ClearFlag
 972                     ; 388 		break;
 974  0012               L374:
 975                     ; 390 }
 978  0012 81            	ret	
1015                     ; 427 void UART_Habilitar_IT( UART_IT_FLAG_e flag )
1015                     ; 428 {
1016                     .text:	section	.text,new
1017  0000               _UART_Habilitar_IT:
1021                     ; 429 	switch( flag )
1023  0000 4d            	tnz	a
1024  0001 260c          	jrne	L715
1027                     ; 431 		case TXE:
1027                     ; 432 			setFlagUartTXE( 0 );
1029  0003 cd0000        	call	_setFlagUartTXE
1031                     ; 433 			UART1_ITConfig( UART1_IT_TXE, ENABLE );
1033  0006 4b01          	push	#1
1034  0008 ae0277        	ldw	x,#631
1035  000b cd0000        	call	_UART1_ITConfig
1037  000e 84            	pop	a
1038                     ; 434 		break;
1040  000f               L715:
1041                     ; 436 }
1044  000f 81            	ret	
1081                     ; 473 void UART_Deshabilitar_IT( UART_IT_FLAG_e flag )
1081                     ; 474 {
1082                     .text:	section	.text,new
1083  0000               _UART_Deshabilitar_IT:
1087                     ; 475 	switch( flag )
1089  0000 4d            	tnz	a
1090  0001 2609          	jrne	L345
1093                     ; 477 		case TXE:
1093                     ; 478 			UART1_ITConfig( UART1_IT_TXE, DISABLE );
1095  0003 4b00          	push	#0
1096  0005 ae0277        	ldw	x,#631
1097  0008 cd0000        	call	_UART1_ITConfig
1099  000b 84            	pop	a
1100                     ; 479 		break;
1102  000c               L345:
1103                     ; 481 }
1106  000c 81            	ret	
1141                     ; 518 void UART_Enviar_8( uint8_t dato )
1141                     ; 519 {
1142                     .text:	section	.text,new
1143  0000               _UART_Enviar_8:
1147                     ; 520 	UART1_SendData8( dato );
1150                     ; 521 }
1153  0000 cc0000        	jp	_UART1_SendData8
1166                     	xdef	_UART_Enviar_8
1167                     	xdef	_UART_Deshabilitar_IT
1168                     	xdef	_UART_Habilitar_IT
1169                     	xdef	_UART_Limpiar_IT
1170                     	xdef	_Nhal_UART_Init
1171                     	xref	_HabilitarRelojPeriferico
1172                     	xref	_NHALgpio_Init
1173                     	xref	_UART1_ClearITPendingBit
1174                     	xref	_UART1_ClearFlag
1175                     	xref	_UART1_SendData8
1176                     	xref	_UART1_ITConfig
1177                     	xref	_UART1_Cmd
1178                     	xref	_UART1_Init
1179                     	xref	_UART1_DeInit
1180                     	xref	_setFlagUartTXE
1181                     	xref	_setFlagUartRXNE
1200                     	end

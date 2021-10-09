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
 712                     ; 148 void Nhal_UART_Init( UART_Config_t_ptr uart )
 712                     ; 149 {
 714                     .text:	section	.text,new
 715  0000               _Nhal_UART_Init:
 717  0000 89            	pushw	x
 718  0001 89            	pushw	x
 719       00000002      OFST:	set	2
 722                     ; 150 	UART_init_config( uart );
 726                     ; 71 	uart->StopBit = UART1_STOPBITS_1;
 728  0002 7f            	clr	(x)
 729                     ; 72 	uart->Paridad = UART1_PARITY_NO;
 731  0003 6f01          	clr	(1,x)
 732                     ; 73 	uart->Bits = UART1_WORDLENGTH_8D;
 734  0005 6f02          	clr	(2,x)
 735                     ; 74 	uart->Baudios = 115200;
 737  0007 4f            	clr	a
 738  0008 e706          	ld	(6,x),a
 739  000a a6c2          	ld	a,#194
 740  000c e705          	ld	(5,x),a
 741  000e a601          	ld	a,#1
 742  0010 e704          	ld	(4,x),a
 743  0012 4f            	clr	a
 744  0013 e703          	ld	(3,x),a
 745                     ; 75 	uart->Modo = UART1_MODE_TXRX_ENABLE;
 747  0015 a60c          	ld	a,#12
 748  0017 e707          	ld	(7,x),a
 749                     ; 76 	uart->TipoInterrupcion = UART1_IT_RXNE;
 751  0019 90ae0255      	ldw	y,#597
 752  001d ef08          	ldw	(8,x),y
 753                     ; 152 	UART_init_rx( uart );
 756  001f 1f01          	ldw	(OFST-1,sp),x
 758                     ; 82 	uart->P_RX.Puerto = GPIOD;
 760  0021 90ae500f      	ldw	y,#20495
 761  0025 ef0a          	ldw	(10,x),y
 762                     ; 83 	uart->P_RX.Pin = GPIO_PIN_6;
 764  0027 a640          	ld	a,#64
 765  0029 e70c          	ld	(12,x),a
 766                     ; 84 	uart->P_RX.Tipo = GPIO_MODE_IN_PU_IT; 
 768  002b a660          	ld	a,#96
 769  002d e70d          	ld	(13,x),a
 770                     ; 85 	NHALgpio_Init( &uart->P_RX ); 
 772  002f 1c000a        	addw	x,#10
 773  0032 cd0000        	call	_NHALgpio_Init
 775                     ; 154 	UART_init_tx( uart );
 778  0035 1e03          	ldw	x,(OFST+1,sp)
 779  0037 1f01          	ldw	(OFST-1,sp),x
 781                     ; 91 	uart->P_TX.Puerto = GPIOD;
 783  0039 90ae500f      	ldw	y,#20495
 784  003d ef0e          	ldw	(14,x),y
 785                     ; 92 	uart->P_TX.Pin = GPIO_PIN_5;
 787  003f a620          	ld	a,#32
 788  0041 e710          	ld	(16,x),a
 789                     ; 93 	uart->P_TX.Tipo = GPIO_MODE_OUT_PP_HIGH_FAST;
 791  0043 a6f0          	ld	a,#240
 792  0045 e711          	ld	(17,x),a
 793                     ; 94 	NHALgpio_Init( &uart->P_TX );
 795  0047 1c000e        	addw	x,#14
 796  004a cd0000        	call	_NHALgpio_Init
 798                     ; 156 	UART1_DeInit();
 800  004d cd0000        	call	_UART1_DeInit
 802                     ; 99 	UART1_ITConfig( UART1_IT_RXNE, DISABLE );
 805  0050 4b00          	push	#0
 806  0052 ae0255        	ldw	x,#597
 807  0055 cd0000        	call	_UART1_ITConfig
 809  0058 84            	pop	a
 810                     ; 101 	UART1_ITConfig( UART1_IT_TXE, DISABLE );
 812  0059 4b00          	push	#0
 813  005b ae0277        	ldw	x,#631
 814  005e cd0000        	call	_UART1_ITConfig
 816  0061 84            	pop	a
 817                     ; 160 	HabilitarRelojPeriferico( CLK_PERIPHERAL_UART1 );
 819  0062 a603          	ld	a,#3
 820  0064 cd0000        	call	_HabilitarRelojPeriferico
 822                     ; 162 	UART1_Init( uart->Baudios, uart->Bits, uart->StopBit, uart->Paridad, UART1_SYNCMODE_CLOCK_DISABLE, uart->Modo );
 824  0067 1e03          	ldw	x,(OFST+1,sp)
 825  0069 e607          	ld	a,(7,x)
 826  006b 88            	push	a
 827  006c 4b80          	push	#128
 828  006e 1e05          	ldw	x,(OFST+3,sp)
 829  0070 e601          	ld	a,(1,x)
 830  0072 88            	push	a
 831  0073 1e06          	ldw	x,(OFST+4,sp)
 832  0075 f6            	ld	a,(x)
 833  0076 88            	push	a
 834  0077 1e07          	ldw	x,(OFST+5,sp)
 835  0079 e602          	ld	a,(2,x)
 836  007b 88            	push	a
 837  007c 1e08          	ldw	x,(OFST+6,sp)
 838  007e 9093          	ldw	y,x
 839  0080 ee05          	ldw	x,(5,x)
 840  0082 89            	pushw	x
 841  0083 93            	ldw	x,y
 842  0084 ee03          	ldw	x,(3,x)
 843  0086 89            	pushw	x
 844  0087 cd0000        	call	_UART1_Init
 846  008a 5b09          	addw	sp,#9
 847                     ; 164 	UART1_ITConfig( UART1_IT_RXNE, ENABLE );
 849  008c 4b01          	push	#1
 850  008e ae0255        	ldw	x,#597
 851  0091 cd0000        	call	_UART1_ITConfig
 853  0094 84            	pop	a
 854                     ; 165 	UART1_Cmd(ENABLE);
 856  0095 a601          	ld	a,#1
 857  0097 cd0000        	call	_UART1_Cmd
 859                     ; 106 	setFlagUartRXNE( 0 );
 862  009a 4f            	clr	a
 863  009b cd0000        	call	_setFlagUartRXNE
 865                     ; 107 	setFlagUartTXE( 0 );
 867  009e 4f            	clr	a
 868  009f cd0000        	call	_setFlagUartTXE
 870                     ; 109 	UART1_ClearFlag( UART1_FLAG_RXNE );
 872  00a2 ae0020        	ldw	x,#32
 873  00a5 cd0000        	call	_UART1_ClearFlag
 875                     ; 110 	UART1_ClearFlag( UART1_FLAG_TXE );
 877  00a8 ae0080        	ldw	x,#128
 878  00ab cd0000        	call	_UART1_ClearFlag
 880                     ; 168 }
 883  00ae 5b04          	addw	sp,#4
 884  00b0 81            	ret	
 935                     ; 170 void UART_Limpiar_IT( UART_IT_FLAG_e flag )
 935                     ; 171 {
 936                     .text:	section	.text,new
 937  0000               _UART_Limpiar_IT:
 941                     ; 172 	switch( flag )
 943  0000 4d            	tnz	a
 944  0001 260f          	jrne	L564
 947                     ; 174 		case TXE:
 947                     ; 175 			setFlagUartTXE( 0 );
 949  0003 cd0000        	call	_setFlagUartTXE
 951                     ; 176 			UART1_ClearITPendingBit( UART1_IT_TXE );
 953  0006 ae0277        	ldw	x,#631
 954  0009 cd0000        	call	_UART1_ClearITPendingBit
 956                     ; 177 			UART1_ClearFlag( UART1_FLAG_TXE );
 958  000c ae0080        	ldw	x,#128
 959  000f cd0000        	call	_UART1_ClearFlag
 961                     ; 178 		break;
 963  0012               L564:
 964                     ; 180 }
 967  0012 81            	ret	
1004                     ; 182 void UART_Habilitar_IT( UART_IT_FLAG_e flag )
1004                     ; 183 {
1005                     .text:	section	.text,new
1006  0000               _UART_Habilitar_IT:
1010                     ; 184 	switch( flag )
1012  0000 4d            	tnz	a
1013  0001 260c          	jrne	L115
1016                     ; 186 		case TXE:
1016                     ; 187 			setFlagUartTXE( 0 );
1018  0003 cd0000        	call	_setFlagUartTXE
1020                     ; 188 			UART1_ITConfig( UART1_IT_TXE, ENABLE );
1022  0006 4b01          	push	#1
1023  0008 ae0277        	ldw	x,#631
1024  000b cd0000        	call	_UART1_ITConfig
1026  000e 84            	pop	a
1027                     ; 189 		break;
1029  000f               L115:
1030                     ; 191 }
1033  000f 81            	ret	
1070                     ; 193 void UART_Deshabilitar_IT( UART_IT_FLAG_e flag )
1070                     ; 194 {
1071                     .text:	section	.text,new
1072  0000               _UART_Deshabilitar_IT:
1076                     ; 195 	switch( flag )
1078  0000 4d            	tnz	a
1079  0001 2609          	jrne	L535
1082                     ; 197 		case TXE:
1082                     ; 198 			UART1_ITConfig( UART1_IT_TXE, DISABLE );
1084  0003 4b00          	push	#0
1085  0005 ae0277        	ldw	x,#631
1086  0008 cd0000        	call	_UART1_ITConfig
1088  000b 84            	pop	a
1089                     ; 199 		break;
1091  000c               L535:
1092                     ; 201 }
1095  000c 81            	ret	
1130                     ; 203 void UART_Enviar_8( uint8_t dato )
1130                     ; 204 {
1131                     .text:	section	.text,new
1132  0000               _UART_Enviar_8:
1136                     ; 205 	UART1_SendData8( dato );
1139                     ; 206 }
1142  0000 cc0000        	jp	_UART1_SendData8
1155                     	xdef	_UART_Enviar_8
1156                     	xdef	_UART_Deshabilitar_IT
1157                     	xdef	_UART_Habilitar_IT
1158                     	xdef	_UART_Limpiar_IT
1159                     	xdef	_Nhal_UART_Init
1160                     	xref	_HabilitarRelojPeriferico
1161                     	xref	_NHALgpio_Init
1162                     	xref	_UART1_ClearITPendingBit
1163                     	xref	_UART1_ClearFlag
1164                     	xref	_UART1_SendData8
1165                     	xref	_UART1_ITConfig
1166                     	xref	_UART1_Cmd
1167                     	xref	_UART1_Init
1168                     	xref	_UART1_DeInit
1169                     	xref	_setFlagUartTXE
1170                     	xref	_setFlagUartRXNE
1189                     	end

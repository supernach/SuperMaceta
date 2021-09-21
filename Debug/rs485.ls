   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  21  0002               L5_flagUartRXNE:
  22  0002 00            	dc.b	0
 846                     ; 106 void RS485_Init( RS485_t_ptr rs485 )
 846                     ; 107 {
 848                     .text:	section	.text,new
 849  0000               _RS485_Init:
 851  0000 89            	pushw	x
 852       00000000      OFST:	set	0
 855                     ; 109 	rs485->Config.UART.StopBit = UART1_STOPBITS_1;
 857  0001 7f            	clr	(x)
 858                     ; 110 	rs485->Config.UART.Paridad = UART1_PARITY_NO;
 860  0002 6f01          	clr	(1,x)
 861                     ; 111 	rs485->Config.UART.Bits = UART1_WORDLENGTH_8D;
 863  0004 6f02          	clr	(2,x)
 864                     ; 112 	rs485->Config.UART.Baudios = 9600;
 866  0006 a680          	ld	a,#128
 867  0008 e706          	ld	(6,x),a
 868  000a a625          	ld	a,#37
 869  000c e705          	ld	(5,x),a
 870  000e 4f            	clr	a
 871  000f e704          	ld	(4,x),a
 872  0011 e703          	ld	(3,x),a
 873                     ; 113 	rs485->Config.UART.Modo = UART1_MODE_RX_ENABLE;
 875  0013 a608          	ld	a,#8
 876  0015 e707          	ld	(7,x),a
 877                     ; 114 	rs485->Config.UART.TipoInterrupcion = UART1_IT_RXNE;
 879  0017 90ae0255      	ldw	y,#597
 880  001b ef08          	ldw	(8,x),y
 881                     ; 117 	rs485->Config.UART.P_RX.Puerto = GPIOD;
 883  001d 90ae500f      	ldw	y,#20495
 884  0021 ef0a          	ldw	(10,x),y
 885                     ; 118 	rs485->Config.UART.P_RX.Pin = GPIO_PIN_6;
 887  0023 a640          	ld	a,#64
 888  0025 e70c          	ld	(12,x),a
 889                     ; 119 	rs485->Config.UART.P_RX.Tipo = GPIO_MODE_IN_PU_IT; 
 891  0027 a660          	ld	a,#96
 892  0029 e70d          	ld	(13,x),a
 893                     ; 120 	NHALgpio_Init( &rs485->Config.UART.P_RX ); 
 895  002b 1c000a        	addw	x,#10
 896  002e cd0000        	call	_NHALgpio_Init
 898                     ; 123 	rs485->Config.UART.P_TX.Puerto = GPIOD;
 900  0031 1e01          	ldw	x,(OFST+1,sp)
 901  0033 90ae500f      	ldw	y,#20495
 902  0037 ef0e          	ldw	(14,x),y
 903                     ; 124 	rs485->Config.UART.P_TX.Pin = GPIO_PIN_5;
 905  0039 a620          	ld	a,#32
 906  003b e710          	ld	(16,x),a
 907                     ; 125 	rs485->Config.UART.P_TX.Tipo = GPIO_MODE_OUT_PP_HIGH_FAST;
 909  003d a6f0          	ld	a,#240
 910  003f e711          	ld	(17,x),a
 911                     ; 126 	NHALgpio_Init( &rs485->Config.UART.P_TX );
 913  0041 1c000e        	addw	x,#14
 914  0044 cd0000        	call	_NHALgpio_Init
 916                     ; 130 	rs485->Buffer.Broadcast.nNodo = 0;
 918  0047 1e01          	ldw	x,(OFST+1,sp)
 919                     ; 131 	rs485->Buffer.Broadcast.Orden.Funcion = 0;
 921  0049 6f13          	clr	(19,x)
 922  004b 6f12          	clr	(18,x)
 923                     ; 132 	rs485->Buffer.Broadcast.Orden.Comando = 0;
 925  004d 6f14          	clr	(20,x)
 926                     ; 134 	rs485->Buffer.Tx.nNodo = 0;
 928  004f 6f15          	clr	(21,x)
 929                     ; 135 	rs485->Buffer.Tx.LecturaDHT11 = 0;
 931  0051 4f            	clr	a
 932  0052 e719          	ld	(25,x),a
 933  0054 e718          	ld	(24,x),a
 934  0056 e717          	ld	(23,x),a
 935  0058 e716          	ld	(22,x),a
 936                     ; 136 	rs485->Buffer.Tx.LecturaHX711 = 0;
 938  005a e71d          	ld	(29,x),a
 939  005c e71c          	ld	(28,x),a
 940  005e e71b          	ld	(27,x),a
 941  0060 e71a          	ld	(26,x),a
 942                     ; 138 	rs485->Buffer.Rx.nNodo = 0;
 944  0062 6f1e          	clr	(30,x)
 945                     ; 139 	rs485->Buffer.Rx.OrdenDHT11.Funcion = 0;
 947  0064 6f1f          	clr	(31,x)
 948                     ; 140 	rs485->Buffer.Rx.OrdenHX711.Comando = 0;
 950  0066 6f22          	clr	(34,x)
 951                     ; 142 	UART1_DeInit();
 953  0068 cd0000        	call	_UART1_DeInit
 955                     ; 143 	UART1_ITConfig( UART1_IT_RXNE, DISABLE );
 957  006b 4b00          	push	#0
 958  006d ae0255        	ldw	x,#597
 959  0070 cd0000        	call	_UART1_ITConfig
 961  0073 ae0301        	ldw	x,#769
 962  0076 84            	pop	a
 963                     ; 146 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);
 965  0077 cd0000        	call	_CLK_PeripheralClockConfig
 967                     ; 147 	UART1_Init( rs485->Config.UART.Baudios, rs485->Config.UART.Bits, rs485->Config.UART.StopBit, rs485->Config.UART.Paridad, UART1_SYNCMODE_CLOCK_DISABLE, rs485->Config.UART.Modo );
 969  007a 1e01          	ldw	x,(OFST+1,sp)
 970  007c e607          	ld	a,(7,x)
 971  007e 88            	push	a
 972  007f 4b80          	push	#128
 973  0081 1e03          	ldw	x,(OFST+3,sp)
 974  0083 e601          	ld	a,(1,x)
 975  0085 88            	push	a
 976  0086 1e04          	ldw	x,(OFST+4,sp)
 977  0088 f6            	ld	a,(x)
 978  0089 88            	push	a
 979  008a 1e05          	ldw	x,(OFST+5,sp)
 980  008c e602          	ld	a,(2,x)
 981  008e 88            	push	a
 982  008f 1e06          	ldw	x,(OFST+6,sp)
 983  0091 9093          	ldw	y,x
 984  0093 ee05          	ldw	x,(5,x)
 985  0095 89            	pushw	x
 986  0096 93            	ldw	x,y
 987  0097 ee03          	ldw	x,(3,x)
 988  0099 89            	pushw	x
 989  009a cd0000        	call	_UART1_Init
 991  009d 5b09          	addw	sp,#9
 992                     ; 149 	UART1_ITConfig( UART1_IT_RXNE, ENABLE );
 994  009f 4b01          	push	#1
 995  00a1 ae0255        	ldw	x,#597
 996  00a4 cd0000        	call	_UART1_ITConfig
 998  00a7 84            	pop	a
 999                     ; 150 	UART1_Cmd(ENABLE);
1001  00a8 a601          	ld	a,#1
1002  00aa cd0000        	call	_UART1_Cmd
1004                     ; 152 	UART1_ClearFlag( UART1_FLAG_RXNE );
1006  00ad ae0020        	ldw	x,#32
1007  00b0 cd0000        	call	_UART1_ClearFlag
1009                     ; 153 }
1012  00b3 85            	popw	x
1013  00b4 81            	ret	
1026                     	xdef	_RS485_Init
1027                     	xref	_NHALgpio_Init
1028                     	xref	_UART1_ClearFlag
1029                     	xref	_UART1_ITConfig
1030                     	xref	_UART1_Cmd
1031                     	xref	_UART1_Init
1032                     	xref	_UART1_DeInit
1033                     	xref	_CLK_PeripheralClockConfig
1052                     	end

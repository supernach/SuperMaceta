   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  21  0002               L5_flagUartRXNE:
  22  0002 00            	dc.b	0
1033                     ; 106 void RS485_Init( RS485_t_ptr rs485 )
1033                     ; 107 {
1035                     .text:	section	.text,new
1036  0000               _RS485_Init:
1038  0000 89            	pushw	x
1039       00000000      OFST:	set	0
1042                     ; 109 	rs485->Config.UART.StopBit = UART1_STOPBITS_1;
1044  0001 7f            	clr	(x)
1045                     ; 110 	rs485->Config.UART.Paridad = UART1_PARITY_NO;
1047  0002 6f01          	clr	(1,x)
1048                     ; 111 	rs485->Config.UART.Bits = UART1_WORDLENGTH_8D;
1050  0004 6f02          	clr	(2,x)
1051                     ; 112 	rs485->Config.UART.Baudios = 115200;
1053  0006 4f            	clr	a
1054  0007 e706          	ld	(6,x),a
1055  0009 a6c2          	ld	a,#194
1056  000b e705          	ld	(5,x),a
1057  000d a601          	ld	a,#1
1058  000f e704          	ld	(4,x),a
1059  0011 4f            	clr	a
1060  0012 e703          	ld	(3,x),a
1061                     ; 113 	rs485->Config.UART.Modo = UART1_MODE_RX_ENABLE;
1063  0014 a608          	ld	a,#8
1064  0016 e707          	ld	(7,x),a
1065                     ; 114 	rs485->Config.UART.TipoInterrupcion = UART1_IT_RXNE;
1067  0018 90ae0255      	ldw	y,#597
1068  001c ef08          	ldw	(8,x),y
1069                     ; 117 	rs485->Config.UART.P_RX.Puerto = GPIOD;
1071  001e 90ae500f      	ldw	y,#20495
1072  0022 ef0a          	ldw	(10,x),y
1073                     ; 118 	rs485->Config.UART.P_RX.Pin = GPIO_PIN_6;
1075  0024 a640          	ld	a,#64
1076  0026 e70c          	ld	(12,x),a
1077                     ; 119 	rs485->Config.UART.P_RX.Tipo = GPIO_MODE_IN_PU_IT; 
1079  0028 a660          	ld	a,#96
1080  002a e70d          	ld	(13,x),a
1081                     ; 120 	NHALgpio_Init( &rs485->Config.UART.P_RX ); 
1083  002c 1c000a        	addw	x,#10
1084  002f cd0000        	call	_NHALgpio_Init
1086                     ; 123 	rs485->Config.UART.P_TX.Puerto = GPIOD;
1088  0032 1e01          	ldw	x,(OFST+1,sp)
1089  0034 90ae500f      	ldw	y,#20495
1090  0038 ef0e          	ldw	(14,x),y
1091                     ; 124 	rs485->Config.UART.P_TX.Pin = GPIO_PIN_5;
1093  003a a620          	ld	a,#32
1094  003c e710          	ld	(16,x),a
1095                     ; 125 	rs485->Config.UART.P_TX.Tipo = GPIO_MODE_OUT_PP_HIGH_FAST;
1097  003e a6f0          	ld	a,#240
1098  0040 e711          	ld	(17,x),a
1099                     ; 126 	NHALgpio_Init( &rs485->Config.UART.P_TX );
1101  0042 1c000e        	addw	x,#14
1102  0045 cd0000        	call	_NHALgpio_Init
1104                     ; 130 	rs485->Buffer.Broadcast.nNodo = 0;
1106  0048 1e01          	ldw	x,(OFST+1,sp)
1107                     ; 131 	rs485->Buffer.Broadcast.Orden.Funcion = 0;
1109  004a 6f13          	clr	(19,x)
1110  004c 6f12          	clr	(18,x)
1111                     ; 132 	rs485->Buffer.Broadcast.Orden.Comando = 0;
1113  004e 6f14          	clr	(20,x)
1114                     ; 134 	rs485->Buffer.Tx.nNodo = 0;
1116  0050 6f15          	clr	(21,x)
1117                     ; 135 	rs485->Buffer.Tx.LecturaDHT11 = 0;
1119  0052 4f            	clr	a
1120  0053 e719          	ld	(25,x),a
1121  0055 e718          	ld	(24,x),a
1122  0057 e717          	ld	(23,x),a
1123  0059 e716          	ld	(22,x),a
1124                     ; 136 	rs485->Buffer.Tx.LecturaHX711 = 0;
1126  005b e71d          	ld	(29,x),a
1127  005d e71c          	ld	(28,x),a
1128  005f e71b          	ld	(27,x),a
1129  0061 e71a          	ld	(26,x),a
1130                     ; 138 	rs485->Buffer.Rx.buffer[0] = 0;
1132  0063 6f1e          	clr	(30,x)
1133                     ; 139 	rs485->Buffer.Rx.buffer[1] = 0;
1135  0065 6f1f          	clr	(31,x)
1136                     ; 140 	rs485->Buffer.Rx.buffer[2] = 0;
1138  0067 6f20          	clr	(32,x)
1139                     ; 141 	rs485->Buffer.Rx.buffer[3] = 0;
1141  0069 6f21          	clr	(33,x)
1142                     ; 142 	rs485->Buffer.Rx.buffer[4] = 0;
1144  006b 6f22          	clr	(34,x)
1145                     ; 143 	rs485->Buffer.Rx.buffer[5] = 0;
1147  006d 6f23          	clr	(35,x)
1148                     ; 144 	rs485->Buffer.Rx.ptrBuffer = 0;
1150  006f 6f24          	clr	(36,x)
1151                     ; 146 	rs485->Buffer.Rx.Secuencia.pasoActual = 0;
1153  0071 6f25          	clr	(37,x)
1154                     ; 148 	rs485->Buffer.Rx.Secuencia.LecturaNodo.nPasoSiguiente = 1;
1156  0073 4c            	inc	a
1157  0074 e726          	ld	(38,x),a
1158                     ; 149 	rs485->Buffer.Rx.Secuencia.LecturaNodo.BytesaLeer = RS485_BYTES_N_NODO;
1160  0076 4c            	inc	a
1161  0077 e727          	ld	(39,x),a
1162                     ; 151 	rs485->Buffer.Rx.Secuencia.LecturaOrdenDHT11.nPasoSiguiente = 2;
1164  0079 e728          	ld	(40,x),a
1165                     ; 152 	rs485->Buffer.Rx.Secuencia.LecturaOrdenDHT11.BytesaLeer = RS485_ORDENES_BYTES;
1167  007b e729          	ld	(41,x),a
1168                     ; 154 	rs485->Buffer.Rx.Secuencia.LecturaOrdenHX711.nPasoSiguiente = 0;
1170  007d 6f2a          	clr	(42,x)
1171                     ; 155 	rs485->Buffer.Rx.Secuencia.LecturaOrdenHX711.BytesaLeer = RS485_ORDENES_BYTES;
1173  007f e72b          	ld	(43,x),a
1174                     ; 159 	UART1_DeInit();
1176  0081 cd0000        	call	_UART1_DeInit
1178                     ; 160 	UART1_ITConfig( UART1_IT_RXNE, DISABLE );
1180  0084 4b00          	push	#0
1181  0086 ae0255        	ldw	x,#597
1182  0089 cd0000        	call	_UART1_ITConfig
1184  008c ae0301        	ldw	x,#769
1185  008f 84            	pop	a
1186                     ; 163 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);
1188  0090 cd0000        	call	_CLK_PeripheralClockConfig
1190                     ; 164 	UART1_Init( rs485->Config.UART.Baudios, rs485->Config.UART.Bits, rs485->Config.UART.StopBit, rs485->Config.UART.Paridad, UART1_SYNCMODE_CLOCK_DISABLE, rs485->Config.UART.Modo );
1192  0093 1e01          	ldw	x,(OFST+1,sp)
1193  0095 e607          	ld	a,(7,x)
1194  0097 88            	push	a
1195  0098 4b80          	push	#128
1196  009a 1e03          	ldw	x,(OFST+3,sp)
1197  009c e601          	ld	a,(1,x)
1198  009e 88            	push	a
1199  009f 1e04          	ldw	x,(OFST+4,sp)
1200  00a1 f6            	ld	a,(x)
1201  00a2 88            	push	a
1202  00a3 1e05          	ldw	x,(OFST+5,sp)
1203  00a5 e602          	ld	a,(2,x)
1204  00a7 88            	push	a
1205  00a8 1e06          	ldw	x,(OFST+6,sp)
1206  00aa 9093          	ldw	y,x
1207  00ac ee05          	ldw	x,(5,x)
1208  00ae 89            	pushw	x
1209  00af 93            	ldw	x,y
1210  00b0 ee03          	ldw	x,(3,x)
1211  00b2 89            	pushw	x
1212  00b3 cd0000        	call	_UART1_Init
1214  00b6 5b09          	addw	sp,#9
1215                     ; 166 	UART1_ITConfig( UART1_IT_RXNE, ENABLE );
1217  00b8 4b01          	push	#1
1218  00ba ae0255        	ldw	x,#597
1219  00bd cd0000        	call	_UART1_ITConfig
1221  00c0 84            	pop	a
1222                     ; 167 	UART1_Cmd(ENABLE);
1224  00c1 a601          	ld	a,#1
1225  00c3 cd0000        	call	_UART1_Cmd
1227                     ; 171 	UART1_ClearFlag( UART1_FLAG_RXNE );
1229  00c6 ae0020        	ldw	x,#32
1230  00c9 cd0000        	call	_UART1_ClearFlag
1232                     ; 172 	enableInterrupts();
1235  00cc 9a            	rim	
1237                     ; 173 }
1241  00cd 85            	popw	x
1242  00ce 81            	ret	
1255                     	xdef	_RS485_Init
1256                     	xref	_NHALgpio_Init
1257                     	xref	_UART1_ClearFlag
1258                     	xref	_UART1_ITConfig
1259                     	xref	_UART1_Cmd
1260                     	xref	_UART1_Init
1261                     	xref	_UART1_DeInit
1262                     	xref	_CLK_PeripheralClockConfig
1281                     	end

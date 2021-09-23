   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  21  0002               L5_flagUartRXNE:
  22  0002 00            	dc.b	0
1047                     ; 106 void RS485_Init( RS485_t_ptr rs485 )
1047                     ; 107 {
1049                     .text:	section	.text,new
1050  0000               _RS485_Init:
1052  0000 89            	pushw	x
1053       00000000      OFST:	set	0
1056                     ; 108 	rs485->Flags.flags = 0;
1058  0001 6f30          	clr	(48,x)
1059                     ; 110 	rs485->Config.UART.StopBit = UART1_STOPBITS_1;
1061  0003 7f            	clr	(x)
1062                     ; 111 	rs485->Config.UART.Paridad = UART1_PARITY_NO;
1064  0004 6f01          	clr	(1,x)
1065                     ; 112 	rs485->Config.UART.Bits = UART1_WORDLENGTH_8D;
1067  0006 6f02          	clr	(2,x)
1068                     ; 113 	rs485->Config.UART.Baudios = 115200;
1070  0008 4f            	clr	a
1071  0009 e706          	ld	(6,x),a
1072  000b a6c2          	ld	a,#194
1073  000d e705          	ld	(5,x),a
1074  000f a601          	ld	a,#1
1075  0011 e704          	ld	(4,x),a
1076  0013 4f            	clr	a
1077  0014 e703          	ld	(3,x),a
1078                     ; 114 	rs485->Config.UART.Modo = UART1_MODE_RX_ENABLE;
1080  0016 a608          	ld	a,#8
1081  0018 e707          	ld	(7,x),a
1082                     ; 115 	rs485->Config.UART.TipoInterrupcion = UART1_IT_RXNE;
1084  001a 90ae0255      	ldw	y,#597
1085  001e ef08          	ldw	(8,x),y
1086                     ; 118 	rs485->Config.UART.P_RX.Puerto = GPIOD;
1088  0020 90ae500f      	ldw	y,#20495
1089  0024 ef0a          	ldw	(10,x),y
1090                     ; 119 	rs485->Config.UART.P_RX.Pin = GPIO_PIN_6;
1092  0026 a640          	ld	a,#64
1093  0028 e70c          	ld	(12,x),a
1094                     ; 120 	rs485->Config.UART.P_RX.Tipo = GPIO_MODE_IN_PU_IT; 
1096  002a a660          	ld	a,#96
1097  002c e70d          	ld	(13,x),a
1098                     ; 121 	NHALgpio_Init( &rs485->Config.UART.P_RX ); 
1100  002e 1c000a        	addw	x,#10
1101  0031 cd0000        	call	_NHALgpio_Init
1103                     ; 124 	rs485->Config.UART.P_TX.Puerto = GPIOD;
1105  0034 1e01          	ldw	x,(OFST+1,sp)
1106  0036 90ae500f      	ldw	y,#20495
1107  003a ef0e          	ldw	(14,x),y
1108                     ; 125 	rs485->Config.UART.P_TX.Pin = GPIO_PIN_5;
1110  003c a620          	ld	a,#32
1111  003e e710          	ld	(16,x),a
1112                     ; 126 	rs485->Config.UART.P_TX.Tipo = GPIO_MODE_OUT_PP_HIGH_FAST;
1114  0040 a6f0          	ld	a,#240
1115  0042 e711          	ld	(17,x),a
1116                     ; 127 	NHALgpio_Init( &rs485->Config.UART.P_TX );
1118  0044 1c000e        	addw	x,#14
1119  0047 cd0000        	call	_NHALgpio_Init
1121                     ; 131 	rs485->Buffer.Broadcast.nNodo = 0;
1123  004a 1e01          	ldw	x,(OFST+1,sp)
1124                     ; 132 	rs485->Buffer.Broadcast.Orden.Funcion = 0;
1126  004c 6f13          	clr	(19,x)
1127  004e 6f12          	clr	(18,x)
1128                     ; 133 	rs485->Buffer.Broadcast.Orden.Comando = 0;
1130  0050 6f14          	clr	(20,x)
1131                     ; 135 	rs485->Buffer.Tx.nNodo = 0;
1133  0052 6f15          	clr	(21,x)
1134                     ; 136 	rs485->Buffer.Tx.LecturaDHT11 = 0;
1136  0054 4f            	clr	a
1137  0055 e719          	ld	(25,x),a
1138  0057 e718          	ld	(24,x),a
1139  0059 e717          	ld	(23,x),a
1140  005b e716          	ld	(22,x),a
1141                     ; 137 	rs485->Buffer.Tx.LecturaHX711 = 0;
1143  005d e71d          	ld	(29,x),a
1144  005f e71c          	ld	(28,x),a
1145  0061 e71b          	ld	(27,x),a
1146  0063 e71a          	ld	(26,x),a
1147                     ; 139 	rs485->Buffer.Rx.buffer[0] = 0;
1149  0065 6f1e          	clr	(30,x)
1150                     ; 140 	rs485->Buffer.Rx.buffer[1] = 0;
1152  0067 6f1f          	clr	(31,x)
1153                     ; 141 	rs485->Buffer.Rx.buffer[2] = 0;
1155  0069 6f20          	clr	(32,x)
1156                     ; 142 	rs485->Buffer.Rx.buffer[3] = 0;
1158  006b 6f21          	clr	(33,x)
1159                     ; 143 	rs485->Buffer.Rx.buffer[4] = 0;
1161  006d 6f22          	clr	(34,x)
1162                     ; 144 	rs485->Buffer.Rx.buffer[5] = 0;
1164  006f 6f23          	clr	(35,x)
1165                     ; 145 	rs485->Buffer.Rx.ptrBuffer = 0;
1167  0071 6f24          	clr	(36,x)
1168                     ; 147 	rs485->Buffer.Rx.Secuencia.pasoActual = 0;
1170  0073 6f25          	clr	(37,x)
1171                     ; 148 	rs485->Buffer.Rx.Secuencia.transicion = 1; // Empieza con lectura nodo ( BYTES NNODO - 1 )
1173  0075 4c            	inc	a
1174  0076 e726          	ld	(38,x),a
1175                     ; 150 	rs485->Buffer.Rx.Secuencia.LecturaNodo.nPasoSiguiente = 1;
1177  0078 e727          	ld	(39,x),a
1178                     ; 151 	rs485->Buffer.Rx.Secuencia.LecturaNodo.BytesaLeer = RS485_BYTES_N_NODO;
1180  007a 4c            	inc	a
1181  007b e728          	ld	(40,x),a
1182                     ; 152 	rs485->Buffer.Rx.Secuencia.LecturaNodo.nPaso = 0;
1184  007d 6f29          	clr	(41,x)
1185                     ; 154 	rs485->Buffer.Rx.Secuencia.LecturaOrdenDHT11.nPasoSiguiente = 2;
1187  007f e72a          	ld	(42,x),a
1188                     ; 155 	rs485->Buffer.Rx.Secuencia.LecturaOrdenDHT11.BytesaLeer = RS485_ORDENES_BYTES;
1190  0081 e72b          	ld	(43,x),a
1191                     ; 156 	rs485->Buffer.Rx.Secuencia.LecturaOrdenDHT11.nPaso = 1;
1193  0083 a601          	ld	a,#1
1194  0085 e72c          	ld	(44,x),a
1195                     ; 158 	rs485->Buffer.Rx.Secuencia.LecturaOrdenHX711.nPasoSiguiente = 0;
1197  0087 6f2d          	clr	(45,x)
1198                     ; 159 	rs485->Buffer.Rx.Secuencia.LecturaOrdenHX711.BytesaLeer = RS485_ORDENES_BYTES;
1200  0089 4c            	inc	a
1201  008a e72e          	ld	(46,x),a
1202                     ; 160 	rs485->Buffer.Rx.Secuencia.LecturaOrdenHX711.nPaso = 2;
1204  008c e72f          	ld	(47,x),a
1205                     ; 164 	UART1_DeInit();
1207  008e cd0000        	call	_UART1_DeInit
1209                     ; 165 	UART1_ITConfig( UART1_IT_RXNE, DISABLE );
1211  0091 4b00          	push	#0
1212  0093 ae0255        	ldw	x,#597
1213  0096 cd0000        	call	_UART1_ITConfig
1215  0099 ae0301        	ldw	x,#769
1216  009c 84            	pop	a
1217                     ; 168 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);
1219  009d cd0000        	call	_CLK_PeripheralClockConfig
1221                     ; 169 	UART1_Init( rs485->Config.UART.Baudios, rs485->Config.UART.Bits, rs485->Config.UART.StopBit, rs485->Config.UART.Paridad, UART1_SYNCMODE_CLOCK_DISABLE, rs485->Config.UART.Modo );
1223  00a0 1e01          	ldw	x,(OFST+1,sp)
1224  00a2 e607          	ld	a,(7,x)
1225  00a4 88            	push	a
1226  00a5 4b80          	push	#128
1227  00a7 1e03          	ldw	x,(OFST+3,sp)
1228  00a9 e601          	ld	a,(1,x)
1229  00ab 88            	push	a
1230  00ac 1e04          	ldw	x,(OFST+4,sp)
1231  00ae f6            	ld	a,(x)
1232  00af 88            	push	a
1233  00b0 1e05          	ldw	x,(OFST+5,sp)
1234  00b2 e602          	ld	a,(2,x)
1235  00b4 88            	push	a
1236  00b5 1e06          	ldw	x,(OFST+6,sp)
1237  00b7 9093          	ldw	y,x
1238  00b9 ee05          	ldw	x,(5,x)
1239  00bb 89            	pushw	x
1240  00bc 93            	ldw	x,y
1241  00bd ee03          	ldw	x,(3,x)
1242  00bf 89            	pushw	x
1243  00c0 cd0000        	call	_UART1_Init
1245  00c3 5b09          	addw	sp,#9
1246                     ; 171 	UART1_ITConfig( UART1_IT_RXNE, ENABLE );
1248  00c5 4b01          	push	#1
1249  00c7 ae0255        	ldw	x,#597
1250  00ca cd0000        	call	_UART1_ITConfig
1252  00cd 84            	pop	a
1253                     ; 172 	UART1_Cmd(ENABLE);
1255  00ce a601          	ld	a,#1
1256  00d0 cd0000        	call	_UART1_Cmd
1258                     ; 176 	UART1_ClearFlag( UART1_FLAG_RXNE );
1260  00d3 ae0020        	ldw	x,#32
1261  00d6 cd0000        	call	_UART1_ClearFlag
1263                     ; 177 	enableInterrupts();
1266  00d9 9a            	rim	
1268                     ; 179 	rs485->Flags.bit.Inicializado = 1;
1271  00da 1e01          	ldw	x,(OFST+1,sp)
1272  00dc e630          	ld	a,(48,x)
1273  00de aa02          	or	a,#2
1274  00e0 e730          	ld	(48,x),a
1275                     ; 180 }
1278  00e2 85            	popw	x
1279  00e3 81            	ret	
1292                     	xdef	_RS485_Init
1293                     	xref	_NHALgpio_Init
1294                     	xref	_UART1_ClearFlag
1295                     	xref	_UART1_ITConfig
1296                     	xref	_UART1_Cmd
1297                     	xref	_UART1_Init
1298                     	xref	_UART1_DeInit
1299                     	xref	_CLK_PeripheralClockConfig
1318                     	end

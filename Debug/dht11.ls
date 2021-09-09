   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     .const:	section	.text
  19  0000               L71_semilla:
  20  0000 00            	dc.b	0
  21  0001 00            	dc.b	0
  22  0002 00            	dc.b	0
  23  0003 00            	dc.b	0
  24  0004 00            	dc.b	0
 581                     ; 220 void DHT11_Init( DHT11_t_ptr dht11, DHT11_fPtr Lectura )
 581                     ; 221 {
 583                     .text:	section	.text,new
 584  0000               _DHT11_Init:
 586  0000 89            	pushw	x
 587       00000000      OFST:	set	0
 590                     ; 222 	dht11->Lectura = Lectura;
 592  0001 1605          	ldw	y,(OFST+5,sp)
 593  0003 ef0a          	ldw	(10,x),y
 594                     ; 224 	dht11->Datos.UltimaLectura.CRC = 0;
 596  0005 6f04          	clr	(4,x)
 597                     ; 225 	dht11->Datos.UltimaLectura.T_Decimal = 0;
 599  0007 6f05          	clr	(5,x)
 600                     ; 226 	dht11->Datos.UltimaLectura.T_Entero = 0;
 602  0009 6f06          	clr	(6,x)
 603                     ; 227 	dht11->Datos.UltimaLectura.H_Decimal = 0;
 605  000b 6f07          	clr	(7,x)
 606                     ; 228 	dht11->Datos.UltimaLectura.H_Entero = 0;
 608  000d 6f08          	clr	(8,x)
 609                     ; 230 	NHALgpioConfig_SetType( &dht11->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
 611  000f 4bc0          	push	#192
 612  0011 cd0000        	call	_NHALgpioConfig_SetType
 614  0014 84            	pop	a
 615                     ; 231 	NHALgpio_Init( &dht11->Config.HW );
 617  0015 1e01          	ldw	x,(OFST+1,sp)
 618  0017 cd0000        	call	_NHALgpio_Init
 620                     ; 233 	NHALgpio_Write( &dht11->Config.HW, true );
 622  001a 4b01          	push	#1
 623  001c 1e02          	ldw	x,(OFST+2,sp)
 624  001e cd0000        	call	_NHALgpio_Write
 626  0021 84            	pop	a
 627                     ; 235 	dht11->Datos.Estado = dht11_INICIALIZADO;
 629  0022 1e01          	ldw	x,(OFST+1,sp)
 630  0024 6f09          	clr	(9,x)
 631                     ; 237 }
 634  0026 85            	popw	x
 635  0027 81            	ret	
 638                     	switch	.const
 639  0005               L733_lectura:
 640  0005 00            	dc.b	0
 641  0006 00            	dc.b	0
 642  0007 00            	dc.b	0
 643  0008 00            	dc.b	0
 644  0009 00            	dc.b	0
 645  000a               L553_semilla:
 646  000a 00            	dc.b	0
 647  000b 00            	dc.b	0
 648  000c 00            	dc.b	0
 649  000d 00            	dc.b	0
 650  000e 00            	dc.b	0
 934                     ; 273 DHT11_SI_t dht11_Lectura( DHT11_t_ptr dht11 )
 934                     ; 274 {
 935                     .text:	section	.text,new
 936  0000               _dht11_Lectura:
 938  0000 5213          	subw	sp,#19
 939       00000013      OFST:	set	19
 942                     ; 275 	DHT11_SI_t lectura = { 0, 0, 0, 0, 0 };
 944  0002 96            	ldw	x,sp
 945  0003 1c000f        	addw	x,#OFST-4
 946  0006 90ae0005      	ldw	y,#L733_lectura
 947  000a a605          	ld	a,#5
 948  000c cd0000        	call	c_xymov
 950                     ; 277 	if( dht11_ComenzarTransmision( dht11 ) )
 953  000f 1e18          	ldw	x,(OFST+5,sp)
 954  0011 1f0c          	ldw	(OFST-7,sp),x
 956                     ; 108 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
 958  0013 4bc0          	push	#192
 959  0015 1e0d          	ldw	x,(OFST-6,sp)
 960  0017 cd0000        	call	_NHALgpioConfig_SetType
 962  001a 84            	pop	a
 963                     ; 109 	NHALgpio_Init( &sensor->Config.HW ); 
 965  001b 1e0c          	ldw	x,(OFST-7,sp)
 966  001d cd0000        	call	_NHALgpio_Init
 968                     ; 111 	NHALgpio_Write( &sensor->Config.HW, false );
 970  0020 4b00          	push	#0
 971  0022 1e0d          	ldw	x,(OFST-6,sp)
 972  0024 cd0000        	call	_NHALgpio_Write
 974  0027 84            	pop	a
 975                     ; 113 	sensor->Datos.Estado = dht11_COMUNICANDO;
 977  0028 1e0c          	ldw	x,(OFST-7,sp)
 978  002a a601          	ld	a,#1
 979  002c e709          	ld	(9,x),a
 983  002e ae0012        	ldw	x,#18
 986  0031 200a          	jra	L126
 987  0033               L516:
 988                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 992  0033 ae14d4        	ldw	x,#5332
 994  0036 9d            	nop	
 995  0037               L42:
 996  0037 5a            	decw	X
 997  0038 26fd          	jrne	L42
 998  003a 9d            	nop	
 999                     
1001  003b 1e0a          	ldw	x,(OFST-9,sp)
1002  003d               L126:
1003                     ; 98 	while ( __ms-- )
1005  003d 5a            	decw	x
1006  003e 1f0a          	ldw	(OFST-9,sp),x
1007  0040 5c            	incw	x
1009  0041 26f0          	jrne	L516
1010                     ; 116 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_IN_PU_NO_IT); //Configuro como entrada para leer
1012  0043 4b40          	push	#64
1013  0045 1e0d          	ldw	x,(OFST-6,sp)
1014  0047 cd0000        	call	_NHALgpioConfig_SetType
1016  004a 84            	pop	a
1017                     ; 117 	NHALgpio_Init( &sensor->Config.HW ); 
1019  004b 1e0c          	ldw	x,(OFST-7,sp)
1020  004d cd0000        	call	_NHALgpio_Init
1022                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1026  0050 ae00d4        	ldw	x,#212
1028  0053 9d            	nop	
1029  0054               L23:
1030  0054 5a            	decw	X
1031  0055 26fd          	jrne	L23
1032  0057 9d            	nop	
1033                     
1035  0058 2006          	jra	L726
1036  005a               L526:
1037                     ; 122 		sensor->Datos.Estado = dht11_ESPERA_BAJO;
1039  005a 1e0c          	ldw	x,(OFST-7,sp)
1040  005c a607          	ld	a,#7
1041  005e e709          	ld	(9,x),a
1042  0060               L726:
1043                     ; 120 	while( !NHALgpio_Read( &sensor->Config.HW ) )
1045  0060 1e0c          	ldw	x,(OFST-7,sp)
1046  0062 cd0000        	call	_NHALgpio_Read
1048  0065 4d            	tnz	a
1049  0066 27f2          	jreq	L526
1051  0068 2006          	jra	L536
1052  006a               L336:
1053                     ; 128 		sensor->Datos.Estado = dht11_ESPERA_ALTO;
1055  006a 1e0c          	ldw	x,(OFST-7,sp)
1056  006c a608          	ld	a,#8
1057  006e e709          	ld	(9,x),a
1058  0070               L536:
1059                     ; 126 	while( NHALgpio_Read( &sensor->Config.HW ) )
1061  0070 1e0c          	ldw	x,(OFST-7,sp)
1062  0072 cd0000        	call	_NHALgpio_Read
1064  0075 4d            	tnz	a
1065  0076 26f2          	jrne	L336
1066                     ; 132 	sensor->Datos.Estado = dht11_CONEXION_OK;
1068  0078 1e0c          	ldw	x,(OFST-7,sp)
1069  007a a602          	ld	a,#2
1070  007c e709          	ld	(9,x),a
1071                     ; 133 	return true;
1073  007e a601          	ld	a,#1
1074  0080 6b0e          	ld	(OFST-5,sp),a
1078  0082 2603cc0268    	jreq	L316
1079                     ; 279 		lectura = dht11_LeerDatos( dht11 );
1082  0087 1e18          	ldw	x,(OFST+5,sp)
1083  0089 1f0c          	ldw	(OFST-7,sp),x
1085                     ; 138 	uint16_t checkCRC = 0;
1087                     ; 139 	uint8_t mask = 0b11111111;
1089  008b a6ff          	ld	a,#255
1090  008d 6b04          	ld	(OFST-15,sp),a
1092                     ; 141 	DHT11_SI_t semilla = { 0, 0, 0, 0, 0 };
1094  008f 96            	ldw	x,sp
1095  0090 1c0007        	addw	x,#OFST-12
1096  0093 90ae000a      	ldw	y,#L553_semilla
1097  0097 a605          	ld	a,#5
1098  0099 cd0000        	call	c_xymov
1100                     ; 143 	sensor->Datos.Estado = dht11_MIDIENDO_H;
1102  009c 1e0c          	ldw	x,(OFST-7,sp)
1103  009e a603          	ld	a,#3
1104  00a0 e709          	ld	(9,x),a
1105                     ; 69 	uint8_t contador = 0;
1108  00a2 0f02          	clr	(OFST-17,sp)
1110                     ; 70 	uint8_t temp = 0;
1112  00a4 0f01          	clr	(OFST-18,sp)
1114                     ; 71 	uint8_t bitLeido = 0;
1116                     ; 73 	for( contador; contador < 8; contador++ )
1119  00a6 2032          	jra	L546
1120  00a8               L356:
1121                     ; 75 		while( !NHALgpio_Read( gpio ) ) //Espera nuevo bit
1123  00a8 1e0c          	ldw	x,(OFST-7,sp)
1124  00aa cd0000        	call	_NHALgpio_Read
1126  00ad 4d            	tnz	a
1127  00ae 27f8          	jreq	L356
1128                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1132  00b0 ae00d4        	ldw	x,#212
1134  00b3 9d            	nop	
1135  00b4               L24:
1136  00b4 5a            	decw	X
1137  00b5 26fd          	jrne	L24
1138  00b7 9d            	nop	
1139                     
1141                     ; 81 		bitLeido = 0;
1143                     ; 82 		if( NHALgpio_Read( gpio ) )
1145  00b8 1e0c          	ldw	x,(OFST-7,sp)
1146  00ba cd0000        	call	_NHALgpio_Read
1148  00bd 4d            	tnz	a
1149  00be 2702          	jreq	L756
1150                     ; 84 			bitLeido = 1;
1152  00c0 a601          	ld	a,#1
1154  00c2               L756:
1155                     ; 88 			bitLeido = 0;
1157  00c2 6b03          	ld	(OFST-16,sp),a
1159                     ; 91 		temp |= bitLeido;
1161  00c4 1a01          	or	a,(OFST-18,sp)
1162  00c6 6b01          	ld	(OFST-18,sp),a
1164                     ; 92 		if( contador < 7 )
1166  00c8 7b02          	ld	a,(OFST-17,sp)
1167  00ca a107          	cp	a,#7
1168  00cc 2402          	jruge	L766
1169                     ; 94 			temp <<=  1;
1171  00ce 0801          	sll	(OFST-18,sp)
1173  00d0               L766:
1174                     ; 97 		while( NHALgpio_Read( gpio ) ) //Si el bit=1 espero a que baje señal
1176  00d0 1e0c          	ldw	x,(OFST-7,sp)
1177  00d2 cd0000        	call	_NHALgpio_Read
1179  00d5 4d            	tnz	a
1180  00d6 26f8          	jrne	L766
1181                     ; 73 	for( contador; contador < 8; contador++ )
1183  00d8 0c02          	inc	(OFST-17,sp)
1185  00da               L546:
1188  00da 7b02          	ld	a,(OFST-17,sp)
1189  00dc a108          	cp	a,#8
1190  00de 25c8          	jrult	L356
1191                     ; 103 	return temp;
1193  00e0 7b01          	ld	a,(OFST-18,sp)
1194  00e2 6b0b          	ld	(OFST-8,sp),a
1198                     ; 146 	sensor->Datos.Estado = dht11_MIDIENDO_H;
1200  00e4 1e0c          	ldw	x,(OFST-7,sp)
1201  00e6 a603          	ld	a,#3
1202  00e8 e709          	ld	(9,x),a
1203                     ; 69 	uint8_t contador = 0;
1206  00ea 0f02          	clr	(OFST-17,sp)
1208                     ; 70 	uint8_t temp = 0;
1210  00ec 0f01          	clr	(OFST-18,sp)
1212                     ; 71 	uint8_t bitLeido = 0;
1214                     ; 73 	for( contador; contador < 8; contador++ )
1217  00ee 2032          	jra	L776
1218  00f0               L507:
1219                     ; 75 		while( !NHALgpio_Read( gpio ) ) //Espera nuevo bit
1221  00f0 1e0c          	ldw	x,(OFST-7,sp)
1222  00f2 cd0000        	call	_NHALgpio_Read
1224  00f5 4d            	tnz	a
1225  00f6 27f8          	jreq	L507
1226                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1230  00f8 ae00d4        	ldw	x,#212
1232  00fb 9d            	nop	
1233  00fc               L25:
1234  00fc 5a            	decw	X
1235  00fd 26fd          	jrne	L25
1236  00ff 9d            	nop	
1237                     
1239                     ; 81 		bitLeido = 0;
1241                     ; 82 		if( NHALgpio_Read( gpio ) )
1243  0100 1e0c          	ldw	x,(OFST-7,sp)
1244  0102 cd0000        	call	_NHALgpio_Read
1246  0105 4d            	tnz	a
1247  0106 2702          	jreq	L117
1248                     ; 84 			bitLeido = 1;
1250  0108 a601          	ld	a,#1
1252  010a               L117:
1253                     ; 88 			bitLeido = 0;
1255  010a 6b03          	ld	(OFST-16,sp),a
1257                     ; 91 		temp |= bitLeido;
1259  010c 1a01          	or	a,(OFST-18,sp)
1260  010e 6b01          	ld	(OFST-18,sp),a
1262                     ; 92 		if( contador < 7 )
1264  0110 7b02          	ld	a,(OFST-17,sp)
1265  0112 a107          	cp	a,#7
1266  0114 2402          	jruge	L127
1267                     ; 94 			temp <<=  1;
1269  0116 0801          	sll	(OFST-18,sp)
1271  0118               L127:
1272                     ; 97 		while( NHALgpio_Read( gpio ) ) //Si el bit=1 espero a que baje señal
1274  0118 1e0c          	ldw	x,(OFST-7,sp)
1275  011a cd0000        	call	_NHALgpio_Read
1277  011d 4d            	tnz	a
1278  011e 26f8          	jrne	L127
1279                     ; 73 	for( contador; contador < 8; contador++ )
1281  0120 0c02          	inc	(OFST-17,sp)
1283  0122               L776:
1286  0122 7b02          	ld	a,(OFST-17,sp)
1287  0124 a108          	cp	a,#8
1288  0126 25c8          	jrult	L507
1289                     ; 103 	return temp;
1291  0128 7b01          	ld	a,(OFST-18,sp)
1292  012a 6b0a          	ld	(OFST-9,sp),a
1296                     ; 149 	sensor->Datos.Estado = dht11_MIDIENDO_T;
1298  012c 1e0c          	ldw	x,(OFST-7,sp)
1299  012e a604          	ld	a,#4
1300  0130 e709          	ld	(9,x),a
1301                     ; 69 	uint8_t contador = 0;
1304  0132 0f02          	clr	(OFST-17,sp)
1306                     ; 70 	uint8_t temp = 0;
1308  0134 0f01          	clr	(OFST-18,sp)
1310                     ; 71 	uint8_t bitLeido = 0;
1312                     ; 73 	for( contador; contador < 8; contador++ )
1315  0136 2032          	jra	L137
1316  0138               L737:
1317                     ; 75 		while( !NHALgpio_Read( gpio ) ) //Espera nuevo bit
1319  0138 1e0c          	ldw	x,(OFST-7,sp)
1320  013a cd0000        	call	_NHALgpio_Read
1322  013d 4d            	tnz	a
1323  013e 27f8          	jreq	L737
1324                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1328  0140 ae00d4        	ldw	x,#212
1330  0143 9d            	nop	
1331  0144               L26:
1332  0144 5a            	decw	X
1333  0145 26fd          	jrne	L26
1334  0147 9d            	nop	
1335                     
1337                     ; 81 		bitLeido = 0;
1339                     ; 82 		if( NHALgpio_Read( gpio ) )
1341  0148 1e0c          	ldw	x,(OFST-7,sp)
1342  014a cd0000        	call	_NHALgpio_Read
1344  014d 4d            	tnz	a
1345  014e 2702          	jreq	L347
1346                     ; 84 			bitLeido = 1;
1348  0150 a601          	ld	a,#1
1350  0152               L347:
1351                     ; 88 			bitLeido = 0;
1353  0152 6b03          	ld	(OFST-16,sp),a
1355                     ; 91 		temp |= bitLeido;
1357  0154 1a01          	or	a,(OFST-18,sp)
1358  0156 6b01          	ld	(OFST-18,sp),a
1360                     ; 92 		if( contador < 7 )
1362  0158 7b02          	ld	a,(OFST-17,sp)
1363  015a a107          	cp	a,#7
1364  015c 2402          	jruge	L357
1365                     ; 94 			temp <<=  1;
1367  015e 0801          	sll	(OFST-18,sp)
1369  0160               L357:
1370                     ; 97 		while( NHALgpio_Read( gpio ) ) //Si el bit=1 espero a que baje señal
1372  0160 1e0c          	ldw	x,(OFST-7,sp)
1373  0162 cd0000        	call	_NHALgpio_Read
1375  0165 4d            	tnz	a
1376  0166 26f8          	jrne	L357
1377                     ; 73 	for( contador; contador < 8; contador++ )
1379  0168 0c02          	inc	(OFST-17,sp)
1381  016a               L137:
1384  016a 7b02          	ld	a,(OFST-17,sp)
1385  016c a108          	cp	a,#8
1386  016e 25c8          	jrult	L737
1387                     ; 103 	return temp;
1389  0170 7b01          	ld	a,(OFST-18,sp)
1390  0172 6b09          	ld	(OFST-10,sp),a
1394                     ; 152 	sensor->Datos.Estado = dht11_MIDIENDO_T;
1396  0174 1e0c          	ldw	x,(OFST-7,sp)
1397  0176 a604          	ld	a,#4
1398  0178 e709          	ld	(9,x),a
1399                     ; 69 	uint8_t contador = 0;
1402  017a 0f02          	clr	(OFST-17,sp)
1404                     ; 70 	uint8_t temp = 0;
1406  017c 0f01          	clr	(OFST-18,sp)
1408                     ; 71 	uint8_t bitLeido = 0;
1410                     ; 73 	for( contador; contador < 8; contador++ )
1413  017e 2032          	jra	L367
1414  0180               L177:
1415                     ; 75 		while( !NHALgpio_Read( gpio ) ) //Espera nuevo bit
1417  0180 1e0c          	ldw	x,(OFST-7,sp)
1418  0182 cd0000        	call	_NHALgpio_Read
1420  0185 4d            	tnz	a
1421  0186 27f8          	jreq	L177
1422                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1426  0188 ae00d4        	ldw	x,#212
1428  018b 9d            	nop	
1429  018c               L27:
1430  018c 5a            	decw	X
1431  018d 26fd          	jrne	L27
1432  018f 9d            	nop	
1433                     
1435                     ; 81 		bitLeido = 0;
1437                     ; 82 		if( NHALgpio_Read( gpio ) )
1439  0190 1e0c          	ldw	x,(OFST-7,sp)
1440  0192 cd0000        	call	_NHALgpio_Read
1442  0195 4d            	tnz	a
1443  0196 2702          	jreq	L577
1444                     ; 84 			bitLeido = 1;
1446  0198 a601          	ld	a,#1
1448  019a               L577:
1449                     ; 88 			bitLeido = 0;
1451  019a 6b03          	ld	(OFST-16,sp),a
1453                     ; 91 		temp |= bitLeido;
1455  019c 1a01          	or	a,(OFST-18,sp)
1456  019e 6b01          	ld	(OFST-18,sp),a
1458                     ; 92 		if( contador < 7 )
1460  01a0 7b02          	ld	a,(OFST-17,sp)
1461  01a2 a107          	cp	a,#7
1462  01a4 2402          	jruge	L5001
1463                     ; 94 			temp <<=  1;
1465  01a6 0801          	sll	(OFST-18,sp)
1467  01a8               L5001:
1468                     ; 97 		while( NHALgpio_Read( gpio ) ) //Si el bit=1 espero a que baje señal
1470  01a8 1e0c          	ldw	x,(OFST-7,sp)
1471  01aa cd0000        	call	_NHALgpio_Read
1473  01ad 4d            	tnz	a
1474  01ae 26f8          	jrne	L5001
1475                     ; 73 	for( contador; contador < 8; contador++ )
1477  01b0 0c02          	inc	(OFST-17,sp)
1479  01b2               L367:
1482  01b2 7b02          	ld	a,(OFST-17,sp)
1483  01b4 a108          	cp	a,#8
1484  01b6 25c8          	jrult	L177
1485                     ; 103 	return temp;
1487  01b8 7b01          	ld	a,(OFST-18,sp)
1488  01ba 6b08          	ld	(OFST-11,sp),a
1492                     ; 69 	uint8_t contador = 0;
1495  01bc 0f02          	clr	(OFST-17,sp)
1497                     ; 70 	uint8_t temp = 0;
1499  01be 0f01          	clr	(OFST-18,sp)
1501                     ; 71 	uint8_t bitLeido = 0;
1503                     ; 73 	for( contador; contador < 8; contador++ )
1506  01c0 2032          	jra	L5101
1507  01c2               L3201:
1508                     ; 75 		while( !NHALgpio_Read( gpio ) ) //Espera nuevo bit
1510  01c2 1e0c          	ldw	x,(OFST-7,sp)
1511  01c4 cd0000        	call	_NHALgpio_Read
1513  01c7 4d            	tnz	a
1514  01c8 27f8          	jreq	L3201
1515                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1519  01ca ae00d4        	ldw	x,#212
1521  01cd 9d            	nop	
1522  01ce               L201:
1523  01ce 5a            	decw	X
1524  01cf 26fd          	jrne	L201
1525  01d1 9d            	nop	
1526                     
1528                     ; 81 		bitLeido = 0;
1530                     ; 82 		if( NHALgpio_Read( gpio ) )
1532  01d2 1e0c          	ldw	x,(OFST-7,sp)
1533  01d4 cd0000        	call	_NHALgpio_Read
1535  01d7 4d            	tnz	a
1536  01d8 2702          	jreq	L7201
1537                     ; 84 			bitLeido = 1;
1539  01da a601          	ld	a,#1
1541  01dc               L7201:
1542                     ; 88 			bitLeido = 0;
1544  01dc 6b03          	ld	(OFST-16,sp),a
1546                     ; 91 		temp |= bitLeido;
1548  01de 1a01          	or	a,(OFST-18,sp)
1549  01e0 6b01          	ld	(OFST-18,sp),a
1551                     ; 92 		if( contador < 7 )
1553  01e2 7b02          	ld	a,(OFST-17,sp)
1554  01e4 a107          	cp	a,#7
1555  01e6 2402          	jruge	L7301
1556                     ; 94 			temp <<=  1;
1558  01e8 0801          	sll	(OFST-18,sp)
1560  01ea               L7301:
1561                     ; 97 		while( NHALgpio_Read( gpio ) ) //Si el bit=1 espero a que baje señal
1563  01ea 1e0c          	ldw	x,(OFST-7,sp)
1564  01ec cd0000        	call	_NHALgpio_Read
1566  01ef 4d            	tnz	a
1567  01f0 26f8          	jrne	L7301
1568                     ; 73 	for( contador; contador < 8; contador++ )
1570  01f2 0c02          	inc	(OFST-17,sp)
1572  01f4               L5101:
1575  01f4 7b02          	ld	a,(OFST-17,sp)
1576  01f6 a108          	cp	a,#8
1577  01f8 25c8          	jrult	L3201
1578                     ; 103 	return temp;
1580  01fa 7b01          	ld	a,(OFST-18,sp)
1581  01fc 6b07          	ld	(OFST-12,sp),a
1585                     ; 157 	checkCRC = semilla.H_Entero + semilla.H_Decimal + semilla.T_Entero + semilla.T_Decimal;
1587  01fe 5f            	clrw	x
1588  01ff 7b0b          	ld	a,(OFST-8,sp)
1589  0201 1b0a          	add	a,(OFST-9,sp)
1590  0203 59            	rlcw	x
1591  0204 1b09          	add	a,(OFST-10,sp)
1592  0206 2401          	jrnc	L211
1593  0208 5c            	incw	x
1594  0209               L211:
1595  0209 1b08          	add	a,(OFST-11,sp)
1596  020b 2401          	jrnc	L411
1597  020d 5c            	incw	x
1598  020e               L411:
1599  020e 02            	rlwa	x,a
1600  020f 1f05          	ldw	(OFST-14,sp),x
1602                     ; 158 	checkCRC &= mask;
1604  0211 5f            	clrw	x
1605  0212 7b04          	ld	a,(OFST-15,sp)
1606  0214 97            	ld	xl,a
1607  0215 01            	rrwa	x,a
1608  0216 1406          	and	a,(OFST-13,sp)
1609  0218 01            	rrwa	x,a
1610  0219 1405          	and	a,(OFST-14,sp)
1611  021b 01            	rrwa	x,a
1612  021c 1f05          	ldw	(OFST-14,sp),x
1614                     ; 160 	if( checkCRC == semilla.CRC )
1616  021e 5f            	clrw	x
1617  021f 7b07          	ld	a,(OFST-12,sp)
1618  0221 97            	ld	xl,a
1619  0222 bf00          	ldw	c_x,x
1620  0224 1e05          	ldw	x,(OFST-14,sp)
1621  0226 b300          	cpw	x,c_x
1622  0228 2606          	jrne	L3401
1623                     ; 162 		sensor->Datos.Estado = dht11_LECTURA_OK;
1625  022a 1e0c          	ldw	x,(OFST-7,sp)
1626  022c a60b          	ld	a,#11
1627                     ; 163 		return semilla;
1630  022e 2004          	jra	L514
1631  0230               L3401:
1632                     ; 167 		sensor->Datos.Estado = dht11_FALLO_AL_LEER;
1634  0230 1e0c          	ldw	x,(OFST-7,sp)
1635  0232 a609          	ld	a,#9
1636                     ; 168 		return semilla;
1640  0234               L514:
1641  0234 e709          	ld	(9,x),a
1643  0236 96            	ldw	x,sp
1644  0237 1c000f        	addw	x,#OFST-4
1645  023a 9096          	ldw	y,sp
1646  023c 72a90007      	addw	y,#OFST-12
1647  0240 a605          	ld	a,#5
1648  0242 cd0000        	call	c_xymov
1650                     ; 280 		dht11_CerrarConexion( dht11 );
1653  0245 1e18          	ldw	x,(OFST+5,sp)
1654  0247 1f0c          	ldw	(OFST-7,sp),x
1656                     ; 174 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
1658  0249 4bc0          	push	#192
1659  024b 1e0d          	ldw	x,(OFST-6,sp)
1660  024d cd0000        	call	_NHALgpioConfig_SetType
1662  0250 84            	pop	a
1663                     ; 175 	NHALgpio_Init( &sensor->Config.HW );
1665  0251 1e0c          	ldw	x,(OFST-7,sp)
1666  0253 cd0000        	call	_NHALgpio_Init
1668                     ; 177 	NHALgpio_Write( &sensor->Config.HW, true );
1670  0256 4b01          	push	#1
1671  0258 1e0d          	ldw	x,(OFST-6,sp)
1672  025a cd0000        	call	_NHALgpio_Write
1674  025d 84            	pop	a
1675                     ; 179 	if( sensor->Datos.Estado == dht11_CERRANDO_CONEXION )
1677  025e 1e0c          	ldw	x,(OFST-7,sp)
1678  0260 e609          	ld	a,(9,x)
1679  0262 a105          	cp	a,#5
1680  0264 262b          	jrne	L124
1681                     ; 181 		sensor->Datos.Estado = dht11_SLEEP;
1682                     ; 282 		return lectura;
1685  0266 2025          	jp	LC001
1686  0268               L316:
1687                     ; 286 		dht11->Datos.Estado = dht11_FALLO_AL_COMUNICAR;
1689  0268 1e18          	ldw	x,(OFST+5,sp)
1690  026a a60a          	ld	a,#10
1691  026c e709          	ld	(9,x),a
1692                     ; 287 		dht11_CerrarConexion( dht11 );
1695  026e 1f0c          	ldw	(OFST-7,sp),x
1697                     ; 174 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
1699  0270 4bc0          	push	#192
1700  0272 1e0d          	ldw	x,(OFST-6,sp)
1701  0274 cd0000        	call	_NHALgpioConfig_SetType
1703  0277 84            	pop	a
1704                     ; 175 	NHALgpio_Init( &sensor->Config.HW );
1706  0278 1e0c          	ldw	x,(OFST-7,sp)
1707  027a cd0000        	call	_NHALgpio_Init
1709                     ; 177 	NHALgpio_Write( &sensor->Config.HW, true );
1711  027d 4b01          	push	#1
1712  027f 1e0d          	ldw	x,(OFST-6,sp)
1713  0281 cd0000        	call	_NHALgpio_Write
1715  0284 84            	pop	a
1716                     ; 179 	if( sensor->Datos.Estado == dht11_CERRANDO_CONEXION )
1718  0285 1e0c          	ldw	x,(OFST-7,sp)
1719  0287 e609          	ld	a,(9,x)
1720  0289 a105          	cp	a,#5
1721  028b 2604          	jrne	L124
1722                     ; 181 		sensor->Datos.Estado = dht11_SLEEP;
1724  028d               LC001:
1726  028d a606          	ld	a,#6
1727  028f e709          	ld	(9,x),a
1728  0291               L124:
1729                     ; 289 		return lectura;
1734  0291 1e16          	ldw	x,(OFST+3,sp)
1735  0293 9096          	ldw	y,sp
1736  0295 72a9000f      	addw	y,#OFST-4
1737  0299 a605          	ld	a,#5
1738  029b cd0000        	call	c_xymov
1740  029e 5b13          	addw	sp,#19
1741  02a0 81            	ret	
1754                     	xdef	_dht11_Lectura
1755                     	xdef	_DHT11_Init
1756                     	xref	_NHALgpio_Write
1757                     	xref	_NHALgpio_Read
1758                     	xref	_NHALgpio_Init
1759                     	xref	_NHALgpioConfig_SetType
1760                     	xref.b	c_x
1779                     	xref	c_xymov
1780                     	end

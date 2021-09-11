   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 00            	dc.b	0
  50                     .const:	section	.text
  51  0000               L53_semilla:
  52  0000 00            	dc.b	0
  53  0001 00            	dc.b	0
  54  0002 00            	dc.b	0
  55  0003 00            	dc.b	0
  56  0004 00            	dc.b	0
 613                     ; 220 void DHT11_Init( DHT11_t_ptr dht11, DHT11_fPtr Lectura )
 613                     ; 221 {
 615                     .text:	section	.text,new
 616  0000               _DHT11_Init:
 618  0000 89            	pushw	x
 619       00000000      OFST:	set	0
 622                     ; 222 	dht11->Lectura = Lectura;
 624  0001 1605          	ldw	y,(OFST+5,sp)
 625  0003 ef0a          	ldw	(10,x),y
 626                     ; 224 	dht11->Datos.UltimaLectura.CRC = 0;
 628  0005 6f04          	clr	(4,x)
 629                     ; 225 	dht11->Datos.UltimaLectura.T_Decimal = 0;
 631  0007 6f05          	clr	(5,x)
 632                     ; 226 	dht11->Datos.UltimaLectura.T_Entero = 0;
 634  0009 6f06          	clr	(6,x)
 635                     ; 227 	dht11->Datos.UltimaLectura.H_Decimal = 0;
 637  000b 6f07          	clr	(7,x)
 638                     ; 228 	dht11->Datos.UltimaLectura.H_Entero = 0;
 640  000d 6f08          	clr	(8,x)
 641                     ; 230 	NHALgpioConfig_SetType( &dht11->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
 643  000f 4bc0          	push	#192
 644  0011 cd0000        	call	_NHALgpioConfig_SetType
 646  0014 84            	pop	a
 647                     ; 231 	NHALgpio_Init( &dht11->Config.HW );
 649  0015 1e01          	ldw	x,(OFST+1,sp)
 650  0017 cd0000        	call	_NHALgpio_Init
 652                     ; 233 	NHALgpio_Write( &dht11->Config.HW, true );
 654  001a 4b01          	push	#1
 655  001c 1e02          	ldw	x,(OFST+2,sp)
 656  001e cd0000        	call	_NHALgpio_Write
 658  0021 84            	pop	a
 659                     ; 235 	dht11->Datos.Estado = dht11_INICIALIZADO;
 661  0022 1e01          	ldw	x,(OFST+1,sp)
 662  0024 6f09          	clr	(9,x)
 663                     ; 237 }
 666  0026 85            	popw	x
 667  0027 81            	ret	
 670                     	switch	.const
 671  0005               L553_lectura:
 672  0005 00            	dc.b	0
 673  0006 00            	dc.b	0
 674  0007 00            	dc.b	0
 675  0008 00            	dc.b	0
 676  0009 00            	dc.b	0
 677  000a               L373_semilla:
 678  000a 00            	dc.b	0
 679  000b 00            	dc.b	0
 680  000c 00            	dc.b	0
 681  000d 00            	dc.b	0
 682  000e 00            	dc.b	0
 966                     ; 273 DHT11_SI_t dht11_Lectura( DHT11_t_ptr dht11 )
 966                     ; 274 {
 967                     .text:	section	.text,new
 968  0000               _dht11_Lectura:
 970  0000 5213          	subw	sp,#19
 971       00000013      OFST:	set	19
 974                     ; 275 	DHT11_SI_t lectura = { 0, 0, 0, 0, 0 };
 976  0002 96            	ldw	x,sp
 977  0003 1c000f        	addw	x,#OFST-4
 978  0006 90ae0005      	ldw	y,#L553_lectura
 979  000a a605          	ld	a,#5
 980  000c cd0000        	call	c_xymov
 982                     ; 277 	if( dht11_ComenzarTransmision( dht11 ) )
 985  000f 1e18          	ldw	x,(OFST+5,sp)
 986  0011 1f0c          	ldw	(OFST-7,sp),x
 988                     ; 108 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
 990  0013 4bc0          	push	#192
 991  0015 1e0d          	ldw	x,(OFST-6,sp)
 992  0017 cd0000        	call	_NHALgpioConfig_SetType
 994  001a 84            	pop	a
 995                     ; 109 	NHALgpio_Init( &sensor->Config.HW ); 
 997  001b 1e0c          	ldw	x,(OFST-7,sp)
 998  001d cd0000        	call	_NHALgpio_Init
1000                     ; 111 	NHALgpio_Write( &sensor->Config.HW, false );
1002  0020 4b00          	push	#0
1003  0022 1e0d          	ldw	x,(OFST-6,sp)
1004  0024 cd0000        	call	_NHALgpio_Write
1006  0027 84            	pop	a
1007                     ; 113 	sensor->Datos.Estado = dht11_COMUNICANDO;
1009  0028 1e0c          	ldw	x,(OFST-7,sp)
1010  002a a601          	ld	a,#1
1011  002c e709          	ld	(9,x),a
1015  002e ae0012        	ldw	x,#18
1018  0031 200a          	jra	L736
1019  0033               L336:
1020                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1024  0033 ae14d4        	ldw	x,#5332
1026  0036 9d            	nop	
1027  0037               L42:
1028  0037 5a            	decw	X
1029  0038 26fd          	jrne	L42
1030  003a 9d            	nop	
1031                     
1033  003b 1e0a          	ldw	x,(OFST-9,sp)
1034  003d               L736:
1035                     ; 177 	while ( __ms-- )
1037  003d 5a            	decw	x
1038  003e 1f0a          	ldw	(OFST-9,sp),x
1039  0040 5c            	incw	x
1041  0041 26f0          	jrne	L336
1042                     ; 116 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_IN_PU_NO_IT); //Configuro como entrada para leer
1044  0043 4b40          	push	#64
1045  0045 1e0d          	ldw	x,(OFST-6,sp)
1046  0047 cd0000        	call	_NHALgpioConfig_SetType
1048  004a 84            	pop	a
1049                     ; 117 	NHALgpio_Init( &sensor->Config.HW ); 
1051  004b 1e0c          	ldw	x,(OFST-7,sp)
1052  004d cd0000        	call	_NHALgpio_Init
1054                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1058  0050 ae00d4        	ldw	x,#212
1060  0053 9d            	nop	
1061  0054               L23:
1062  0054 5a            	decw	X
1063  0055 26fd          	jrne	L23
1064  0057 9d            	nop	
1065                     
1067  0058 2006          	jra	L546
1068  005a               L346:
1069                     ; 122 		sensor->Datos.Estado = dht11_ESPERA_BAJO;
1071  005a 1e0c          	ldw	x,(OFST-7,sp)
1072  005c a607          	ld	a,#7
1073  005e e709          	ld	(9,x),a
1074  0060               L546:
1075                     ; 120 	while( !NHALgpio_Read( &sensor->Config.HW ) )
1077  0060 1e0c          	ldw	x,(OFST-7,sp)
1078  0062 cd0000        	call	_NHALgpio_Read
1080  0065 4d            	tnz	a
1081  0066 27f2          	jreq	L346
1083  0068 2006          	jra	L356
1084  006a               L156:
1085                     ; 128 		sensor->Datos.Estado = dht11_ESPERA_ALTO;
1087  006a 1e0c          	ldw	x,(OFST-7,sp)
1088  006c a608          	ld	a,#8
1089  006e e709          	ld	(9,x),a
1090  0070               L356:
1091                     ; 126 	while( NHALgpio_Read( &sensor->Config.HW ) )
1093  0070 1e0c          	ldw	x,(OFST-7,sp)
1094  0072 cd0000        	call	_NHALgpio_Read
1096  0075 4d            	tnz	a
1097  0076 26f2          	jrne	L156
1098                     ; 132 	sensor->Datos.Estado = dht11_CONEXION_OK;
1100  0078 1e0c          	ldw	x,(OFST-7,sp)
1101  007a a602          	ld	a,#2
1102  007c e709          	ld	(9,x),a
1103                     ; 133 	return true;
1105  007e a601          	ld	a,#1
1106  0080 6b0e          	ld	(OFST-5,sp),a
1110  0082 2603cc0268    	jreq	L136
1111                     ; 279 		lectura = dht11_LeerDatos( dht11 );
1114  0087 1e18          	ldw	x,(OFST+5,sp)
1115  0089 1f0c          	ldw	(OFST-7,sp),x
1117                     ; 138 	uint16_t checkCRC = 0;
1119                     ; 139 	uint8_t mask = 0b11111111;
1121  008b a6ff          	ld	a,#255
1122  008d 6b04          	ld	(OFST-15,sp),a
1124                     ; 141 	DHT11_SI_t semilla = { 0, 0, 0, 0, 0 };
1126  008f 96            	ldw	x,sp
1127  0090 1c0007        	addw	x,#OFST-12
1128  0093 90ae000a      	ldw	y,#L373_semilla
1129  0097 a605          	ld	a,#5
1130  0099 cd0000        	call	c_xymov
1132                     ; 143 	sensor->Datos.Estado = dht11_MIDIENDO_H;
1134  009c 1e0c          	ldw	x,(OFST-7,sp)
1135  009e a603          	ld	a,#3
1136  00a0 e709          	ld	(9,x),a
1137                     ; 69 	uint8_t contador = 0;
1140  00a2 0f02          	clr	(OFST-17,sp)
1142                     ; 70 	uint8_t temp = 0;
1144  00a4 0f01          	clr	(OFST-18,sp)
1146                     ; 71 	uint8_t bitLeido = 0;
1148                     ; 73 	for( contador; contador < 8; contador++ )
1151  00a6 2032          	jra	L366
1152  00a8               L176:
1153                     ; 75 		while( !NHALgpio_Read( gpio ) ) //Espera nuevo bit
1155  00a8 1e0c          	ldw	x,(OFST-7,sp)
1156  00aa cd0000        	call	_NHALgpio_Read
1158  00ad 4d            	tnz	a
1159  00ae 27f8          	jreq	L176
1160                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1164  00b0 ae00d4        	ldw	x,#212
1166  00b3 9d            	nop	
1167  00b4               L24:
1168  00b4 5a            	decw	X
1169  00b5 26fd          	jrne	L24
1170  00b7 9d            	nop	
1171                     
1173                     ; 81 		bitLeido = 0;
1175                     ; 82 		if( NHALgpio_Read( gpio ) )
1177  00b8 1e0c          	ldw	x,(OFST-7,sp)
1178  00ba cd0000        	call	_NHALgpio_Read
1180  00bd 4d            	tnz	a
1181  00be 2702          	jreq	L576
1182                     ; 84 			bitLeido = 1;
1184  00c0 a601          	ld	a,#1
1186  00c2               L576:
1187                     ; 88 			bitLeido = 0;
1189  00c2 6b03          	ld	(OFST-16,sp),a
1191                     ; 91 		temp |= bitLeido;
1193  00c4 1a01          	or	a,(OFST-18,sp)
1194  00c6 6b01          	ld	(OFST-18,sp),a
1196                     ; 92 		if( contador < 7 )
1198  00c8 7b02          	ld	a,(OFST-17,sp)
1199  00ca a107          	cp	a,#7
1200  00cc 2402          	jruge	L507
1201                     ; 94 			temp <<=  1;
1203  00ce 0801          	sll	(OFST-18,sp)
1205  00d0               L507:
1206                     ; 97 		while( NHALgpio_Read( gpio ) ) //Si el bit=1 espero a que baje señal
1208  00d0 1e0c          	ldw	x,(OFST-7,sp)
1209  00d2 cd0000        	call	_NHALgpio_Read
1211  00d5 4d            	tnz	a
1212  00d6 26f8          	jrne	L507
1213                     ; 73 	for( contador; contador < 8; contador++ )
1215  00d8 0c02          	inc	(OFST-17,sp)
1217  00da               L366:
1220  00da 7b02          	ld	a,(OFST-17,sp)
1221  00dc a108          	cp	a,#8
1222  00de 25c8          	jrult	L176
1223                     ; 103 	return temp;
1225  00e0 7b01          	ld	a,(OFST-18,sp)
1226  00e2 6b0b          	ld	(OFST-8,sp),a
1230                     ; 146 	sensor->Datos.Estado = dht11_MIDIENDO_H;
1232  00e4 1e0c          	ldw	x,(OFST-7,sp)
1233  00e6 a603          	ld	a,#3
1234  00e8 e709          	ld	(9,x),a
1235                     ; 69 	uint8_t contador = 0;
1238  00ea 0f02          	clr	(OFST-17,sp)
1240                     ; 70 	uint8_t temp = 0;
1242  00ec 0f01          	clr	(OFST-18,sp)
1244                     ; 71 	uint8_t bitLeido = 0;
1246                     ; 73 	for( contador; contador < 8; contador++ )
1249  00ee 2032          	jra	L517
1250  00f0               L327:
1251                     ; 75 		while( !NHALgpio_Read( gpio ) ) //Espera nuevo bit
1253  00f0 1e0c          	ldw	x,(OFST-7,sp)
1254  00f2 cd0000        	call	_NHALgpio_Read
1256  00f5 4d            	tnz	a
1257  00f6 27f8          	jreq	L327
1258                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1262  00f8 ae00d4        	ldw	x,#212
1264  00fb 9d            	nop	
1265  00fc               L25:
1266  00fc 5a            	decw	X
1267  00fd 26fd          	jrne	L25
1268  00ff 9d            	nop	
1269                     
1271                     ; 81 		bitLeido = 0;
1273                     ; 82 		if( NHALgpio_Read( gpio ) )
1275  0100 1e0c          	ldw	x,(OFST-7,sp)
1276  0102 cd0000        	call	_NHALgpio_Read
1278  0105 4d            	tnz	a
1279  0106 2702          	jreq	L727
1280                     ; 84 			bitLeido = 1;
1282  0108 a601          	ld	a,#1
1284  010a               L727:
1285                     ; 88 			bitLeido = 0;
1287  010a 6b03          	ld	(OFST-16,sp),a
1289                     ; 91 		temp |= bitLeido;
1291  010c 1a01          	or	a,(OFST-18,sp)
1292  010e 6b01          	ld	(OFST-18,sp),a
1294                     ; 92 		if( contador < 7 )
1296  0110 7b02          	ld	a,(OFST-17,sp)
1297  0112 a107          	cp	a,#7
1298  0114 2402          	jruge	L737
1299                     ; 94 			temp <<=  1;
1301  0116 0801          	sll	(OFST-18,sp)
1303  0118               L737:
1304                     ; 97 		while( NHALgpio_Read( gpio ) ) //Si el bit=1 espero a que baje señal
1306  0118 1e0c          	ldw	x,(OFST-7,sp)
1307  011a cd0000        	call	_NHALgpio_Read
1309  011d 4d            	tnz	a
1310  011e 26f8          	jrne	L737
1311                     ; 73 	for( contador; contador < 8; contador++ )
1313  0120 0c02          	inc	(OFST-17,sp)
1315  0122               L517:
1318  0122 7b02          	ld	a,(OFST-17,sp)
1319  0124 a108          	cp	a,#8
1320  0126 25c8          	jrult	L327
1321                     ; 103 	return temp;
1323  0128 7b01          	ld	a,(OFST-18,sp)
1324  012a 6b0a          	ld	(OFST-9,sp),a
1328                     ; 149 	sensor->Datos.Estado = dht11_MIDIENDO_T;
1330  012c 1e0c          	ldw	x,(OFST-7,sp)
1331  012e a604          	ld	a,#4
1332  0130 e709          	ld	(9,x),a
1333                     ; 69 	uint8_t contador = 0;
1336  0132 0f02          	clr	(OFST-17,sp)
1338                     ; 70 	uint8_t temp = 0;
1340  0134 0f01          	clr	(OFST-18,sp)
1342                     ; 71 	uint8_t bitLeido = 0;
1344                     ; 73 	for( contador; contador < 8; contador++ )
1347  0136 2032          	jra	L747
1348  0138               L557:
1349                     ; 75 		while( !NHALgpio_Read( gpio ) ) //Espera nuevo bit
1351  0138 1e0c          	ldw	x,(OFST-7,sp)
1352  013a cd0000        	call	_NHALgpio_Read
1354  013d 4d            	tnz	a
1355  013e 27f8          	jreq	L557
1356                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1360  0140 ae00d4        	ldw	x,#212
1362  0143 9d            	nop	
1363  0144               L26:
1364  0144 5a            	decw	X
1365  0145 26fd          	jrne	L26
1366  0147 9d            	nop	
1367                     
1369                     ; 81 		bitLeido = 0;
1371                     ; 82 		if( NHALgpio_Read( gpio ) )
1373  0148 1e0c          	ldw	x,(OFST-7,sp)
1374  014a cd0000        	call	_NHALgpio_Read
1376  014d 4d            	tnz	a
1377  014e 2702          	jreq	L167
1378                     ; 84 			bitLeido = 1;
1380  0150 a601          	ld	a,#1
1382  0152               L167:
1383                     ; 88 			bitLeido = 0;
1385  0152 6b03          	ld	(OFST-16,sp),a
1387                     ; 91 		temp |= bitLeido;
1389  0154 1a01          	or	a,(OFST-18,sp)
1390  0156 6b01          	ld	(OFST-18,sp),a
1392                     ; 92 		if( contador < 7 )
1394  0158 7b02          	ld	a,(OFST-17,sp)
1395  015a a107          	cp	a,#7
1396  015c 2402          	jruge	L177
1397                     ; 94 			temp <<=  1;
1399  015e 0801          	sll	(OFST-18,sp)
1401  0160               L177:
1402                     ; 97 		while( NHALgpio_Read( gpio ) ) //Si el bit=1 espero a que baje señal
1404  0160 1e0c          	ldw	x,(OFST-7,sp)
1405  0162 cd0000        	call	_NHALgpio_Read
1407  0165 4d            	tnz	a
1408  0166 26f8          	jrne	L177
1409                     ; 73 	for( contador; contador < 8; contador++ )
1411  0168 0c02          	inc	(OFST-17,sp)
1413  016a               L747:
1416  016a 7b02          	ld	a,(OFST-17,sp)
1417  016c a108          	cp	a,#8
1418  016e 25c8          	jrult	L557
1419                     ; 103 	return temp;
1421  0170 7b01          	ld	a,(OFST-18,sp)
1422  0172 6b09          	ld	(OFST-10,sp),a
1426                     ; 152 	sensor->Datos.Estado = dht11_MIDIENDO_T;
1428  0174 1e0c          	ldw	x,(OFST-7,sp)
1429  0176 a604          	ld	a,#4
1430  0178 e709          	ld	(9,x),a
1431                     ; 69 	uint8_t contador = 0;
1434  017a 0f02          	clr	(OFST-17,sp)
1436                     ; 70 	uint8_t temp = 0;
1438  017c 0f01          	clr	(OFST-18,sp)
1440                     ; 71 	uint8_t bitLeido = 0;
1442                     ; 73 	for( contador; contador < 8; contador++ )
1445  017e 2032          	jra	L1001
1446  0180               L7001:
1447                     ; 75 		while( !NHALgpio_Read( gpio ) ) //Espera nuevo bit
1449  0180 1e0c          	ldw	x,(OFST-7,sp)
1450  0182 cd0000        	call	_NHALgpio_Read
1452  0185 4d            	tnz	a
1453  0186 27f8          	jreq	L7001
1454                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1458  0188 ae00d4        	ldw	x,#212
1460  018b 9d            	nop	
1461  018c               L27:
1462  018c 5a            	decw	X
1463  018d 26fd          	jrne	L27
1464  018f 9d            	nop	
1465                     
1467                     ; 81 		bitLeido = 0;
1469                     ; 82 		if( NHALgpio_Read( gpio ) )
1471  0190 1e0c          	ldw	x,(OFST-7,sp)
1472  0192 cd0000        	call	_NHALgpio_Read
1474  0195 4d            	tnz	a
1475  0196 2702          	jreq	L3101
1476                     ; 84 			bitLeido = 1;
1478  0198 a601          	ld	a,#1
1480  019a               L3101:
1481                     ; 88 			bitLeido = 0;
1483  019a 6b03          	ld	(OFST-16,sp),a
1485                     ; 91 		temp |= bitLeido;
1487  019c 1a01          	or	a,(OFST-18,sp)
1488  019e 6b01          	ld	(OFST-18,sp),a
1490                     ; 92 		if( contador < 7 )
1492  01a0 7b02          	ld	a,(OFST-17,sp)
1493  01a2 a107          	cp	a,#7
1494  01a4 2402          	jruge	L3201
1495                     ; 94 			temp <<=  1;
1497  01a6 0801          	sll	(OFST-18,sp)
1499  01a8               L3201:
1500                     ; 97 		while( NHALgpio_Read( gpio ) ) //Si el bit=1 espero a que baje señal
1502  01a8 1e0c          	ldw	x,(OFST-7,sp)
1503  01aa cd0000        	call	_NHALgpio_Read
1505  01ad 4d            	tnz	a
1506  01ae 26f8          	jrne	L3201
1507                     ; 73 	for( contador; contador < 8; contador++ )
1509  01b0 0c02          	inc	(OFST-17,sp)
1511  01b2               L1001:
1514  01b2 7b02          	ld	a,(OFST-17,sp)
1515  01b4 a108          	cp	a,#8
1516  01b6 25c8          	jrult	L7001
1517                     ; 103 	return temp;
1519  01b8 7b01          	ld	a,(OFST-18,sp)
1520  01ba 6b08          	ld	(OFST-11,sp),a
1524                     ; 69 	uint8_t contador = 0;
1527  01bc 0f02          	clr	(OFST-17,sp)
1529                     ; 70 	uint8_t temp = 0;
1531  01be 0f01          	clr	(OFST-18,sp)
1533                     ; 71 	uint8_t bitLeido = 0;
1535                     ; 73 	for( contador; contador < 8; contador++ )
1538  01c0 2032          	jra	L3301
1539  01c2               L1401:
1540                     ; 75 		while( !NHALgpio_Read( gpio ) ) //Espera nuevo bit
1542  01c2 1e0c          	ldw	x,(OFST-7,sp)
1543  01c4 cd0000        	call	_NHALgpio_Read
1545  01c7 4d            	tnz	a
1546  01c8 27f8          	jreq	L1401
1547                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1551  01ca ae00d4        	ldw	x,#212
1553  01cd 9d            	nop	
1554  01ce               L201:
1555  01ce 5a            	decw	X
1556  01cf 26fd          	jrne	L201
1557  01d1 9d            	nop	
1558                     
1560                     ; 81 		bitLeido = 0;
1562                     ; 82 		if( NHALgpio_Read( gpio ) )
1564  01d2 1e0c          	ldw	x,(OFST-7,sp)
1565  01d4 cd0000        	call	_NHALgpio_Read
1567  01d7 4d            	tnz	a
1568  01d8 2702          	jreq	L5401
1569                     ; 84 			bitLeido = 1;
1571  01da a601          	ld	a,#1
1573  01dc               L5401:
1574                     ; 88 			bitLeido = 0;
1576  01dc 6b03          	ld	(OFST-16,sp),a
1578                     ; 91 		temp |= bitLeido;
1580  01de 1a01          	or	a,(OFST-18,sp)
1581  01e0 6b01          	ld	(OFST-18,sp),a
1583                     ; 92 		if( contador < 7 )
1585  01e2 7b02          	ld	a,(OFST-17,sp)
1586  01e4 a107          	cp	a,#7
1587  01e6 2402          	jruge	L5501
1588                     ; 94 			temp <<=  1;
1590  01e8 0801          	sll	(OFST-18,sp)
1592  01ea               L5501:
1593                     ; 97 		while( NHALgpio_Read( gpio ) ) //Si el bit=1 espero a que baje señal
1595  01ea 1e0c          	ldw	x,(OFST-7,sp)
1596  01ec cd0000        	call	_NHALgpio_Read
1598  01ef 4d            	tnz	a
1599  01f0 26f8          	jrne	L5501
1600                     ; 73 	for( contador; contador < 8; contador++ )
1602  01f2 0c02          	inc	(OFST-17,sp)
1604  01f4               L3301:
1607  01f4 7b02          	ld	a,(OFST-17,sp)
1608  01f6 a108          	cp	a,#8
1609  01f8 25c8          	jrult	L1401
1610                     ; 103 	return temp;
1612  01fa 7b01          	ld	a,(OFST-18,sp)
1613  01fc 6b07          	ld	(OFST-12,sp),a
1617                     ; 157 	checkCRC = semilla.H_Entero + semilla.H_Decimal + semilla.T_Entero + semilla.T_Decimal;
1619  01fe 5f            	clrw	x
1620  01ff 7b0b          	ld	a,(OFST-8,sp)
1621  0201 1b0a          	add	a,(OFST-9,sp)
1622  0203 59            	rlcw	x
1623  0204 1b09          	add	a,(OFST-10,sp)
1624  0206 2401          	jrnc	L211
1625  0208 5c            	incw	x
1626  0209               L211:
1627  0209 1b08          	add	a,(OFST-11,sp)
1628  020b 2401          	jrnc	L411
1629  020d 5c            	incw	x
1630  020e               L411:
1631  020e 02            	rlwa	x,a
1632  020f 1f05          	ldw	(OFST-14,sp),x
1634                     ; 158 	checkCRC &= mask;
1636  0211 5f            	clrw	x
1637  0212 7b04          	ld	a,(OFST-15,sp)
1638  0214 97            	ld	xl,a
1639  0215 01            	rrwa	x,a
1640  0216 1406          	and	a,(OFST-13,sp)
1641  0218 01            	rrwa	x,a
1642  0219 1405          	and	a,(OFST-14,sp)
1643  021b 01            	rrwa	x,a
1644  021c 1f05          	ldw	(OFST-14,sp),x
1646                     ; 160 	if( checkCRC == semilla.CRC )
1648  021e 5f            	clrw	x
1649  021f 7b07          	ld	a,(OFST-12,sp)
1650  0221 97            	ld	xl,a
1651  0222 bf00          	ldw	c_x,x
1652  0224 1e05          	ldw	x,(OFST-14,sp)
1653  0226 b300          	cpw	x,c_x
1654  0228 2606          	jrne	L1601
1655                     ; 162 		sensor->Datos.Estado = dht11_LECTURA_OK;
1657  022a 1e0c          	ldw	x,(OFST-7,sp)
1658  022c a60b          	ld	a,#11
1659                     ; 163 		return semilla;
1662  022e 2004          	jra	L334
1663  0230               L1601:
1664                     ; 167 		sensor->Datos.Estado = dht11_FALLO_AL_LEER;
1666  0230 1e0c          	ldw	x,(OFST-7,sp)
1667  0232 a609          	ld	a,#9
1668                     ; 168 		return semilla;
1672  0234               L334:
1673  0234 e709          	ld	(9,x),a
1675  0236 96            	ldw	x,sp
1676  0237 1c000f        	addw	x,#OFST-4
1677  023a 9096          	ldw	y,sp
1678  023c 72a90007      	addw	y,#OFST-12
1679  0240 a605          	ld	a,#5
1680  0242 cd0000        	call	c_xymov
1682                     ; 280 		dht11_CerrarConexion( dht11 );
1685  0245 1e18          	ldw	x,(OFST+5,sp)
1686  0247 1f0c          	ldw	(OFST-7,sp),x
1688                     ; 174 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
1690  0249 4bc0          	push	#192
1691  024b 1e0d          	ldw	x,(OFST-6,sp)
1692  024d cd0000        	call	_NHALgpioConfig_SetType
1694  0250 84            	pop	a
1695                     ; 175 	NHALgpio_Init( &sensor->Config.HW );
1697  0251 1e0c          	ldw	x,(OFST-7,sp)
1698  0253 cd0000        	call	_NHALgpio_Init
1700                     ; 177 	NHALgpio_Write( &sensor->Config.HW, true );
1702  0256 4b01          	push	#1
1703  0258 1e0d          	ldw	x,(OFST-6,sp)
1704  025a cd0000        	call	_NHALgpio_Write
1706  025d 84            	pop	a
1707                     ; 179 	if( sensor->Datos.Estado == dht11_CERRANDO_CONEXION )
1709  025e 1e0c          	ldw	x,(OFST-7,sp)
1710  0260 e609          	ld	a,(9,x)
1711  0262 a105          	cp	a,#5
1712  0264 262b          	jrne	L734
1713                     ; 181 		sensor->Datos.Estado = dht11_SLEEP;
1714                     ; 282 		return lectura;
1717  0266 2025          	jp	LC001
1718  0268               L136:
1719                     ; 286 		dht11->Datos.Estado = dht11_FALLO_AL_COMUNICAR;
1721  0268 1e18          	ldw	x,(OFST+5,sp)
1722  026a a60a          	ld	a,#10
1723  026c e709          	ld	(9,x),a
1724                     ; 287 		dht11_CerrarConexion( dht11 );
1727  026e 1f0c          	ldw	(OFST-7,sp),x
1729                     ; 174 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
1731  0270 4bc0          	push	#192
1732  0272 1e0d          	ldw	x,(OFST-6,sp)
1733  0274 cd0000        	call	_NHALgpioConfig_SetType
1735  0277 84            	pop	a
1736                     ; 175 	NHALgpio_Init( &sensor->Config.HW );
1738  0278 1e0c          	ldw	x,(OFST-7,sp)
1739  027a cd0000        	call	_NHALgpio_Init
1741                     ; 177 	NHALgpio_Write( &sensor->Config.HW, true );
1743  027d 4b01          	push	#1
1744  027f 1e0d          	ldw	x,(OFST-6,sp)
1745  0281 cd0000        	call	_NHALgpio_Write
1747  0284 84            	pop	a
1748                     ; 179 	if( sensor->Datos.Estado == dht11_CERRANDO_CONEXION )
1750  0285 1e0c          	ldw	x,(OFST-7,sp)
1751  0287 e609          	ld	a,(9,x)
1752  0289 a105          	cp	a,#5
1753  028b 2604          	jrne	L734
1754                     ; 181 		sensor->Datos.Estado = dht11_SLEEP;
1756  028d               LC001:
1758  028d a606          	ld	a,#6
1759  028f e709          	ld	(9,x),a
1760  0291               L734:
1761                     ; 289 		return lectura;
1766  0291 1e16          	ldw	x,(OFST+3,sp)
1767  0293 9096          	ldw	y,sp
1768  0295 72a9000f      	addw	y,#OFST-4
1769  0299 a605          	ld	a,#5
1770  029b cd0000        	call	c_xymov
1772  029e 5b13          	addw	sp,#19
1773  02a0 81            	ret	
1786                     	xdef	_dht11_Lectura
1787                     	xdef	_DHT11_Init
1788                     	xref	_NHALgpio_Write
1789                     	xref	_NHALgpio_Read
1790                     	xref	_NHALgpio_Init
1791                     	xref	_NHALgpioConfig_SetType
1792                     	xref.b	c_x
1811                     	xref	c_xymov
1812                     	end

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
 570                     ; 122 void DHT11_Init( DHT11_t_ptr dht11 )
 570                     ; 123 {
 572                     .text:	section	.text,new
 573  0000               _DHT11_Init:
 575  0000 89            	pushw	x
 576       00000000      OFST:	set	0
 579                     ; 124 	dht11->Lectura = &dht11_Lectura;
 581  0001 90ae0000      	ldw	y,#_dht11_Lectura
 582  0005 ef0a          	ldw	(10,x),y
 583                     ; 126 	dht11->Datos.UltimaLectura.CRC = 0;
 585  0007 6f04          	clr	(4,x)
 586                     ; 127 	dht11->Datos.UltimaLectura.T_Decimal = 0;
 588  0009 6f05          	clr	(5,x)
 589                     ; 128 	dht11->Datos.UltimaLectura.T_Entero = 0;
 591  000b 6f06          	clr	(6,x)
 592                     ; 129 	dht11->Datos.UltimaLectura.H_Decimal = 0;
 594  000d 6f07          	clr	(7,x)
 595                     ; 130 	dht11->Datos.UltimaLectura.H_Entero = 0;
 597  000f 6f08          	clr	(8,x)
 598                     ; 132 	NHALgpioConfig_SetType( &dht11->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
 600  0011 4bc0          	push	#192
 601  0013 cd0000        	call	_NHALgpioConfig_SetType
 603  0016 84            	pop	a
 604                     ; 133 	NHALgpio_Init( &dht11->Config.HW );
 606  0017 1e01          	ldw	x,(OFST+1,sp)
 607  0019 cd0000        	call	_NHALgpio_Init
 609                     ; 135 	NHALgpio_Write( &dht11->Config.HW, true );
 611  001c 4b01          	push	#1
 612  001e 1e02          	ldw	x,(OFST+2,sp)
 613  0020 cd0000        	call	_NHALgpio_Write
 615  0023 84            	pop	a
 616                     ; 137 	dht11->Datos.Estado = dht11_INICIALIZADO;
 618  0024 1e01          	ldw	x,(OFST+1,sp)
 619  0026 6f09          	clr	(9,x)
 620                     ; 139 }
 623  0028 85            	popw	x
 624  0029 81            	ret	
 627                     	switch	.const
 628  0005               L133_lectura:
 629  0005 00            	dc.b	0
 630  0006 00            	dc.b	0
 631  0007 00            	dc.b	0
 632  0008 00            	dc.b	0
 633  0009 00            	dc.b	0
 634  000a               L743_semilla:
 635  000a 00            	dc.b	0
 636  000b 00            	dc.b	0
 637  000c 00            	dc.b	0
 638  000d 00            	dc.b	0
 639  000e 00            	dc.b	0
 923                     ; 141 DHT11_SI_t dht11_Lectura( DHT11_t_ptr dht11 )
 923                     ; 142 {
 924                     .text:	section	.text,new
 925  0000               _dht11_Lectura:
 927  0000 5213          	subw	sp,#19
 928       00000013      OFST:	set	19
 931                     ; 143 	DHT11_SI_t lectura = { 0, 0, 0, 0, 0 };
 933  0002 96            	ldw	x,sp
 934  0003 1c000f        	addw	x,#OFST-4
 935  0006 90ae0005      	ldw	y,#L133_lectura
 936  000a a605          	ld	a,#5
 937  000c cd0000        	call	c_xymov
 939                     ; 145 	if( dht11_ComenzarTransmision( dht11 ) )
 942  000f 1e18          	ldw	x,(OFST+5,sp)
 943  0011 1f0c          	ldw	(OFST-7,sp),x
 945                     ; 44 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
 947  0013 4bc0          	push	#192
 948  0015 1e0d          	ldw	x,(OFST-6,sp)
 949  0017 cd0000        	call	_NHALgpioConfig_SetType
 951  001a 84            	pop	a
 952                     ; 45 	NHALgpio_Init( &sensor->Config.HW ); 
 954  001b 1e0c          	ldw	x,(OFST-7,sp)
 955  001d cd0000        	call	_NHALgpio_Init
 957                     ; 47 	NHALgpio_Write( &sensor->Config.HW, false );
 959  0020 4b00          	push	#0
 960  0022 1e0d          	ldw	x,(OFST-6,sp)
 961  0024 cd0000        	call	_NHALgpio_Write
 963  0027 84            	pop	a
 964                     ; 49 	sensor->Datos.Estado = dht11_COMUNICANDO;
 966  0028 1e0c          	ldw	x,(OFST-7,sp)
 967  002a a601          	ld	a,#1
 968  002c e709          	ld	(9,x),a
 972  002e ae0012        	ldw	x,#18
 975  0031 200a          	jra	L316
 976  0033               L706:
 977                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 981  0033 ae14d4        	ldw	x,#5332
 983  0036 9d            	nop	
 984  0037               L42:
 985  0037 5a            	decw	X
 986  0038 26fd          	jrne	L42
 987  003a 9d            	nop	
 988                     
 990  003b 1e0a          	ldw	x,(OFST-9,sp)
 991  003d               L316:
 992                     ; 39 	while ( __ms-- )
 994  003d 5a            	decw	x
 995  003e 1f0a          	ldw	(OFST-9,sp),x
 996  0040 5c            	incw	x
 998  0041 26f0          	jrne	L706
 999                     ; 52 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_IN_PU_NO_IT); //Configuro como entrada para leer
1001  0043 4b40          	push	#64
1002  0045 1e0d          	ldw	x,(OFST-6,sp)
1003  0047 cd0000        	call	_NHALgpioConfig_SetType
1005  004a 84            	pop	a
1006                     ; 53 	NHALgpio_Init( &sensor->Config.HW ); 
1008  004b 1e0c          	ldw	x,(OFST-7,sp)
1009  004d cd0000        	call	_NHALgpio_Init
1011                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1015  0050 ae00d4        	ldw	x,#212
1017  0053 9d            	nop	
1018  0054               L23:
1019  0054 5a            	decw	X
1020  0055 26fd          	jrne	L23
1021  0057 9d            	nop	
1022                     
1024  0058 2006          	jra	L126
1025  005a               L716:
1026                     ; 58 		sensor->Datos.Estado = dht11_ESPERA_BAJO;
1028  005a 1e0c          	ldw	x,(OFST-7,sp)
1029  005c a607          	ld	a,#7
1030  005e e709          	ld	(9,x),a
1031  0060               L126:
1032                     ; 56 	while( !NHALgpio_Read( &sensor->Config.HW ) )
1034  0060 1e0c          	ldw	x,(OFST-7,sp)
1035  0062 cd0000        	call	_NHALgpio_Read
1037  0065 4d            	tnz	a
1038  0066 27f2          	jreq	L716
1040  0068 2006          	jra	L726
1041  006a               L526:
1042                     ; 64 		sensor->Datos.Estado = dht11_ESPERA_ALTO;
1044  006a 1e0c          	ldw	x,(OFST-7,sp)
1045  006c a608          	ld	a,#8
1046  006e e709          	ld	(9,x),a
1047  0070               L726:
1048                     ; 62 	while( NHALgpio_Read( &sensor->Config.HW ) )
1050  0070 1e0c          	ldw	x,(OFST-7,sp)
1051  0072 cd0000        	call	_NHALgpio_Read
1053  0075 4d            	tnz	a
1054  0076 26f2          	jrne	L526
1055                     ; 68 	sensor->Datos.Estado = dht11_CONEXION_OK;
1057  0078 1e0c          	ldw	x,(OFST-7,sp)
1058  007a a602          	ld	a,#2
1059  007c e709          	ld	(9,x),a
1060                     ; 69 	return true;
1062  007e a601          	ld	a,#1
1063  0080 6b0e          	ld	(OFST-5,sp),a
1067  0082 2603cc0268    	jreq	L506
1068                     ; 147 		lectura = dht11_LeerDatos( dht11 );
1071  0087 1e18          	ldw	x,(OFST+5,sp)
1072  0089 1f0c          	ldw	(OFST-7,sp),x
1074                     ; 74 	uint16_t checkCRC = 0;
1076                     ; 75 	uint8_t mask = 0b11111111;
1078  008b a6ff          	ld	a,#255
1079  008d 6b04          	ld	(OFST-15,sp),a
1081                     ; 77 	DHT11_SI_t semilla = { 0, 0, 0, 0, 0 };
1083  008f 96            	ldw	x,sp
1084  0090 1c0007        	addw	x,#OFST-12
1085  0093 90ae000a      	ldw	y,#L743_semilla
1086  0097 a605          	ld	a,#5
1087  0099 cd0000        	call	c_xymov
1089                     ; 79 	sensor->Datos.Estado = dht11_MIDIENDO_H;
1091  009c 1e0c          	ldw	x,(OFST-7,sp)
1092  009e a603          	ld	a,#3
1093  00a0 e709          	ld	(9,x),a
1094                     ; 5 	uint8_t contador = 0;
1097  00a2 0f02          	clr	(OFST-17,sp)
1099                     ; 6 	uint8_t temp = 0;
1101  00a4 0f01          	clr	(OFST-18,sp)
1103                     ; 7 	uint8_t bitLeido = 0;
1105                     ; 9 	for( contador; contador < 8; contador++ )
1108  00a6 2032          	jra	L736
1109  00a8               L546:
1110                     ; 11 		while( !NHALgpio_Read( gpio ) ) //Espera nuevo bit
1112  00a8 1e0c          	ldw	x,(OFST-7,sp)
1113  00aa cd0000        	call	_NHALgpio_Read
1115  00ad 4d            	tnz	a
1116  00ae 27f8          	jreq	L546
1117                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1121  00b0 ae00d4        	ldw	x,#212
1123  00b3 9d            	nop	
1124  00b4               L24:
1125  00b4 5a            	decw	X
1126  00b5 26fd          	jrne	L24
1127  00b7 9d            	nop	
1128                     
1130                     ; 17 		bitLeido = 0;
1132                     ; 18 		if( NHALgpio_Read( gpio ) )
1134  00b8 1e0c          	ldw	x,(OFST-7,sp)
1135  00ba cd0000        	call	_NHALgpio_Read
1137  00bd 4d            	tnz	a
1138  00be 2702          	jreq	L156
1139                     ; 20 			bitLeido = 1;
1141  00c0 a601          	ld	a,#1
1143  00c2               L156:
1144                     ; 24 			bitLeido = 0;
1146  00c2 6b03          	ld	(OFST-16,sp),a
1148                     ; 27 		temp |= bitLeido;
1150  00c4 1a01          	or	a,(OFST-18,sp)
1151  00c6 6b01          	ld	(OFST-18,sp),a
1153                     ; 28 		if( contador < 7 )
1155  00c8 7b02          	ld	a,(OFST-17,sp)
1156  00ca a107          	cp	a,#7
1157  00cc 2402          	jruge	L166
1158                     ; 30 			temp <<=  1;
1160  00ce 0801          	sll	(OFST-18,sp)
1162  00d0               L166:
1163                     ; 33 		while( NHALgpio_Read( gpio ) ) //Si el bit=1 espero a que baje señal
1165  00d0 1e0c          	ldw	x,(OFST-7,sp)
1166  00d2 cd0000        	call	_NHALgpio_Read
1168  00d5 4d            	tnz	a
1169  00d6 26f8          	jrne	L166
1170                     ; 9 	for( contador; contador < 8; contador++ )
1172  00d8 0c02          	inc	(OFST-17,sp)
1174  00da               L736:
1177  00da 7b02          	ld	a,(OFST-17,sp)
1178  00dc a108          	cp	a,#8
1179  00de 25c8          	jrult	L546
1180                     ; 39 	return temp;
1182  00e0 7b01          	ld	a,(OFST-18,sp)
1183  00e2 6b0b          	ld	(OFST-8,sp),a
1187                     ; 82 	sensor->Datos.Estado = dht11_MIDIENDO_H;
1189  00e4 1e0c          	ldw	x,(OFST-7,sp)
1190  00e6 a603          	ld	a,#3
1191  00e8 e709          	ld	(9,x),a
1192                     ; 5 	uint8_t contador = 0;
1195  00ea 0f02          	clr	(OFST-17,sp)
1197                     ; 6 	uint8_t temp = 0;
1199  00ec 0f01          	clr	(OFST-18,sp)
1201                     ; 7 	uint8_t bitLeido = 0;
1203                     ; 9 	for( contador; contador < 8; contador++ )
1206  00ee 2032          	jra	L176
1207  00f0               L776:
1208                     ; 11 		while( !NHALgpio_Read( gpio ) ) //Espera nuevo bit
1210  00f0 1e0c          	ldw	x,(OFST-7,sp)
1211  00f2 cd0000        	call	_NHALgpio_Read
1213  00f5 4d            	tnz	a
1214  00f6 27f8          	jreq	L776
1215                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1219  00f8 ae00d4        	ldw	x,#212
1221  00fb 9d            	nop	
1222  00fc               L25:
1223  00fc 5a            	decw	X
1224  00fd 26fd          	jrne	L25
1225  00ff 9d            	nop	
1226                     
1228                     ; 17 		bitLeido = 0;
1230                     ; 18 		if( NHALgpio_Read( gpio ) )
1232  0100 1e0c          	ldw	x,(OFST-7,sp)
1233  0102 cd0000        	call	_NHALgpio_Read
1235  0105 4d            	tnz	a
1236  0106 2702          	jreq	L307
1237                     ; 20 			bitLeido = 1;
1239  0108 a601          	ld	a,#1
1241  010a               L307:
1242                     ; 24 			bitLeido = 0;
1244  010a 6b03          	ld	(OFST-16,sp),a
1246                     ; 27 		temp |= bitLeido;
1248  010c 1a01          	or	a,(OFST-18,sp)
1249  010e 6b01          	ld	(OFST-18,sp),a
1251                     ; 28 		if( contador < 7 )
1253  0110 7b02          	ld	a,(OFST-17,sp)
1254  0112 a107          	cp	a,#7
1255  0114 2402          	jruge	L317
1256                     ; 30 			temp <<=  1;
1258  0116 0801          	sll	(OFST-18,sp)
1260  0118               L317:
1261                     ; 33 		while( NHALgpio_Read( gpio ) ) //Si el bit=1 espero a que baje señal
1263  0118 1e0c          	ldw	x,(OFST-7,sp)
1264  011a cd0000        	call	_NHALgpio_Read
1266  011d 4d            	tnz	a
1267  011e 26f8          	jrne	L317
1268                     ; 9 	for( contador; contador < 8; contador++ )
1270  0120 0c02          	inc	(OFST-17,sp)
1272  0122               L176:
1275  0122 7b02          	ld	a,(OFST-17,sp)
1276  0124 a108          	cp	a,#8
1277  0126 25c8          	jrult	L776
1278                     ; 39 	return temp;
1280  0128 7b01          	ld	a,(OFST-18,sp)
1281  012a 6b0a          	ld	(OFST-9,sp),a
1285                     ; 85 	sensor->Datos.Estado = dht11_MIDIENDO_T;
1287  012c 1e0c          	ldw	x,(OFST-7,sp)
1288  012e a604          	ld	a,#4
1289  0130 e709          	ld	(9,x),a
1290                     ; 5 	uint8_t contador = 0;
1293  0132 0f02          	clr	(OFST-17,sp)
1295                     ; 6 	uint8_t temp = 0;
1297  0134 0f01          	clr	(OFST-18,sp)
1299                     ; 7 	uint8_t bitLeido = 0;
1301                     ; 9 	for( contador; contador < 8; contador++ )
1304  0136 2032          	jra	L327
1305  0138               L137:
1306                     ; 11 		while( !NHALgpio_Read( gpio ) ) //Espera nuevo bit
1308  0138 1e0c          	ldw	x,(OFST-7,sp)
1309  013a cd0000        	call	_NHALgpio_Read
1311  013d 4d            	tnz	a
1312  013e 27f8          	jreq	L137
1313                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1317  0140 ae00d4        	ldw	x,#212
1319  0143 9d            	nop	
1320  0144               L26:
1321  0144 5a            	decw	X
1322  0145 26fd          	jrne	L26
1323  0147 9d            	nop	
1324                     
1326                     ; 17 		bitLeido = 0;
1328                     ; 18 		if( NHALgpio_Read( gpio ) )
1330  0148 1e0c          	ldw	x,(OFST-7,sp)
1331  014a cd0000        	call	_NHALgpio_Read
1333  014d 4d            	tnz	a
1334  014e 2702          	jreq	L537
1335                     ; 20 			bitLeido = 1;
1337  0150 a601          	ld	a,#1
1339  0152               L537:
1340                     ; 24 			bitLeido = 0;
1342  0152 6b03          	ld	(OFST-16,sp),a
1344                     ; 27 		temp |= bitLeido;
1346  0154 1a01          	or	a,(OFST-18,sp)
1347  0156 6b01          	ld	(OFST-18,sp),a
1349                     ; 28 		if( contador < 7 )
1351  0158 7b02          	ld	a,(OFST-17,sp)
1352  015a a107          	cp	a,#7
1353  015c 2402          	jruge	L547
1354                     ; 30 			temp <<=  1;
1356  015e 0801          	sll	(OFST-18,sp)
1358  0160               L547:
1359                     ; 33 		while( NHALgpio_Read( gpio ) ) //Si el bit=1 espero a que baje señal
1361  0160 1e0c          	ldw	x,(OFST-7,sp)
1362  0162 cd0000        	call	_NHALgpio_Read
1364  0165 4d            	tnz	a
1365  0166 26f8          	jrne	L547
1366                     ; 9 	for( contador; contador < 8; contador++ )
1368  0168 0c02          	inc	(OFST-17,sp)
1370  016a               L327:
1373  016a 7b02          	ld	a,(OFST-17,sp)
1374  016c a108          	cp	a,#8
1375  016e 25c8          	jrult	L137
1376                     ; 39 	return temp;
1378  0170 7b01          	ld	a,(OFST-18,sp)
1379  0172 6b09          	ld	(OFST-10,sp),a
1383                     ; 88 	sensor->Datos.Estado = dht11_MIDIENDO_T;
1385  0174 1e0c          	ldw	x,(OFST-7,sp)
1386  0176 a604          	ld	a,#4
1387  0178 e709          	ld	(9,x),a
1388                     ; 5 	uint8_t contador = 0;
1391  017a 0f02          	clr	(OFST-17,sp)
1393                     ; 6 	uint8_t temp = 0;
1395  017c 0f01          	clr	(OFST-18,sp)
1397                     ; 7 	uint8_t bitLeido = 0;
1399                     ; 9 	for( contador; contador < 8; contador++ )
1402  017e 2032          	jra	L557
1403  0180               L367:
1404                     ; 11 		while( !NHALgpio_Read( gpio ) ) //Espera nuevo bit
1406  0180 1e0c          	ldw	x,(OFST-7,sp)
1407  0182 cd0000        	call	_NHALgpio_Read
1409  0185 4d            	tnz	a
1410  0186 27f8          	jreq	L367
1411                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1415  0188 ae00d4        	ldw	x,#212
1417  018b 9d            	nop	
1418  018c               L27:
1419  018c 5a            	decw	X
1420  018d 26fd          	jrne	L27
1421  018f 9d            	nop	
1422                     
1424                     ; 17 		bitLeido = 0;
1426                     ; 18 		if( NHALgpio_Read( gpio ) )
1428  0190 1e0c          	ldw	x,(OFST-7,sp)
1429  0192 cd0000        	call	_NHALgpio_Read
1431  0195 4d            	tnz	a
1432  0196 2702          	jreq	L767
1433                     ; 20 			bitLeido = 1;
1435  0198 a601          	ld	a,#1
1437  019a               L767:
1438                     ; 24 			bitLeido = 0;
1440  019a 6b03          	ld	(OFST-16,sp),a
1442                     ; 27 		temp |= bitLeido;
1444  019c 1a01          	or	a,(OFST-18,sp)
1445  019e 6b01          	ld	(OFST-18,sp),a
1447                     ; 28 		if( contador < 7 )
1449  01a0 7b02          	ld	a,(OFST-17,sp)
1450  01a2 a107          	cp	a,#7
1451  01a4 2402          	jruge	L777
1452                     ; 30 			temp <<=  1;
1454  01a6 0801          	sll	(OFST-18,sp)
1456  01a8               L777:
1457                     ; 33 		while( NHALgpio_Read( gpio ) ) //Si el bit=1 espero a que baje señal
1459  01a8 1e0c          	ldw	x,(OFST-7,sp)
1460  01aa cd0000        	call	_NHALgpio_Read
1462  01ad 4d            	tnz	a
1463  01ae 26f8          	jrne	L777
1464                     ; 9 	for( contador; contador < 8; contador++ )
1466  01b0 0c02          	inc	(OFST-17,sp)
1468  01b2               L557:
1471  01b2 7b02          	ld	a,(OFST-17,sp)
1472  01b4 a108          	cp	a,#8
1473  01b6 25c8          	jrult	L367
1474                     ; 39 	return temp;
1476  01b8 7b01          	ld	a,(OFST-18,sp)
1477  01ba 6b08          	ld	(OFST-11,sp),a
1481                     ; 5 	uint8_t contador = 0;
1484  01bc 0f02          	clr	(OFST-17,sp)
1486                     ; 6 	uint8_t temp = 0;
1488  01be 0f01          	clr	(OFST-18,sp)
1490                     ; 7 	uint8_t bitLeido = 0;
1492                     ; 9 	for( contador; contador < 8; contador++ )
1495  01c0 2032          	jra	L7001
1496  01c2               L5101:
1497                     ; 11 		while( !NHALgpio_Read( gpio ) ) //Espera nuevo bit
1499  01c2 1e0c          	ldw	x,(OFST-7,sp)
1500  01c4 cd0000        	call	_NHALgpio_Read
1502  01c7 4d            	tnz	a
1503  01c8 27f8          	jreq	L5101
1504                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1508  01ca ae00d4        	ldw	x,#212
1510  01cd 9d            	nop	
1511  01ce               L201:
1512  01ce 5a            	decw	X
1513  01cf 26fd          	jrne	L201
1514  01d1 9d            	nop	
1515                     
1517                     ; 17 		bitLeido = 0;
1519                     ; 18 		if( NHALgpio_Read( gpio ) )
1521  01d2 1e0c          	ldw	x,(OFST-7,sp)
1522  01d4 cd0000        	call	_NHALgpio_Read
1524  01d7 4d            	tnz	a
1525  01d8 2702          	jreq	L1201
1526                     ; 20 			bitLeido = 1;
1528  01da a601          	ld	a,#1
1530  01dc               L1201:
1531                     ; 24 			bitLeido = 0;
1533  01dc 6b03          	ld	(OFST-16,sp),a
1535                     ; 27 		temp |= bitLeido;
1537  01de 1a01          	or	a,(OFST-18,sp)
1538  01e0 6b01          	ld	(OFST-18,sp),a
1540                     ; 28 		if( contador < 7 )
1542  01e2 7b02          	ld	a,(OFST-17,sp)
1543  01e4 a107          	cp	a,#7
1544  01e6 2402          	jruge	L1301
1545                     ; 30 			temp <<=  1;
1547  01e8 0801          	sll	(OFST-18,sp)
1549  01ea               L1301:
1550                     ; 33 		while( NHALgpio_Read( gpio ) ) //Si el bit=1 espero a que baje señal
1552  01ea 1e0c          	ldw	x,(OFST-7,sp)
1553  01ec cd0000        	call	_NHALgpio_Read
1555  01ef 4d            	tnz	a
1556  01f0 26f8          	jrne	L1301
1557                     ; 9 	for( contador; contador < 8; contador++ )
1559  01f2 0c02          	inc	(OFST-17,sp)
1561  01f4               L7001:
1564  01f4 7b02          	ld	a,(OFST-17,sp)
1565  01f6 a108          	cp	a,#8
1566  01f8 25c8          	jrult	L5101
1567                     ; 39 	return temp;
1569  01fa 7b01          	ld	a,(OFST-18,sp)
1570  01fc 6b07          	ld	(OFST-12,sp),a
1574                     ; 93 	checkCRC = semilla.H_Entero + semilla.H_Decimal + semilla.T_Entero + semilla.T_Decimal;
1576  01fe 5f            	clrw	x
1577  01ff 7b0b          	ld	a,(OFST-8,sp)
1578  0201 1b0a          	add	a,(OFST-9,sp)
1579  0203 59            	rlcw	x
1580  0204 1b09          	add	a,(OFST-10,sp)
1581  0206 2401          	jrnc	L211
1582  0208 5c            	incw	x
1583  0209               L211:
1584  0209 1b08          	add	a,(OFST-11,sp)
1585  020b 2401          	jrnc	L411
1586  020d 5c            	incw	x
1587  020e               L411:
1588  020e 02            	rlwa	x,a
1589  020f 1f05          	ldw	(OFST-14,sp),x
1591                     ; 94 	checkCRC &= mask;
1593  0211 5f            	clrw	x
1594  0212 7b04          	ld	a,(OFST-15,sp)
1595  0214 97            	ld	xl,a
1596  0215 01            	rrwa	x,a
1597  0216 1406          	and	a,(OFST-13,sp)
1598  0218 01            	rrwa	x,a
1599  0219 1405          	and	a,(OFST-14,sp)
1600  021b 01            	rrwa	x,a
1601  021c 1f05          	ldw	(OFST-14,sp),x
1603                     ; 96 	if( checkCRC == semilla.CRC )
1605  021e 5f            	clrw	x
1606  021f 7b07          	ld	a,(OFST-12,sp)
1607  0221 97            	ld	xl,a
1608  0222 bf00          	ldw	c_x,x
1609  0224 1e05          	ldw	x,(OFST-14,sp)
1610  0226 b300          	cpw	x,c_x
1611  0228 2606          	jrne	L5301
1612                     ; 98 		sensor->Datos.Estado = dht11_LECTURA_OK;
1614  022a 1e0c          	ldw	x,(OFST-7,sp)
1615  022c a60b          	ld	a,#11
1616                     ; 99 		return semilla;
1619  022e 2004          	jra	L704
1620  0230               L5301:
1621                     ; 103 		sensor->Datos.Estado = dht11_FALLO_AL_LEER;
1623  0230 1e0c          	ldw	x,(OFST-7,sp)
1624  0232 a609          	ld	a,#9
1625                     ; 104 		return semilla;
1629  0234               L704:
1630  0234 e709          	ld	(9,x),a
1632  0236 96            	ldw	x,sp
1633  0237 1c000f        	addw	x,#OFST-4
1634  023a 9096          	ldw	y,sp
1635  023c 72a90007      	addw	y,#OFST-12
1636  0240 a605          	ld	a,#5
1637  0242 cd0000        	call	c_xymov
1639                     ; 148 		dht11_CerrarConexion( dht11 );
1642  0245 1e18          	ldw	x,(OFST+5,sp)
1643  0247 1f0c          	ldw	(OFST-7,sp),x
1645                     ; 110 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
1647  0249 4bc0          	push	#192
1648  024b 1e0d          	ldw	x,(OFST-6,sp)
1649  024d cd0000        	call	_NHALgpioConfig_SetType
1651  0250 84            	pop	a
1652                     ; 111 	NHALgpio_Init( &sensor->Config.HW );
1654  0251 1e0c          	ldw	x,(OFST-7,sp)
1655  0253 cd0000        	call	_NHALgpio_Init
1657                     ; 113 	NHALgpio_Write( &sensor->Config.HW, true );
1659  0256 4b01          	push	#1
1660  0258 1e0d          	ldw	x,(OFST-6,sp)
1661  025a cd0000        	call	_NHALgpio_Write
1663  025d 84            	pop	a
1664                     ; 115 	if( sensor->Datos.Estado == dht11_CERRANDO_CONEXION )
1666  025e 1e0c          	ldw	x,(OFST-7,sp)
1667  0260 e609          	ld	a,(9,x)
1668  0262 a105          	cp	a,#5
1669  0264 262b          	jrne	L314
1670                     ; 117 		sensor->Datos.Estado = dht11_SLEEP;
1671                     ; 150 		return lectura;
1674  0266 2025          	jp	LC001
1675  0268               L506:
1676                     ; 154 		dht11->Datos.Estado = dht11_FALLO_AL_COMUNICAR;
1678  0268 1e18          	ldw	x,(OFST+5,sp)
1679  026a a60a          	ld	a,#10
1680  026c e709          	ld	(9,x),a
1681                     ; 155 		dht11_CerrarConexion( dht11 );
1684  026e 1f0c          	ldw	(OFST-7,sp),x
1686                     ; 110 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
1688  0270 4bc0          	push	#192
1689  0272 1e0d          	ldw	x,(OFST-6,sp)
1690  0274 cd0000        	call	_NHALgpioConfig_SetType
1692  0277 84            	pop	a
1693                     ; 111 	NHALgpio_Init( &sensor->Config.HW );
1695  0278 1e0c          	ldw	x,(OFST-7,sp)
1696  027a cd0000        	call	_NHALgpio_Init
1698                     ; 113 	NHALgpio_Write( &sensor->Config.HW, true );
1700  027d 4b01          	push	#1
1701  027f 1e0d          	ldw	x,(OFST-6,sp)
1702  0281 cd0000        	call	_NHALgpio_Write
1704  0284 84            	pop	a
1705                     ; 115 	if( sensor->Datos.Estado == dht11_CERRANDO_CONEXION )
1707  0285 1e0c          	ldw	x,(OFST-7,sp)
1708  0287 e609          	ld	a,(9,x)
1709  0289 a105          	cp	a,#5
1710  028b 2604          	jrne	L314
1711                     ; 117 		sensor->Datos.Estado = dht11_SLEEP;
1713  028d               LC001:
1715  028d a606          	ld	a,#6
1716  028f e709          	ld	(9,x),a
1717  0291               L314:
1718                     ; 157 		return lectura;
1723  0291 1e16          	ldw	x,(OFST+3,sp)
1724  0293 9096          	ldw	y,sp
1725  0295 72a9000f      	addw	y,#OFST-4
1726  0299 a605          	ld	a,#5
1727  029b cd0000        	call	c_xymov
1729  029e 5b13          	addw	sp,#19
1730  02a0 81            	ret	
1743                     	xdef	_dht11_Lectura
1744                     	xdef	_DHT11_Init
1745                     	xref	_NHALgpio_Write
1746                     	xref	_NHALgpio_Read
1747                     	xref	_NHALgpio_Init
1748                     	xref	_NHALgpioConfig_SetType
1749                     	xref.b	c_x
1768                     	xref	c_xymov
1769                     	end

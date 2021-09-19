   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  50                     .const:	section	.text
  51  0000               L53_semilla:
  52  0000 00            	dc.b	0
  53  0001 00            	dc.b	0
  54  0002 00            	dc.b	0
  55  0003 00            	dc.b	0
  56  0004 00            	dc.b	0
 878                     ; 256 void DHT11_Init( DHT11_t_ptr dht11, DHT11_fPtr Lectura, Timeout_t_ptr Timeout )
 878                     ; 257 {
 880                     .text:	section	.text,new
 881  0000               _DHT11_Init:
 883  0000 89            	pushw	x
 884       00000000      OFST:	set	0
 887                     ; 258 	dht11->Lectura = Lectura;
 889  0001 1605          	ldw	y,(OFST+5,sp)
 890  0003 ef0c          	ldw	(12,x),y
 891                     ; 260 	dht11->Timeout = Timeout;
 893  0005 1607          	ldw	y,(OFST+7,sp)
 894  0007 ef0a          	ldw	(10,x),y
 895                     ; 262 	dht11->Datos.UltimaLectura.CRC = 0;
 897  0009 6f04          	clr	(4,x)
 898                     ; 263 	dht11->Datos.UltimaLectura.T_Decimal = 0;
 900  000b 6f05          	clr	(5,x)
 901                     ; 264 	dht11->Datos.UltimaLectura.T_Entero = 0;
 903  000d 6f06          	clr	(6,x)
 904                     ; 265 	dht11->Datos.UltimaLectura.H_Decimal = 0;
 906  000f 6f07          	clr	(7,x)
 907                     ; 266 	dht11->Datos.UltimaLectura.H_Entero = 0;
 909  0011 6f08          	clr	(8,x)
 910                     ; 268 	NHALgpioConfig_SetType( &dht11->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
 912  0013 4bc0          	push	#192
 913  0015 cd0000        	call	_NHALgpioConfig_SetType
 915  0018 84            	pop	a
 916                     ; 269 	NHALgpio_Init( &dht11->Config.HW );
 918  0019 1e01          	ldw	x,(OFST+1,sp)
 919  001b cd0000        	call	_NHALgpio_Init
 921                     ; 271 	NHALgpio_Write( &dht11->Config.HW, true );
 923  001e 4b01          	push	#1
 924  0020 1e02          	ldw	x,(OFST+2,sp)
 925  0022 cd0000        	call	_NHALgpio_Write
 927  0025 84            	pop	a
 928                     ; 273 	dht11->Datos.Estado = dht11_INICIALIZADO;
 930  0026 1e01          	ldw	x,(OFST+1,sp)
 931  0028 6f09          	clr	(9,x)
 932                     ; 275 }
 935  002a 85            	popw	x
 936  002b 81            	ret	
 939                     	switch	.const
 940  0005               L535_lectura:
 941  0005 00            	dc.b	0
 942  0006 00            	dc.b	0
 943  0007 00            	dc.b	0
 944  0008 00            	dc.b	0
 945  0009 00            	dc.b	0
 946  000a               L355_semilla:
 947  000a 00            	dc.b	0
 948  000b 00            	dc.b	0
 949  000c 00            	dc.b	0
 950  000d 00            	dc.b	0
 951  000e 00            	dc.b	0
1237                     ; 311 DHT11_SI_t dht11_Lectura( DHT11_t_ptr dht11 )
1237                     ; 312 {
1238                     .text:	section	.text,new
1239  0000               _dht11_Lectura:
1241  0000 5213          	subw	sp,#19
1242       00000013      OFST:	set	19
1245                     ; 313 	DHT11_SI_t lectura = { 0, 0, 0, 0, 0 };
1247  0002 96            	ldw	x,sp
1248  0003 1c000f        	addw	x,#OFST-4
1249  0006 90ae0005      	ldw	y,#L535_lectura
1250  000a a605          	ld	a,#5
1251  000c cd0000        	call	c_xymov
1253                     ; 315 	if( dht11_ComenzarTransmision( dht11 ) )
1256  000f 1e18          	ldw	x,(OFST+5,sp)
1257  0011 1f0c          	ldw	(OFST-7,sp),x
1259                     ; 118 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
1261  0013 4bc0          	push	#192
1262  0015 1e0d          	ldw	x,(OFST-6,sp)
1263  0017 cd0000        	call	_NHALgpioConfig_SetType
1265  001a 84            	pop	a
1266                     ; 119 	NHALgpio_Init( &sensor->Config.HW ); 
1268  001b 1e0c          	ldw	x,(OFST-7,sp)
1269  001d cd0000        	call	_NHALgpio_Init
1271                     ; 121 	NHALgpio_Write( &sensor->Config.HW, false );
1273  0020 4b00          	push	#0
1274  0022 1e0d          	ldw	x,(OFST-6,sp)
1275  0024 cd0000        	call	_NHALgpio_Write
1277  0027 84            	pop	a
1278                     ; 123 	sensor->Datos.Estado = dht11_COMUNICANDO;
1280  0028 1e0c          	ldw	x,(OFST-7,sp)
1281  002a a601          	ld	a,#1
1282  002c e709          	ld	(9,x),a
1286  002e ae0012        	ldw	x,#18
1289  0031 200a          	jra	L7101
1290  0033               L3101:
1291                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1295  0033 ae14d4        	ldw	x,#5332
1297  0036 9d            	nop	
1298  0037               L42:
1299  0037 5a            	decw	X
1300  0038 26fd          	jrne	L42
1301  003a 9d            	nop	
1302                     
1304  003b 1e0a          	ldw	x,(OFST-9,sp)
1305  003d               L7101:
1306                     ; 177 	while ( __ms-- )
1308  003d 5a            	decw	x
1309  003e 1f0a          	ldw	(OFST-9,sp),x
1310  0040 5c            	incw	x
1312  0041 26f0          	jrne	L3101
1313                     ; 126 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_IN_PU_NO_IT); //Configuro como entrada para leer
1315  0043 4b40          	push	#64
1316  0045 1e0d          	ldw	x,(OFST-6,sp)
1317  0047 cd0000        	call	_NHALgpioConfig_SetType
1319  004a 84            	pop	a
1320                     ; 127 	NHALgpio_Init( &sensor->Config.HW ); 
1322  004b 1e0c          	ldw	x,(OFST-7,sp)
1323  004d cd0000        	call	_NHALgpio_Init
1325                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1329  0050 ae00d4        	ldw	x,#212
1331  0053 9d            	nop	
1332  0054               L23:
1333  0054 5a            	decw	X
1334  0055 26fd          	jrne	L23
1335  0057 9d            	nop	
1336                     
1338                     ; 130 	Timeout_Start( sensor->Timeout, TIMEOUT_1MS );
1340  0058 ae03e8        	ldw	x,#1000
1341  005b 89            	pushw	x
1342  005c 1e0e          	ldw	x,(OFST-5,sp)
1343  005e ee0a          	ldw	x,(10,x)
1344  0060 cd0000        	call	_Timeout_Start
1346  0063 85            	popw	x
1348  0064 2006          	jra	L5201
1349  0066               L3201:
1350                     ; 133 		sensor->Datos.Estado = dht11_ESPERA_BAJO;
1352  0066 1e0c          	ldw	x,(OFST-7,sp)
1353  0068 a607          	ld	a,#7
1354  006a e709          	ld	(9,x),a
1355  006c               L5201:
1356                     ; 131 	while( !NHALgpio_Read( &sensor->Config.HW ) && ( sensor->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) )
1358  006c 1e0c          	ldw	x,(OFST-7,sp)
1359  006e cd0000        	call	_NHALgpio_Read
1361  0071 4d            	tnz	a
1362  0072 260c          	jrne	L1301
1364  0074 1e0c          	ldw	x,(OFST-7,sp)
1365  0076 ee0a          	ldw	x,(10,x)
1366  0078 ee02          	ldw	x,(2,x)
1367  007a fd            	call	(x)
1369  007b a301f4        	cpw	x,#500
1370  007e 25e6          	jrult	L3201
1371  0080               L1301:
1372                     ; 136 	if( sensor->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
1374  0080 1e0c          	ldw	x,(OFST-7,sp)
1375  0082 ee0a          	ldw	x,(10,x)
1376  0084 ee02          	ldw	x,(2,x)
1377  0086 fd            	call	(x)
1379  0087 a301f4        	cpw	x,#500
1380  008a 2506          	jrult	L3301
1381                     ; 138 		sensor->Datos.Estado = dht11_TIMEOUT;
1383  008c 1e0c          	ldw	x,(OFST-7,sp)
1384  008e a60c          	ld	a,#12
1385  0090 e709          	ld	(9,x),a
1386  0092               L3301:
1387                     ; 140 	Timeout_Stop( sensor->Timeout );
1389  0092 1e0c          	ldw	x,(OFST-7,sp)
1390  0094 ee0a          	ldw	x,(10,x)
1391  0096 cd0000        	call	_Timeout_Stop
1393                     ; 143 	if( sensor->Datos.Estado != dht11_TIMEOUT )
1395  0099 1e0c          	ldw	x,(OFST-7,sp)
1396  009b e609          	ld	a,(9,x)
1397  009d a10c          	cp	a,#12
1398  009f 2753          	jreq	L1501
1399                     ; 145 		Timeout_Start( sensor->Timeout, TIMEOUT_1MS );
1401  00a1 ae03e8        	ldw	x,#1000
1402  00a4 89            	pushw	x
1403  00a5 1e0e          	ldw	x,(OFST-5,sp)
1404  00a7 ee0a          	ldw	x,(10,x)
1405  00a9 cd0000        	call	_Timeout_Start
1407  00ac 85            	popw	x
1409  00ad 2006          	jra	L1401
1410  00af               L7301:
1411                     ; 148 			sensor->Datos.Estado = dht11_ESPERA_ALTO;
1413  00af 1e0c          	ldw	x,(OFST-7,sp)
1414  00b1 a608          	ld	a,#8
1415  00b3 e709          	ld	(9,x),a
1416  00b5               L1401:
1417                     ; 146 		while( NHALgpio_Read( &sensor->Config.HW ) && ( sensor->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) )
1419  00b5 1e0c          	ldw	x,(OFST-7,sp)
1420  00b7 cd0000        	call	_NHALgpio_Read
1422  00ba 4d            	tnz	a
1423  00bb 270c          	jreq	L5401
1425  00bd 1e0c          	ldw	x,(OFST-7,sp)
1426  00bf ee0a          	ldw	x,(10,x)
1427  00c1 ee02          	ldw	x,(2,x)
1428  00c3 fd            	call	(x)
1430  00c4 a301f4        	cpw	x,#500
1431  00c7 25e6          	jrult	L7301
1432  00c9               L5401:
1433                     ; 150 		if( sensor->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
1435  00c9 1e0c          	ldw	x,(OFST-7,sp)
1436  00cb ee0a          	ldw	x,(10,x)
1437  00cd ee02          	ldw	x,(2,x)
1438  00cf fd            	call	(x)
1440  00d0 a301f4        	cpw	x,#500
1441  00d3 2506          	jrult	L7401
1442                     ; 152 			sensor->Datos.Estado = dht11_TIMEOUT;
1444  00d5 1e0c          	ldw	x,(OFST-7,sp)
1445  00d7 a60c          	ld	a,#12
1446  00d9 e709          	ld	(9,x),a
1447  00db               L7401:
1448                     ; 154 		Timeout_Stop( sensor->Timeout );
1450  00db 1e0c          	ldw	x,(OFST-7,sp)
1451  00dd ee0a          	ldw	x,(10,x)
1452  00df cd0000        	call	_Timeout_Stop
1454                     ; 156 		if( sensor->Datos.Estado != dht11_TIMEOUT )
1456  00e2 1e0c          	ldw	x,(OFST-7,sp)
1457  00e4 e609          	ld	a,(9,x)
1458  00e6 a10c          	cp	a,#12
1459  00e8 270a          	jreq	L1501
1460                     ; 158 			sensor->Datos.Estado = dht11_CONEXION_OK;
1462  00ea a602          	ld	a,#2
1463  00ec e709          	ld	(9,x),a
1464                     ; 159 			return true;
1466  00ee a601          	ld	a,#1
1467  00f0 6b0e          	ld	(OFST-5,sp),a
1470  00f2 2002          	jra	L155
1471  00f4               L1501:
1472                     ; 163 			return false;
1474                     ; 168 		return false;
1477  00f4 0f0e          	clr	(OFST-5,sp)
1480  00f6               L155:
1482  00f6 2603cc03f9    	jreq	L1101
1483                     ; 317 		lectura = dht11_LeerDatos( dht11 );
1486  00fb 1e18          	ldw	x,(OFST+5,sp)
1487  00fd 1f0c          	ldw	(OFST-7,sp),x
1489                     ; 174 	uint16_t checkCRC = 0;
1491                     ; 175 	uint8_t mask = 0b11111111;
1493  00ff a6ff          	ld	a,#255
1494  0101 6b04          	ld	(OFST-15,sp),a
1496                     ; 177 	DHT11_SI_t semilla = { 0, 0, 0, 0, 0 };
1498  0103 96            	ldw	x,sp
1499  0104 1c0007        	addw	x,#OFST-12
1500  0107 90ae000a      	ldw	y,#L355_semilla
1501  010b a605          	ld	a,#5
1502  010d cd0000        	call	c_xymov
1504                     ; 179 	sensor->Datos.Estado = dht11_MIDIENDO_H;
1506  0110 1e0c          	ldw	x,(OFST-7,sp)
1507  0112 a603          	ld	a,#3
1508  0114 e709          	ld	(9,x),a
1509                     ; 69 	uint8_t contador = 0;
1512  0116 0f02          	clr	(OFST-17,sp)
1514                     ; 70 	uint8_t temp = 0;
1516  0118 0f01          	clr	(OFST-18,sp)
1518                     ; 71 	uint8_t bitLeido = 0;
1520                     ; 73 	for( contador; contador < 8; contador++ )
1523  011a 206b          	jra	L3601
1524  011c               L7501:
1525                     ; 75 		Timeout_Start( dht11->Timeout, TIMEOUT_1MS );
1527  011c ae03e8        	ldw	x,#1000
1528  011f 89            	pushw	x
1529  0120 1e0e          	ldw	x,(OFST-5,sp)
1530  0122 ee0a          	ldw	x,(10,x)
1531  0124 cd0000        	call	_Timeout_Start
1533  0127 85            	popw	x
1535  0128               L1701:
1536                     ; 76 		while( !NHALgpio_Read( &dht11->Config.HW ) && ( dht11->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) ) //Espera nuevo bit
1538  0128 1e0c          	ldw	x,(OFST-7,sp)
1539  012a cd0000        	call	_NHALgpio_Read
1541  012d 4d            	tnz	a
1542  012e 260c          	jrne	L5701
1544  0130 1e0c          	ldw	x,(OFST-7,sp)
1545  0132 ee0a          	ldw	x,(10,x)
1546  0134 ee02          	ldw	x,(2,x)
1547  0136 fd            	call	(x)
1549  0137 a301f4        	cpw	x,#500
1550  013a 25ec          	jrult	L1701
1551  013c               L5701:
1552                     ; 80 		if( dht11->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
1554  013c 1e0c          	ldw	x,(OFST-7,sp)
1555  013e ee0a          	ldw	x,(10,x)
1556  0140 ee02          	ldw	x,(2,x)
1557  0142 fd            	call	(x)
1559  0143 a301f4        	cpw	x,#500
1560  0146 2506          	jrult	L7701
1561                     ; 82 			dht11->Datos.Estado = dht11_TIMEOUT;
1563  0148 1e0c          	ldw	x,(OFST-7,sp)
1564  014a a60c          	ld	a,#12
1565  014c e709          	ld	(9,x),a
1566  014e               L7701:
1567                     ; 84 		Timeout_Stop( dht11->Timeout );
1569  014e 1e0c          	ldw	x,(OFST-7,sp)
1570  0150 ee0a          	ldw	x,(10,x)
1571  0152 cd0000        	call	_Timeout_Stop
1573                     ; 86 		if( dht11->Datos.Estado != dht11_TIMEOUT )
1575  0155 1e0c          	ldw	x,(OFST-7,sp)
1576  0157 e609          	ld	a,(9,x)
1577  0159 a10c          	cp	a,#12
1578  015b 2728          	jreq	L1011
1579                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1583  015d ae00d4        	ldw	x,#212
1585  0160 9d            	nop	
1586  0161               L27:
1587  0161 5a            	decw	X
1588  0162 26fd          	jrne	L27
1589  0164 9d            	nop	
1590                     
1592                     ; 90 			bitLeido = 0;
1594                     ; 91 			if( NHALgpio_Read( &dht11->Config.HW ) )
1596  0165 1e0c          	ldw	x,(OFST-7,sp)
1597  0167 cd0000        	call	_NHALgpio_Read
1599  016a 4d            	tnz	a
1600  016b 2702          	jreq	L3011
1601                     ; 93 				bitLeido = 1;
1603  016d a601          	ld	a,#1
1605  016f               L3011:
1606                     ; 97 				bitLeido = 0;
1608  016f 6b03          	ld	(OFST-16,sp),a
1610                     ; 100 			temp |= bitLeido;
1612  0171 1a01          	or	a,(OFST-18,sp)
1613  0173 6b01          	ld	(OFST-18,sp),a
1615                     ; 101 			if( contador < 7 )
1617  0175 7b02          	ld	a,(OFST-17,sp)
1618  0177 a107          	cp	a,#7
1619  0179 2402          	jruge	L3111
1620                     ; 103 				temp <<=  1;
1622  017b 0801          	sll	(OFST-18,sp)
1624  017d               L3111:
1625                     ; 106 			while( NHALgpio_Read( &dht11->Config.HW ) ) //Si el bit=1 espero a que baje señal
1627  017d 1e0c          	ldw	x,(OFST-7,sp)
1628  017f cd0000        	call	_NHALgpio_Read
1630  0182 4d            	tnz	a
1631  0183 26f8          	jrne	L3111
1632  0185               L1011:
1633                     ; 73 	for( contador; contador < 8; contador++ )
1635  0185 0c02          	inc	(OFST-17,sp)
1637  0187               L3601:
1640  0187 7b02          	ld	a,(OFST-17,sp)
1641  0189 a108          	cp	a,#8
1642  018b 258f          	jrult	L7501
1643                     ; 113 	return temp;
1645  018d 7b01          	ld	a,(OFST-18,sp)
1646  018f 6b0b          	ld	(OFST-8,sp),a
1650                     ; 182 	sensor->Datos.Estado = dht11_MIDIENDO_H;
1652  0191 1e0c          	ldw	x,(OFST-7,sp)
1653  0193 a603          	ld	a,#3
1654  0195 e709          	ld	(9,x),a
1655                     ; 69 	uint8_t contador = 0;
1658  0197 0f02          	clr	(OFST-17,sp)
1660                     ; 70 	uint8_t temp = 0;
1662  0199 0f01          	clr	(OFST-18,sp)
1664                     ; 71 	uint8_t bitLeido = 0;
1666                     ; 73 	for( contador; contador < 8; contador++ )
1669  019b 206b          	jra	L3211
1670  019d               L7111:
1671                     ; 75 		Timeout_Start( dht11->Timeout, TIMEOUT_1MS );
1673  019d ae03e8        	ldw	x,#1000
1674  01a0 89            	pushw	x
1675  01a1 1e0e          	ldw	x,(OFST-5,sp)
1676  01a3 ee0a          	ldw	x,(10,x)
1677  01a5 cd0000        	call	_Timeout_Start
1679  01a8 85            	popw	x
1681  01a9               L1311:
1682                     ; 76 		while( !NHALgpio_Read( &dht11->Config.HW ) && ( dht11->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) ) //Espera nuevo bit
1684  01a9 1e0c          	ldw	x,(OFST-7,sp)
1685  01ab cd0000        	call	_NHALgpio_Read
1687  01ae 4d            	tnz	a
1688  01af 260c          	jrne	L5311
1690  01b1 1e0c          	ldw	x,(OFST-7,sp)
1691  01b3 ee0a          	ldw	x,(10,x)
1692  01b5 ee02          	ldw	x,(2,x)
1693  01b7 fd            	call	(x)
1695  01b8 a301f4        	cpw	x,#500
1696  01bb 25ec          	jrult	L1311
1697  01bd               L5311:
1698                     ; 80 		if( dht11->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
1700  01bd 1e0c          	ldw	x,(OFST-7,sp)
1701  01bf ee0a          	ldw	x,(10,x)
1702  01c1 ee02          	ldw	x,(2,x)
1703  01c3 fd            	call	(x)
1705  01c4 a301f4        	cpw	x,#500
1706  01c7 2506          	jrult	L7311
1707                     ; 82 			dht11->Datos.Estado = dht11_TIMEOUT;
1709  01c9 1e0c          	ldw	x,(OFST-7,sp)
1710  01cb a60c          	ld	a,#12
1711  01cd e709          	ld	(9,x),a
1712  01cf               L7311:
1713                     ; 84 		Timeout_Stop( dht11->Timeout );
1715  01cf 1e0c          	ldw	x,(OFST-7,sp)
1716  01d1 ee0a          	ldw	x,(10,x)
1717  01d3 cd0000        	call	_Timeout_Stop
1719                     ; 86 		if( dht11->Datos.Estado != dht11_TIMEOUT )
1721  01d6 1e0c          	ldw	x,(OFST-7,sp)
1722  01d8 e609          	ld	a,(9,x)
1723  01da a10c          	cp	a,#12
1724  01dc 2728          	jreq	L1411
1725                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1729  01de ae00d4        	ldw	x,#212
1731  01e1 9d            	nop	
1732  01e2               L211:
1733  01e2 5a            	decw	X
1734  01e3 26fd          	jrne	L211
1735  01e5 9d            	nop	
1736                     
1738                     ; 90 			bitLeido = 0;
1740                     ; 91 			if( NHALgpio_Read( &dht11->Config.HW ) )
1742  01e6 1e0c          	ldw	x,(OFST-7,sp)
1743  01e8 cd0000        	call	_NHALgpio_Read
1745  01eb 4d            	tnz	a
1746  01ec 2702          	jreq	L3411
1747                     ; 93 				bitLeido = 1;
1749  01ee a601          	ld	a,#1
1751  01f0               L3411:
1752                     ; 97 				bitLeido = 0;
1754  01f0 6b03          	ld	(OFST-16,sp),a
1756                     ; 100 			temp |= bitLeido;
1758  01f2 1a01          	or	a,(OFST-18,sp)
1759  01f4 6b01          	ld	(OFST-18,sp),a
1761                     ; 101 			if( contador < 7 )
1763  01f6 7b02          	ld	a,(OFST-17,sp)
1764  01f8 a107          	cp	a,#7
1765  01fa 2402          	jruge	L3511
1766                     ; 103 				temp <<=  1;
1768  01fc 0801          	sll	(OFST-18,sp)
1770  01fe               L3511:
1771                     ; 106 			while( NHALgpio_Read( &dht11->Config.HW ) ) //Si el bit=1 espero a que baje señal
1773  01fe 1e0c          	ldw	x,(OFST-7,sp)
1774  0200 cd0000        	call	_NHALgpio_Read
1776  0203 4d            	tnz	a
1777  0204 26f8          	jrne	L3511
1778  0206               L1411:
1779                     ; 73 	for( contador; contador < 8; contador++ )
1781  0206 0c02          	inc	(OFST-17,sp)
1783  0208               L3211:
1786  0208 7b02          	ld	a,(OFST-17,sp)
1787  020a a108          	cp	a,#8
1788  020c 258f          	jrult	L7111
1789                     ; 113 	return temp;
1791  020e 7b01          	ld	a,(OFST-18,sp)
1792  0210 6b0a          	ld	(OFST-9,sp),a
1796                     ; 185 	sensor->Datos.Estado = dht11_MIDIENDO_T;
1798  0212 1e0c          	ldw	x,(OFST-7,sp)
1799  0214 a604          	ld	a,#4
1800  0216 e709          	ld	(9,x),a
1801                     ; 69 	uint8_t contador = 0;
1804  0218 0f02          	clr	(OFST-17,sp)
1806                     ; 70 	uint8_t temp = 0;
1808  021a 0f01          	clr	(OFST-18,sp)
1810                     ; 71 	uint8_t bitLeido = 0;
1812                     ; 73 	for( contador; contador < 8; contador++ )
1815  021c 206b          	jra	L3611
1816  021e               L7511:
1817                     ; 75 		Timeout_Start( dht11->Timeout, TIMEOUT_1MS );
1819  021e ae03e8        	ldw	x,#1000
1820  0221 89            	pushw	x
1821  0222 1e0e          	ldw	x,(OFST-5,sp)
1822  0224 ee0a          	ldw	x,(10,x)
1823  0226 cd0000        	call	_Timeout_Start
1825  0229 85            	popw	x
1827  022a               L1711:
1828                     ; 76 		while( !NHALgpio_Read( &dht11->Config.HW ) && ( dht11->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) ) //Espera nuevo bit
1830  022a 1e0c          	ldw	x,(OFST-7,sp)
1831  022c cd0000        	call	_NHALgpio_Read
1833  022f 4d            	tnz	a
1834  0230 260c          	jrne	L5711
1836  0232 1e0c          	ldw	x,(OFST-7,sp)
1837  0234 ee0a          	ldw	x,(10,x)
1838  0236 ee02          	ldw	x,(2,x)
1839  0238 fd            	call	(x)
1841  0239 a301f4        	cpw	x,#500
1842  023c 25ec          	jrult	L1711
1843  023e               L5711:
1844                     ; 80 		if( dht11->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
1846  023e 1e0c          	ldw	x,(OFST-7,sp)
1847  0240 ee0a          	ldw	x,(10,x)
1848  0242 ee02          	ldw	x,(2,x)
1849  0244 fd            	call	(x)
1851  0245 a301f4        	cpw	x,#500
1852  0248 2506          	jrult	L7711
1853                     ; 82 			dht11->Datos.Estado = dht11_TIMEOUT;
1855  024a 1e0c          	ldw	x,(OFST-7,sp)
1856  024c a60c          	ld	a,#12
1857  024e e709          	ld	(9,x),a
1858  0250               L7711:
1859                     ; 84 		Timeout_Stop( dht11->Timeout );
1861  0250 1e0c          	ldw	x,(OFST-7,sp)
1862  0252 ee0a          	ldw	x,(10,x)
1863  0254 cd0000        	call	_Timeout_Stop
1865                     ; 86 		if( dht11->Datos.Estado != dht11_TIMEOUT )
1867  0257 1e0c          	ldw	x,(OFST-7,sp)
1868  0259 e609          	ld	a,(9,x)
1869  025b a10c          	cp	a,#12
1870  025d 2728          	jreq	L1021
1871                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1875  025f ae00d4        	ldw	x,#212
1877  0262 9d            	nop	
1878  0263               L231:
1879  0263 5a            	decw	X
1880  0264 26fd          	jrne	L231
1881  0266 9d            	nop	
1882                     
1884                     ; 90 			bitLeido = 0;
1886                     ; 91 			if( NHALgpio_Read( &dht11->Config.HW ) )
1888  0267 1e0c          	ldw	x,(OFST-7,sp)
1889  0269 cd0000        	call	_NHALgpio_Read
1891  026c 4d            	tnz	a
1892  026d 2702          	jreq	L3021
1893                     ; 93 				bitLeido = 1;
1895  026f a601          	ld	a,#1
1897  0271               L3021:
1898                     ; 97 				bitLeido = 0;
1900  0271 6b03          	ld	(OFST-16,sp),a
1902                     ; 100 			temp |= bitLeido;
1904  0273 1a01          	or	a,(OFST-18,sp)
1905  0275 6b01          	ld	(OFST-18,sp),a
1907                     ; 101 			if( contador < 7 )
1909  0277 7b02          	ld	a,(OFST-17,sp)
1910  0279 a107          	cp	a,#7
1911  027b 2402          	jruge	L3121
1912                     ; 103 				temp <<=  1;
1914  027d 0801          	sll	(OFST-18,sp)
1916  027f               L3121:
1917                     ; 106 			while( NHALgpio_Read( &dht11->Config.HW ) ) //Si el bit=1 espero a que baje señal
1919  027f 1e0c          	ldw	x,(OFST-7,sp)
1920  0281 cd0000        	call	_NHALgpio_Read
1922  0284 4d            	tnz	a
1923  0285 26f8          	jrne	L3121
1924  0287               L1021:
1925                     ; 73 	for( contador; contador < 8; contador++ )
1927  0287 0c02          	inc	(OFST-17,sp)
1929  0289               L3611:
1932  0289 7b02          	ld	a,(OFST-17,sp)
1933  028b a108          	cp	a,#8
1934  028d 258f          	jrult	L7511
1935                     ; 113 	return temp;
1937  028f 7b01          	ld	a,(OFST-18,sp)
1938  0291 6b09          	ld	(OFST-10,sp),a
1942                     ; 188 	sensor->Datos.Estado = dht11_MIDIENDO_T;
1944  0293 1e0c          	ldw	x,(OFST-7,sp)
1945  0295 a604          	ld	a,#4
1946  0297 e709          	ld	(9,x),a
1947                     ; 69 	uint8_t contador = 0;
1950  0299 0f02          	clr	(OFST-17,sp)
1952                     ; 70 	uint8_t temp = 0;
1954  029b 0f01          	clr	(OFST-18,sp)
1956                     ; 71 	uint8_t bitLeido = 0;
1958                     ; 73 	for( contador; contador < 8; contador++ )
1961  029d 206b          	jra	L3221
1962  029f               L7121:
1963                     ; 75 		Timeout_Start( dht11->Timeout, TIMEOUT_1MS );
1965  029f ae03e8        	ldw	x,#1000
1966  02a2 89            	pushw	x
1967  02a3 1e0e          	ldw	x,(OFST-5,sp)
1968  02a5 ee0a          	ldw	x,(10,x)
1969  02a7 cd0000        	call	_Timeout_Start
1971  02aa 85            	popw	x
1973  02ab               L1321:
1974                     ; 76 		while( !NHALgpio_Read( &dht11->Config.HW ) && ( dht11->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) ) //Espera nuevo bit
1976  02ab 1e0c          	ldw	x,(OFST-7,sp)
1977  02ad cd0000        	call	_NHALgpio_Read
1979  02b0 4d            	tnz	a
1980  02b1 260c          	jrne	L5321
1982  02b3 1e0c          	ldw	x,(OFST-7,sp)
1983  02b5 ee0a          	ldw	x,(10,x)
1984  02b7 ee02          	ldw	x,(2,x)
1985  02b9 fd            	call	(x)
1987  02ba a301f4        	cpw	x,#500
1988  02bd 25ec          	jrult	L1321
1989  02bf               L5321:
1990                     ; 80 		if( dht11->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
1992  02bf 1e0c          	ldw	x,(OFST-7,sp)
1993  02c1 ee0a          	ldw	x,(10,x)
1994  02c3 ee02          	ldw	x,(2,x)
1995  02c5 fd            	call	(x)
1997  02c6 a301f4        	cpw	x,#500
1998  02c9 2506          	jrult	L7321
1999                     ; 82 			dht11->Datos.Estado = dht11_TIMEOUT;
2001  02cb 1e0c          	ldw	x,(OFST-7,sp)
2002  02cd a60c          	ld	a,#12
2003  02cf e709          	ld	(9,x),a
2004  02d1               L7321:
2005                     ; 84 		Timeout_Stop( dht11->Timeout );
2007  02d1 1e0c          	ldw	x,(OFST-7,sp)
2008  02d3 ee0a          	ldw	x,(10,x)
2009  02d5 cd0000        	call	_Timeout_Stop
2011                     ; 86 		if( dht11->Datos.Estado != dht11_TIMEOUT )
2013  02d8 1e0c          	ldw	x,(OFST-7,sp)
2014  02da e609          	ld	a,(9,x)
2015  02dc a10c          	cp	a,#12
2016  02de 2728          	jreq	L1421
2017                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2021  02e0 ae00d4        	ldw	x,#212
2023  02e3 9d            	nop	
2024  02e4               L251:
2025  02e4 5a            	decw	X
2026  02e5 26fd          	jrne	L251
2027  02e7 9d            	nop	
2028                     
2030                     ; 90 			bitLeido = 0;
2032                     ; 91 			if( NHALgpio_Read( &dht11->Config.HW ) )
2034  02e8 1e0c          	ldw	x,(OFST-7,sp)
2035  02ea cd0000        	call	_NHALgpio_Read
2037  02ed 4d            	tnz	a
2038  02ee 2702          	jreq	L3421
2039                     ; 93 				bitLeido = 1;
2041  02f0 a601          	ld	a,#1
2043  02f2               L3421:
2044                     ; 97 				bitLeido = 0;
2046  02f2 6b03          	ld	(OFST-16,sp),a
2048                     ; 100 			temp |= bitLeido;
2050  02f4 1a01          	or	a,(OFST-18,sp)
2051  02f6 6b01          	ld	(OFST-18,sp),a
2053                     ; 101 			if( contador < 7 )
2055  02f8 7b02          	ld	a,(OFST-17,sp)
2056  02fa a107          	cp	a,#7
2057  02fc 2402          	jruge	L3521
2058                     ; 103 				temp <<=  1;
2060  02fe 0801          	sll	(OFST-18,sp)
2062  0300               L3521:
2063                     ; 106 			while( NHALgpio_Read( &dht11->Config.HW ) ) //Si el bit=1 espero a que baje señal
2065  0300 1e0c          	ldw	x,(OFST-7,sp)
2066  0302 cd0000        	call	_NHALgpio_Read
2068  0305 4d            	tnz	a
2069  0306 26f8          	jrne	L3521
2070  0308               L1421:
2071                     ; 73 	for( contador; contador < 8; contador++ )
2073  0308 0c02          	inc	(OFST-17,sp)
2075  030a               L3221:
2078  030a 7b02          	ld	a,(OFST-17,sp)
2079  030c a108          	cp	a,#8
2080  030e 258f          	jrult	L7121
2081                     ; 113 	return temp;
2083  0310 7b01          	ld	a,(OFST-18,sp)
2084  0312 6b08          	ld	(OFST-11,sp),a
2088                     ; 69 	uint8_t contador = 0;
2091  0314 0f02          	clr	(OFST-17,sp)
2093                     ; 70 	uint8_t temp = 0;
2095  0316 0f01          	clr	(OFST-18,sp)
2097                     ; 71 	uint8_t bitLeido = 0;
2099                     ; 73 	for( contador; contador < 8; contador++ )
2102  0318 206b          	jra	L3621
2103  031a               L7521:
2104                     ; 75 		Timeout_Start( dht11->Timeout, TIMEOUT_1MS );
2106  031a ae03e8        	ldw	x,#1000
2107  031d 89            	pushw	x
2108  031e 1e0e          	ldw	x,(OFST-5,sp)
2109  0320 ee0a          	ldw	x,(10,x)
2110  0322 cd0000        	call	_Timeout_Start
2112  0325 85            	popw	x
2114  0326               L1721:
2115                     ; 76 		while( !NHALgpio_Read( &dht11->Config.HW ) && ( dht11->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) ) //Espera nuevo bit
2117  0326 1e0c          	ldw	x,(OFST-7,sp)
2118  0328 cd0000        	call	_NHALgpio_Read
2120  032b 4d            	tnz	a
2121  032c 260c          	jrne	L5721
2123  032e 1e0c          	ldw	x,(OFST-7,sp)
2124  0330 ee0a          	ldw	x,(10,x)
2125  0332 ee02          	ldw	x,(2,x)
2126  0334 fd            	call	(x)
2128  0335 a301f4        	cpw	x,#500
2129  0338 25ec          	jrult	L1721
2130  033a               L5721:
2131                     ; 80 		if( dht11->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
2133  033a 1e0c          	ldw	x,(OFST-7,sp)
2134  033c ee0a          	ldw	x,(10,x)
2135  033e ee02          	ldw	x,(2,x)
2136  0340 fd            	call	(x)
2138  0341 a301f4        	cpw	x,#500
2139  0344 2506          	jrult	L7721
2140                     ; 82 			dht11->Datos.Estado = dht11_TIMEOUT;
2142  0346 1e0c          	ldw	x,(OFST-7,sp)
2143  0348 a60c          	ld	a,#12
2144  034a e709          	ld	(9,x),a
2145  034c               L7721:
2146                     ; 84 		Timeout_Stop( dht11->Timeout );
2148  034c 1e0c          	ldw	x,(OFST-7,sp)
2149  034e ee0a          	ldw	x,(10,x)
2150  0350 cd0000        	call	_Timeout_Stop
2152                     ; 86 		if( dht11->Datos.Estado != dht11_TIMEOUT )
2154  0353 1e0c          	ldw	x,(OFST-7,sp)
2155  0355 e609          	ld	a,(9,x)
2156  0357 a10c          	cp	a,#12
2157  0359 2728          	jreq	L1031
2158                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2162  035b ae00d4        	ldw	x,#212
2164  035e 9d            	nop	
2165  035f               L271:
2166  035f 5a            	decw	X
2167  0360 26fd          	jrne	L271
2168  0362 9d            	nop	
2169                     
2171                     ; 90 			bitLeido = 0;
2173                     ; 91 			if( NHALgpio_Read( &dht11->Config.HW ) )
2175  0363 1e0c          	ldw	x,(OFST-7,sp)
2176  0365 cd0000        	call	_NHALgpio_Read
2178  0368 4d            	tnz	a
2179  0369 2702          	jreq	L3031
2180                     ; 93 				bitLeido = 1;
2182  036b a601          	ld	a,#1
2184  036d               L3031:
2185                     ; 97 				bitLeido = 0;
2187  036d 6b03          	ld	(OFST-16,sp),a
2189                     ; 100 			temp |= bitLeido;
2191  036f 1a01          	or	a,(OFST-18,sp)
2192  0371 6b01          	ld	(OFST-18,sp),a
2194                     ; 101 			if( contador < 7 )
2196  0373 7b02          	ld	a,(OFST-17,sp)
2197  0375 a107          	cp	a,#7
2198  0377 2402          	jruge	L3131
2199                     ; 103 				temp <<=  1;
2201  0379 0801          	sll	(OFST-18,sp)
2203  037b               L3131:
2204                     ; 106 			while( NHALgpio_Read( &dht11->Config.HW ) ) //Si el bit=1 espero a que baje señal
2206  037b 1e0c          	ldw	x,(OFST-7,sp)
2207  037d cd0000        	call	_NHALgpio_Read
2209  0380 4d            	tnz	a
2210  0381 26f8          	jrne	L3131
2211  0383               L1031:
2212                     ; 73 	for( contador; contador < 8; contador++ )
2214  0383 0c02          	inc	(OFST-17,sp)
2216  0385               L3621:
2219  0385 7b02          	ld	a,(OFST-17,sp)
2220  0387 a108          	cp	a,#8
2221  0389 258f          	jrult	L7521
2222                     ; 113 	return temp;
2224  038b 7b01          	ld	a,(OFST-18,sp)
2225  038d 6b07          	ld	(OFST-12,sp),a
2229                     ; 193 	checkCRC = semilla.H_Entero + semilla.H_Decimal + semilla.T_Entero + semilla.T_Decimal;
2231  038f 5f            	clrw	x
2232  0390 7b0b          	ld	a,(OFST-8,sp)
2233  0392 1b0a          	add	a,(OFST-9,sp)
2234  0394 59            	rlcw	x
2235  0395 1b09          	add	a,(OFST-10,sp)
2236  0397 2401          	jrnc	L202
2237  0399 5c            	incw	x
2238  039a               L202:
2239  039a 1b08          	add	a,(OFST-11,sp)
2240  039c 2401          	jrnc	L402
2241  039e 5c            	incw	x
2242  039f               L402:
2243  039f 02            	rlwa	x,a
2244  03a0 1f05          	ldw	(OFST-14,sp),x
2246                     ; 194 	checkCRC &= mask;
2248  03a2 5f            	clrw	x
2249  03a3 7b04          	ld	a,(OFST-15,sp)
2250  03a5 97            	ld	xl,a
2251  03a6 01            	rrwa	x,a
2252  03a7 1406          	and	a,(OFST-13,sp)
2253  03a9 01            	rrwa	x,a
2254  03aa 1405          	and	a,(OFST-14,sp)
2255  03ac 01            	rrwa	x,a
2256  03ad 1f05          	ldw	(OFST-14,sp),x
2258                     ; 196 	if( checkCRC == semilla.CRC )
2260  03af 5f            	clrw	x
2261  03b0 7b07          	ld	a,(OFST-12,sp)
2262  03b2 97            	ld	xl,a
2263  03b3 bf00          	ldw	c_x,x
2264  03b5 1e05          	ldw	x,(OFST-14,sp)
2265  03b7 b300          	cpw	x,c_x
2266  03b9 2606          	jrne	L7131
2267                     ; 198 		sensor->Datos.Estado = dht11_LECTURA_OK;
2269  03bb 1e0c          	ldw	x,(OFST-7,sp)
2270  03bd a60b          	ld	a,#11
2271                     ; 199 		return semilla;
2274  03bf 2004          	jra	L316
2275  03c1               L7131:
2276                     ; 203 		sensor->Datos.Estado = dht11_FALLO_AL_LEER;
2278  03c1 1e0c          	ldw	x,(OFST-7,sp)
2279  03c3 a609          	ld	a,#9
2280                     ; 204 		return semilla;
2284  03c5               L316:
2285  03c5 e709          	ld	(9,x),a
2287  03c7 96            	ldw	x,sp
2288  03c8 1c000f        	addw	x,#OFST-4
2289  03cb 9096          	ldw	y,sp
2290  03cd 72a90007      	addw	y,#OFST-12
2291  03d1 a605          	ld	a,#5
2292  03d3 cd0000        	call	c_xymov
2294                     ; 318 		dht11_CerrarConexion( dht11 );
2297  03d6 1e18          	ldw	x,(OFST+5,sp)
2298  03d8 1f0c          	ldw	(OFST-7,sp),x
2300                     ; 210 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
2302  03da 4bc0          	push	#192
2303  03dc 1e0d          	ldw	x,(OFST-6,sp)
2304  03de cd0000        	call	_NHALgpioConfig_SetType
2306  03e1 84            	pop	a
2307                     ; 211 	NHALgpio_Init( &sensor->Config.HW );
2309  03e2 1e0c          	ldw	x,(OFST-7,sp)
2310  03e4 cd0000        	call	_NHALgpio_Init
2312                     ; 213 	NHALgpio_Write( &sensor->Config.HW, true );
2314  03e7 4b01          	push	#1
2315  03e9 1e0d          	ldw	x,(OFST-6,sp)
2316  03eb cd0000        	call	_NHALgpio_Write
2318  03ee 84            	pop	a
2319                     ; 215 	if( sensor->Datos.Estado == dht11_CERRANDO_CONEXION )
2321  03ef 1e0c          	ldw	x,(OFST-7,sp)
2322  03f1 e609          	ld	a,(9,x)
2323  03f3 a105          	cp	a,#5
2324  03f5 262b          	jrne	L716
2325                     ; 217 		sensor->Datos.Estado = dht11_SLEEP;
2326                     ; 320 		return lectura;
2329  03f7 2025          	jp	LC002
2330  03f9               L1101:
2331                     ; 324 		dht11->Datos.Estado = dht11_FALLO_AL_COMUNICAR;
2333  03f9 1e18          	ldw	x,(OFST+5,sp)
2334  03fb a60a          	ld	a,#10
2335  03fd e709          	ld	(9,x),a
2336                     ; 325 		dht11_CerrarConexion( dht11 );
2339  03ff 1f0c          	ldw	(OFST-7,sp),x
2341                     ; 210 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
2343  0401 4bc0          	push	#192
2344  0403 1e0d          	ldw	x,(OFST-6,sp)
2345  0405 cd0000        	call	_NHALgpioConfig_SetType
2347  0408 84            	pop	a
2348                     ; 211 	NHALgpio_Init( &sensor->Config.HW );
2350  0409 1e0c          	ldw	x,(OFST-7,sp)
2351  040b cd0000        	call	_NHALgpio_Init
2353                     ; 213 	NHALgpio_Write( &sensor->Config.HW, true );
2355  040e 4b01          	push	#1
2356  0410 1e0d          	ldw	x,(OFST-6,sp)
2357  0412 cd0000        	call	_NHALgpio_Write
2359  0415 84            	pop	a
2360                     ; 215 	if( sensor->Datos.Estado == dht11_CERRANDO_CONEXION )
2362  0416 1e0c          	ldw	x,(OFST-7,sp)
2363  0418 e609          	ld	a,(9,x)
2364  041a a105          	cp	a,#5
2365  041c 2604          	jrne	L716
2366                     ; 217 		sensor->Datos.Estado = dht11_SLEEP;
2368  041e               LC002:
2370  041e a606          	ld	a,#6
2371  0420 e709          	ld	(9,x),a
2372  0422               L716:
2373                     ; 327 		return lectura;
2378  0422 1e16          	ldw	x,(OFST+3,sp)
2379  0424 9096          	ldw	y,sp
2380  0426 72a9000f      	addw	y,#OFST-4
2381  042a a605          	ld	a,#5
2382  042c cd0000        	call	c_xymov
2384  042f 5b13          	addw	sp,#19
2385  0431 81            	ret	
2398                     	xdef	_dht11_Lectura
2399                     	xdef	_DHT11_Init
2400                     	xref	_Timeout_Stop
2401                     	xref	_Timeout_Start
2402                     	xref	_NHALgpio_Write
2403                     	xref	_NHALgpio_Read
2404                     	xref	_NHALgpio_Init
2405                     	xref	_NHALgpioConfig_SetType
2406                     	xref.b	c_x
2425                     	xref	c_xymov
2426                     	end

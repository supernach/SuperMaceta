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
  72                     .const:	section	.text
  73  0000               L75_semilla:
  74  0000 00            	dc.b	0
  75  0001 00            	dc.b	0
  76  0002 00            	dc.b	0
  77  0003 00            	dc.b	0
  78  0004 00            	dc.b	0
 900                     ; 263 void DHT11_Init( DHT11_t_ptr dht11, DHT11_fPtr Lectura, Timeout_t_ptr Timeout )
 900                     ; 264 {
 902                     .text:	section	.text,new
 903  0000               _DHT11_Init:
 905  0000 89            	pushw	x
 906       00000000      OFST:	set	0
 909                     ; 265 	dht11->Lectura = Lectura;
 911  0001 1605          	ldw	y,(OFST+5,sp)
 912  0003 ef0c          	ldw	(12,x),y
 913                     ; 267 	dht11->Timeout = Timeout;
 915  0005 1607          	ldw	y,(OFST+7,sp)
 916  0007 ef0a          	ldw	(10,x),y
 917                     ; 269 	dht11->Datos.UltimaLectura.CRC = 0;
 919  0009 6f04          	clr	(4,x)
 920                     ; 270 	dht11->Datos.UltimaLectura.T_Decimal = 1;
 922  000b a601          	ld	a,#1
 923  000d e705          	ld	(5,x),a
 924                     ; 271 	dht11->Datos.UltimaLectura.T_Entero = 2;
 926  000f 4c            	inc	a
 927  0010 e706          	ld	(6,x),a
 928                     ; 272 	dht11->Datos.UltimaLectura.H_Decimal = 3;
 930  0012 4c            	inc	a
 931  0013 e707          	ld	(7,x),a
 932                     ; 273 	dht11->Datos.UltimaLectura.H_Entero = 4;
 934  0015 4c            	inc	a
 935  0016 e708          	ld	(8,x),a
 936                     ; 275 	NHALgpioConfig_SetType( &dht11->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
 938  0018 4bc0          	push	#192
 939  001a cd0000        	call	_NHALgpioConfig_SetType
 941  001d 84            	pop	a
 942                     ; 276 	NHALgpio_Init( &dht11->Config.HW );
 944  001e 1e01          	ldw	x,(OFST+1,sp)
 945  0020 cd0000        	call	_NHALgpio_Init
 947                     ; 278 	NHALgpio_Write( &dht11->Config.HW, true );
 949  0023 4b01          	push	#1
 950  0025 1e02          	ldw	x,(OFST+2,sp)
 951  0027 cd0000        	call	_NHALgpio_Write
 953  002a 84            	pop	a
 954                     ; 280 	dht11->Datos.Estado = dht11_INICIALIZADO;
 956  002b 1e01          	ldw	x,(OFST+1,sp)
 957  002d 6f09          	clr	(9,x)
 958                     ; 282 }
 961  002f 85            	popw	x
 962  0030 81            	ret	
 965                     	switch	.const
 966  0005               L755_lectura:
 967  0005 00            	dc.b	0
 968  0006 00            	dc.b	0
 969  0007 00            	dc.b	0
 970  0008 00            	dc.b	0
 971  0009 00            	dc.b	0
 972  000a               L575_semilla:
 973  000a 00            	dc.b	0
 974  000b 00            	dc.b	0
 975  000c 00            	dc.b	0
 976  000d 00            	dc.b	0
 977  000e 00            	dc.b	0
1263                     ; 318 DHT11_SI_t dht11_Lectura( DHT11_t_ptr dht11 )
1263                     ; 319 {
1264                     .text:	section	.text,new
1265  0000               _dht11_Lectura:
1267  0000 5213          	subw	sp,#19
1268       00000013      OFST:	set	19
1271                     ; 320 	DHT11_SI_t lectura = { 0, 0, 0, 0, 0 };
1273  0002 96            	ldw	x,sp
1274  0003 1c000f        	addw	x,#OFST-4
1275  0006 90ae0005      	ldw	y,#L755_lectura
1276  000a a605          	ld	a,#5
1277  000c cd0000        	call	c_xymov
1279                     ; 322 	if( dht11_ComenzarTransmision( dht11 ) )
1282  000f 1e18          	ldw	x,(OFST+5,sp)
1283  0011 1f0c          	ldw	(OFST-7,sp),x
1285                     ; 125 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
1287  0013 4bc0          	push	#192
1288  0015 1e0d          	ldw	x,(OFST-6,sp)
1289  0017 cd0000        	call	_NHALgpioConfig_SetType
1291  001a 84            	pop	a
1292                     ; 126 	NHALgpio_Init( &sensor->Config.HW ); 
1294  001b 1e0c          	ldw	x,(OFST-7,sp)
1295  001d cd0000        	call	_NHALgpio_Init
1297                     ; 128 	NHALgpio_Write( &sensor->Config.HW, false );
1299  0020 4b00          	push	#0
1300  0022 1e0d          	ldw	x,(OFST-6,sp)
1301  0024 cd0000        	call	_NHALgpio_Write
1303  0027 84            	pop	a
1304                     ; 130 	sensor->Datos.Estado = dht11_COMUNICANDO;
1306  0028 1e0c          	ldw	x,(OFST-7,sp)
1307  002a a601          	ld	a,#1
1308  002c e709          	ld	(9,x),a
1312  002e ae0012        	ldw	x,#18
1315  0031 200a          	jra	L1401
1316  0033               L5301:
1317                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1321  0033 ae14d4        	ldw	x,#5332
1323  0036 9d            	nop	
1324  0037               L42:
1325  0037 5a            	decw	X
1326  0038 26fd          	jrne	L42
1327  003a 9d            	nop	
1328                     
1330  003b 1e0a          	ldw	x,(OFST-9,sp)
1331  003d               L1401:
1332                     ; 186 	while ( __ms-- )
1334  003d 5a            	decw	x
1335  003e 1f0a          	ldw	(OFST-9,sp),x
1336  0040 5c            	incw	x
1338  0041 26f0          	jrne	L5301
1339                     ; 133 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_IN_PU_NO_IT); //Configuro como entrada para leer
1341  0043 4b40          	push	#64
1342  0045 1e0d          	ldw	x,(OFST-6,sp)
1343  0047 cd0000        	call	_NHALgpioConfig_SetType
1345  004a 84            	pop	a
1346                     ; 134 	NHALgpio_Init( &sensor->Config.HW ); 
1348  004b 1e0c          	ldw	x,(OFST-7,sp)
1349  004d cd0000        	call	_NHALgpio_Init
1351                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1355  0050 ae00d4        	ldw	x,#212
1357  0053 9d            	nop	
1358  0054               L23:
1359  0054 5a            	decw	X
1360  0055 26fd          	jrne	L23
1361  0057 9d            	nop	
1362                     
1364                     ; 137 	Timeout_Start( sensor->Timeout, TIMEOUT_1MS );
1366  0058 ae03e8        	ldw	x,#1000
1367  005b 89            	pushw	x
1368  005c 1e0e          	ldw	x,(OFST-5,sp)
1369  005e ee0a          	ldw	x,(10,x)
1370  0060 cd0000        	call	_Timeout_Start
1372  0063 85            	popw	x
1374  0064 2006          	jra	L7401
1375  0066               L5401:
1376                     ; 140 		sensor->Datos.Estado = dht11_ESPERA_BAJO;
1378  0066 1e0c          	ldw	x,(OFST-7,sp)
1379  0068 a607          	ld	a,#7
1380  006a e709          	ld	(9,x),a
1381  006c               L7401:
1382                     ; 138 	while( !NHALgpio_Read( &sensor->Config.HW ) && ( sensor->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) )
1384  006c 1e0c          	ldw	x,(OFST-7,sp)
1385  006e cd0000        	call	_NHALgpio_Read
1387  0071 4d            	tnz	a
1388  0072 260c          	jrne	L3501
1390  0074 1e0c          	ldw	x,(OFST-7,sp)
1391  0076 ee0a          	ldw	x,(10,x)
1392  0078 ee02          	ldw	x,(2,x)
1393  007a fd            	call	(x)
1395  007b a301f4        	cpw	x,#500
1396  007e 25e6          	jrult	L5401
1397  0080               L3501:
1398                     ; 143 	if( sensor->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
1400  0080 1e0c          	ldw	x,(OFST-7,sp)
1401  0082 ee0a          	ldw	x,(10,x)
1402  0084 ee02          	ldw	x,(2,x)
1403  0086 fd            	call	(x)
1405  0087 a301f4        	cpw	x,#500
1406  008a 2506          	jrult	L5501
1407                     ; 145 		sensor->Datos.Estado = dht11_TIMEOUT;
1409  008c 1e0c          	ldw	x,(OFST-7,sp)
1410  008e a60c          	ld	a,#12
1411  0090 e709          	ld	(9,x),a
1412  0092               L5501:
1413                     ; 147 	Timeout_Stop( sensor->Timeout );
1415  0092 1e0c          	ldw	x,(OFST-7,sp)
1416  0094 ee0a          	ldw	x,(10,x)
1417  0096 cd0000        	call	_Timeout_Stop
1419                     ; 150 	if( sensor->Datos.Estado != dht11_TIMEOUT )
1421  0099 1e0c          	ldw	x,(OFST-7,sp)
1422  009b e609          	ld	a,(9,x)
1423  009d a10c          	cp	a,#12
1424  009f 2753          	jreq	L3701
1425                     ; 152 		Timeout_Start( sensor->Timeout, TIMEOUT_1MS );
1427  00a1 ae03e8        	ldw	x,#1000
1428  00a4 89            	pushw	x
1429  00a5 1e0e          	ldw	x,(OFST-5,sp)
1430  00a7 ee0a          	ldw	x,(10,x)
1431  00a9 cd0000        	call	_Timeout_Start
1433  00ac 85            	popw	x
1435  00ad 2006          	jra	L3601
1436  00af               L1601:
1437                     ; 155 			sensor->Datos.Estado = dht11_ESPERA_ALTO;
1439  00af 1e0c          	ldw	x,(OFST-7,sp)
1440  00b1 a608          	ld	a,#8
1441  00b3 e709          	ld	(9,x),a
1442  00b5               L3601:
1443                     ; 153 		while( NHALgpio_Read( &sensor->Config.HW ) && ( sensor->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) )
1445  00b5 1e0c          	ldw	x,(OFST-7,sp)
1446  00b7 cd0000        	call	_NHALgpio_Read
1448  00ba 4d            	tnz	a
1449  00bb 270c          	jreq	L7601
1451  00bd 1e0c          	ldw	x,(OFST-7,sp)
1452  00bf ee0a          	ldw	x,(10,x)
1453  00c1 ee02          	ldw	x,(2,x)
1454  00c3 fd            	call	(x)
1456  00c4 a301f4        	cpw	x,#500
1457  00c7 25e6          	jrult	L1601
1458  00c9               L7601:
1459                     ; 157 		if( sensor->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
1461  00c9 1e0c          	ldw	x,(OFST-7,sp)
1462  00cb ee0a          	ldw	x,(10,x)
1463  00cd ee02          	ldw	x,(2,x)
1464  00cf fd            	call	(x)
1466  00d0 a301f4        	cpw	x,#500
1467  00d3 2506          	jrult	L1701
1468                     ; 159 			sensor->Datos.Estado = dht11_TIMEOUT;
1470  00d5 1e0c          	ldw	x,(OFST-7,sp)
1471  00d7 a60c          	ld	a,#12
1472  00d9 e709          	ld	(9,x),a
1473  00db               L1701:
1474                     ; 161 		Timeout_Stop( sensor->Timeout );
1476  00db 1e0c          	ldw	x,(OFST-7,sp)
1477  00dd ee0a          	ldw	x,(10,x)
1478  00df cd0000        	call	_Timeout_Stop
1480                     ; 163 		if( sensor->Datos.Estado != dht11_TIMEOUT )
1482  00e2 1e0c          	ldw	x,(OFST-7,sp)
1483  00e4 e609          	ld	a,(9,x)
1484  00e6 a10c          	cp	a,#12
1485  00e8 270a          	jreq	L3701
1486                     ; 165 			sensor->Datos.Estado = dht11_CONEXION_OK;
1488  00ea a602          	ld	a,#2
1489  00ec e709          	ld	(9,x),a
1490                     ; 166 			return true;
1492  00ee a601          	ld	a,#1
1493  00f0 6b0e          	ld	(OFST-5,sp),a
1496  00f2 2002          	jra	L375
1497  00f4               L3701:
1498                     ; 170 			return false;
1500                     ; 175 		return false;
1503  00f4 0f0e          	clr	(OFST-5,sp)
1506  00f6               L375:
1508  00f6 2603cc03f9    	jreq	L3301
1509                     ; 324 		lectura = dht11_LeerDatos( dht11 );
1512  00fb 1e18          	ldw	x,(OFST+5,sp)
1513  00fd 1f0c          	ldw	(OFST-7,sp),x
1515                     ; 181 	uint16_t checkCRC = 0;
1517                     ; 182 	uint8_t mask = 0b11111111;
1519  00ff a6ff          	ld	a,#255
1520  0101 6b04          	ld	(OFST-15,sp),a
1522                     ; 184 	DHT11_SI_t semilla = { 0, 0, 0, 0, 0 };
1524  0103 96            	ldw	x,sp
1525  0104 1c0007        	addw	x,#OFST-12
1526  0107 90ae000a      	ldw	y,#L575_semilla
1527  010b a605          	ld	a,#5
1528  010d cd0000        	call	c_xymov
1530                     ; 186 	sensor->Datos.Estado = dht11_MIDIENDO_H;
1532  0110 1e0c          	ldw	x,(OFST-7,sp)
1533  0112 a603          	ld	a,#3
1534  0114 e709          	ld	(9,x),a
1535                     ; 76 	uint8_t contador = 0;
1538  0116 0f02          	clr	(OFST-17,sp)
1540                     ; 77 	uint8_t temp = 0;
1542  0118 0f01          	clr	(OFST-18,sp)
1544                     ; 78 	uint8_t bitLeido = 0;
1546                     ; 80 	for( contador; contador < 8; contador++ )
1549  011a 206b          	jra	L5011
1550  011c               L1011:
1551                     ; 82 		Timeout_Start( dht11->Timeout, TIMEOUT_1MS );
1553  011c ae03e8        	ldw	x,#1000
1554  011f 89            	pushw	x
1555  0120 1e0e          	ldw	x,(OFST-5,sp)
1556  0122 ee0a          	ldw	x,(10,x)
1557  0124 cd0000        	call	_Timeout_Start
1559  0127 85            	popw	x
1561  0128               L3111:
1562                     ; 83 		while( !NHALgpio_Read( &dht11->Config.HW ) && ( dht11->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) ) //Espera nuevo bit
1564  0128 1e0c          	ldw	x,(OFST-7,sp)
1565  012a cd0000        	call	_NHALgpio_Read
1567  012d 4d            	tnz	a
1568  012e 260c          	jrne	L7111
1570  0130 1e0c          	ldw	x,(OFST-7,sp)
1571  0132 ee0a          	ldw	x,(10,x)
1572  0134 ee02          	ldw	x,(2,x)
1573  0136 fd            	call	(x)
1575  0137 a301f4        	cpw	x,#500
1576  013a 25ec          	jrult	L3111
1577  013c               L7111:
1578                     ; 87 		if( dht11->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
1580  013c 1e0c          	ldw	x,(OFST-7,sp)
1581  013e ee0a          	ldw	x,(10,x)
1582  0140 ee02          	ldw	x,(2,x)
1583  0142 fd            	call	(x)
1585  0143 a301f4        	cpw	x,#500
1586  0146 2506          	jrult	L1211
1587                     ; 89 			dht11->Datos.Estado = dht11_TIMEOUT;
1589  0148 1e0c          	ldw	x,(OFST-7,sp)
1590  014a a60c          	ld	a,#12
1591  014c e709          	ld	(9,x),a
1592  014e               L1211:
1593                     ; 91 		Timeout_Stop( dht11->Timeout );
1595  014e 1e0c          	ldw	x,(OFST-7,sp)
1596  0150 ee0a          	ldw	x,(10,x)
1597  0152 cd0000        	call	_Timeout_Stop
1599                     ; 93 		if( dht11->Datos.Estado != dht11_TIMEOUT )
1601  0155 1e0c          	ldw	x,(OFST-7,sp)
1602  0157 e609          	ld	a,(9,x)
1603  0159 a10c          	cp	a,#12
1604  015b 2728          	jreq	L3211
1605                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1609  015d ae00d4        	ldw	x,#212
1611  0160 9d            	nop	
1612  0161               L27:
1613  0161 5a            	decw	X
1614  0162 26fd          	jrne	L27
1615  0164 9d            	nop	
1616                     
1618                     ; 97 			bitLeido = 0;
1620                     ; 98 			if( NHALgpio_Read( &dht11->Config.HW ) )
1622  0165 1e0c          	ldw	x,(OFST-7,sp)
1623  0167 cd0000        	call	_NHALgpio_Read
1625  016a 4d            	tnz	a
1626  016b 2702          	jreq	L5211
1627                     ; 100 				bitLeido = 1;
1629  016d a601          	ld	a,#1
1631  016f               L5211:
1632                     ; 104 				bitLeido = 0;
1634  016f 6b03          	ld	(OFST-16,sp),a
1636                     ; 107 			temp |= bitLeido;
1638  0171 1a01          	or	a,(OFST-18,sp)
1639  0173 6b01          	ld	(OFST-18,sp),a
1641                     ; 108 			if( contador < 7 )
1643  0175 7b02          	ld	a,(OFST-17,sp)
1644  0177 a107          	cp	a,#7
1645  0179 2402          	jruge	L5311
1646                     ; 110 				temp <<=  1;
1648  017b 0801          	sll	(OFST-18,sp)
1650  017d               L5311:
1651                     ; 113 			while( NHALgpio_Read( &dht11->Config.HW ) ) //Si el bit=1 espero a que baje señal
1653  017d 1e0c          	ldw	x,(OFST-7,sp)
1654  017f cd0000        	call	_NHALgpio_Read
1656  0182 4d            	tnz	a
1657  0183 26f8          	jrne	L5311
1658  0185               L3211:
1659                     ; 80 	for( contador; contador < 8; contador++ )
1661  0185 0c02          	inc	(OFST-17,sp)
1663  0187               L5011:
1666  0187 7b02          	ld	a,(OFST-17,sp)
1667  0189 a108          	cp	a,#8
1668  018b 258f          	jrult	L1011
1669                     ; 120 	return temp;
1671  018d 7b01          	ld	a,(OFST-18,sp)
1672  018f 6b0b          	ld	(OFST-8,sp),a
1676                     ; 189 	sensor->Datos.Estado = dht11_MIDIENDO_H;
1678  0191 1e0c          	ldw	x,(OFST-7,sp)
1679  0193 a603          	ld	a,#3
1680  0195 e709          	ld	(9,x),a
1681                     ; 76 	uint8_t contador = 0;
1684  0197 0f02          	clr	(OFST-17,sp)
1686                     ; 77 	uint8_t temp = 0;
1688  0199 0f01          	clr	(OFST-18,sp)
1690                     ; 78 	uint8_t bitLeido = 0;
1692                     ; 80 	for( contador; contador < 8; contador++ )
1695  019b 206b          	jra	L5411
1696  019d               L1411:
1697                     ; 82 		Timeout_Start( dht11->Timeout, TIMEOUT_1MS );
1699  019d ae03e8        	ldw	x,#1000
1700  01a0 89            	pushw	x
1701  01a1 1e0e          	ldw	x,(OFST-5,sp)
1702  01a3 ee0a          	ldw	x,(10,x)
1703  01a5 cd0000        	call	_Timeout_Start
1705  01a8 85            	popw	x
1707  01a9               L3511:
1708                     ; 83 		while( !NHALgpio_Read( &dht11->Config.HW ) && ( dht11->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) ) //Espera nuevo bit
1710  01a9 1e0c          	ldw	x,(OFST-7,sp)
1711  01ab cd0000        	call	_NHALgpio_Read
1713  01ae 4d            	tnz	a
1714  01af 260c          	jrne	L7511
1716  01b1 1e0c          	ldw	x,(OFST-7,sp)
1717  01b3 ee0a          	ldw	x,(10,x)
1718  01b5 ee02          	ldw	x,(2,x)
1719  01b7 fd            	call	(x)
1721  01b8 a301f4        	cpw	x,#500
1722  01bb 25ec          	jrult	L3511
1723  01bd               L7511:
1724                     ; 87 		if( dht11->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
1726  01bd 1e0c          	ldw	x,(OFST-7,sp)
1727  01bf ee0a          	ldw	x,(10,x)
1728  01c1 ee02          	ldw	x,(2,x)
1729  01c3 fd            	call	(x)
1731  01c4 a301f4        	cpw	x,#500
1732  01c7 2506          	jrult	L1611
1733                     ; 89 			dht11->Datos.Estado = dht11_TIMEOUT;
1735  01c9 1e0c          	ldw	x,(OFST-7,sp)
1736  01cb a60c          	ld	a,#12
1737  01cd e709          	ld	(9,x),a
1738  01cf               L1611:
1739                     ; 91 		Timeout_Stop( dht11->Timeout );
1741  01cf 1e0c          	ldw	x,(OFST-7,sp)
1742  01d1 ee0a          	ldw	x,(10,x)
1743  01d3 cd0000        	call	_Timeout_Stop
1745                     ; 93 		if( dht11->Datos.Estado != dht11_TIMEOUT )
1747  01d6 1e0c          	ldw	x,(OFST-7,sp)
1748  01d8 e609          	ld	a,(9,x)
1749  01da a10c          	cp	a,#12
1750  01dc 2728          	jreq	L3611
1751                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1755  01de ae00d4        	ldw	x,#212
1757  01e1 9d            	nop	
1758  01e2               L211:
1759  01e2 5a            	decw	X
1760  01e3 26fd          	jrne	L211
1761  01e5 9d            	nop	
1762                     
1764                     ; 97 			bitLeido = 0;
1766                     ; 98 			if( NHALgpio_Read( &dht11->Config.HW ) )
1768  01e6 1e0c          	ldw	x,(OFST-7,sp)
1769  01e8 cd0000        	call	_NHALgpio_Read
1771  01eb 4d            	tnz	a
1772  01ec 2702          	jreq	L5611
1773                     ; 100 				bitLeido = 1;
1775  01ee a601          	ld	a,#1
1777  01f0               L5611:
1778                     ; 104 				bitLeido = 0;
1780  01f0 6b03          	ld	(OFST-16,sp),a
1782                     ; 107 			temp |= bitLeido;
1784  01f2 1a01          	or	a,(OFST-18,sp)
1785  01f4 6b01          	ld	(OFST-18,sp),a
1787                     ; 108 			if( contador < 7 )
1789  01f6 7b02          	ld	a,(OFST-17,sp)
1790  01f8 a107          	cp	a,#7
1791  01fa 2402          	jruge	L5711
1792                     ; 110 				temp <<=  1;
1794  01fc 0801          	sll	(OFST-18,sp)
1796  01fe               L5711:
1797                     ; 113 			while( NHALgpio_Read( &dht11->Config.HW ) ) //Si el bit=1 espero a que baje señal
1799  01fe 1e0c          	ldw	x,(OFST-7,sp)
1800  0200 cd0000        	call	_NHALgpio_Read
1802  0203 4d            	tnz	a
1803  0204 26f8          	jrne	L5711
1804  0206               L3611:
1805                     ; 80 	for( contador; contador < 8; contador++ )
1807  0206 0c02          	inc	(OFST-17,sp)
1809  0208               L5411:
1812  0208 7b02          	ld	a,(OFST-17,sp)
1813  020a a108          	cp	a,#8
1814  020c 258f          	jrult	L1411
1815                     ; 120 	return temp;
1817  020e 7b01          	ld	a,(OFST-18,sp)
1818  0210 6b0a          	ld	(OFST-9,sp),a
1822                     ; 192 	sensor->Datos.Estado = dht11_MIDIENDO_T;
1824  0212 1e0c          	ldw	x,(OFST-7,sp)
1825  0214 a604          	ld	a,#4
1826  0216 e709          	ld	(9,x),a
1827                     ; 76 	uint8_t contador = 0;
1830  0218 0f02          	clr	(OFST-17,sp)
1832                     ; 77 	uint8_t temp = 0;
1834  021a 0f01          	clr	(OFST-18,sp)
1836                     ; 78 	uint8_t bitLeido = 0;
1838                     ; 80 	for( contador; contador < 8; contador++ )
1841  021c 206b          	jra	L5021
1842  021e               L1021:
1843                     ; 82 		Timeout_Start( dht11->Timeout, TIMEOUT_1MS );
1845  021e ae03e8        	ldw	x,#1000
1846  0221 89            	pushw	x
1847  0222 1e0e          	ldw	x,(OFST-5,sp)
1848  0224 ee0a          	ldw	x,(10,x)
1849  0226 cd0000        	call	_Timeout_Start
1851  0229 85            	popw	x
1853  022a               L3121:
1854                     ; 83 		while( !NHALgpio_Read( &dht11->Config.HW ) && ( dht11->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) ) //Espera nuevo bit
1856  022a 1e0c          	ldw	x,(OFST-7,sp)
1857  022c cd0000        	call	_NHALgpio_Read
1859  022f 4d            	tnz	a
1860  0230 260c          	jrne	L7121
1862  0232 1e0c          	ldw	x,(OFST-7,sp)
1863  0234 ee0a          	ldw	x,(10,x)
1864  0236 ee02          	ldw	x,(2,x)
1865  0238 fd            	call	(x)
1867  0239 a301f4        	cpw	x,#500
1868  023c 25ec          	jrult	L3121
1869  023e               L7121:
1870                     ; 87 		if( dht11->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
1872  023e 1e0c          	ldw	x,(OFST-7,sp)
1873  0240 ee0a          	ldw	x,(10,x)
1874  0242 ee02          	ldw	x,(2,x)
1875  0244 fd            	call	(x)
1877  0245 a301f4        	cpw	x,#500
1878  0248 2506          	jrult	L1221
1879                     ; 89 			dht11->Datos.Estado = dht11_TIMEOUT;
1881  024a 1e0c          	ldw	x,(OFST-7,sp)
1882  024c a60c          	ld	a,#12
1883  024e e709          	ld	(9,x),a
1884  0250               L1221:
1885                     ; 91 		Timeout_Stop( dht11->Timeout );
1887  0250 1e0c          	ldw	x,(OFST-7,sp)
1888  0252 ee0a          	ldw	x,(10,x)
1889  0254 cd0000        	call	_Timeout_Stop
1891                     ; 93 		if( dht11->Datos.Estado != dht11_TIMEOUT )
1893  0257 1e0c          	ldw	x,(OFST-7,sp)
1894  0259 e609          	ld	a,(9,x)
1895  025b a10c          	cp	a,#12
1896  025d 2728          	jreq	L3221
1897                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1901  025f ae00d4        	ldw	x,#212
1903  0262 9d            	nop	
1904  0263               L231:
1905  0263 5a            	decw	X
1906  0264 26fd          	jrne	L231
1907  0266 9d            	nop	
1908                     
1910                     ; 97 			bitLeido = 0;
1912                     ; 98 			if( NHALgpio_Read( &dht11->Config.HW ) )
1914  0267 1e0c          	ldw	x,(OFST-7,sp)
1915  0269 cd0000        	call	_NHALgpio_Read
1917  026c 4d            	tnz	a
1918  026d 2702          	jreq	L5221
1919                     ; 100 				bitLeido = 1;
1921  026f a601          	ld	a,#1
1923  0271               L5221:
1924                     ; 104 				bitLeido = 0;
1926  0271 6b03          	ld	(OFST-16,sp),a
1928                     ; 107 			temp |= bitLeido;
1930  0273 1a01          	or	a,(OFST-18,sp)
1931  0275 6b01          	ld	(OFST-18,sp),a
1933                     ; 108 			if( contador < 7 )
1935  0277 7b02          	ld	a,(OFST-17,sp)
1936  0279 a107          	cp	a,#7
1937  027b 2402          	jruge	L5321
1938                     ; 110 				temp <<=  1;
1940  027d 0801          	sll	(OFST-18,sp)
1942  027f               L5321:
1943                     ; 113 			while( NHALgpio_Read( &dht11->Config.HW ) ) //Si el bit=1 espero a que baje señal
1945  027f 1e0c          	ldw	x,(OFST-7,sp)
1946  0281 cd0000        	call	_NHALgpio_Read
1948  0284 4d            	tnz	a
1949  0285 26f8          	jrne	L5321
1950  0287               L3221:
1951                     ; 80 	for( contador; contador < 8; contador++ )
1953  0287 0c02          	inc	(OFST-17,sp)
1955  0289               L5021:
1958  0289 7b02          	ld	a,(OFST-17,sp)
1959  028b a108          	cp	a,#8
1960  028d 258f          	jrult	L1021
1961                     ; 120 	return temp;
1963  028f 7b01          	ld	a,(OFST-18,sp)
1964  0291 6b09          	ld	(OFST-10,sp),a
1968                     ; 195 	sensor->Datos.Estado = dht11_MIDIENDO_T;
1970  0293 1e0c          	ldw	x,(OFST-7,sp)
1971  0295 a604          	ld	a,#4
1972  0297 e709          	ld	(9,x),a
1973                     ; 76 	uint8_t contador = 0;
1976  0299 0f02          	clr	(OFST-17,sp)
1978                     ; 77 	uint8_t temp = 0;
1980  029b 0f01          	clr	(OFST-18,sp)
1982                     ; 78 	uint8_t bitLeido = 0;
1984                     ; 80 	for( contador; contador < 8; contador++ )
1987  029d 206b          	jra	L5421
1988  029f               L1421:
1989                     ; 82 		Timeout_Start( dht11->Timeout, TIMEOUT_1MS );
1991  029f ae03e8        	ldw	x,#1000
1992  02a2 89            	pushw	x
1993  02a3 1e0e          	ldw	x,(OFST-5,sp)
1994  02a5 ee0a          	ldw	x,(10,x)
1995  02a7 cd0000        	call	_Timeout_Start
1997  02aa 85            	popw	x
1999  02ab               L3521:
2000                     ; 83 		while( !NHALgpio_Read( &dht11->Config.HW ) && ( dht11->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) ) //Espera nuevo bit
2002  02ab 1e0c          	ldw	x,(OFST-7,sp)
2003  02ad cd0000        	call	_NHALgpio_Read
2005  02b0 4d            	tnz	a
2006  02b1 260c          	jrne	L7521
2008  02b3 1e0c          	ldw	x,(OFST-7,sp)
2009  02b5 ee0a          	ldw	x,(10,x)
2010  02b7 ee02          	ldw	x,(2,x)
2011  02b9 fd            	call	(x)
2013  02ba a301f4        	cpw	x,#500
2014  02bd 25ec          	jrult	L3521
2015  02bf               L7521:
2016                     ; 87 		if( dht11->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
2018  02bf 1e0c          	ldw	x,(OFST-7,sp)
2019  02c1 ee0a          	ldw	x,(10,x)
2020  02c3 ee02          	ldw	x,(2,x)
2021  02c5 fd            	call	(x)
2023  02c6 a301f4        	cpw	x,#500
2024  02c9 2506          	jrult	L1621
2025                     ; 89 			dht11->Datos.Estado = dht11_TIMEOUT;
2027  02cb 1e0c          	ldw	x,(OFST-7,sp)
2028  02cd a60c          	ld	a,#12
2029  02cf e709          	ld	(9,x),a
2030  02d1               L1621:
2031                     ; 91 		Timeout_Stop( dht11->Timeout );
2033  02d1 1e0c          	ldw	x,(OFST-7,sp)
2034  02d3 ee0a          	ldw	x,(10,x)
2035  02d5 cd0000        	call	_Timeout_Stop
2037                     ; 93 		if( dht11->Datos.Estado != dht11_TIMEOUT )
2039  02d8 1e0c          	ldw	x,(OFST-7,sp)
2040  02da e609          	ld	a,(9,x)
2041  02dc a10c          	cp	a,#12
2042  02de 2728          	jreq	L3621
2043                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2047  02e0 ae00d4        	ldw	x,#212
2049  02e3 9d            	nop	
2050  02e4               L251:
2051  02e4 5a            	decw	X
2052  02e5 26fd          	jrne	L251
2053  02e7 9d            	nop	
2054                     
2056                     ; 97 			bitLeido = 0;
2058                     ; 98 			if( NHALgpio_Read( &dht11->Config.HW ) )
2060  02e8 1e0c          	ldw	x,(OFST-7,sp)
2061  02ea cd0000        	call	_NHALgpio_Read
2063  02ed 4d            	tnz	a
2064  02ee 2702          	jreq	L5621
2065                     ; 100 				bitLeido = 1;
2067  02f0 a601          	ld	a,#1
2069  02f2               L5621:
2070                     ; 104 				bitLeido = 0;
2072  02f2 6b03          	ld	(OFST-16,sp),a
2074                     ; 107 			temp |= bitLeido;
2076  02f4 1a01          	or	a,(OFST-18,sp)
2077  02f6 6b01          	ld	(OFST-18,sp),a
2079                     ; 108 			if( contador < 7 )
2081  02f8 7b02          	ld	a,(OFST-17,sp)
2082  02fa a107          	cp	a,#7
2083  02fc 2402          	jruge	L5721
2084                     ; 110 				temp <<=  1;
2086  02fe 0801          	sll	(OFST-18,sp)
2088  0300               L5721:
2089                     ; 113 			while( NHALgpio_Read( &dht11->Config.HW ) ) //Si el bit=1 espero a que baje señal
2091  0300 1e0c          	ldw	x,(OFST-7,sp)
2092  0302 cd0000        	call	_NHALgpio_Read
2094  0305 4d            	tnz	a
2095  0306 26f8          	jrne	L5721
2096  0308               L3621:
2097                     ; 80 	for( contador; contador < 8; contador++ )
2099  0308 0c02          	inc	(OFST-17,sp)
2101  030a               L5421:
2104  030a 7b02          	ld	a,(OFST-17,sp)
2105  030c a108          	cp	a,#8
2106  030e 258f          	jrult	L1421
2107                     ; 120 	return temp;
2109  0310 7b01          	ld	a,(OFST-18,sp)
2110  0312 6b08          	ld	(OFST-11,sp),a
2114                     ; 76 	uint8_t contador = 0;
2117  0314 0f02          	clr	(OFST-17,sp)
2119                     ; 77 	uint8_t temp = 0;
2121  0316 0f01          	clr	(OFST-18,sp)
2123                     ; 78 	uint8_t bitLeido = 0;
2125                     ; 80 	for( contador; contador < 8; contador++ )
2128  0318 206b          	jra	L5031
2129  031a               L1031:
2130                     ; 82 		Timeout_Start( dht11->Timeout, TIMEOUT_1MS );
2132  031a ae03e8        	ldw	x,#1000
2133  031d 89            	pushw	x
2134  031e 1e0e          	ldw	x,(OFST-5,sp)
2135  0320 ee0a          	ldw	x,(10,x)
2136  0322 cd0000        	call	_Timeout_Start
2138  0325 85            	popw	x
2140  0326               L3131:
2141                     ; 83 		while( !NHALgpio_Read( &dht11->Config.HW ) && ( dht11->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) ) //Espera nuevo bit
2143  0326 1e0c          	ldw	x,(OFST-7,sp)
2144  0328 cd0000        	call	_NHALgpio_Read
2146  032b 4d            	tnz	a
2147  032c 260c          	jrne	L7131
2149  032e 1e0c          	ldw	x,(OFST-7,sp)
2150  0330 ee0a          	ldw	x,(10,x)
2151  0332 ee02          	ldw	x,(2,x)
2152  0334 fd            	call	(x)
2154  0335 a301f4        	cpw	x,#500
2155  0338 25ec          	jrult	L3131
2156  033a               L7131:
2157                     ; 87 		if( dht11->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
2159  033a 1e0c          	ldw	x,(OFST-7,sp)
2160  033c ee0a          	ldw	x,(10,x)
2161  033e ee02          	ldw	x,(2,x)
2162  0340 fd            	call	(x)
2164  0341 a301f4        	cpw	x,#500
2165  0344 2506          	jrult	L1231
2166                     ; 89 			dht11->Datos.Estado = dht11_TIMEOUT;
2168  0346 1e0c          	ldw	x,(OFST-7,sp)
2169  0348 a60c          	ld	a,#12
2170  034a e709          	ld	(9,x),a
2171  034c               L1231:
2172                     ; 91 		Timeout_Stop( dht11->Timeout );
2174  034c 1e0c          	ldw	x,(OFST-7,sp)
2175  034e ee0a          	ldw	x,(10,x)
2176  0350 cd0000        	call	_Timeout_Stop
2178                     ; 93 		if( dht11->Datos.Estado != dht11_TIMEOUT )
2180  0353 1e0c          	ldw	x,(OFST-7,sp)
2181  0355 e609          	ld	a,(9,x)
2182  0357 a10c          	cp	a,#12
2183  0359 2728          	jreq	L3231
2184                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2188  035b ae00d4        	ldw	x,#212
2190  035e 9d            	nop	
2191  035f               L271:
2192  035f 5a            	decw	X
2193  0360 26fd          	jrne	L271
2194  0362 9d            	nop	
2195                     
2197                     ; 97 			bitLeido = 0;
2199                     ; 98 			if( NHALgpio_Read( &dht11->Config.HW ) )
2201  0363 1e0c          	ldw	x,(OFST-7,sp)
2202  0365 cd0000        	call	_NHALgpio_Read
2204  0368 4d            	tnz	a
2205  0369 2702          	jreq	L5231
2206                     ; 100 				bitLeido = 1;
2208  036b a601          	ld	a,#1
2210  036d               L5231:
2211                     ; 104 				bitLeido = 0;
2213  036d 6b03          	ld	(OFST-16,sp),a
2215                     ; 107 			temp |= bitLeido;
2217  036f 1a01          	or	a,(OFST-18,sp)
2218  0371 6b01          	ld	(OFST-18,sp),a
2220                     ; 108 			if( contador < 7 )
2222  0373 7b02          	ld	a,(OFST-17,sp)
2223  0375 a107          	cp	a,#7
2224  0377 2402          	jruge	L5331
2225                     ; 110 				temp <<=  1;
2227  0379 0801          	sll	(OFST-18,sp)
2229  037b               L5331:
2230                     ; 113 			while( NHALgpio_Read( &dht11->Config.HW ) ) //Si el bit=1 espero a que baje señal
2232  037b 1e0c          	ldw	x,(OFST-7,sp)
2233  037d cd0000        	call	_NHALgpio_Read
2235  0380 4d            	tnz	a
2236  0381 26f8          	jrne	L5331
2237  0383               L3231:
2238                     ; 80 	for( contador; contador < 8; contador++ )
2240  0383 0c02          	inc	(OFST-17,sp)
2242  0385               L5031:
2245  0385 7b02          	ld	a,(OFST-17,sp)
2246  0387 a108          	cp	a,#8
2247  0389 258f          	jrult	L1031
2248                     ; 120 	return temp;
2250  038b 7b01          	ld	a,(OFST-18,sp)
2251  038d 6b07          	ld	(OFST-12,sp),a
2255                     ; 200 	checkCRC = semilla.H_Entero + semilla.H_Decimal + semilla.T_Entero + semilla.T_Decimal;
2257  038f 5f            	clrw	x
2258  0390 7b0b          	ld	a,(OFST-8,sp)
2259  0392 1b0a          	add	a,(OFST-9,sp)
2260  0394 59            	rlcw	x
2261  0395 1b09          	add	a,(OFST-10,sp)
2262  0397 2401          	jrnc	L202
2263  0399 5c            	incw	x
2264  039a               L202:
2265  039a 1b08          	add	a,(OFST-11,sp)
2266  039c 2401          	jrnc	L402
2267  039e 5c            	incw	x
2268  039f               L402:
2269  039f 02            	rlwa	x,a
2270  03a0 1f05          	ldw	(OFST-14,sp),x
2272                     ; 201 	checkCRC &= mask;
2274  03a2 5f            	clrw	x
2275  03a3 7b04          	ld	a,(OFST-15,sp)
2276  03a5 97            	ld	xl,a
2277  03a6 01            	rrwa	x,a
2278  03a7 1406          	and	a,(OFST-13,sp)
2279  03a9 01            	rrwa	x,a
2280  03aa 1405          	and	a,(OFST-14,sp)
2281  03ac 01            	rrwa	x,a
2282  03ad 1f05          	ldw	(OFST-14,sp),x
2284                     ; 203 	if( checkCRC == semilla.CRC )
2286  03af 5f            	clrw	x
2287  03b0 7b07          	ld	a,(OFST-12,sp)
2288  03b2 97            	ld	xl,a
2289  03b3 bf00          	ldw	c_x,x
2290  03b5 1e05          	ldw	x,(OFST-14,sp)
2291  03b7 b300          	cpw	x,c_x
2292  03b9 2606          	jrne	L1431
2293                     ; 205 		sensor->Datos.Estado = dht11_LECTURA_OK;
2295  03bb 1e0c          	ldw	x,(OFST-7,sp)
2296  03bd a60b          	ld	a,#11
2297                     ; 206 		return semilla;
2300  03bf 2004          	jra	L536
2301  03c1               L1431:
2302                     ; 210 		sensor->Datos.Estado = dht11_FALLO_AL_LEER;
2304  03c1 1e0c          	ldw	x,(OFST-7,sp)
2305  03c3 a609          	ld	a,#9
2306                     ; 211 		return semilla;
2310  03c5               L536:
2311  03c5 e709          	ld	(9,x),a
2313  03c7 96            	ldw	x,sp
2314  03c8 1c000f        	addw	x,#OFST-4
2315  03cb 9096          	ldw	y,sp
2316  03cd 72a90007      	addw	y,#OFST-12
2317  03d1 a605          	ld	a,#5
2318  03d3 cd0000        	call	c_xymov
2320                     ; 325 		dht11_CerrarConexion( dht11 );
2323  03d6 1e18          	ldw	x,(OFST+5,sp)
2324  03d8 1f0c          	ldw	(OFST-7,sp),x
2326                     ; 217 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
2328  03da 4bc0          	push	#192
2329  03dc 1e0d          	ldw	x,(OFST-6,sp)
2330  03de cd0000        	call	_NHALgpioConfig_SetType
2332  03e1 84            	pop	a
2333                     ; 218 	NHALgpio_Init( &sensor->Config.HW );
2335  03e2 1e0c          	ldw	x,(OFST-7,sp)
2336  03e4 cd0000        	call	_NHALgpio_Init
2338                     ; 220 	NHALgpio_Write( &sensor->Config.HW, true );
2340  03e7 4b01          	push	#1
2341  03e9 1e0d          	ldw	x,(OFST-6,sp)
2342  03eb cd0000        	call	_NHALgpio_Write
2344  03ee 84            	pop	a
2345                     ; 222 	if( sensor->Datos.Estado == dht11_CERRANDO_CONEXION )
2347  03ef 1e0c          	ldw	x,(OFST-7,sp)
2348  03f1 e609          	ld	a,(9,x)
2349  03f3 a105          	cp	a,#5
2350  03f5 262b          	jrne	L146
2351                     ; 224 		sensor->Datos.Estado = dht11_SLEEP;
2352                     ; 327 		return lectura;
2355  03f7 2025          	jp	LC002
2356  03f9               L3301:
2357                     ; 331 		dht11->Datos.Estado = dht11_FALLO_AL_COMUNICAR;
2359  03f9 1e18          	ldw	x,(OFST+5,sp)
2360  03fb a60a          	ld	a,#10
2361  03fd e709          	ld	(9,x),a
2362                     ; 332 		dht11_CerrarConexion( dht11 );
2365  03ff 1f0c          	ldw	(OFST-7,sp),x
2367                     ; 217 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
2369  0401 4bc0          	push	#192
2370  0403 1e0d          	ldw	x,(OFST-6,sp)
2371  0405 cd0000        	call	_NHALgpioConfig_SetType
2373  0408 84            	pop	a
2374                     ; 218 	NHALgpio_Init( &sensor->Config.HW );
2376  0409 1e0c          	ldw	x,(OFST-7,sp)
2377  040b cd0000        	call	_NHALgpio_Init
2379                     ; 220 	NHALgpio_Write( &sensor->Config.HW, true );
2381  040e 4b01          	push	#1
2382  0410 1e0d          	ldw	x,(OFST-6,sp)
2383  0412 cd0000        	call	_NHALgpio_Write
2385  0415 84            	pop	a
2386                     ; 222 	if( sensor->Datos.Estado == dht11_CERRANDO_CONEXION )
2388  0416 1e0c          	ldw	x,(OFST-7,sp)
2389  0418 e609          	ld	a,(9,x)
2390  041a a105          	cp	a,#5
2391  041c 2604          	jrne	L146
2392                     ; 224 		sensor->Datos.Estado = dht11_SLEEP;
2394  041e               LC002:
2396  041e a606          	ld	a,#6
2397  0420 e709          	ld	(9,x),a
2398  0422               L146:
2399                     ; 334 		return lectura;
2404  0422 1e16          	ldw	x,(OFST+3,sp)
2405  0424 9096          	ldw	y,sp
2406  0426 72a9000f      	addw	y,#OFST-4
2407  042a a605          	ld	a,#5
2408  042c cd0000        	call	c_xymov
2410  042f 5b13          	addw	sp,#19
2411  0431 81            	ret	
2424                     	xdef	_dht11_Lectura
2425                     	xdef	_DHT11_Init
2426                     	xref	_Timeout_Stop
2427                     	xref	_Timeout_Start
2428                     	xref	_NHALgpio_Write
2429                     	xref	_NHALgpio_Read
2430                     	xref	_NHALgpio_Init
2431                     	xref	_NHALgpioConfig_SetType
2432                     	xref.b	c_x
2451                     	xref	c_xymov
2452                     	end

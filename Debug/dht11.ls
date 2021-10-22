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
  83                     .const:	section	.text
  84  0000               L56_semilla:
  85  0000 00            	dc.b	0
  86  0001 00            	dc.b	0
  87  0002 00            	dc.b	0
  88  0003 00            	dc.b	0
  89  0004 00            	dc.b	0
 925                     ; 402 void DHT11_Init( DHT11_t_ptr dht11, DHT11_fPtr Lectura, Timeout_t_ptr Timeout )
 925                     ; 403 {
 927                     .text:	section	.text,new
 928  0000               _DHT11_Init:
 930  0000 89            	pushw	x
 931       00000000      OFST:	set	0
 934                     ; 404 	dht11->Lectura = Lectura;
 936  0001 1605          	ldw	y,(OFST+5,sp)
 937  0003 ef0c          	ldw	(12,x),y
 938                     ; 406 	dht11->Timeout = Timeout;
 940  0005 1607          	ldw	y,(OFST+7,sp)
 941  0007 ef0a          	ldw	(10,x),y
 942                     ; 408 	dht11->Datos.UltimaLectura.CRC = 0;
 944  0009 6f04          	clr	(4,x)
 945                     ; 409 	dht11->Datos.UltimaLectura.T_Decimal = 1;
 947  000b a601          	ld	a,#1
 948  000d e705          	ld	(5,x),a
 949                     ; 410 	dht11->Datos.UltimaLectura.T_Entero = 2;
 951  000f 4c            	inc	a
 952  0010 e706          	ld	(6,x),a
 953                     ; 411 	dht11->Datos.UltimaLectura.H_Decimal = 3;
 955  0012 4c            	inc	a
 956  0013 e707          	ld	(7,x),a
 957                     ; 412 	dht11->Datos.UltimaLectura.H_Entero = 4;
 959  0015 4c            	inc	a
 960  0016 e708          	ld	(8,x),a
 961                     ; 414 	NHALgpioConfig_SetType( &dht11->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
 963  0018 4bc0          	push	#192
 964  001a cd0000        	call	_NHALgpioConfig_SetType
 966  001d 84            	pop	a
 967                     ; 415 	NHALgpio_Init( &dht11->Config.HW );
 969  001e 1e01          	ldw	x,(OFST+1,sp)
 970  0020 cd0000        	call	_NHALgpio_Init
 972                     ; 417 	NHALgpio_Write( &dht11->Config.HW, true );
 974  0023 4b01          	push	#1
 975  0025 1e02          	ldw	x,(OFST+2,sp)
 976  0027 cd0000        	call	_NHALgpio_Write
 978  002a 84            	pop	a
 979                     ; 419 	dht11->Datos.Estado = dht11_INICIALIZADO;
 981  002b 1e01          	ldw	x,(OFST+1,sp)
 982  002d 6f09          	clr	(9,x)
 983                     ; 421 }
 986  002f 85            	popw	x
 987  0030 81            	ret	
 990                     	switch	.const
 991  0005               L175_lectura:
 992  0005 00            	dc.b	0
 993  0006 00            	dc.b	0
 994  0007 00            	dc.b	0
 995  0008 00            	dc.b	0
 996  0009 00            	dc.b	0
 997  000a               L706_semilla:
 998  000a 00            	dc.b	0
 999  000b 00            	dc.b	0
1000  000c 00            	dc.b	0
1001  000d 00            	dc.b	0
1002  000e 00            	dc.b	0
1288                     ; 457 DHT11_SI_t dht11_Lectura( DHT11_t_ptr dht11 )
1288                     ; 458 {
1289                     .text:	section	.text,new
1290  0000               _dht11_Lectura:
1292  0000 5213          	subw	sp,#19
1293       00000013      OFST:	set	19
1296                     ; 459 	DHT11_SI_t lectura = { 0, 0, 0, 0, 0 };
1298  0002 96            	ldw	x,sp
1299  0003 1c000f        	addw	x,#OFST-4
1300  0006 90ae0005      	ldw	y,#L175_lectura
1301  000a a605          	ld	a,#5
1302  000c cd0000        	call	c_xymov
1304                     ; 461 	if( dht11_ComenzarTransmision( dht11 ) )
1307  000f 1e18          	ldw	x,(OFST+5,sp)
1308  0011 1f0c          	ldw	(OFST-7,sp),x
1310                     ; 194 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
1312  0013 4bc0          	push	#192
1313  0015 1e0d          	ldw	x,(OFST-6,sp)
1314  0017 cd0000        	call	_NHALgpioConfig_SetType
1316  001a 84            	pop	a
1317                     ; 195 	NHALgpio_Init( &sensor->Config.HW ); 
1319  001b 1e0c          	ldw	x,(OFST-7,sp)
1320  001d cd0000        	call	_NHALgpio_Init
1322                     ; 197 	NHALgpio_Write( &sensor->Config.HW, false );
1324  0020 4b00          	push	#0
1325  0022 1e0d          	ldw	x,(OFST-6,sp)
1326  0024 cd0000        	call	_NHALgpio_Write
1328  0027 84            	pop	a
1329                     ; 199 	sensor->Datos.Estado = dht11_COMUNICANDO;
1331  0028 1e0c          	ldw	x,(OFST-7,sp)
1332  002a a601          	ld	a,#1
1333  002c e709          	ld	(9,x),a
1337  002e ae0012        	ldw	x,#18
1340  0031 200a          	jra	L3501
1341  0033               L7401:
1342                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1346  0033 ae14d4        	ldw	x,#5332
1348  0036 9d            	nop	
1349  0037               L42:
1350  0037 5a            	decw	X
1351  0038 26fd          	jrne	L42
1352  003a 9d            	nop	
1353                     
1355  003b 1e0a          	ldw	x,(OFST-9,sp)
1356  003d               L3501:
1357                     ; 186 	while ( __ms-- )
1359  003d 5a            	decw	x
1360  003e 1f0a          	ldw	(OFST-9,sp),x
1361  0040 5c            	incw	x
1363  0041 26f0          	jrne	L7401
1364                     ; 202 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_IN_PU_NO_IT); //Configuro como entrada para leer
1366  0043 4b40          	push	#64
1367  0045 1e0d          	ldw	x,(OFST-6,sp)
1368  0047 cd0000        	call	_NHALgpioConfig_SetType
1370  004a 84            	pop	a
1371                     ; 203 	NHALgpio_Init( &sensor->Config.HW ); 
1373  004b 1e0c          	ldw	x,(OFST-7,sp)
1374  004d cd0000        	call	_NHALgpio_Init
1376                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1380  0050 ae00d4        	ldw	x,#212
1382  0053 9d            	nop	
1383  0054               L23:
1384  0054 5a            	decw	X
1385  0055 26fd          	jrne	L23
1386  0057 9d            	nop	
1387                     
1389                     ; 206 	Timeout_Start( sensor->Timeout, TIMEOUT_1MS );
1391  0058 ae03e8        	ldw	x,#1000
1392  005b 89            	pushw	x
1393  005c 1e0e          	ldw	x,(OFST-5,sp)
1394  005e ee0a          	ldw	x,(10,x)
1395  0060 cd0000        	call	_Timeout_Start
1397  0063 85            	popw	x
1399  0064 2006          	jra	L1601
1400  0066               L7501:
1401                     ; 209 		sensor->Datos.Estado = dht11_ESPERA_BAJO;
1403  0066 1e0c          	ldw	x,(OFST-7,sp)
1404  0068 a607          	ld	a,#7
1405  006a e709          	ld	(9,x),a
1406  006c               L1601:
1407                     ; 207 	while( !NHALgpio_Read( &sensor->Config.HW ) && ( sensor->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) )
1409  006c 1e0c          	ldw	x,(OFST-7,sp)
1410  006e cd0000        	call	_NHALgpio_Read
1412  0071 4d            	tnz	a
1413  0072 260c          	jrne	L5601
1415  0074 1e0c          	ldw	x,(OFST-7,sp)
1416  0076 ee0a          	ldw	x,(10,x)
1417  0078 ee02          	ldw	x,(2,x)
1418  007a fd            	call	(x)
1420  007b a301f4        	cpw	x,#500
1421  007e 25e6          	jrult	L7501
1422  0080               L5601:
1423                     ; 212 	if( sensor->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
1425  0080 1e0c          	ldw	x,(OFST-7,sp)
1426  0082 ee0a          	ldw	x,(10,x)
1427  0084 ee02          	ldw	x,(2,x)
1428  0086 fd            	call	(x)
1430  0087 a301f4        	cpw	x,#500
1431  008a 2506          	jrult	L7601
1432                     ; 214 		sensor->Datos.Estado = dht11_TIMEOUT;
1434  008c 1e0c          	ldw	x,(OFST-7,sp)
1435  008e a60c          	ld	a,#12
1436  0090 e709          	ld	(9,x),a
1437  0092               L7601:
1438                     ; 216 	Timeout_Stop( sensor->Timeout );
1440  0092 1e0c          	ldw	x,(OFST-7,sp)
1441  0094 ee0a          	ldw	x,(10,x)
1442  0096 cd0000        	call	_Timeout_Stop
1444                     ; 219 	if( sensor->Datos.Estado != dht11_TIMEOUT )
1446  0099 1e0c          	ldw	x,(OFST-7,sp)
1447  009b e609          	ld	a,(9,x)
1448  009d a10c          	cp	a,#12
1449  009f 2753          	jreq	L5011
1450                     ; 221 		Timeout_Start( sensor->Timeout, TIMEOUT_1MS );
1452  00a1 ae03e8        	ldw	x,#1000
1453  00a4 89            	pushw	x
1454  00a5 1e0e          	ldw	x,(OFST-5,sp)
1455  00a7 ee0a          	ldw	x,(10,x)
1456  00a9 cd0000        	call	_Timeout_Start
1458  00ac 85            	popw	x
1460  00ad 2006          	jra	L5701
1461  00af               L3701:
1462                     ; 224 			sensor->Datos.Estado = dht11_ESPERA_ALTO;
1464  00af 1e0c          	ldw	x,(OFST-7,sp)
1465  00b1 a608          	ld	a,#8
1466  00b3 e709          	ld	(9,x),a
1467  00b5               L5701:
1468                     ; 222 		while( NHALgpio_Read( &sensor->Config.HW ) && ( sensor->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) )
1470  00b5 1e0c          	ldw	x,(OFST-7,sp)
1471  00b7 cd0000        	call	_NHALgpio_Read
1473  00ba 4d            	tnz	a
1474  00bb 270c          	jreq	L1011
1476  00bd 1e0c          	ldw	x,(OFST-7,sp)
1477  00bf ee0a          	ldw	x,(10,x)
1478  00c1 ee02          	ldw	x,(2,x)
1479  00c3 fd            	call	(x)
1481  00c4 a301f4        	cpw	x,#500
1482  00c7 25e6          	jrult	L3701
1483  00c9               L1011:
1484                     ; 226 		if( sensor->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
1486  00c9 1e0c          	ldw	x,(OFST-7,sp)
1487  00cb ee0a          	ldw	x,(10,x)
1488  00cd ee02          	ldw	x,(2,x)
1489  00cf fd            	call	(x)
1491  00d0 a301f4        	cpw	x,#500
1492  00d3 2506          	jrult	L3011
1493                     ; 228 			sensor->Datos.Estado = dht11_TIMEOUT;
1495  00d5 1e0c          	ldw	x,(OFST-7,sp)
1496  00d7 a60c          	ld	a,#12
1497  00d9 e709          	ld	(9,x),a
1498  00db               L3011:
1499                     ; 230 		Timeout_Stop( sensor->Timeout );
1501  00db 1e0c          	ldw	x,(OFST-7,sp)
1502  00dd ee0a          	ldw	x,(10,x)
1503  00df cd0000        	call	_Timeout_Stop
1505                     ; 232 		if( sensor->Datos.Estado != dht11_TIMEOUT )
1507  00e2 1e0c          	ldw	x,(OFST-7,sp)
1508  00e4 e609          	ld	a,(9,x)
1509  00e6 a10c          	cp	a,#12
1510  00e8 270a          	jreq	L5011
1511                     ; 234 			sensor->Datos.Estado = dht11_CONEXION_OK;
1513  00ea a602          	ld	a,#2
1514  00ec e709          	ld	(9,x),a
1515                     ; 235 			return true;
1517  00ee a601          	ld	a,#1
1518  00f0 6b0e          	ld	(OFST-5,sp),a
1521  00f2 2002          	jra	L506
1522  00f4               L5011:
1523                     ; 239 			return false;
1525                     ; 244 		return false;
1528  00f4 0f0e          	clr	(OFST-5,sp)
1531  00f6               L506:
1533  00f6 2603cc03f9    	jreq	L5401
1534                     ; 463 		lectura = dht11_LeerDatos( dht11 );
1537  00fb 1e18          	ldw	x,(OFST+5,sp)
1538  00fd 1f0c          	ldw	(OFST-7,sp),x
1540                     ; 285 	uint16_t checkCRC = 0;
1542                     ; 286 	uint8_t mask = 0b11111111;
1544  00ff a6ff          	ld	a,#255
1545  0101 6b04          	ld	(OFST-15,sp),a
1547                     ; 288 	DHT11_SI_t semilla = { 0, 0, 0, 0, 0 };
1549  0103 96            	ldw	x,sp
1550  0104 1c0007        	addw	x,#OFST-12
1551  0107 90ae000a      	ldw	y,#L706_semilla
1552  010b a605          	ld	a,#5
1553  010d cd0000        	call	c_xymov
1555                     ; 290 	sensor->Datos.Estado = dht11_MIDIENDO_H;
1557  0110 1e0c          	ldw	x,(OFST-7,sp)
1558  0112 a603          	ld	a,#3
1559  0114 e709          	ld	(9,x),a
1560                     ; 110 	uint8_t contador = 0;
1563  0116 0f02          	clr	(OFST-17,sp)
1565                     ; 111 	uint8_t temp = 0;
1567  0118 0f01          	clr	(OFST-18,sp)
1569                     ; 112 	uint8_t bitLeido = 0;
1571                     ; 114 	for( contador; contador < 8; contador++ )
1574  011a 206b          	jra	L7111
1575  011c               L3111:
1576                     ; 116 		Timeout_Start( dht11->Timeout, TIMEOUT_1MS );
1578  011c ae03e8        	ldw	x,#1000
1579  011f 89            	pushw	x
1580  0120 1e0e          	ldw	x,(OFST-5,sp)
1581  0122 ee0a          	ldw	x,(10,x)
1582  0124 cd0000        	call	_Timeout_Start
1584  0127 85            	popw	x
1586  0128               L5211:
1587                     ; 117 		while( !NHALgpio_Read( &dht11->Config.HW ) && ( dht11->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) ) //Espera nuevo bit
1589  0128 1e0c          	ldw	x,(OFST-7,sp)
1590  012a cd0000        	call	_NHALgpio_Read
1592  012d 4d            	tnz	a
1593  012e 260c          	jrne	L1311
1595  0130 1e0c          	ldw	x,(OFST-7,sp)
1596  0132 ee0a          	ldw	x,(10,x)
1597  0134 ee02          	ldw	x,(2,x)
1598  0136 fd            	call	(x)
1600  0137 a301f4        	cpw	x,#500
1601  013a 25ec          	jrult	L5211
1602  013c               L1311:
1603                     ; 121 		if( dht11->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
1605  013c 1e0c          	ldw	x,(OFST-7,sp)
1606  013e ee0a          	ldw	x,(10,x)
1607  0140 ee02          	ldw	x,(2,x)
1608  0142 fd            	call	(x)
1610  0143 a301f4        	cpw	x,#500
1611  0146 2506          	jrult	L3311
1612                     ; 123 			dht11->Datos.Estado = dht11_TIMEOUT;
1614  0148 1e0c          	ldw	x,(OFST-7,sp)
1615  014a a60c          	ld	a,#12
1616  014c e709          	ld	(9,x),a
1617  014e               L3311:
1618                     ; 125 		Timeout_Stop( dht11->Timeout );
1620  014e 1e0c          	ldw	x,(OFST-7,sp)
1621  0150 ee0a          	ldw	x,(10,x)
1622  0152 cd0000        	call	_Timeout_Stop
1624                     ; 127 		if( dht11->Datos.Estado != dht11_TIMEOUT )
1626  0155 1e0c          	ldw	x,(OFST-7,sp)
1627  0157 e609          	ld	a,(9,x)
1628  0159 a10c          	cp	a,#12
1629  015b 2728          	jreq	L5311
1630                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1634  015d ae00d4        	ldw	x,#212
1636  0160 9d            	nop	
1637  0161               L27:
1638  0161 5a            	decw	X
1639  0162 26fd          	jrne	L27
1640  0164 9d            	nop	
1641                     
1643                     ; 131 			bitLeido = 0;
1645                     ; 132 			if( NHALgpio_Read( &dht11->Config.HW ) )
1647  0165 1e0c          	ldw	x,(OFST-7,sp)
1648  0167 cd0000        	call	_NHALgpio_Read
1650  016a 4d            	tnz	a
1651  016b 2702          	jreq	L7311
1652                     ; 134 				bitLeido = 1;
1654  016d a601          	ld	a,#1
1656  016f               L7311:
1657                     ; 138 				bitLeido = 0;
1659  016f 6b03          	ld	(OFST-16,sp),a
1661                     ; 141 			temp |= bitLeido;
1663  0171 1a01          	or	a,(OFST-18,sp)
1664  0173 6b01          	ld	(OFST-18,sp),a
1666                     ; 142 			if( contador < 7 )
1668  0175 7b02          	ld	a,(OFST-17,sp)
1669  0177 a107          	cp	a,#7
1670  0179 2402          	jruge	L7411
1671                     ; 144 				temp <<=  1;
1673  017b 0801          	sll	(OFST-18,sp)
1675  017d               L7411:
1676                     ; 147 			while( NHALgpio_Read( &dht11->Config.HW ) ) //Si el bit=1 espero a que baje señal
1678  017d 1e0c          	ldw	x,(OFST-7,sp)
1679  017f cd0000        	call	_NHALgpio_Read
1681  0182 4d            	tnz	a
1682  0183 26f8          	jrne	L7411
1683  0185               L5311:
1684                     ; 114 	for( contador; contador < 8; contador++ )
1686  0185 0c02          	inc	(OFST-17,sp)
1688  0187               L7111:
1691  0187 7b02          	ld	a,(OFST-17,sp)
1692  0189 a108          	cp	a,#8
1693  018b 258f          	jrult	L3111
1694                     ; 154 	return temp;
1696  018d 7b01          	ld	a,(OFST-18,sp)
1697  018f 6b0b          	ld	(OFST-8,sp),a
1701                     ; 293 	sensor->Datos.Estado = dht11_MIDIENDO_H;
1703  0191 1e0c          	ldw	x,(OFST-7,sp)
1704  0193 a603          	ld	a,#3
1705  0195 e709          	ld	(9,x),a
1706                     ; 110 	uint8_t contador = 0;
1709  0197 0f02          	clr	(OFST-17,sp)
1711                     ; 111 	uint8_t temp = 0;
1713  0199 0f01          	clr	(OFST-18,sp)
1715                     ; 112 	uint8_t bitLeido = 0;
1717                     ; 114 	for( contador; contador < 8; contador++ )
1720  019b 206b          	jra	L7511
1721  019d               L3511:
1722                     ; 116 		Timeout_Start( dht11->Timeout, TIMEOUT_1MS );
1724  019d ae03e8        	ldw	x,#1000
1725  01a0 89            	pushw	x
1726  01a1 1e0e          	ldw	x,(OFST-5,sp)
1727  01a3 ee0a          	ldw	x,(10,x)
1728  01a5 cd0000        	call	_Timeout_Start
1730  01a8 85            	popw	x
1732  01a9               L5611:
1733                     ; 117 		while( !NHALgpio_Read( &dht11->Config.HW ) && ( dht11->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) ) //Espera nuevo bit
1735  01a9 1e0c          	ldw	x,(OFST-7,sp)
1736  01ab cd0000        	call	_NHALgpio_Read
1738  01ae 4d            	tnz	a
1739  01af 260c          	jrne	L1711
1741  01b1 1e0c          	ldw	x,(OFST-7,sp)
1742  01b3 ee0a          	ldw	x,(10,x)
1743  01b5 ee02          	ldw	x,(2,x)
1744  01b7 fd            	call	(x)
1746  01b8 a301f4        	cpw	x,#500
1747  01bb 25ec          	jrult	L5611
1748  01bd               L1711:
1749                     ; 121 		if( dht11->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
1751  01bd 1e0c          	ldw	x,(OFST-7,sp)
1752  01bf ee0a          	ldw	x,(10,x)
1753  01c1 ee02          	ldw	x,(2,x)
1754  01c3 fd            	call	(x)
1756  01c4 a301f4        	cpw	x,#500
1757  01c7 2506          	jrult	L3711
1758                     ; 123 			dht11->Datos.Estado = dht11_TIMEOUT;
1760  01c9 1e0c          	ldw	x,(OFST-7,sp)
1761  01cb a60c          	ld	a,#12
1762  01cd e709          	ld	(9,x),a
1763  01cf               L3711:
1764                     ; 125 		Timeout_Stop( dht11->Timeout );
1766  01cf 1e0c          	ldw	x,(OFST-7,sp)
1767  01d1 ee0a          	ldw	x,(10,x)
1768  01d3 cd0000        	call	_Timeout_Stop
1770                     ; 127 		if( dht11->Datos.Estado != dht11_TIMEOUT )
1772  01d6 1e0c          	ldw	x,(OFST-7,sp)
1773  01d8 e609          	ld	a,(9,x)
1774  01da a10c          	cp	a,#12
1775  01dc 2728          	jreq	L5711
1776                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1780  01de ae00d4        	ldw	x,#212
1782  01e1 9d            	nop	
1783  01e2               L211:
1784  01e2 5a            	decw	X
1785  01e3 26fd          	jrne	L211
1786  01e5 9d            	nop	
1787                     
1789                     ; 131 			bitLeido = 0;
1791                     ; 132 			if( NHALgpio_Read( &dht11->Config.HW ) )
1793  01e6 1e0c          	ldw	x,(OFST-7,sp)
1794  01e8 cd0000        	call	_NHALgpio_Read
1796  01eb 4d            	tnz	a
1797  01ec 2702          	jreq	L7711
1798                     ; 134 				bitLeido = 1;
1800  01ee a601          	ld	a,#1
1802  01f0               L7711:
1803                     ; 138 				bitLeido = 0;
1805  01f0 6b03          	ld	(OFST-16,sp),a
1807                     ; 141 			temp |= bitLeido;
1809  01f2 1a01          	or	a,(OFST-18,sp)
1810  01f4 6b01          	ld	(OFST-18,sp),a
1812                     ; 142 			if( contador < 7 )
1814  01f6 7b02          	ld	a,(OFST-17,sp)
1815  01f8 a107          	cp	a,#7
1816  01fa 2402          	jruge	L7021
1817                     ; 144 				temp <<=  1;
1819  01fc 0801          	sll	(OFST-18,sp)
1821  01fe               L7021:
1822                     ; 147 			while( NHALgpio_Read( &dht11->Config.HW ) ) //Si el bit=1 espero a que baje señal
1824  01fe 1e0c          	ldw	x,(OFST-7,sp)
1825  0200 cd0000        	call	_NHALgpio_Read
1827  0203 4d            	tnz	a
1828  0204 26f8          	jrne	L7021
1829  0206               L5711:
1830                     ; 114 	for( contador; contador < 8; contador++ )
1832  0206 0c02          	inc	(OFST-17,sp)
1834  0208               L7511:
1837  0208 7b02          	ld	a,(OFST-17,sp)
1838  020a a108          	cp	a,#8
1839  020c 258f          	jrult	L3511
1840                     ; 154 	return temp;
1842  020e 7b01          	ld	a,(OFST-18,sp)
1843  0210 6b0a          	ld	(OFST-9,sp),a
1847                     ; 296 	sensor->Datos.Estado = dht11_MIDIENDO_T;
1849  0212 1e0c          	ldw	x,(OFST-7,sp)
1850  0214 a604          	ld	a,#4
1851  0216 e709          	ld	(9,x),a
1852                     ; 110 	uint8_t contador = 0;
1855  0218 0f02          	clr	(OFST-17,sp)
1857                     ; 111 	uint8_t temp = 0;
1859  021a 0f01          	clr	(OFST-18,sp)
1861                     ; 112 	uint8_t bitLeido = 0;
1863                     ; 114 	for( contador; contador < 8; contador++ )
1866  021c 206b          	jra	L7121
1867  021e               L3121:
1868                     ; 116 		Timeout_Start( dht11->Timeout, TIMEOUT_1MS );
1870  021e ae03e8        	ldw	x,#1000
1871  0221 89            	pushw	x
1872  0222 1e0e          	ldw	x,(OFST-5,sp)
1873  0224 ee0a          	ldw	x,(10,x)
1874  0226 cd0000        	call	_Timeout_Start
1876  0229 85            	popw	x
1878  022a               L5221:
1879                     ; 117 		while( !NHALgpio_Read( &dht11->Config.HW ) && ( dht11->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) ) //Espera nuevo bit
1881  022a 1e0c          	ldw	x,(OFST-7,sp)
1882  022c cd0000        	call	_NHALgpio_Read
1884  022f 4d            	tnz	a
1885  0230 260c          	jrne	L1321
1887  0232 1e0c          	ldw	x,(OFST-7,sp)
1888  0234 ee0a          	ldw	x,(10,x)
1889  0236 ee02          	ldw	x,(2,x)
1890  0238 fd            	call	(x)
1892  0239 a301f4        	cpw	x,#500
1893  023c 25ec          	jrult	L5221
1894  023e               L1321:
1895                     ; 121 		if( dht11->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
1897  023e 1e0c          	ldw	x,(OFST-7,sp)
1898  0240 ee0a          	ldw	x,(10,x)
1899  0242 ee02          	ldw	x,(2,x)
1900  0244 fd            	call	(x)
1902  0245 a301f4        	cpw	x,#500
1903  0248 2506          	jrult	L3321
1904                     ; 123 			dht11->Datos.Estado = dht11_TIMEOUT;
1906  024a 1e0c          	ldw	x,(OFST-7,sp)
1907  024c a60c          	ld	a,#12
1908  024e e709          	ld	(9,x),a
1909  0250               L3321:
1910                     ; 125 		Timeout_Stop( dht11->Timeout );
1912  0250 1e0c          	ldw	x,(OFST-7,sp)
1913  0252 ee0a          	ldw	x,(10,x)
1914  0254 cd0000        	call	_Timeout_Stop
1916                     ; 127 		if( dht11->Datos.Estado != dht11_TIMEOUT )
1918  0257 1e0c          	ldw	x,(OFST-7,sp)
1919  0259 e609          	ld	a,(9,x)
1920  025b a10c          	cp	a,#12
1921  025d 2728          	jreq	L5321
1922                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1926  025f ae00d4        	ldw	x,#212
1928  0262 9d            	nop	
1929  0263               L231:
1930  0263 5a            	decw	X
1931  0264 26fd          	jrne	L231
1932  0266 9d            	nop	
1933                     
1935                     ; 131 			bitLeido = 0;
1937                     ; 132 			if( NHALgpio_Read( &dht11->Config.HW ) )
1939  0267 1e0c          	ldw	x,(OFST-7,sp)
1940  0269 cd0000        	call	_NHALgpio_Read
1942  026c 4d            	tnz	a
1943  026d 2702          	jreq	L7321
1944                     ; 134 				bitLeido = 1;
1946  026f a601          	ld	a,#1
1948  0271               L7321:
1949                     ; 138 				bitLeido = 0;
1951  0271 6b03          	ld	(OFST-16,sp),a
1953                     ; 141 			temp |= bitLeido;
1955  0273 1a01          	or	a,(OFST-18,sp)
1956  0275 6b01          	ld	(OFST-18,sp),a
1958                     ; 142 			if( contador < 7 )
1960  0277 7b02          	ld	a,(OFST-17,sp)
1961  0279 a107          	cp	a,#7
1962  027b 2402          	jruge	L7421
1963                     ; 144 				temp <<=  1;
1965  027d 0801          	sll	(OFST-18,sp)
1967  027f               L7421:
1968                     ; 147 			while( NHALgpio_Read( &dht11->Config.HW ) ) //Si el bit=1 espero a que baje señal
1970  027f 1e0c          	ldw	x,(OFST-7,sp)
1971  0281 cd0000        	call	_NHALgpio_Read
1973  0284 4d            	tnz	a
1974  0285 26f8          	jrne	L7421
1975  0287               L5321:
1976                     ; 114 	for( contador; contador < 8; contador++ )
1978  0287 0c02          	inc	(OFST-17,sp)
1980  0289               L7121:
1983  0289 7b02          	ld	a,(OFST-17,sp)
1984  028b a108          	cp	a,#8
1985  028d 258f          	jrult	L3121
1986                     ; 154 	return temp;
1988  028f 7b01          	ld	a,(OFST-18,sp)
1989  0291 6b09          	ld	(OFST-10,sp),a
1993                     ; 299 	sensor->Datos.Estado = dht11_MIDIENDO_T;
1995  0293 1e0c          	ldw	x,(OFST-7,sp)
1996  0295 a604          	ld	a,#4
1997  0297 e709          	ld	(9,x),a
1998                     ; 110 	uint8_t contador = 0;
2001  0299 0f02          	clr	(OFST-17,sp)
2003                     ; 111 	uint8_t temp = 0;
2005  029b 0f01          	clr	(OFST-18,sp)
2007                     ; 112 	uint8_t bitLeido = 0;
2009                     ; 114 	for( contador; contador < 8; contador++ )
2012  029d 206b          	jra	L7521
2013  029f               L3521:
2014                     ; 116 		Timeout_Start( dht11->Timeout, TIMEOUT_1MS );
2016  029f ae03e8        	ldw	x,#1000
2017  02a2 89            	pushw	x
2018  02a3 1e0e          	ldw	x,(OFST-5,sp)
2019  02a5 ee0a          	ldw	x,(10,x)
2020  02a7 cd0000        	call	_Timeout_Start
2022  02aa 85            	popw	x
2024  02ab               L5621:
2025                     ; 117 		while( !NHALgpio_Read( &dht11->Config.HW ) && ( dht11->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) ) //Espera nuevo bit
2027  02ab 1e0c          	ldw	x,(OFST-7,sp)
2028  02ad cd0000        	call	_NHALgpio_Read
2030  02b0 4d            	tnz	a
2031  02b1 260c          	jrne	L1721
2033  02b3 1e0c          	ldw	x,(OFST-7,sp)
2034  02b5 ee0a          	ldw	x,(10,x)
2035  02b7 ee02          	ldw	x,(2,x)
2036  02b9 fd            	call	(x)
2038  02ba a301f4        	cpw	x,#500
2039  02bd 25ec          	jrult	L5621
2040  02bf               L1721:
2041                     ; 121 		if( dht11->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
2043  02bf 1e0c          	ldw	x,(OFST-7,sp)
2044  02c1 ee0a          	ldw	x,(10,x)
2045  02c3 ee02          	ldw	x,(2,x)
2046  02c5 fd            	call	(x)
2048  02c6 a301f4        	cpw	x,#500
2049  02c9 2506          	jrult	L3721
2050                     ; 123 			dht11->Datos.Estado = dht11_TIMEOUT;
2052  02cb 1e0c          	ldw	x,(OFST-7,sp)
2053  02cd a60c          	ld	a,#12
2054  02cf e709          	ld	(9,x),a
2055  02d1               L3721:
2056                     ; 125 		Timeout_Stop( dht11->Timeout );
2058  02d1 1e0c          	ldw	x,(OFST-7,sp)
2059  02d3 ee0a          	ldw	x,(10,x)
2060  02d5 cd0000        	call	_Timeout_Stop
2062                     ; 127 		if( dht11->Datos.Estado != dht11_TIMEOUT )
2064  02d8 1e0c          	ldw	x,(OFST-7,sp)
2065  02da e609          	ld	a,(9,x)
2066  02dc a10c          	cp	a,#12
2067  02de 2728          	jreq	L5721
2068                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2072  02e0 ae00d4        	ldw	x,#212
2074  02e3 9d            	nop	
2075  02e4               L251:
2076  02e4 5a            	decw	X
2077  02e5 26fd          	jrne	L251
2078  02e7 9d            	nop	
2079                     
2081                     ; 131 			bitLeido = 0;
2083                     ; 132 			if( NHALgpio_Read( &dht11->Config.HW ) )
2085  02e8 1e0c          	ldw	x,(OFST-7,sp)
2086  02ea cd0000        	call	_NHALgpio_Read
2088  02ed 4d            	tnz	a
2089  02ee 2702          	jreq	L7721
2090                     ; 134 				bitLeido = 1;
2092  02f0 a601          	ld	a,#1
2094  02f2               L7721:
2095                     ; 138 				bitLeido = 0;
2097  02f2 6b03          	ld	(OFST-16,sp),a
2099                     ; 141 			temp |= bitLeido;
2101  02f4 1a01          	or	a,(OFST-18,sp)
2102  02f6 6b01          	ld	(OFST-18,sp),a
2104                     ; 142 			if( contador < 7 )
2106  02f8 7b02          	ld	a,(OFST-17,sp)
2107  02fa a107          	cp	a,#7
2108  02fc 2402          	jruge	L7031
2109                     ; 144 				temp <<=  1;
2111  02fe 0801          	sll	(OFST-18,sp)
2113  0300               L7031:
2114                     ; 147 			while( NHALgpio_Read( &dht11->Config.HW ) ) //Si el bit=1 espero a que baje señal
2116  0300 1e0c          	ldw	x,(OFST-7,sp)
2117  0302 cd0000        	call	_NHALgpio_Read
2119  0305 4d            	tnz	a
2120  0306 26f8          	jrne	L7031
2121  0308               L5721:
2122                     ; 114 	for( contador; contador < 8; contador++ )
2124  0308 0c02          	inc	(OFST-17,sp)
2126  030a               L7521:
2129  030a 7b02          	ld	a,(OFST-17,sp)
2130  030c a108          	cp	a,#8
2131  030e 258f          	jrult	L3521
2132                     ; 154 	return temp;
2134  0310 7b01          	ld	a,(OFST-18,sp)
2135  0312 6b08          	ld	(OFST-11,sp),a
2139                     ; 110 	uint8_t contador = 0;
2142  0314 0f02          	clr	(OFST-17,sp)
2144                     ; 111 	uint8_t temp = 0;
2146  0316 0f01          	clr	(OFST-18,sp)
2148                     ; 112 	uint8_t bitLeido = 0;
2150                     ; 114 	for( contador; contador < 8; contador++ )
2153  0318 206b          	jra	L7131
2154  031a               L3131:
2155                     ; 116 		Timeout_Start( dht11->Timeout, TIMEOUT_1MS );
2157  031a ae03e8        	ldw	x,#1000
2158  031d 89            	pushw	x
2159  031e 1e0e          	ldw	x,(OFST-5,sp)
2160  0320 ee0a          	ldw	x,(10,x)
2161  0322 cd0000        	call	_Timeout_Start
2163  0325 85            	popw	x
2165  0326               L5231:
2166                     ; 117 		while( !NHALgpio_Read( &dht11->Config.HW ) && ( dht11->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) ) //Espera nuevo bit
2168  0326 1e0c          	ldw	x,(OFST-7,sp)
2169  0328 cd0000        	call	_NHALgpio_Read
2171  032b 4d            	tnz	a
2172  032c 260c          	jrne	L1331
2174  032e 1e0c          	ldw	x,(OFST-7,sp)
2175  0330 ee0a          	ldw	x,(10,x)
2176  0332 ee02          	ldw	x,(2,x)
2177  0334 fd            	call	(x)
2179  0335 a301f4        	cpw	x,#500
2180  0338 25ec          	jrult	L5231
2181  033a               L1331:
2182                     ; 121 		if( dht11->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
2184  033a 1e0c          	ldw	x,(OFST-7,sp)
2185  033c ee0a          	ldw	x,(10,x)
2186  033e ee02          	ldw	x,(2,x)
2187  0340 fd            	call	(x)
2189  0341 a301f4        	cpw	x,#500
2190  0344 2506          	jrult	L3331
2191                     ; 123 			dht11->Datos.Estado = dht11_TIMEOUT;
2193  0346 1e0c          	ldw	x,(OFST-7,sp)
2194  0348 a60c          	ld	a,#12
2195  034a e709          	ld	(9,x),a
2196  034c               L3331:
2197                     ; 125 		Timeout_Stop( dht11->Timeout );
2199  034c 1e0c          	ldw	x,(OFST-7,sp)
2200  034e ee0a          	ldw	x,(10,x)
2201  0350 cd0000        	call	_Timeout_Stop
2203                     ; 127 		if( dht11->Datos.Estado != dht11_TIMEOUT )
2205  0353 1e0c          	ldw	x,(OFST-7,sp)
2206  0355 e609          	ld	a,(9,x)
2207  0357 a10c          	cp	a,#12
2208  0359 2728          	jreq	L5331
2209                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2213  035b ae00d4        	ldw	x,#212
2215  035e 9d            	nop	
2216  035f               L271:
2217  035f 5a            	decw	X
2218  0360 26fd          	jrne	L271
2219  0362 9d            	nop	
2220                     
2222                     ; 131 			bitLeido = 0;
2224                     ; 132 			if( NHALgpio_Read( &dht11->Config.HW ) )
2226  0363 1e0c          	ldw	x,(OFST-7,sp)
2227  0365 cd0000        	call	_NHALgpio_Read
2229  0368 4d            	tnz	a
2230  0369 2702          	jreq	L7331
2231                     ; 134 				bitLeido = 1;
2233  036b a601          	ld	a,#1
2235  036d               L7331:
2236                     ; 138 				bitLeido = 0;
2238  036d 6b03          	ld	(OFST-16,sp),a
2240                     ; 141 			temp |= bitLeido;
2242  036f 1a01          	or	a,(OFST-18,sp)
2243  0371 6b01          	ld	(OFST-18,sp),a
2245                     ; 142 			if( contador < 7 )
2247  0373 7b02          	ld	a,(OFST-17,sp)
2248  0375 a107          	cp	a,#7
2249  0377 2402          	jruge	L7431
2250                     ; 144 				temp <<=  1;
2252  0379 0801          	sll	(OFST-18,sp)
2254  037b               L7431:
2255                     ; 147 			while( NHALgpio_Read( &dht11->Config.HW ) ) //Si el bit=1 espero a que baje señal
2257  037b 1e0c          	ldw	x,(OFST-7,sp)
2258  037d cd0000        	call	_NHALgpio_Read
2260  0380 4d            	tnz	a
2261  0381 26f8          	jrne	L7431
2262  0383               L5331:
2263                     ; 114 	for( contador; contador < 8; contador++ )
2265  0383 0c02          	inc	(OFST-17,sp)
2267  0385               L7131:
2270  0385 7b02          	ld	a,(OFST-17,sp)
2271  0387 a108          	cp	a,#8
2272  0389 258f          	jrult	L3131
2273                     ; 154 	return temp;
2275  038b 7b01          	ld	a,(OFST-18,sp)
2276  038d 6b07          	ld	(OFST-12,sp),a
2280                     ; 304 	checkCRC = semilla.H_Entero + semilla.H_Decimal + semilla.T_Entero + semilla.T_Decimal;
2282  038f 5f            	clrw	x
2283  0390 7b0b          	ld	a,(OFST-8,sp)
2284  0392 1b0a          	add	a,(OFST-9,sp)
2285  0394 59            	rlcw	x
2286  0395 1b09          	add	a,(OFST-10,sp)
2287  0397 2401          	jrnc	L202
2288  0399 5c            	incw	x
2289  039a               L202:
2290  039a 1b08          	add	a,(OFST-11,sp)
2291  039c 2401          	jrnc	L402
2292  039e 5c            	incw	x
2293  039f               L402:
2294  039f 02            	rlwa	x,a
2295  03a0 1f05          	ldw	(OFST-14,sp),x
2297                     ; 305 	checkCRC &= mask;
2299  03a2 5f            	clrw	x
2300  03a3 7b04          	ld	a,(OFST-15,sp)
2301  03a5 97            	ld	xl,a
2302  03a6 01            	rrwa	x,a
2303  03a7 1406          	and	a,(OFST-13,sp)
2304  03a9 01            	rrwa	x,a
2305  03aa 1405          	and	a,(OFST-14,sp)
2306  03ac 01            	rrwa	x,a
2307  03ad 1f05          	ldw	(OFST-14,sp),x
2309                     ; 307 	if( checkCRC == semilla.CRC )
2311  03af 5f            	clrw	x
2312  03b0 7b07          	ld	a,(OFST-12,sp)
2313  03b2 97            	ld	xl,a
2314  03b3 bf00          	ldw	c_x,x
2315  03b5 1e05          	ldw	x,(OFST-14,sp)
2316  03b7 b300          	cpw	x,c_x
2317  03b9 2606          	jrne	L3531
2318                     ; 309 		sensor->Datos.Estado = dht11_LECTURA_OK;
2320  03bb 1e0c          	ldw	x,(OFST-7,sp)
2321  03bd a60b          	ld	a,#11
2322                     ; 310 		return semilla;
2325  03bf 2004          	jra	L746
2326  03c1               L3531:
2327                     ; 314 		sensor->Datos.Estado = dht11_FALLO_AL_LEER;
2329  03c1 1e0c          	ldw	x,(OFST-7,sp)
2330  03c3 a609          	ld	a,#9
2331                     ; 315 		return semilla;
2335  03c5               L746:
2336  03c5 e709          	ld	(9,x),a
2338  03c7 96            	ldw	x,sp
2339  03c8 1c000f        	addw	x,#OFST-4
2340  03cb 9096          	ldw	y,sp
2341  03cd 72a90007      	addw	y,#OFST-12
2342  03d1 a605          	ld	a,#5
2343  03d3 cd0000        	call	c_xymov
2345                     ; 464 		dht11_CerrarConexion( dht11 );
2348  03d6 1e18          	ldw	x,(OFST+5,sp)
2349  03d8 1f0c          	ldw	(OFST-7,sp),x
2351                     ; 356 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
2353  03da 4bc0          	push	#192
2354  03dc 1e0d          	ldw	x,(OFST-6,sp)
2355  03de cd0000        	call	_NHALgpioConfig_SetType
2357  03e1 84            	pop	a
2358                     ; 357 	NHALgpio_Init( &sensor->Config.HW );
2360  03e2 1e0c          	ldw	x,(OFST-7,sp)
2361  03e4 cd0000        	call	_NHALgpio_Init
2363                     ; 359 	NHALgpio_Write( &sensor->Config.HW, true );
2365  03e7 4b01          	push	#1
2366  03e9 1e0d          	ldw	x,(OFST-6,sp)
2367  03eb cd0000        	call	_NHALgpio_Write
2369  03ee 84            	pop	a
2370                     ; 361 	if( sensor->Datos.Estado == dht11_CERRANDO_CONEXION )
2372  03ef 1e0c          	ldw	x,(OFST-7,sp)
2373  03f1 e609          	ld	a,(9,x)
2374  03f3 a105          	cp	a,#5
2375  03f5 262b          	jrne	L356
2376                     ; 363 		sensor->Datos.Estado = dht11_SLEEP;
2377                     ; 466 		return lectura;
2380  03f7 2025          	jp	LC002
2381  03f9               L5401:
2382                     ; 470 		dht11->Datos.Estado = dht11_FALLO_AL_COMUNICAR;
2384  03f9 1e18          	ldw	x,(OFST+5,sp)
2385  03fb a60a          	ld	a,#10
2386  03fd e709          	ld	(9,x),a
2387                     ; 471 		dht11_CerrarConexion( dht11 );
2390  03ff 1f0c          	ldw	(OFST-7,sp),x
2392                     ; 356 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
2394  0401 4bc0          	push	#192
2395  0403 1e0d          	ldw	x,(OFST-6,sp)
2396  0405 cd0000        	call	_NHALgpioConfig_SetType
2398  0408 84            	pop	a
2399                     ; 357 	NHALgpio_Init( &sensor->Config.HW );
2401  0409 1e0c          	ldw	x,(OFST-7,sp)
2402  040b cd0000        	call	_NHALgpio_Init
2404                     ; 359 	NHALgpio_Write( &sensor->Config.HW, true );
2406  040e 4b01          	push	#1
2407  0410 1e0d          	ldw	x,(OFST-6,sp)
2408  0412 cd0000        	call	_NHALgpio_Write
2410  0415 84            	pop	a
2411                     ; 361 	if( sensor->Datos.Estado == dht11_CERRANDO_CONEXION )
2413  0416 1e0c          	ldw	x,(OFST-7,sp)
2414  0418 e609          	ld	a,(9,x)
2415  041a a105          	cp	a,#5
2416  041c 2604          	jrne	L356
2417                     ; 363 		sensor->Datos.Estado = dht11_SLEEP;
2419  041e               LC002:
2421  041e a606          	ld	a,#6
2422  0420 e709          	ld	(9,x),a
2423  0422               L356:
2424                     ; 473 		return lectura;
2429  0422 1e16          	ldw	x,(OFST+3,sp)
2430  0424 9096          	ldw	y,sp
2431  0426 72a9000f      	addw	y,#OFST-4
2432  042a a605          	ld	a,#5
2433  042c cd0000        	call	c_xymov
2435  042f 5b13          	addw	sp,#19
2436  0431 81            	ret	
2449                     	xdef	_dht11_Lectura
2450                     	xdef	_DHT11_Init
2451                     	xref	_Timeout_Stop
2452                     	xref	_Timeout_Start
2453                     	xref	_NHALgpio_Write
2454                     	xref	_NHALgpio_Read
2455                     	xref	_NHALgpio_Init
2456                     	xref	_NHALgpioConfig_SetType
2457                     	xref.b	c_x
2476                     	xref	c_xymov
2477                     	end

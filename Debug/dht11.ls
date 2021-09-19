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
 878                     ; 226 void DHT11_Init( DHT11_t_ptr dht11, DHT11_fPtr Lectura, Timeout_t_ptr Timeout )
 878                     ; 227 {
 880                     .text:	section	.text,new
 881  0000               _DHT11_Init:
 883  0000 89            	pushw	x
 884       00000000      OFST:	set	0
 887                     ; 228 	dht11->Lectura = Lectura;
 889  0001 1605          	ldw	y,(OFST+5,sp)
 890  0003 ef0c          	ldw	(12,x),y
 891                     ; 230 	dht11->Timeout = Timeout;
 893  0005 1607          	ldw	y,(OFST+7,sp)
 894  0007 ef0a          	ldw	(10,x),y
 895                     ; 232 	dht11->Datos.UltimaLectura.CRC = 0;
 897  0009 6f04          	clr	(4,x)
 898                     ; 233 	dht11->Datos.UltimaLectura.T_Decimal = 0;
 900  000b 6f05          	clr	(5,x)
 901                     ; 234 	dht11->Datos.UltimaLectura.T_Entero = 0;
 903  000d 6f06          	clr	(6,x)
 904                     ; 235 	dht11->Datos.UltimaLectura.H_Decimal = 0;
 906  000f 6f07          	clr	(7,x)
 907                     ; 236 	dht11->Datos.UltimaLectura.H_Entero = 0;
 909  0011 6f08          	clr	(8,x)
 910                     ; 238 	NHALgpioConfig_SetType( &dht11->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
 912  0013 4bc0          	push	#192
 913  0015 cd0000        	call	_NHALgpioConfig_SetType
 915  0018 84            	pop	a
 916                     ; 239 	NHALgpio_Init( &dht11->Config.HW );
 918  0019 1e01          	ldw	x,(OFST+1,sp)
 919  001b cd0000        	call	_NHALgpio_Init
 921                     ; 241 	NHALgpio_Write( &dht11->Config.HW, true );
 923  001e 4b01          	push	#1
 924  0020 1e02          	ldw	x,(OFST+2,sp)
 925  0022 cd0000        	call	_NHALgpio_Write
 927  0025 84            	pop	a
 928                     ; 243 	dht11->Datos.Estado = dht11_INICIALIZADO;
 930  0026 1e01          	ldw	x,(OFST+1,sp)
 931  0028 6f09          	clr	(9,x)
 932                     ; 245 }
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
1237                     ; 281 DHT11_SI_t dht11_Lectura( DHT11_t_ptr dht11 )
1237                     ; 282 {
1238                     .text:	section	.text,new
1239  0000               _dht11_Lectura:
1241  0000 5213          	subw	sp,#19
1242       00000013      OFST:	set	19
1245                     ; 283 	DHT11_SI_t lectura = { 0, 0, 0, 0, 0 };
1247  0002 96            	ldw	x,sp
1248  0003 1c000f        	addw	x,#OFST-4
1249  0006 90ae0005      	ldw	y,#L535_lectura
1250  000a a605          	ld	a,#5
1251  000c cd0000        	call	c_xymov
1253                     ; 285 	if( dht11_ComenzarTransmision( dht11 ) )
1256  000f 1e18          	ldw	x,(OFST+5,sp)
1257  0011 1f0c          	ldw	(OFST-7,sp),x
1259                     ; 114 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
1261  0013 4bc0          	push	#192
1262  0015 1e0d          	ldw	x,(OFST-6,sp)
1263  0017 cd0000        	call	_NHALgpioConfig_SetType
1265  001a 84            	pop	a
1266                     ; 115 	NHALgpio_Init( &sensor->Config.HW ); 
1268  001b 1e0c          	ldw	x,(OFST-7,sp)
1269  001d cd0000        	call	_NHALgpio_Init
1271                     ; 117 	NHALgpio_Write( &sensor->Config.HW, false );
1273  0020 4b00          	push	#0
1274  0022 1e0d          	ldw	x,(OFST-6,sp)
1275  0024 cd0000        	call	_NHALgpio_Write
1277  0027 84            	pop	a
1278                     ; 119 	sensor->Datos.Estado = dht11_COMUNICANDO;
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
1313                     ; 122 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_IN_PU_NO_IT); //Configuro como entrada para leer
1315  0043 4b40          	push	#64
1316  0045 1e0d          	ldw	x,(OFST-6,sp)
1317  0047 cd0000        	call	_NHALgpioConfig_SetType
1319  004a 84            	pop	a
1320                     ; 123 	NHALgpio_Init( &sensor->Config.HW ); 
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
1338  0058 2006          	jra	L5201
1339  005a               L3201:
1340                     ; 128 		sensor->Datos.Estado = dht11_ESPERA_BAJO;
1342  005a 1e0c          	ldw	x,(OFST-7,sp)
1343  005c a607          	ld	a,#7
1344  005e e709          	ld	(9,x),a
1345  0060               L5201:
1346                     ; 126 	while( !NHALgpio_Read( &sensor->Config.HW ) )
1348  0060 1e0c          	ldw	x,(OFST-7,sp)
1349  0062 cd0000        	call	_NHALgpio_Read
1351  0065 4d            	tnz	a
1352  0066 27f2          	jreq	L3201
1354  0068 2006          	jra	L3301
1355  006a               L1301:
1356                     ; 134 		sensor->Datos.Estado = dht11_ESPERA_ALTO;
1358  006a 1e0c          	ldw	x,(OFST-7,sp)
1359  006c a608          	ld	a,#8
1360  006e e709          	ld	(9,x),a
1361  0070               L3301:
1362                     ; 132 	while( NHALgpio_Read( &sensor->Config.HW ) )
1364  0070 1e0c          	ldw	x,(OFST-7,sp)
1365  0072 cd0000        	call	_NHALgpio_Read
1367  0075 4d            	tnz	a
1368  0076 26f2          	jrne	L1301
1369                     ; 138 	sensor->Datos.Estado = dht11_CONEXION_OK;
1371  0078 1e0c          	ldw	x,(OFST-7,sp)
1372  007a a602          	ld	a,#2
1373  007c e709          	ld	(9,x),a
1374                     ; 139 	return true;
1376  007e a601          	ld	a,#1
1377  0080 6b0e          	ld	(OFST-5,sp),a
1381  0082 2603cc0349    	jreq	L1101
1382                     ; 287 		lectura = dht11_LeerDatos( dht11 );
1385  0087 1e18          	ldw	x,(OFST+5,sp)
1386  0089 1f0c          	ldw	(OFST-7,sp),x
1388                     ; 144 	uint16_t checkCRC = 0;
1390                     ; 145 	uint8_t mask = 0b11111111;
1392  008b a6ff          	ld	a,#255
1393  008d 6b04          	ld	(OFST-15,sp),a
1395                     ; 147 	DHT11_SI_t semilla = { 0, 0, 0, 0, 0 };
1397  008f 96            	ldw	x,sp
1398  0090 1c0007        	addw	x,#OFST-12
1399  0093 90ae000a      	ldw	y,#L355_semilla
1400  0097 a605          	ld	a,#5
1401  0099 cd0000        	call	c_xymov
1403                     ; 149 	sensor->Datos.Estado = dht11_MIDIENDO_H;
1405  009c 1e0c          	ldw	x,(OFST-7,sp)
1406  009e a603          	ld	a,#3
1407  00a0 e709          	ld	(9,x),a
1408                     ; 69 	uint8_t contador = 0;
1411  00a2 0f02          	clr	(OFST-17,sp)
1413                     ; 70 	uint8_t temp = 0;
1415  00a4 0f01          	clr	(OFST-18,sp)
1417                     ; 71 	uint8_t bitLeido = 0;
1419                     ; 73 	for( contador; contador < 8; contador++ )
1422  00a6 205f          	jra	L3401
1423  00a8               L7301:
1424                     ; 75 		Timeout_Start( dht11->Timeout, 140 );
1426  00a8 ae008c        	ldw	x,#140
1427  00ab 89            	pushw	x
1428  00ac 1e0e          	ldw	x,(OFST-5,sp)
1429  00ae ee0a          	ldw	x,(10,x)
1430  00b0 cd0000        	call	_Timeout_Start
1432  00b3 85            	popw	x
1434  00b4               L1501:
1435                     ; 76 		while( !NHALgpio_Read( &dht11->Config.HW ) || ( dht11->Timeout->Config.Notificacion( ) == 1 )) //Espera nuevo bit
1437  00b4 1e0c          	ldw	x,(OFST-7,sp)
1438  00b6 cd0000        	call	_NHALgpio_Read
1440  00b9 4d            	tnz	a
1441  00ba 27f8          	jreq	L1501
1443  00bc 1e0c          	ldw	x,(OFST-7,sp)
1444  00be ee0a          	ldw	x,(10,x)
1445  00c0 ee02          	ldw	x,(2,x)
1446  00c2 fd            	call	(x)
1448  00c3 4a            	dec	a
1449  00c4 27ee          	jreq	L1501
1450                     ; 80 		if( dht11->Timeout->Config.Notificacion( ) )
1452  00c6 1e0c          	ldw	x,(OFST-7,sp)
1453  00c8 ee0a          	ldw	x,(10,x)
1454  00ca ee02          	ldw	x,(2,x)
1455  00cc fd            	call	(x)
1457  00cd 4d            	tnz	a
1458  00ce 2706          	jreq	L5501
1459                     ; 82 			dht11->Datos.Estado = dht11_TIMEOUT;
1461  00d0 1e0c          	ldw	x,(OFST-7,sp)
1462  00d2 a60c          	ld	a,#12
1463  00d4 e709          	ld	(9,x),a
1464  00d6               L5501:
1465                     ; 84 		Timeout_Stop( dht11->Timeout );
1467  00d6 1e0c          	ldw	x,(OFST-7,sp)
1468  00d8 ee0a          	ldw	x,(10,x)
1469  00da cd0000        	call	_Timeout_Stop
1471                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1475  00dd ae00d4        	ldw	x,#212
1477  00e0 9d            	nop	
1478  00e1               L25:
1479  00e1 5a            	decw	X
1480  00e2 26fd          	jrne	L25
1481  00e4 9d            	nop	
1482                     
1484                     ; 87 		bitLeido = 0;
1486                     ; 88 		if( NHALgpio_Read( &dht11->Config.HW ) )
1488  00e5 1e0c          	ldw	x,(OFST-7,sp)
1489  00e7 cd0000        	call	_NHALgpio_Read
1491  00ea 4d            	tnz	a
1492  00eb 2702          	jreq	L7501
1493                     ; 90 			bitLeido = 1;
1495  00ed a601          	ld	a,#1
1497  00ef               L7501:
1498                     ; 94 			bitLeido = 0;
1500  00ef 6b03          	ld	(OFST-16,sp),a
1502                     ; 97 		temp |= bitLeido;
1504  00f1 1a01          	or	a,(OFST-18,sp)
1505  00f3 6b01          	ld	(OFST-18,sp),a
1507                     ; 98 		if( contador < 7 )
1509  00f5 7b02          	ld	a,(OFST-17,sp)
1510  00f7 a107          	cp	a,#7
1511  00f9 2402          	jruge	L7601
1512                     ; 100 			temp <<=  1;
1514  00fb 0801          	sll	(OFST-18,sp)
1516  00fd               L7601:
1517                     ; 103 		while( NHALgpio_Read( &dht11->Config.HW ) ) //Si el bit=1 espero a que baje señal
1519  00fd 1e0c          	ldw	x,(OFST-7,sp)
1520  00ff cd0000        	call	_NHALgpio_Read
1522  0102 4d            	tnz	a
1523  0103 26f8          	jrne	L7601
1524                     ; 73 	for( contador; contador < 8; contador++ )
1526  0105 0c02          	inc	(OFST-17,sp)
1528  0107               L3401:
1531  0107 7b02          	ld	a,(OFST-17,sp)
1532  0109 a108          	cp	a,#8
1533  010b 259b          	jrult	L7301
1534                     ; 109 	return temp;
1536  010d 7b01          	ld	a,(OFST-18,sp)
1537  010f 6b0b          	ld	(OFST-8,sp),a
1541                     ; 152 	sensor->Datos.Estado = dht11_MIDIENDO_H;
1543  0111 1e0c          	ldw	x,(OFST-7,sp)
1544  0113 a603          	ld	a,#3
1545  0115 e709          	ld	(9,x),a
1546                     ; 69 	uint8_t contador = 0;
1549  0117 0f02          	clr	(OFST-17,sp)
1551                     ; 70 	uint8_t temp = 0;
1553  0119 0f01          	clr	(OFST-18,sp)
1555                     ; 71 	uint8_t bitLeido = 0;
1557                     ; 73 	for( contador; contador < 8; contador++ )
1560  011b 205f          	jra	L7701
1561  011d               L3701:
1562                     ; 75 		Timeout_Start( dht11->Timeout, 140 );
1564  011d ae008c        	ldw	x,#140
1565  0120 89            	pushw	x
1566  0121 1e0e          	ldw	x,(OFST-5,sp)
1567  0123 ee0a          	ldw	x,(10,x)
1568  0125 cd0000        	call	_Timeout_Start
1570  0128 85            	popw	x
1572  0129               L5011:
1573                     ; 76 		while( !NHALgpio_Read( &dht11->Config.HW ) || ( dht11->Timeout->Config.Notificacion( ) == 1 )) //Espera nuevo bit
1575  0129 1e0c          	ldw	x,(OFST-7,sp)
1576  012b cd0000        	call	_NHALgpio_Read
1578  012e 4d            	tnz	a
1579  012f 27f8          	jreq	L5011
1581  0131 1e0c          	ldw	x,(OFST-7,sp)
1582  0133 ee0a          	ldw	x,(10,x)
1583  0135 ee02          	ldw	x,(2,x)
1584  0137 fd            	call	(x)
1586  0138 4a            	dec	a
1587  0139 27ee          	jreq	L5011
1588                     ; 80 		if( dht11->Timeout->Config.Notificacion( ) )
1590  013b 1e0c          	ldw	x,(OFST-7,sp)
1591  013d ee0a          	ldw	x,(10,x)
1592  013f ee02          	ldw	x,(2,x)
1593  0141 fd            	call	(x)
1595  0142 4d            	tnz	a
1596  0143 2706          	jreq	L1111
1597                     ; 82 			dht11->Datos.Estado = dht11_TIMEOUT;
1599  0145 1e0c          	ldw	x,(OFST-7,sp)
1600  0147 a60c          	ld	a,#12
1601  0149 e709          	ld	(9,x),a
1602  014b               L1111:
1603                     ; 84 		Timeout_Stop( dht11->Timeout );
1605  014b 1e0c          	ldw	x,(OFST-7,sp)
1606  014d ee0a          	ldw	x,(10,x)
1607  014f cd0000        	call	_Timeout_Stop
1609                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1613  0152 ae00d4        	ldw	x,#212
1615  0155 9d            	nop	
1616  0156               L27:
1617  0156 5a            	decw	X
1618  0157 26fd          	jrne	L27
1619  0159 9d            	nop	
1620                     
1622                     ; 87 		bitLeido = 0;
1624                     ; 88 		if( NHALgpio_Read( &dht11->Config.HW ) )
1626  015a 1e0c          	ldw	x,(OFST-7,sp)
1627  015c cd0000        	call	_NHALgpio_Read
1629  015f 4d            	tnz	a
1630  0160 2702          	jreq	L3111
1631                     ; 90 			bitLeido = 1;
1633  0162 a601          	ld	a,#1
1635  0164               L3111:
1636                     ; 94 			bitLeido = 0;
1638  0164 6b03          	ld	(OFST-16,sp),a
1640                     ; 97 		temp |= bitLeido;
1642  0166 1a01          	or	a,(OFST-18,sp)
1643  0168 6b01          	ld	(OFST-18,sp),a
1645                     ; 98 		if( contador < 7 )
1647  016a 7b02          	ld	a,(OFST-17,sp)
1648  016c a107          	cp	a,#7
1649  016e 2402          	jruge	L3211
1650                     ; 100 			temp <<=  1;
1652  0170 0801          	sll	(OFST-18,sp)
1654  0172               L3211:
1655                     ; 103 		while( NHALgpio_Read( &dht11->Config.HW ) ) //Si el bit=1 espero a que baje señal
1657  0172 1e0c          	ldw	x,(OFST-7,sp)
1658  0174 cd0000        	call	_NHALgpio_Read
1660  0177 4d            	tnz	a
1661  0178 26f8          	jrne	L3211
1662                     ; 73 	for( contador; contador < 8; contador++ )
1664  017a 0c02          	inc	(OFST-17,sp)
1666  017c               L7701:
1669  017c 7b02          	ld	a,(OFST-17,sp)
1670  017e a108          	cp	a,#8
1671  0180 259b          	jrult	L3701
1672                     ; 109 	return temp;
1674  0182 7b01          	ld	a,(OFST-18,sp)
1675  0184 6b0a          	ld	(OFST-9,sp),a
1679                     ; 155 	sensor->Datos.Estado = dht11_MIDIENDO_T;
1681  0186 1e0c          	ldw	x,(OFST-7,sp)
1682  0188 a604          	ld	a,#4
1683  018a e709          	ld	(9,x),a
1684                     ; 69 	uint8_t contador = 0;
1687  018c 0f02          	clr	(OFST-17,sp)
1689                     ; 70 	uint8_t temp = 0;
1691  018e 0f01          	clr	(OFST-18,sp)
1693                     ; 71 	uint8_t bitLeido = 0;
1695                     ; 73 	for( contador; contador < 8; contador++ )
1698  0190 205f          	jra	L3311
1699  0192               L7211:
1700                     ; 75 		Timeout_Start( dht11->Timeout, 140 );
1702  0192 ae008c        	ldw	x,#140
1703  0195 89            	pushw	x
1704  0196 1e0e          	ldw	x,(OFST-5,sp)
1705  0198 ee0a          	ldw	x,(10,x)
1706  019a cd0000        	call	_Timeout_Start
1708  019d 85            	popw	x
1710  019e               L1411:
1711                     ; 76 		while( !NHALgpio_Read( &dht11->Config.HW ) || ( dht11->Timeout->Config.Notificacion( ) == 1 )) //Espera nuevo bit
1713  019e 1e0c          	ldw	x,(OFST-7,sp)
1714  01a0 cd0000        	call	_NHALgpio_Read
1716  01a3 4d            	tnz	a
1717  01a4 27f8          	jreq	L1411
1719  01a6 1e0c          	ldw	x,(OFST-7,sp)
1720  01a8 ee0a          	ldw	x,(10,x)
1721  01aa ee02          	ldw	x,(2,x)
1722  01ac fd            	call	(x)
1724  01ad 4a            	dec	a
1725  01ae 27ee          	jreq	L1411
1726                     ; 80 		if( dht11->Timeout->Config.Notificacion( ) )
1728  01b0 1e0c          	ldw	x,(OFST-7,sp)
1729  01b2 ee0a          	ldw	x,(10,x)
1730  01b4 ee02          	ldw	x,(2,x)
1731  01b6 fd            	call	(x)
1733  01b7 4d            	tnz	a
1734  01b8 2706          	jreq	L5411
1735                     ; 82 			dht11->Datos.Estado = dht11_TIMEOUT;
1737  01ba 1e0c          	ldw	x,(OFST-7,sp)
1738  01bc a60c          	ld	a,#12
1739  01be e709          	ld	(9,x),a
1740  01c0               L5411:
1741                     ; 84 		Timeout_Stop( dht11->Timeout );
1743  01c0 1e0c          	ldw	x,(OFST-7,sp)
1744  01c2 ee0a          	ldw	x,(10,x)
1745  01c4 cd0000        	call	_Timeout_Stop
1747                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1751  01c7 ae00d4        	ldw	x,#212
1753  01ca 9d            	nop	
1754  01cb               L211:
1755  01cb 5a            	decw	X
1756  01cc 26fd          	jrne	L211
1757  01ce 9d            	nop	
1758                     
1760                     ; 87 		bitLeido = 0;
1762                     ; 88 		if( NHALgpio_Read( &dht11->Config.HW ) )
1764  01cf 1e0c          	ldw	x,(OFST-7,sp)
1765  01d1 cd0000        	call	_NHALgpio_Read
1767  01d4 4d            	tnz	a
1768  01d5 2702          	jreq	L7411
1769                     ; 90 			bitLeido = 1;
1771  01d7 a601          	ld	a,#1
1773  01d9               L7411:
1774                     ; 94 			bitLeido = 0;
1776  01d9 6b03          	ld	(OFST-16,sp),a
1778                     ; 97 		temp |= bitLeido;
1780  01db 1a01          	or	a,(OFST-18,sp)
1781  01dd 6b01          	ld	(OFST-18,sp),a
1783                     ; 98 		if( contador < 7 )
1785  01df 7b02          	ld	a,(OFST-17,sp)
1786  01e1 a107          	cp	a,#7
1787  01e3 2402          	jruge	L7511
1788                     ; 100 			temp <<=  1;
1790  01e5 0801          	sll	(OFST-18,sp)
1792  01e7               L7511:
1793                     ; 103 		while( NHALgpio_Read( &dht11->Config.HW ) ) //Si el bit=1 espero a que baje señal
1795  01e7 1e0c          	ldw	x,(OFST-7,sp)
1796  01e9 cd0000        	call	_NHALgpio_Read
1798  01ec 4d            	tnz	a
1799  01ed 26f8          	jrne	L7511
1800                     ; 73 	for( contador; contador < 8; contador++ )
1802  01ef 0c02          	inc	(OFST-17,sp)
1804  01f1               L3311:
1807  01f1 7b02          	ld	a,(OFST-17,sp)
1808  01f3 a108          	cp	a,#8
1809  01f5 259b          	jrult	L7211
1810                     ; 109 	return temp;
1812  01f7 7b01          	ld	a,(OFST-18,sp)
1813  01f9 6b09          	ld	(OFST-10,sp),a
1817                     ; 158 	sensor->Datos.Estado = dht11_MIDIENDO_T;
1819  01fb 1e0c          	ldw	x,(OFST-7,sp)
1820  01fd a604          	ld	a,#4
1821  01ff e709          	ld	(9,x),a
1822                     ; 69 	uint8_t contador = 0;
1825  0201 0f02          	clr	(OFST-17,sp)
1827                     ; 70 	uint8_t temp = 0;
1829  0203 0f01          	clr	(OFST-18,sp)
1831                     ; 71 	uint8_t bitLeido = 0;
1833                     ; 73 	for( contador; contador < 8; contador++ )
1836  0205 205f          	jra	L7611
1837  0207               L3611:
1838                     ; 75 		Timeout_Start( dht11->Timeout, 140 );
1840  0207 ae008c        	ldw	x,#140
1841  020a 89            	pushw	x
1842  020b 1e0e          	ldw	x,(OFST-5,sp)
1843  020d ee0a          	ldw	x,(10,x)
1844  020f cd0000        	call	_Timeout_Start
1846  0212 85            	popw	x
1848  0213               L5711:
1849                     ; 76 		while( !NHALgpio_Read( &dht11->Config.HW ) || ( dht11->Timeout->Config.Notificacion( ) == 1 )) //Espera nuevo bit
1851  0213 1e0c          	ldw	x,(OFST-7,sp)
1852  0215 cd0000        	call	_NHALgpio_Read
1854  0218 4d            	tnz	a
1855  0219 27f8          	jreq	L5711
1857  021b 1e0c          	ldw	x,(OFST-7,sp)
1858  021d ee0a          	ldw	x,(10,x)
1859  021f ee02          	ldw	x,(2,x)
1860  0221 fd            	call	(x)
1862  0222 4a            	dec	a
1863  0223 27ee          	jreq	L5711
1864                     ; 80 		if( dht11->Timeout->Config.Notificacion( ) )
1866  0225 1e0c          	ldw	x,(OFST-7,sp)
1867  0227 ee0a          	ldw	x,(10,x)
1868  0229 ee02          	ldw	x,(2,x)
1869  022b fd            	call	(x)
1871  022c 4d            	tnz	a
1872  022d 2706          	jreq	L1021
1873                     ; 82 			dht11->Datos.Estado = dht11_TIMEOUT;
1875  022f 1e0c          	ldw	x,(OFST-7,sp)
1876  0231 a60c          	ld	a,#12
1877  0233 e709          	ld	(9,x),a
1878  0235               L1021:
1879                     ; 84 		Timeout_Stop( dht11->Timeout );
1881  0235 1e0c          	ldw	x,(OFST-7,sp)
1882  0237 ee0a          	ldw	x,(10,x)
1883  0239 cd0000        	call	_Timeout_Stop
1885                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1889  023c ae00d4        	ldw	x,#212
1891  023f 9d            	nop	
1892  0240               L231:
1893  0240 5a            	decw	X
1894  0241 26fd          	jrne	L231
1895  0243 9d            	nop	
1896                     
1898                     ; 87 		bitLeido = 0;
1900                     ; 88 		if( NHALgpio_Read( &dht11->Config.HW ) )
1902  0244 1e0c          	ldw	x,(OFST-7,sp)
1903  0246 cd0000        	call	_NHALgpio_Read
1905  0249 4d            	tnz	a
1906  024a 2702          	jreq	L3021
1907                     ; 90 			bitLeido = 1;
1909  024c a601          	ld	a,#1
1911  024e               L3021:
1912                     ; 94 			bitLeido = 0;
1914  024e 6b03          	ld	(OFST-16,sp),a
1916                     ; 97 		temp |= bitLeido;
1918  0250 1a01          	or	a,(OFST-18,sp)
1919  0252 6b01          	ld	(OFST-18,sp),a
1921                     ; 98 		if( contador < 7 )
1923  0254 7b02          	ld	a,(OFST-17,sp)
1924  0256 a107          	cp	a,#7
1925  0258 2402          	jruge	L3121
1926                     ; 100 			temp <<=  1;
1928  025a 0801          	sll	(OFST-18,sp)
1930  025c               L3121:
1931                     ; 103 		while( NHALgpio_Read( &dht11->Config.HW ) ) //Si el bit=1 espero a que baje señal
1933  025c 1e0c          	ldw	x,(OFST-7,sp)
1934  025e cd0000        	call	_NHALgpio_Read
1936  0261 4d            	tnz	a
1937  0262 26f8          	jrne	L3121
1938                     ; 73 	for( contador; contador < 8; contador++ )
1940  0264 0c02          	inc	(OFST-17,sp)
1942  0266               L7611:
1945  0266 7b02          	ld	a,(OFST-17,sp)
1946  0268 a108          	cp	a,#8
1947  026a 259b          	jrult	L3611
1948                     ; 109 	return temp;
1950  026c 7b01          	ld	a,(OFST-18,sp)
1951  026e 6b08          	ld	(OFST-11,sp),a
1955                     ; 69 	uint8_t contador = 0;
1958  0270 0f02          	clr	(OFST-17,sp)
1960                     ; 70 	uint8_t temp = 0;
1962  0272 0f01          	clr	(OFST-18,sp)
1964                     ; 71 	uint8_t bitLeido = 0;
1966                     ; 73 	for( contador; contador < 8; contador++ )
1969  0274 205f          	jra	L3221
1970  0276               L7121:
1971                     ; 75 		Timeout_Start( dht11->Timeout, 140 );
1973  0276 ae008c        	ldw	x,#140
1974  0279 89            	pushw	x
1975  027a 1e0e          	ldw	x,(OFST-5,sp)
1976  027c ee0a          	ldw	x,(10,x)
1977  027e cd0000        	call	_Timeout_Start
1979  0281 85            	popw	x
1981  0282               L1321:
1982                     ; 76 		while( !NHALgpio_Read( &dht11->Config.HW ) || ( dht11->Timeout->Config.Notificacion( ) == 1 )) //Espera nuevo bit
1984  0282 1e0c          	ldw	x,(OFST-7,sp)
1985  0284 cd0000        	call	_NHALgpio_Read
1987  0287 4d            	tnz	a
1988  0288 27f8          	jreq	L1321
1990  028a 1e0c          	ldw	x,(OFST-7,sp)
1991  028c ee0a          	ldw	x,(10,x)
1992  028e ee02          	ldw	x,(2,x)
1993  0290 fd            	call	(x)
1995  0291 4a            	dec	a
1996  0292 27ee          	jreq	L1321
1997                     ; 80 		if( dht11->Timeout->Config.Notificacion( ) )
1999  0294 1e0c          	ldw	x,(OFST-7,sp)
2000  0296 ee0a          	ldw	x,(10,x)
2001  0298 ee02          	ldw	x,(2,x)
2002  029a fd            	call	(x)
2004  029b 4d            	tnz	a
2005  029c 2706          	jreq	L5321
2006                     ; 82 			dht11->Datos.Estado = dht11_TIMEOUT;
2008  029e 1e0c          	ldw	x,(OFST-7,sp)
2009  02a0 a60c          	ld	a,#12
2010  02a2 e709          	ld	(9,x),a
2011  02a4               L5321:
2012                     ; 84 		Timeout_Stop( dht11->Timeout );
2014  02a4 1e0c          	ldw	x,(OFST-7,sp)
2015  02a6 ee0a          	ldw	x,(10,x)
2016  02a8 cd0000        	call	_Timeout_Stop
2018                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2022  02ab ae00d4        	ldw	x,#212
2024  02ae 9d            	nop	
2025  02af               L251:
2026  02af 5a            	decw	X
2027  02b0 26fd          	jrne	L251
2028  02b2 9d            	nop	
2029                     
2031                     ; 87 		bitLeido = 0;
2033                     ; 88 		if( NHALgpio_Read( &dht11->Config.HW ) )
2035  02b3 1e0c          	ldw	x,(OFST-7,sp)
2036  02b5 cd0000        	call	_NHALgpio_Read
2038  02b8 4d            	tnz	a
2039  02b9 2702          	jreq	L7321
2040                     ; 90 			bitLeido = 1;
2042  02bb a601          	ld	a,#1
2044  02bd               L7321:
2045                     ; 94 			bitLeido = 0;
2047  02bd 6b03          	ld	(OFST-16,sp),a
2049                     ; 97 		temp |= bitLeido;
2051  02bf 1a01          	or	a,(OFST-18,sp)
2052  02c1 6b01          	ld	(OFST-18,sp),a
2054                     ; 98 		if( contador < 7 )
2056  02c3 7b02          	ld	a,(OFST-17,sp)
2057  02c5 a107          	cp	a,#7
2058  02c7 2402          	jruge	L7421
2059                     ; 100 			temp <<=  1;
2061  02c9 0801          	sll	(OFST-18,sp)
2063  02cb               L7421:
2064                     ; 103 		while( NHALgpio_Read( &dht11->Config.HW ) ) //Si el bit=1 espero a que baje señal
2066  02cb 1e0c          	ldw	x,(OFST-7,sp)
2067  02cd cd0000        	call	_NHALgpio_Read
2069  02d0 4d            	tnz	a
2070  02d1 26f8          	jrne	L7421
2071                     ; 73 	for( contador; contador < 8; contador++ )
2073  02d3 0c02          	inc	(OFST-17,sp)
2075  02d5               L3221:
2078  02d5 7b02          	ld	a,(OFST-17,sp)
2079  02d7 a108          	cp	a,#8
2080  02d9 259b          	jrult	L7121
2081                     ; 109 	return temp;
2083  02db 7b01          	ld	a,(OFST-18,sp)
2084  02dd 6b07          	ld	(OFST-12,sp),a
2088                     ; 163 	checkCRC = semilla.H_Entero + semilla.H_Decimal + semilla.T_Entero + semilla.T_Decimal;
2090  02df 5f            	clrw	x
2091  02e0 7b0b          	ld	a,(OFST-8,sp)
2092  02e2 1b0a          	add	a,(OFST-9,sp)
2093  02e4 59            	rlcw	x
2094  02e5 1b09          	add	a,(OFST-10,sp)
2095  02e7 2401          	jrnc	L261
2096  02e9 5c            	incw	x
2097  02ea               L261:
2098  02ea 1b08          	add	a,(OFST-11,sp)
2099  02ec 2401          	jrnc	L461
2100  02ee 5c            	incw	x
2101  02ef               L461:
2102  02ef 02            	rlwa	x,a
2103  02f0 1f05          	ldw	(OFST-14,sp),x
2105                     ; 164 	checkCRC &= mask;
2107  02f2 5f            	clrw	x
2108  02f3 7b04          	ld	a,(OFST-15,sp)
2109  02f5 97            	ld	xl,a
2110  02f6 01            	rrwa	x,a
2111  02f7 1406          	and	a,(OFST-13,sp)
2112  02f9 01            	rrwa	x,a
2113  02fa 1405          	and	a,(OFST-14,sp)
2114  02fc 01            	rrwa	x,a
2115  02fd 1f05          	ldw	(OFST-14,sp),x
2117                     ; 166 	if( checkCRC == semilla.CRC )
2119  02ff 5f            	clrw	x
2120  0300 7b07          	ld	a,(OFST-12,sp)
2121  0302 97            	ld	xl,a
2122  0303 bf00          	ldw	c_x,x
2123  0305 1e05          	ldw	x,(OFST-14,sp)
2124  0307 b300          	cpw	x,c_x
2125  0309 2606          	jrne	L3521
2126                     ; 168 		sensor->Datos.Estado = dht11_LECTURA_OK;
2128  030b 1e0c          	ldw	x,(OFST-7,sp)
2129  030d a60b          	ld	a,#11
2130                     ; 169 		return semilla;
2133  030f 2004          	jra	L316
2134  0311               L3521:
2135                     ; 173 		sensor->Datos.Estado = dht11_FALLO_AL_LEER;
2137  0311 1e0c          	ldw	x,(OFST-7,sp)
2138  0313 a609          	ld	a,#9
2139                     ; 174 		return semilla;
2143  0315               L316:
2144  0315 e709          	ld	(9,x),a
2146  0317 96            	ldw	x,sp
2147  0318 1c000f        	addw	x,#OFST-4
2148  031b 9096          	ldw	y,sp
2149  031d 72a90007      	addw	y,#OFST-12
2150  0321 a605          	ld	a,#5
2151  0323 cd0000        	call	c_xymov
2153                     ; 288 		dht11_CerrarConexion( dht11 );
2156  0326 1e18          	ldw	x,(OFST+5,sp)
2157  0328 1f0c          	ldw	(OFST-7,sp),x
2159                     ; 180 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
2161  032a 4bc0          	push	#192
2162  032c 1e0d          	ldw	x,(OFST-6,sp)
2163  032e cd0000        	call	_NHALgpioConfig_SetType
2165  0331 84            	pop	a
2166                     ; 181 	NHALgpio_Init( &sensor->Config.HW );
2168  0332 1e0c          	ldw	x,(OFST-7,sp)
2169  0334 cd0000        	call	_NHALgpio_Init
2171                     ; 183 	NHALgpio_Write( &sensor->Config.HW, true );
2173  0337 4b01          	push	#1
2174  0339 1e0d          	ldw	x,(OFST-6,sp)
2175  033b cd0000        	call	_NHALgpio_Write
2177  033e 84            	pop	a
2178                     ; 185 	if( sensor->Datos.Estado == dht11_CERRANDO_CONEXION )
2180  033f 1e0c          	ldw	x,(OFST-7,sp)
2181  0341 e609          	ld	a,(9,x)
2182  0343 a105          	cp	a,#5
2183  0345 262b          	jrne	L716
2184                     ; 187 		sensor->Datos.Estado = dht11_SLEEP;
2185                     ; 290 		return lectura;
2188  0347 2025          	jp	LC001
2189  0349               L1101:
2190                     ; 294 		dht11->Datos.Estado = dht11_FALLO_AL_COMUNICAR;
2192  0349 1e18          	ldw	x,(OFST+5,sp)
2193  034b a60a          	ld	a,#10
2194  034d e709          	ld	(9,x),a
2195                     ; 295 		dht11_CerrarConexion( dht11 );
2198  034f 1f0c          	ldw	(OFST-7,sp),x
2200                     ; 180 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
2202  0351 4bc0          	push	#192
2203  0353 1e0d          	ldw	x,(OFST-6,sp)
2204  0355 cd0000        	call	_NHALgpioConfig_SetType
2206  0358 84            	pop	a
2207                     ; 181 	NHALgpio_Init( &sensor->Config.HW );
2209  0359 1e0c          	ldw	x,(OFST-7,sp)
2210  035b cd0000        	call	_NHALgpio_Init
2212                     ; 183 	NHALgpio_Write( &sensor->Config.HW, true );
2214  035e 4b01          	push	#1
2215  0360 1e0d          	ldw	x,(OFST-6,sp)
2216  0362 cd0000        	call	_NHALgpio_Write
2218  0365 84            	pop	a
2219                     ; 185 	if( sensor->Datos.Estado == dht11_CERRANDO_CONEXION )
2221  0366 1e0c          	ldw	x,(OFST-7,sp)
2222  0368 e609          	ld	a,(9,x)
2223  036a a105          	cp	a,#5
2224  036c 2604          	jrne	L716
2225                     ; 187 		sensor->Datos.Estado = dht11_SLEEP;
2227  036e               LC001:
2229  036e a606          	ld	a,#6
2230  0370 e709          	ld	(9,x),a
2231  0372               L716:
2232                     ; 297 		return lectura;
2237  0372 1e16          	ldw	x,(OFST+3,sp)
2238  0374 9096          	ldw	y,sp
2239  0376 72a9000f      	addw	y,#OFST-4
2240  037a a605          	ld	a,#5
2241  037c cd0000        	call	c_xymov
2243  037f 5b13          	addw	sp,#19
2244  0381 81            	ret	
2257                     	xdef	_dht11_Lectura
2258                     	xdef	_DHT11_Init
2259                     	xref	_Timeout_Stop
2260                     	xref	_Timeout_Start
2261                     	xref	_NHALgpio_Write
2262                     	xref	_NHALgpio_Read
2263                     	xref	_NHALgpio_Init
2264                     	xref	_NHALgpioConfig_SetType
2265                     	xref.b	c_x
2284                     	xref	c_xymov
2285                     	end

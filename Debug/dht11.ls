   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  21  0002               L5_flagUartRXNE:
  22  0002 00            	dc.b	0
  61                     .const:	section	.text
  62  0000               L34_semilla:
  63  0000 00            	dc.b	0
  64  0001 00            	dc.b	0
  65  0002 00            	dc.b	0
  66  0003 00            	dc.b	0
  67  0004 00            	dc.b	0
 889                     ; 263 void DHT11_Init( DHT11_t_ptr dht11, DHT11_fPtr Lectura, Timeout_t_ptr Timeout )
 889                     ; 264 {
 891                     .text:	section	.text,new
 892  0000               _DHT11_Init:
 894  0000 89            	pushw	x
 895       00000000      OFST:	set	0
 898                     ; 265 	dht11->Lectura = Lectura;
 900  0001 1605          	ldw	y,(OFST+5,sp)
 901  0003 ef0c          	ldw	(12,x),y
 902                     ; 267 	dht11->Timeout = Timeout;
 904  0005 1607          	ldw	y,(OFST+7,sp)
 905  0007 ef0a          	ldw	(10,x),y
 906                     ; 269 	dht11->Datos.UltimaLectura.CRC = 0;
 908  0009 6f04          	clr	(4,x)
 909                     ; 270 	dht11->Datos.UltimaLectura.T_Decimal = 0;
 911  000b 6f05          	clr	(5,x)
 912                     ; 271 	dht11->Datos.UltimaLectura.T_Entero = 0;
 914  000d 6f06          	clr	(6,x)
 915                     ; 272 	dht11->Datos.UltimaLectura.H_Decimal = 0;
 917  000f 6f07          	clr	(7,x)
 918                     ; 273 	dht11->Datos.UltimaLectura.H_Entero = 0;
 920  0011 6f08          	clr	(8,x)
 921                     ; 275 	NHALgpioConfig_SetType( &dht11->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
 923  0013 4bc0          	push	#192
 924  0015 cd0000        	call	_NHALgpioConfig_SetType
 926  0018 84            	pop	a
 927                     ; 276 	NHALgpio_Init( &dht11->Config.HW );
 929  0019 1e01          	ldw	x,(OFST+1,sp)
 930  001b cd0000        	call	_NHALgpio_Init
 932                     ; 278 	NHALgpio_Write( &dht11->Config.HW, true );
 934  001e 4b01          	push	#1
 935  0020 1e02          	ldw	x,(OFST+2,sp)
 936  0022 cd0000        	call	_NHALgpio_Write
 938  0025 84            	pop	a
 939                     ; 280 	dht11->Datos.Estado = dht11_INICIALIZADO;
 941  0026 1e01          	ldw	x,(OFST+1,sp)
 942  0028 6f09          	clr	(9,x)
 943                     ; 282 }
 946  002a 85            	popw	x
 947  002b 81            	ret	
 950                     	switch	.const
 951  0005               L345_lectura:
 952  0005 00            	dc.b	0
 953  0006 00            	dc.b	0
 954  0007 00            	dc.b	0
 955  0008 00            	dc.b	0
 956  0009 00            	dc.b	0
 957  000a               L165_semilla:
 958  000a 00            	dc.b	0
 959  000b 00            	dc.b	0
 960  000c 00            	dc.b	0
 961  000d 00            	dc.b	0
 962  000e 00            	dc.b	0
1248                     ; 318 DHT11_SI_t dht11_Lectura( DHT11_t_ptr dht11 )
1248                     ; 319 {
1249                     .text:	section	.text,new
1250  0000               _dht11_Lectura:
1252  0000 5213          	subw	sp,#19
1253       00000013      OFST:	set	19
1256                     ; 320 	DHT11_SI_t lectura = { 0, 0, 0, 0, 0 };
1258  0002 96            	ldw	x,sp
1259  0003 1c000f        	addw	x,#OFST-4
1260  0006 90ae0005      	ldw	y,#L345_lectura
1261  000a a605          	ld	a,#5
1262  000c cd0000        	call	c_xymov
1264                     ; 322 	if( dht11_ComenzarTransmision( dht11 ) )
1267  000f 1e18          	ldw	x,(OFST+5,sp)
1268  0011 1f0c          	ldw	(OFST-7,sp),x
1270                     ; 125 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
1272  0013 4bc0          	push	#192
1273  0015 1e0d          	ldw	x,(OFST-6,sp)
1274  0017 cd0000        	call	_NHALgpioConfig_SetType
1276  001a 84            	pop	a
1277                     ; 126 	NHALgpio_Init( &sensor->Config.HW ); 
1279  001b 1e0c          	ldw	x,(OFST-7,sp)
1280  001d cd0000        	call	_NHALgpio_Init
1282                     ; 128 	NHALgpio_Write( &sensor->Config.HW, false );
1284  0020 4b00          	push	#0
1285  0022 1e0d          	ldw	x,(OFST-6,sp)
1286  0024 cd0000        	call	_NHALgpio_Write
1288  0027 84            	pop	a
1289                     ; 130 	sensor->Datos.Estado = dht11_COMUNICANDO;
1291  0028 1e0c          	ldw	x,(OFST-7,sp)
1292  002a a601          	ld	a,#1
1293  002c e709          	ld	(9,x),a
1297  002e ae0012        	ldw	x,#18
1300  0031 200a          	jra	L5201
1301  0033               L1201:
1302                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1306  0033 ae14d4        	ldw	x,#5332
1308  0036 9d            	nop	
1309  0037               L42:
1310  0037 5a            	decw	X
1311  0038 26fd          	jrne	L42
1312  003a 9d            	nop	
1313                     
1315  003b 1e0a          	ldw	x,(OFST-9,sp)
1316  003d               L5201:
1317                     ; 186 	while ( __ms-- )
1319  003d 5a            	decw	x
1320  003e 1f0a          	ldw	(OFST-9,sp),x
1321  0040 5c            	incw	x
1323  0041 26f0          	jrne	L1201
1324                     ; 133 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_IN_PU_NO_IT); //Configuro como entrada para leer
1326  0043 4b40          	push	#64
1327  0045 1e0d          	ldw	x,(OFST-6,sp)
1328  0047 cd0000        	call	_NHALgpioConfig_SetType
1330  004a 84            	pop	a
1331                     ; 134 	NHALgpio_Init( &sensor->Config.HW ); 
1333  004b 1e0c          	ldw	x,(OFST-7,sp)
1334  004d cd0000        	call	_NHALgpio_Init
1336                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1340  0050 ae00d4        	ldw	x,#212
1342  0053 9d            	nop	
1343  0054               L23:
1344  0054 5a            	decw	X
1345  0055 26fd          	jrne	L23
1346  0057 9d            	nop	
1347                     
1349                     ; 137 	Timeout_Start( sensor->Timeout, TIMEOUT_1MS );
1351  0058 ae03e8        	ldw	x,#1000
1352  005b 89            	pushw	x
1353  005c 1e0e          	ldw	x,(OFST-5,sp)
1354  005e ee0a          	ldw	x,(10,x)
1355  0060 cd0000        	call	_Timeout_Start
1357  0063 85            	popw	x
1359  0064 2006          	jra	L3301
1360  0066               L1301:
1361                     ; 140 		sensor->Datos.Estado = dht11_ESPERA_BAJO;
1363  0066 1e0c          	ldw	x,(OFST-7,sp)
1364  0068 a607          	ld	a,#7
1365  006a e709          	ld	(9,x),a
1366  006c               L3301:
1367                     ; 138 	while( !NHALgpio_Read( &sensor->Config.HW ) && ( sensor->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) )
1369  006c 1e0c          	ldw	x,(OFST-7,sp)
1370  006e cd0000        	call	_NHALgpio_Read
1372  0071 4d            	tnz	a
1373  0072 260c          	jrne	L7301
1375  0074 1e0c          	ldw	x,(OFST-7,sp)
1376  0076 ee0a          	ldw	x,(10,x)
1377  0078 ee02          	ldw	x,(2,x)
1378  007a fd            	call	(x)
1380  007b a301f4        	cpw	x,#500
1381  007e 25e6          	jrult	L1301
1382  0080               L7301:
1383                     ; 143 	if( sensor->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
1385  0080 1e0c          	ldw	x,(OFST-7,sp)
1386  0082 ee0a          	ldw	x,(10,x)
1387  0084 ee02          	ldw	x,(2,x)
1388  0086 fd            	call	(x)
1390  0087 a301f4        	cpw	x,#500
1391  008a 2506          	jrult	L1401
1392                     ; 145 		sensor->Datos.Estado = dht11_TIMEOUT;
1394  008c 1e0c          	ldw	x,(OFST-7,sp)
1395  008e a60c          	ld	a,#12
1396  0090 e709          	ld	(9,x),a
1397  0092               L1401:
1398                     ; 147 	Timeout_Stop( sensor->Timeout );
1400  0092 1e0c          	ldw	x,(OFST-7,sp)
1401  0094 ee0a          	ldw	x,(10,x)
1402  0096 cd0000        	call	_Timeout_Stop
1404                     ; 150 	if( sensor->Datos.Estado != dht11_TIMEOUT )
1406  0099 1e0c          	ldw	x,(OFST-7,sp)
1407  009b e609          	ld	a,(9,x)
1408  009d a10c          	cp	a,#12
1409  009f 2753          	jreq	L7501
1410                     ; 152 		Timeout_Start( sensor->Timeout, TIMEOUT_1MS );
1412  00a1 ae03e8        	ldw	x,#1000
1413  00a4 89            	pushw	x
1414  00a5 1e0e          	ldw	x,(OFST-5,sp)
1415  00a7 ee0a          	ldw	x,(10,x)
1416  00a9 cd0000        	call	_Timeout_Start
1418  00ac 85            	popw	x
1420  00ad 2006          	jra	L7401
1421  00af               L5401:
1422                     ; 155 			sensor->Datos.Estado = dht11_ESPERA_ALTO;
1424  00af 1e0c          	ldw	x,(OFST-7,sp)
1425  00b1 a608          	ld	a,#8
1426  00b3 e709          	ld	(9,x),a
1427  00b5               L7401:
1428                     ; 153 		while( NHALgpio_Read( &sensor->Config.HW ) && ( sensor->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) )
1430  00b5 1e0c          	ldw	x,(OFST-7,sp)
1431  00b7 cd0000        	call	_NHALgpio_Read
1433  00ba 4d            	tnz	a
1434  00bb 270c          	jreq	L3501
1436  00bd 1e0c          	ldw	x,(OFST-7,sp)
1437  00bf ee0a          	ldw	x,(10,x)
1438  00c1 ee02          	ldw	x,(2,x)
1439  00c3 fd            	call	(x)
1441  00c4 a301f4        	cpw	x,#500
1442  00c7 25e6          	jrult	L5401
1443  00c9               L3501:
1444                     ; 157 		if( sensor->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
1446  00c9 1e0c          	ldw	x,(OFST-7,sp)
1447  00cb ee0a          	ldw	x,(10,x)
1448  00cd ee02          	ldw	x,(2,x)
1449  00cf fd            	call	(x)
1451  00d0 a301f4        	cpw	x,#500
1452  00d3 2506          	jrult	L5501
1453                     ; 159 			sensor->Datos.Estado = dht11_TIMEOUT;
1455  00d5 1e0c          	ldw	x,(OFST-7,sp)
1456  00d7 a60c          	ld	a,#12
1457  00d9 e709          	ld	(9,x),a
1458  00db               L5501:
1459                     ; 161 		Timeout_Stop( sensor->Timeout );
1461  00db 1e0c          	ldw	x,(OFST-7,sp)
1462  00dd ee0a          	ldw	x,(10,x)
1463  00df cd0000        	call	_Timeout_Stop
1465                     ; 163 		if( sensor->Datos.Estado != dht11_TIMEOUT )
1467  00e2 1e0c          	ldw	x,(OFST-7,sp)
1468  00e4 e609          	ld	a,(9,x)
1469  00e6 a10c          	cp	a,#12
1470  00e8 270a          	jreq	L7501
1471                     ; 165 			sensor->Datos.Estado = dht11_CONEXION_OK;
1473  00ea a602          	ld	a,#2
1474  00ec e709          	ld	(9,x),a
1475                     ; 166 			return true;
1477  00ee a601          	ld	a,#1
1478  00f0 6b0e          	ld	(OFST-5,sp),a
1481  00f2 2002          	jra	L755
1482  00f4               L7501:
1483                     ; 170 			return false;
1485                     ; 175 		return false;
1488  00f4 0f0e          	clr	(OFST-5,sp)
1491  00f6               L755:
1493  00f6 2603cc03f9    	jreq	L7101
1494                     ; 324 		lectura = dht11_LeerDatos( dht11 );
1497  00fb 1e18          	ldw	x,(OFST+5,sp)
1498  00fd 1f0c          	ldw	(OFST-7,sp),x
1500                     ; 181 	uint16_t checkCRC = 0;
1502                     ; 182 	uint8_t mask = 0b11111111;
1504  00ff a6ff          	ld	a,#255
1505  0101 6b04          	ld	(OFST-15,sp),a
1507                     ; 184 	DHT11_SI_t semilla = { 0, 0, 0, 0, 0 };
1509  0103 96            	ldw	x,sp
1510  0104 1c0007        	addw	x,#OFST-12
1511  0107 90ae000a      	ldw	y,#L165_semilla
1512  010b a605          	ld	a,#5
1513  010d cd0000        	call	c_xymov
1515                     ; 186 	sensor->Datos.Estado = dht11_MIDIENDO_H;
1517  0110 1e0c          	ldw	x,(OFST-7,sp)
1518  0112 a603          	ld	a,#3
1519  0114 e709          	ld	(9,x),a
1520                     ; 76 	uint8_t contador = 0;
1523  0116 0f02          	clr	(OFST-17,sp)
1525                     ; 77 	uint8_t temp = 0;
1527  0118 0f01          	clr	(OFST-18,sp)
1529                     ; 78 	uint8_t bitLeido = 0;
1531                     ; 80 	for( contador; contador < 8; contador++ )
1534  011a 206b          	jra	L1701
1535  011c               L5601:
1536                     ; 82 		Timeout_Start( dht11->Timeout, TIMEOUT_1MS );
1538  011c ae03e8        	ldw	x,#1000
1539  011f 89            	pushw	x
1540  0120 1e0e          	ldw	x,(OFST-5,sp)
1541  0122 ee0a          	ldw	x,(10,x)
1542  0124 cd0000        	call	_Timeout_Start
1544  0127 85            	popw	x
1546  0128               L7701:
1547                     ; 83 		while( !NHALgpio_Read( &dht11->Config.HW ) && ( dht11->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) ) //Espera nuevo bit
1549  0128 1e0c          	ldw	x,(OFST-7,sp)
1550  012a cd0000        	call	_NHALgpio_Read
1552  012d 4d            	tnz	a
1553  012e 260c          	jrne	L3011
1555  0130 1e0c          	ldw	x,(OFST-7,sp)
1556  0132 ee0a          	ldw	x,(10,x)
1557  0134 ee02          	ldw	x,(2,x)
1558  0136 fd            	call	(x)
1560  0137 a301f4        	cpw	x,#500
1561  013a 25ec          	jrult	L7701
1562  013c               L3011:
1563                     ; 87 		if( dht11->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
1565  013c 1e0c          	ldw	x,(OFST-7,sp)
1566  013e ee0a          	ldw	x,(10,x)
1567  0140 ee02          	ldw	x,(2,x)
1568  0142 fd            	call	(x)
1570  0143 a301f4        	cpw	x,#500
1571  0146 2506          	jrult	L5011
1572                     ; 89 			dht11->Datos.Estado = dht11_TIMEOUT;
1574  0148 1e0c          	ldw	x,(OFST-7,sp)
1575  014a a60c          	ld	a,#12
1576  014c e709          	ld	(9,x),a
1577  014e               L5011:
1578                     ; 91 		Timeout_Stop( dht11->Timeout );
1580  014e 1e0c          	ldw	x,(OFST-7,sp)
1581  0150 ee0a          	ldw	x,(10,x)
1582  0152 cd0000        	call	_Timeout_Stop
1584                     ; 93 		if( dht11->Datos.Estado != dht11_TIMEOUT )
1586  0155 1e0c          	ldw	x,(OFST-7,sp)
1587  0157 e609          	ld	a,(9,x)
1588  0159 a10c          	cp	a,#12
1589  015b 2728          	jreq	L7011
1590                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1594  015d ae00d4        	ldw	x,#212
1596  0160 9d            	nop	
1597  0161               L27:
1598  0161 5a            	decw	X
1599  0162 26fd          	jrne	L27
1600  0164 9d            	nop	
1601                     
1603                     ; 97 			bitLeido = 0;
1605                     ; 98 			if( NHALgpio_Read( &dht11->Config.HW ) )
1607  0165 1e0c          	ldw	x,(OFST-7,sp)
1608  0167 cd0000        	call	_NHALgpio_Read
1610  016a 4d            	tnz	a
1611  016b 2702          	jreq	L1111
1612                     ; 100 				bitLeido = 1;
1614  016d a601          	ld	a,#1
1616  016f               L1111:
1617                     ; 104 				bitLeido = 0;
1619  016f 6b03          	ld	(OFST-16,sp),a
1621                     ; 107 			temp |= bitLeido;
1623  0171 1a01          	or	a,(OFST-18,sp)
1624  0173 6b01          	ld	(OFST-18,sp),a
1626                     ; 108 			if( contador < 7 )
1628  0175 7b02          	ld	a,(OFST-17,sp)
1629  0177 a107          	cp	a,#7
1630  0179 2402          	jruge	L1211
1631                     ; 110 				temp <<=  1;
1633  017b 0801          	sll	(OFST-18,sp)
1635  017d               L1211:
1636                     ; 113 			while( NHALgpio_Read( &dht11->Config.HW ) ) //Si el bit=1 espero a que baje señal
1638  017d 1e0c          	ldw	x,(OFST-7,sp)
1639  017f cd0000        	call	_NHALgpio_Read
1641  0182 4d            	tnz	a
1642  0183 26f8          	jrne	L1211
1643  0185               L7011:
1644                     ; 80 	for( contador; contador < 8; contador++ )
1646  0185 0c02          	inc	(OFST-17,sp)
1648  0187               L1701:
1651  0187 7b02          	ld	a,(OFST-17,sp)
1652  0189 a108          	cp	a,#8
1653  018b 258f          	jrult	L5601
1654                     ; 120 	return temp;
1656  018d 7b01          	ld	a,(OFST-18,sp)
1657  018f 6b0b          	ld	(OFST-8,sp),a
1661                     ; 189 	sensor->Datos.Estado = dht11_MIDIENDO_H;
1663  0191 1e0c          	ldw	x,(OFST-7,sp)
1664  0193 a603          	ld	a,#3
1665  0195 e709          	ld	(9,x),a
1666                     ; 76 	uint8_t contador = 0;
1669  0197 0f02          	clr	(OFST-17,sp)
1671                     ; 77 	uint8_t temp = 0;
1673  0199 0f01          	clr	(OFST-18,sp)
1675                     ; 78 	uint8_t bitLeido = 0;
1677                     ; 80 	for( contador; contador < 8; contador++ )
1680  019b 206b          	jra	L1311
1681  019d               L5211:
1682                     ; 82 		Timeout_Start( dht11->Timeout, TIMEOUT_1MS );
1684  019d ae03e8        	ldw	x,#1000
1685  01a0 89            	pushw	x
1686  01a1 1e0e          	ldw	x,(OFST-5,sp)
1687  01a3 ee0a          	ldw	x,(10,x)
1688  01a5 cd0000        	call	_Timeout_Start
1690  01a8 85            	popw	x
1692  01a9               L7311:
1693                     ; 83 		while( !NHALgpio_Read( &dht11->Config.HW ) && ( dht11->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) ) //Espera nuevo bit
1695  01a9 1e0c          	ldw	x,(OFST-7,sp)
1696  01ab cd0000        	call	_NHALgpio_Read
1698  01ae 4d            	tnz	a
1699  01af 260c          	jrne	L3411
1701  01b1 1e0c          	ldw	x,(OFST-7,sp)
1702  01b3 ee0a          	ldw	x,(10,x)
1703  01b5 ee02          	ldw	x,(2,x)
1704  01b7 fd            	call	(x)
1706  01b8 a301f4        	cpw	x,#500
1707  01bb 25ec          	jrult	L7311
1708  01bd               L3411:
1709                     ; 87 		if( dht11->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
1711  01bd 1e0c          	ldw	x,(OFST-7,sp)
1712  01bf ee0a          	ldw	x,(10,x)
1713  01c1 ee02          	ldw	x,(2,x)
1714  01c3 fd            	call	(x)
1716  01c4 a301f4        	cpw	x,#500
1717  01c7 2506          	jrult	L5411
1718                     ; 89 			dht11->Datos.Estado = dht11_TIMEOUT;
1720  01c9 1e0c          	ldw	x,(OFST-7,sp)
1721  01cb a60c          	ld	a,#12
1722  01cd e709          	ld	(9,x),a
1723  01cf               L5411:
1724                     ; 91 		Timeout_Stop( dht11->Timeout );
1726  01cf 1e0c          	ldw	x,(OFST-7,sp)
1727  01d1 ee0a          	ldw	x,(10,x)
1728  01d3 cd0000        	call	_Timeout_Stop
1730                     ; 93 		if( dht11->Datos.Estado != dht11_TIMEOUT )
1732  01d6 1e0c          	ldw	x,(OFST-7,sp)
1733  01d8 e609          	ld	a,(9,x)
1734  01da a10c          	cp	a,#12
1735  01dc 2728          	jreq	L7411
1736                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1740  01de ae00d4        	ldw	x,#212
1742  01e1 9d            	nop	
1743  01e2               L211:
1744  01e2 5a            	decw	X
1745  01e3 26fd          	jrne	L211
1746  01e5 9d            	nop	
1747                     
1749                     ; 97 			bitLeido = 0;
1751                     ; 98 			if( NHALgpio_Read( &dht11->Config.HW ) )
1753  01e6 1e0c          	ldw	x,(OFST-7,sp)
1754  01e8 cd0000        	call	_NHALgpio_Read
1756  01eb 4d            	tnz	a
1757  01ec 2702          	jreq	L1511
1758                     ; 100 				bitLeido = 1;
1760  01ee a601          	ld	a,#1
1762  01f0               L1511:
1763                     ; 104 				bitLeido = 0;
1765  01f0 6b03          	ld	(OFST-16,sp),a
1767                     ; 107 			temp |= bitLeido;
1769  01f2 1a01          	or	a,(OFST-18,sp)
1770  01f4 6b01          	ld	(OFST-18,sp),a
1772                     ; 108 			if( contador < 7 )
1774  01f6 7b02          	ld	a,(OFST-17,sp)
1775  01f8 a107          	cp	a,#7
1776  01fa 2402          	jruge	L1611
1777                     ; 110 				temp <<=  1;
1779  01fc 0801          	sll	(OFST-18,sp)
1781  01fe               L1611:
1782                     ; 113 			while( NHALgpio_Read( &dht11->Config.HW ) ) //Si el bit=1 espero a que baje señal
1784  01fe 1e0c          	ldw	x,(OFST-7,sp)
1785  0200 cd0000        	call	_NHALgpio_Read
1787  0203 4d            	tnz	a
1788  0204 26f8          	jrne	L1611
1789  0206               L7411:
1790                     ; 80 	for( contador; contador < 8; contador++ )
1792  0206 0c02          	inc	(OFST-17,sp)
1794  0208               L1311:
1797  0208 7b02          	ld	a,(OFST-17,sp)
1798  020a a108          	cp	a,#8
1799  020c 258f          	jrult	L5211
1800                     ; 120 	return temp;
1802  020e 7b01          	ld	a,(OFST-18,sp)
1803  0210 6b0a          	ld	(OFST-9,sp),a
1807                     ; 192 	sensor->Datos.Estado = dht11_MIDIENDO_T;
1809  0212 1e0c          	ldw	x,(OFST-7,sp)
1810  0214 a604          	ld	a,#4
1811  0216 e709          	ld	(9,x),a
1812                     ; 76 	uint8_t contador = 0;
1815  0218 0f02          	clr	(OFST-17,sp)
1817                     ; 77 	uint8_t temp = 0;
1819  021a 0f01          	clr	(OFST-18,sp)
1821                     ; 78 	uint8_t bitLeido = 0;
1823                     ; 80 	for( contador; contador < 8; contador++ )
1826  021c 206b          	jra	L1711
1827  021e               L5611:
1828                     ; 82 		Timeout_Start( dht11->Timeout, TIMEOUT_1MS );
1830  021e ae03e8        	ldw	x,#1000
1831  0221 89            	pushw	x
1832  0222 1e0e          	ldw	x,(OFST-5,sp)
1833  0224 ee0a          	ldw	x,(10,x)
1834  0226 cd0000        	call	_Timeout_Start
1836  0229 85            	popw	x
1838  022a               L7711:
1839                     ; 83 		while( !NHALgpio_Read( &dht11->Config.HW ) && ( dht11->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) ) //Espera nuevo bit
1841  022a 1e0c          	ldw	x,(OFST-7,sp)
1842  022c cd0000        	call	_NHALgpio_Read
1844  022f 4d            	tnz	a
1845  0230 260c          	jrne	L3021
1847  0232 1e0c          	ldw	x,(OFST-7,sp)
1848  0234 ee0a          	ldw	x,(10,x)
1849  0236 ee02          	ldw	x,(2,x)
1850  0238 fd            	call	(x)
1852  0239 a301f4        	cpw	x,#500
1853  023c 25ec          	jrult	L7711
1854  023e               L3021:
1855                     ; 87 		if( dht11->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
1857  023e 1e0c          	ldw	x,(OFST-7,sp)
1858  0240 ee0a          	ldw	x,(10,x)
1859  0242 ee02          	ldw	x,(2,x)
1860  0244 fd            	call	(x)
1862  0245 a301f4        	cpw	x,#500
1863  0248 2506          	jrult	L5021
1864                     ; 89 			dht11->Datos.Estado = dht11_TIMEOUT;
1866  024a 1e0c          	ldw	x,(OFST-7,sp)
1867  024c a60c          	ld	a,#12
1868  024e e709          	ld	(9,x),a
1869  0250               L5021:
1870                     ; 91 		Timeout_Stop( dht11->Timeout );
1872  0250 1e0c          	ldw	x,(OFST-7,sp)
1873  0252 ee0a          	ldw	x,(10,x)
1874  0254 cd0000        	call	_Timeout_Stop
1876                     ; 93 		if( dht11->Datos.Estado != dht11_TIMEOUT )
1878  0257 1e0c          	ldw	x,(OFST-7,sp)
1879  0259 e609          	ld	a,(9,x)
1880  025b a10c          	cp	a,#12
1881  025d 2728          	jreq	L7021
1882                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1886  025f ae00d4        	ldw	x,#212
1888  0262 9d            	nop	
1889  0263               L231:
1890  0263 5a            	decw	X
1891  0264 26fd          	jrne	L231
1892  0266 9d            	nop	
1893                     
1895                     ; 97 			bitLeido = 0;
1897                     ; 98 			if( NHALgpio_Read( &dht11->Config.HW ) )
1899  0267 1e0c          	ldw	x,(OFST-7,sp)
1900  0269 cd0000        	call	_NHALgpio_Read
1902  026c 4d            	tnz	a
1903  026d 2702          	jreq	L1121
1904                     ; 100 				bitLeido = 1;
1906  026f a601          	ld	a,#1
1908  0271               L1121:
1909                     ; 104 				bitLeido = 0;
1911  0271 6b03          	ld	(OFST-16,sp),a
1913                     ; 107 			temp |= bitLeido;
1915  0273 1a01          	or	a,(OFST-18,sp)
1916  0275 6b01          	ld	(OFST-18,sp),a
1918                     ; 108 			if( contador < 7 )
1920  0277 7b02          	ld	a,(OFST-17,sp)
1921  0279 a107          	cp	a,#7
1922  027b 2402          	jruge	L1221
1923                     ; 110 				temp <<=  1;
1925  027d 0801          	sll	(OFST-18,sp)
1927  027f               L1221:
1928                     ; 113 			while( NHALgpio_Read( &dht11->Config.HW ) ) //Si el bit=1 espero a que baje señal
1930  027f 1e0c          	ldw	x,(OFST-7,sp)
1931  0281 cd0000        	call	_NHALgpio_Read
1933  0284 4d            	tnz	a
1934  0285 26f8          	jrne	L1221
1935  0287               L7021:
1936                     ; 80 	for( contador; contador < 8; contador++ )
1938  0287 0c02          	inc	(OFST-17,sp)
1940  0289               L1711:
1943  0289 7b02          	ld	a,(OFST-17,sp)
1944  028b a108          	cp	a,#8
1945  028d 258f          	jrult	L5611
1946                     ; 120 	return temp;
1948  028f 7b01          	ld	a,(OFST-18,sp)
1949  0291 6b09          	ld	(OFST-10,sp),a
1953                     ; 195 	sensor->Datos.Estado = dht11_MIDIENDO_T;
1955  0293 1e0c          	ldw	x,(OFST-7,sp)
1956  0295 a604          	ld	a,#4
1957  0297 e709          	ld	(9,x),a
1958                     ; 76 	uint8_t contador = 0;
1961  0299 0f02          	clr	(OFST-17,sp)
1963                     ; 77 	uint8_t temp = 0;
1965  029b 0f01          	clr	(OFST-18,sp)
1967                     ; 78 	uint8_t bitLeido = 0;
1969                     ; 80 	for( contador; contador < 8; contador++ )
1972  029d 206b          	jra	L1321
1973  029f               L5221:
1974                     ; 82 		Timeout_Start( dht11->Timeout, TIMEOUT_1MS );
1976  029f ae03e8        	ldw	x,#1000
1977  02a2 89            	pushw	x
1978  02a3 1e0e          	ldw	x,(OFST-5,sp)
1979  02a5 ee0a          	ldw	x,(10,x)
1980  02a7 cd0000        	call	_Timeout_Start
1982  02aa 85            	popw	x
1984  02ab               L7321:
1985                     ; 83 		while( !NHALgpio_Read( &dht11->Config.HW ) && ( dht11->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) ) //Espera nuevo bit
1987  02ab 1e0c          	ldw	x,(OFST-7,sp)
1988  02ad cd0000        	call	_NHALgpio_Read
1990  02b0 4d            	tnz	a
1991  02b1 260c          	jrne	L3421
1993  02b3 1e0c          	ldw	x,(OFST-7,sp)
1994  02b5 ee0a          	ldw	x,(10,x)
1995  02b7 ee02          	ldw	x,(2,x)
1996  02b9 fd            	call	(x)
1998  02ba a301f4        	cpw	x,#500
1999  02bd 25ec          	jrult	L7321
2000  02bf               L3421:
2001                     ; 87 		if( dht11->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
2003  02bf 1e0c          	ldw	x,(OFST-7,sp)
2004  02c1 ee0a          	ldw	x,(10,x)
2005  02c3 ee02          	ldw	x,(2,x)
2006  02c5 fd            	call	(x)
2008  02c6 a301f4        	cpw	x,#500
2009  02c9 2506          	jrult	L5421
2010                     ; 89 			dht11->Datos.Estado = dht11_TIMEOUT;
2012  02cb 1e0c          	ldw	x,(OFST-7,sp)
2013  02cd a60c          	ld	a,#12
2014  02cf e709          	ld	(9,x),a
2015  02d1               L5421:
2016                     ; 91 		Timeout_Stop( dht11->Timeout );
2018  02d1 1e0c          	ldw	x,(OFST-7,sp)
2019  02d3 ee0a          	ldw	x,(10,x)
2020  02d5 cd0000        	call	_Timeout_Stop
2022                     ; 93 		if( dht11->Datos.Estado != dht11_TIMEOUT )
2024  02d8 1e0c          	ldw	x,(OFST-7,sp)
2025  02da e609          	ld	a,(9,x)
2026  02dc a10c          	cp	a,#12
2027  02de 2728          	jreq	L7421
2028                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2032  02e0 ae00d4        	ldw	x,#212
2034  02e3 9d            	nop	
2035  02e4               L251:
2036  02e4 5a            	decw	X
2037  02e5 26fd          	jrne	L251
2038  02e7 9d            	nop	
2039                     
2041                     ; 97 			bitLeido = 0;
2043                     ; 98 			if( NHALgpio_Read( &dht11->Config.HW ) )
2045  02e8 1e0c          	ldw	x,(OFST-7,sp)
2046  02ea cd0000        	call	_NHALgpio_Read
2048  02ed 4d            	tnz	a
2049  02ee 2702          	jreq	L1521
2050                     ; 100 				bitLeido = 1;
2052  02f0 a601          	ld	a,#1
2054  02f2               L1521:
2055                     ; 104 				bitLeido = 0;
2057  02f2 6b03          	ld	(OFST-16,sp),a
2059                     ; 107 			temp |= bitLeido;
2061  02f4 1a01          	or	a,(OFST-18,sp)
2062  02f6 6b01          	ld	(OFST-18,sp),a
2064                     ; 108 			if( contador < 7 )
2066  02f8 7b02          	ld	a,(OFST-17,sp)
2067  02fa a107          	cp	a,#7
2068  02fc 2402          	jruge	L1621
2069                     ; 110 				temp <<=  1;
2071  02fe 0801          	sll	(OFST-18,sp)
2073  0300               L1621:
2074                     ; 113 			while( NHALgpio_Read( &dht11->Config.HW ) ) //Si el bit=1 espero a que baje señal
2076  0300 1e0c          	ldw	x,(OFST-7,sp)
2077  0302 cd0000        	call	_NHALgpio_Read
2079  0305 4d            	tnz	a
2080  0306 26f8          	jrne	L1621
2081  0308               L7421:
2082                     ; 80 	for( contador; contador < 8; contador++ )
2084  0308 0c02          	inc	(OFST-17,sp)
2086  030a               L1321:
2089  030a 7b02          	ld	a,(OFST-17,sp)
2090  030c a108          	cp	a,#8
2091  030e 258f          	jrult	L5221
2092                     ; 120 	return temp;
2094  0310 7b01          	ld	a,(OFST-18,sp)
2095  0312 6b08          	ld	(OFST-11,sp),a
2099                     ; 76 	uint8_t contador = 0;
2102  0314 0f02          	clr	(OFST-17,sp)
2104                     ; 77 	uint8_t temp = 0;
2106  0316 0f01          	clr	(OFST-18,sp)
2108                     ; 78 	uint8_t bitLeido = 0;
2110                     ; 80 	for( contador; contador < 8; contador++ )
2113  0318 206b          	jra	L1721
2114  031a               L5621:
2115                     ; 82 		Timeout_Start( dht11->Timeout, TIMEOUT_1MS );
2117  031a ae03e8        	ldw	x,#1000
2118  031d 89            	pushw	x
2119  031e 1e0e          	ldw	x,(OFST-5,sp)
2120  0320 ee0a          	ldw	x,(10,x)
2121  0322 cd0000        	call	_Timeout_Start
2123  0325 85            	popw	x
2125  0326               L7721:
2126                     ; 83 		while( !NHALgpio_Read( &dht11->Config.HW ) && ( dht11->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) ) //Espera nuevo bit
2128  0326 1e0c          	ldw	x,(OFST-7,sp)
2129  0328 cd0000        	call	_NHALgpio_Read
2131  032b 4d            	tnz	a
2132  032c 260c          	jrne	L3031
2134  032e 1e0c          	ldw	x,(OFST-7,sp)
2135  0330 ee0a          	ldw	x,(10,x)
2136  0332 ee02          	ldw	x,(2,x)
2137  0334 fd            	call	(x)
2139  0335 a301f4        	cpw	x,#500
2140  0338 25ec          	jrult	L7721
2141  033a               L3031:
2142                     ; 87 		if( dht11->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
2144  033a 1e0c          	ldw	x,(OFST-7,sp)
2145  033c ee0a          	ldw	x,(10,x)
2146  033e ee02          	ldw	x,(2,x)
2147  0340 fd            	call	(x)
2149  0341 a301f4        	cpw	x,#500
2150  0344 2506          	jrult	L5031
2151                     ; 89 			dht11->Datos.Estado = dht11_TIMEOUT;
2153  0346 1e0c          	ldw	x,(OFST-7,sp)
2154  0348 a60c          	ld	a,#12
2155  034a e709          	ld	(9,x),a
2156  034c               L5031:
2157                     ; 91 		Timeout_Stop( dht11->Timeout );
2159  034c 1e0c          	ldw	x,(OFST-7,sp)
2160  034e ee0a          	ldw	x,(10,x)
2161  0350 cd0000        	call	_Timeout_Stop
2163                     ; 93 		if( dht11->Datos.Estado != dht11_TIMEOUT )
2165  0353 1e0c          	ldw	x,(OFST-7,sp)
2166  0355 e609          	ld	a,(9,x)
2167  0357 a10c          	cp	a,#12
2168  0359 2728          	jreq	L7031
2169                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2173  035b ae00d4        	ldw	x,#212
2175  035e 9d            	nop	
2176  035f               L271:
2177  035f 5a            	decw	X
2178  0360 26fd          	jrne	L271
2179  0362 9d            	nop	
2180                     
2182                     ; 97 			bitLeido = 0;
2184                     ; 98 			if( NHALgpio_Read( &dht11->Config.HW ) )
2186  0363 1e0c          	ldw	x,(OFST-7,sp)
2187  0365 cd0000        	call	_NHALgpio_Read
2189  0368 4d            	tnz	a
2190  0369 2702          	jreq	L1131
2191                     ; 100 				bitLeido = 1;
2193  036b a601          	ld	a,#1
2195  036d               L1131:
2196                     ; 104 				bitLeido = 0;
2198  036d 6b03          	ld	(OFST-16,sp),a
2200                     ; 107 			temp |= bitLeido;
2202  036f 1a01          	or	a,(OFST-18,sp)
2203  0371 6b01          	ld	(OFST-18,sp),a
2205                     ; 108 			if( contador < 7 )
2207  0373 7b02          	ld	a,(OFST-17,sp)
2208  0375 a107          	cp	a,#7
2209  0377 2402          	jruge	L1231
2210                     ; 110 				temp <<=  1;
2212  0379 0801          	sll	(OFST-18,sp)
2214  037b               L1231:
2215                     ; 113 			while( NHALgpio_Read( &dht11->Config.HW ) ) //Si el bit=1 espero a que baje señal
2217  037b 1e0c          	ldw	x,(OFST-7,sp)
2218  037d cd0000        	call	_NHALgpio_Read
2220  0380 4d            	tnz	a
2221  0381 26f8          	jrne	L1231
2222  0383               L7031:
2223                     ; 80 	for( contador; contador < 8; contador++ )
2225  0383 0c02          	inc	(OFST-17,sp)
2227  0385               L1721:
2230  0385 7b02          	ld	a,(OFST-17,sp)
2231  0387 a108          	cp	a,#8
2232  0389 258f          	jrult	L5621
2233                     ; 120 	return temp;
2235  038b 7b01          	ld	a,(OFST-18,sp)
2236  038d 6b07          	ld	(OFST-12,sp),a
2240                     ; 200 	checkCRC = semilla.H_Entero + semilla.H_Decimal + semilla.T_Entero + semilla.T_Decimal;
2242  038f 5f            	clrw	x
2243  0390 7b0b          	ld	a,(OFST-8,sp)
2244  0392 1b0a          	add	a,(OFST-9,sp)
2245  0394 59            	rlcw	x
2246  0395 1b09          	add	a,(OFST-10,sp)
2247  0397 2401          	jrnc	L202
2248  0399 5c            	incw	x
2249  039a               L202:
2250  039a 1b08          	add	a,(OFST-11,sp)
2251  039c 2401          	jrnc	L402
2252  039e 5c            	incw	x
2253  039f               L402:
2254  039f 02            	rlwa	x,a
2255  03a0 1f05          	ldw	(OFST-14,sp),x
2257                     ; 201 	checkCRC &= mask;
2259  03a2 5f            	clrw	x
2260  03a3 7b04          	ld	a,(OFST-15,sp)
2261  03a5 97            	ld	xl,a
2262  03a6 01            	rrwa	x,a
2263  03a7 1406          	and	a,(OFST-13,sp)
2264  03a9 01            	rrwa	x,a
2265  03aa 1405          	and	a,(OFST-14,sp)
2266  03ac 01            	rrwa	x,a
2267  03ad 1f05          	ldw	(OFST-14,sp),x
2269                     ; 203 	if( checkCRC == semilla.CRC )
2271  03af 5f            	clrw	x
2272  03b0 7b07          	ld	a,(OFST-12,sp)
2273  03b2 97            	ld	xl,a
2274  03b3 bf00          	ldw	c_x,x
2275  03b5 1e05          	ldw	x,(OFST-14,sp)
2276  03b7 b300          	cpw	x,c_x
2277  03b9 2606          	jrne	L5231
2278                     ; 205 		sensor->Datos.Estado = dht11_LECTURA_OK;
2280  03bb 1e0c          	ldw	x,(OFST-7,sp)
2281  03bd a60b          	ld	a,#11
2282                     ; 206 		return semilla;
2285  03bf 2004          	jra	L126
2286  03c1               L5231:
2287                     ; 210 		sensor->Datos.Estado = dht11_FALLO_AL_LEER;
2289  03c1 1e0c          	ldw	x,(OFST-7,sp)
2290  03c3 a609          	ld	a,#9
2291                     ; 211 		return semilla;
2295  03c5               L126:
2296  03c5 e709          	ld	(9,x),a
2298  03c7 96            	ldw	x,sp
2299  03c8 1c000f        	addw	x,#OFST-4
2300  03cb 9096          	ldw	y,sp
2301  03cd 72a90007      	addw	y,#OFST-12
2302  03d1 a605          	ld	a,#5
2303  03d3 cd0000        	call	c_xymov
2305                     ; 325 		dht11_CerrarConexion( dht11 );
2308  03d6 1e18          	ldw	x,(OFST+5,sp)
2309  03d8 1f0c          	ldw	(OFST-7,sp),x
2311                     ; 217 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
2313  03da 4bc0          	push	#192
2314  03dc 1e0d          	ldw	x,(OFST-6,sp)
2315  03de cd0000        	call	_NHALgpioConfig_SetType
2317  03e1 84            	pop	a
2318                     ; 218 	NHALgpio_Init( &sensor->Config.HW );
2320  03e2 1e0c          	ldw	x,(OFST-7,sp)
2321  03e4 cd0000        	call	_NHALgpio_Init
2323                     ; 220 	NHALgpio_Write( &sensor->Config.HW, true );
2325  03e7 4b01          	push	#1
2326  03e9 1e0d          	ldw	x,(OFST-6,sp)
2327  03eb cd0000        	call	_NHALgpio_Write
2329  03ee 84            	pop	a
2330                     ; 222 	if( sensor->Datos.Estado == dht11_CERRANDO_CONEXION )
2332  03ef 1e0c          	ldw	x,(OFST-7,sp)
2333  03f1 e609          	ld	a,(9,x)
2334  03f3 a105          	cp	a,#5
2335  03f5 262b          	jrne	L526
2336                     ; 224 		sensor->Datos.Estado = dht11_SLEEP;
2337                     ; 327 		return lectura;
2340  03f7 2025          	jp	LC002
2341  03f9               L7101:
2342                     ; 331 		dht11->Datos.Estado = dht11_FALLO_AL_COMUNICAR;
2344  03f9 1e18          	ldw	x,(OFST+5,sp)
2345  03fb a60a          	ld	a,#10
2346  03fd e709          	ld	(9,x),a
2347                     ; 332 		dht11_CerrarConexion( dht11 );
2350  03ff 1f0c          	ldw	(OFST-7,sp),x
2352                     ; 217 	NHALgpioConfig_SetType( &sensor->Config.HW, GPIO_MODE_OUT_PP_LOW_SLOW ); //Salida a 2Mhz
2354  0401 4bc0          	push	#192
2355  0403 1e0d          	ldw	x,(OFST-6,sp)
2356  0405 cd0000        	call	_NHALgpioConfig_SetType
2358  0408 84            	pop	a
2359                     ; 218 	NHALgpio_Init( &sensor->Config.HW );
2361  0409 1e0c          	ldw	x,(OFST-7,sp)
2362  040b cd0000        	call	_NHALgpio_Init
2364                     ; 220 	NHALgpio_Write( &sensor->Config.HW, true );
2366  040e 4b01          	push	#1
2367  0410 1e0d          	ldw	x,(OFST-6,sp)
2368  0412 cd0000        	call	_NHALgpio_Write
2370  0415 84            	pop	a
2371                     ; 222 	if( sensor->Datos.Estado == dht11_CERRANDO_CONEXION )
2373  0416 1e0c          	ldw	x,(OFST-7,sp)
2374  0418 e609          	ld	a,(9,x)
2375  041a a105          	cp	a,#5
2376  041c 2604          	jrne	L526
2377                     ; 224 		sensor->Datos.Estado = dht11_SLEEP;
2379  041e               LC002:
2381  041e a606          	ld	a,#6
2382  0420 e709          	ld	(9,x),a
2383  0422               L526:
2384                     ; 334 		return lectura;
2389  0422 1e16          	ldw	x,(OFST+3,sp)
2390  0424 9096          	ldw	y,sp
2391  0426 72a9000f      	addw	y,#OFST-4
2392  042a a605          	ld	a,#5
2393  042c cd0000        	call	c_xymov
2395  042f 5b13          	addw	sp,#19
2396  0431 81            	ret	
2409                     	xdef	_dht11_Lectura
2410                     	xdef	_DHT11_Init
2411                     	xref	_Timeout_Stop
2412                     	xref	_Timeout_Start
2413                     	xref	_NHALgpio_Write
2414                     	xref	_NHALgpio_Read
2415                     	xref	_NHALgpio_Init
2416                     	xref	_NHALgpioConfig_SetType
2417                     	xref.b	c_x
2436                     	xref	c_xymov
2437                     	end

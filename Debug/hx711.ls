   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 00            	dc.b	0
  50                     .const:	section	.text
  51  0000               L72_HX711_LONGITUDTRAMA:
  52  0000 18            	dc.b	24
  53  0001               L13_HX711_TIEMPOCLOCK:
  54  0001 03            	dc.b	3
  55  0002               L33_HX711_TIEMPOCLOCKSLEEP:
  56  0002 46            	dc.b	70
 991                     ; 259 void HX711_Init( HX711_t_ptr hx711, HX711_fPtr Lectura, HX711_fPtr Tarar, Timeout_t_ptr Timeout )
 991                     ; 260 {
 993                     .text:	section	.text,new
 994  0000               _HX711_Init:
 996  0000 89            	pushw	x
 997  0001 89            	pushw	x
 998       00000002      OFST:	set	2
1001                     ; 261 	initPtrFunciones( hx711, Lectura, Tarar );
1005                     ; 67 	hx711->Lectura = Lectura;
1007  0002 1607          	ldw	y,(OFST+5,sp)
1008  0004 ef18          	ldw	(24,x),y
1009                     ; 68 	hx711->Tarar = Tarar;
1011  0006 1609          	ldw	y,(OFST+7,sp)
1012  0008 ef1a          	ldw	(26,x),y
1013                     ; 263 	hx711->Timeout = Timeout;
1015  000a 160b          	ldw	y,(OFST+9,sp)
1016  000c ef16          	ldw	(22,x),y
1017                     ; 265 	initVariables( hx711 );
1021                     ; 73 	hx711->Datos.UltimaLectura = 0;
1023  000e 4f            	clr	a
1024  000f e714          	ld	(20,x),a
1025  0011 e713          	ld	(19,x),a
1026  0013 e712          	ld	(18,x),a
1027  0015 e711          	ld	(17,x),a
1028                     ; 74 	hx711->Config.ValorTara = 0;
1030  0017 905f          	clrw	y
1031  0019 ef0f          	ldw	(15,x),y
1032                     ; 75 	hx711->Config.ValorConversion = 1;
1034  001b 905c          	incw	y
1035  001d ef09          	ldw	(9,x),y
1036                     ; 76 	hx711->Config.Ganancia = CHANNELA_128;
1038  001f 6f08          	clr	(8,x)
1039                     ; 267 	initDOUT( &hx711->Config.DOUT );
1042  0021 1f01          	ldw	(OFST-1,sp),x
1044                     ; 81 	NHALgpioConfig_SetType( dout,GPIO_MODE_IN_PU_NO_IT );
1046  0023 4b40          	push	#64
1047  0025 1e02          	ldw	x,(OFST+0,sp)
1048  0027 cd0000        	call	_NHALgpioConfig_SetType
1050  002a 84            	pop	a
1051                     ; 82 	NHALgpio_Init( dout );
1053  002b 1e01          	ldw	x,(OFST-1,sp)
1054  002d cd0000        	call	_NHALgpio_Init
1056                     ; 268 	initPDSCK( &hx711->Config.PD_SCK );
1059  0030 1e03          	ldw	x,(OFST+1,sp)
1060  0032 1c0004        	addw	x,#4
1061  0035 1f01          	ldw	(OFST-1,sp),x
1063                     ; 87 	NHALgpioConfig_SetType( pdsck, GPIO_MODE_OUT_PP_LOW_FAST );
1065  0037 4be0          	push	#224
1066  0039 1e02          	ldw	x,(OFST+0,sp)
1067  003b cd0000        	call	_NHALgpioConfig_SetType
1069  003e 84            	pop	a
1070                     ; 88 	NHALgpio_Init( pdsck );
1072  003f 1e01          	ldw	x,(OFST-1,sp)
1073  0041 cd0000        	call	_NHALgpio_Init
1075                     ; 270 	chequearValorConversion( hx711 );
1078  0044 1e03          	ldw	x,(OFST+1,sp)
1079  0046 1f01          	ldw	(OFST-1,sp),x
1081                     ; 93 	if( ( hx711->Config.ValorConversion ) == 0 )
1083  0048 e60a          	ld	a,(10,x)
1084  004a ea09          	or	a,(9,x)
1085  004c 260b          	jrne	L176
1086                     ; 95 		hx711->Config.ValorConversion = 1;
1088  004e 90ae0001      	ldw	y,#1
1089  0052 ef09          	ldw	(9,x),y
1090                     ; 96 		hx711->Datos.Estado = SINVALORCONVERSION;
1092  0054 4c            	inc	a
1093  0055 e715          	ld	(21,x),a
1095  0057 2002          	jra	L521
1096  0059               L176:
1097                     ; 100 		hx711->Datos.Estado = INICIALIZADO;
1099  0059 6f15          	clr	(21,x)
1100  005b               L521:
1101                     ; 272 	aDormir( hx711 );
1104  005b 1f01          	ldw	(OFST-1,sp),x
1106                     ; 106 	NHALgpio_Write( &hx711->Config.PD_SCK, true );
1108  005d 4b01          	push	#1
1109  005f 1e02          	ldw	x,(OFST+0,sp)
1110  0061 1c0004        	addw	x,#4
1111  0064 cd0000        	call	_NHALgpio_Write
1113  0067 ae0174        	ldw	x,#372
1114  006a 9d            	nop	
1115  006b 84            	pop	a
1116                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1121  006c               L02:
1122  006c 5a            	decw	X
1123  006d 26fd          	jrne	L02
1124  006f 9d            	nop	
1125                     
1127                     ; 109 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1129  0070 1e01          	ldw	x,(OFST-1,sp)
1130  0072 e615          	ld	a,(21,x)
1131  0074 4a            	dec	a
1132  0075 2704          	jreq	L331
1133                     ; 111 		hx711->Datos.Estado = SLEEP;
1135  0077 a602          	ld	a,#2
1136  0079 e715          	ld	(21,x),a
1138  007b               L331:
1139                     ; 273 }
1142  007b 5b04          	addw	sp,#4
1143  007d 81            	ret	
1262                     ; 308 uint16_t hx711_Lectura( HX711_t_ptr hx711 )
1262                     ; 309 {
1263                     .text:	section	.text,new
1264  0000               _hx711_Lectura:
1266  0000 89            	pushw	x
1267  0001 520b          	subw	sp,#11
1268       0000000b      OFST:	set	11
1271                     ; 310 	uint32_t semilla = 0;
1273                     ; 312 	semilla = leer( hx711 );
1276  0003 1f06          	ldw	(OFST-5,sp),x
1278                     ; 185 	uint32_t semilla = 0;
1280  0005 5f            	clrw	x
1281  0006 1f0a          	ldw	(OFST-1,sp),x
1282  0008 1f08          	ldw	(OFST-3,sp),x
1284                     ; 186 	uint8_t contadorBucle = 0;
1286  000a 0f05          	clr	(OFST-6,sp)
1288                     ; 188 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1290  000c 1e06          	ldw	x,(OFST-5,sp)
1291  000e e615          	ld	a,(21,x)
1292  0010 4a            	dec	a
1293  0011 2603cc01ce    	jreq	L3311
1294                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1297  0016 4b00          	push	#0
1298  0018 1e07          	ldw	x,(OFST-4,sp)
1299  001a 1c0004        	addw	x,#4
1300  001d cd0000        	call	_NHALgpio_Write
1302  0020 ae000f        	ldw	x,#15
1303  0023 9d            	nop	
1304  0024 84            	pop	a
1305                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1310  0025               L62:
1311  0025 5a            	decw	X
1312  0026 26fd          	jrne	L62
1313  0028 9d            	nop	
1314                     
1316                     ; 159 	if( hx711->Timeout != NULL )
1319  0029 1e06          	ldw	x,(OFST-5,sp)
1320  002b e617          	ld	a,(23,x)
1321  002d ea16          	or	a,(22,x)
1322  002f 2737          	jreq	L3511
1323                     ; 161 		Timeout_Start( hx711->Timeout, 40 );
1325  0031 ae0028        	ldw	x,#40
1326  0034 89            	pushw	x
1327  0035 1e08          	ldw	x,(OFST-3,sp)
1328  0037 ee16          	ldw	x,(22,x)
1329  0039 cd0000        	call	_Timeout_Start
1331  003c 85            	popw	x
1333  003d               L1411:
1334                     ; 162 		while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) || ( hx711->Timeout->Config.Notificacion( ) == 0 ) )
1336  003d 1e06          	ldw	x,(OFST-5,sp)
1337  003f cd0000        	call	_NHALgpio_Read
1339  0042 4d            	tnz	a
1340  0043 26f8          	jrne	L1411
1342  0045 1e06          	ldw	x,(OFST-5,sp)
1343  0047 ee16          	ldw	x,(22,x)
1344  0049 ee02          	ldw	x,(2,x)
1345  004b fd            	call	(x)
1347  004c 4d            	tnz	a
1348  004d 27ee          	jreq	L1411
1349                     ; 167 		if( hx711->Timeout->Config.Notificacion( ) )
1351  004f 1e06          	ldw	x,(OFST-5,sp)
1352  0051 ee16          	ldw	x,(22,x)
1353  0053 ee02          	ldw	x,(2,x)
1354  0055 fd            	call	(x)
1356  0056 4d            	tnz	a
1357  0057 2706          	jreq	L5411
1358                     ; 169 			hx711->Datos.Estado = TIMEOUT;
1360  0059 1e06          	ldw	x,(OFST-5,sp)
1361  005b a604          	ld	a,#4
1362  005d e715          	ld	(21,x),a
1363  005f               L5411:
1364                     ; 171 		Timeout_Stop( hx711->Timeout );
1366  005f 1e06          	ldw	x,(OFST-5,sp)
1367  0061 ee16          	ldw	x,(22,x)
1368  0063 cd0000        	call	_Timeout_Stop
1371  0066 2008          	jra	L7411
1372  0068               L3511:
1373                     ; 175 		while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) )
1375  0068 1e06          	ldw	x,(OFST-5,sp)
1376  006a cd0000        	call	_NHALgpio_Read
1378  006d 4d            	tnz	a
1379  006e 26f8          	jrne	L3511
1380  0070               L7411:
1381                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1385  0070 ae000f        	ldw	x,#15
1387  0073 9d            	nop	
1388  0074               L44:
1389  0074 5a            	decw	X
1390  0075 26fd          	jrne	L44
1391                     
1393  0077 2043          	jra	L1611
1394  0079               L7511:
1395                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1398  0079 4b01          	push	#1
1399  007b 1e07          	ldw	x,(OFST-4,sp)
1400  007d 1c0004        	addw	x,#4
1401  0080 cd0000        	call	_NHALgpio_Write
1403  0083 ae000f        	ldw	x,#15
1404  0086 9d            	nop	
1405  0087 84            	pop	a
1406                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1411  0088               L05:
1412  0088 5a            	decw	X
1413  0089 26fd          	jrne	L05
1414  008b 9d            	nop	
1415                     
1417                     ; 203 			semilla |= NHALgpio_Read( &hx711->Config.DOUT );
1419  008c 1e06          	ldw	x,(OFST-5,sp)
1420  008e cd0000        	call	_NHALgpio_Read
1422  0091 b703          	ld	c_lreg+3,a
1423  0093 3f02          	clr	c_lreg+2
1424  0095 3f01          	clr	c_lreg+1
1425  0097 3f00          	clr	c_lreg
1426  0099 96            	ldw	x,sp
1427  009a 1c0008        	addw	x,#OFST-3
1428  009d cd0000        	call	c_lgor
1431                     ; 204 			semilla <<= 1;
1433  00a0 080b          	sll	(OFST+0,sp)
1434  00a2 090a          	rlc	(OFST-1,sp)
1435  00a4 0909          	rlc	(OFST-2,sp)
1436  00a6 0908          	rlc	(OFST-3,sp)
1438                     ; 206 			contadorBucle++;
1440  00a8 0c05          	inc	(OFST-6,sp)
1442                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1445  00aa 4b00          	push	#0
1446  00ac 1e07          	ldw	x,(OFST-4,sp)
1447  00ae 1c0004        	addw	x,#4
1448  00b1 cd0000        	call	_NHALgpio_Write
1450  00b4 ae000f        	ldw	x,#15
1451  00b7 9d            	nop	
1452  00b8 84            	pop	a
1453                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1458  00b9               L65:
1459  00b9 5a            	decw	X
1460  00ba 26fd          	jrne	L65
1461                     
1463  00bc               L1611:
1464  00bc 9d            	nop	
1465                     ; 197 		while( contadorBucle < HX711_LONGITUDTRAMA ) 
1467  00bd 7b05          	ld	a,(OFST-6,sp)
1468  00bf a118          	cp	a,#24
1469  00c1 25b6          	jrult	L7511
1470                     ; 126 	switch( hx711->Config.Ganancia )
1473  00c3 1e06          	ldw	x,(OFST-5,sp)
1474  00c5 e608          	ld	a,(8,x)
1476                     ; 151 		default:
1476                     ; 152 		
1476                     ; 153 		;
1477  00c7 270b          	jreq	L137
1478  00c9 4a            	dec	a
1479  00ca 2740          	jreq	L747
1480  00cc 4a            	dec	a
1481  00cd 2603cc0180    	jreq	L5101
1482  00d2 2028          	jra	L1501
1483  00d4               L137:
1484                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1487  00d4 4b01          	push	#1
1488  00d6 1e07          	ldw	x,(OFST-4,sp)
1489  00d8 1c0004        	addw	x,#4
1490  00db cd0000        	call	_NHALgpio_Write
1492  00de ae000f        	ldw	x,#15
1493  00e1 9d            	nop	
1494  00e2 84            	pop	a
1495                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1500  00e3               L26:
1501  00e3 5a            	decw	X
1502  00e4 26fd          	jrne	L26
1503  00e6 9d            	nop	
1504                     
1506                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1509  00e7 4b00          	push	#0
1510  00e9 1e07          	ldw	x,(OFST-4,sp)
1511  00eb 1c0004        	addw	x,#4
1512  00ee cd0000        	call	_NHALgpio_Write
1514  00f1 ae000f        	ldw	x,#15
1515  00f4 9d            	nop	
1516  00f5 84            	pop	a
1517                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1522  00f6               L66:
1523  00f6 5a            	decw	X
1524  00f7 26fd          	jrne	L66
1525  00f9               LC001:
1526  00f9 9d            	nop	
1527                     
1529  00fa 1e06          	ldw	x,(OFST-5,sp)
1530  00fc               L1501:
1531                     ; 214 		if( hx711->Datos.Estado != TIMEOUT )
1533  00fc e615          	ld	a,(21,x)
1534  00fe a104          	cp	a,#4
1535  0100 2603cc01ce    	jreq	L3311
1536                     ; 216 			hx711->Datos.Estado = NUEVA_LECTURA;
1538  0105 a603          	ld	a,#3
1539  0107 e715          	ld	(21,x),a
1540  0109 cc01ce        	jra	L3311
1541  010c               L747:
1542                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1545  010c 4b01          	push	#1
1546  010e 1e07          	ldw	x,(OFST-4,sp)
1547  0110 1c0004        	addw	x,#4
1548  0113 cd0000        	call	_NHALgpio_Write
1550  0116 ae000f        	ldw	x,#15
1551  0119 9d            	nop	
1552  011a 84            	pop	a
1553                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1558  011b               L27:
1559  011b 5a            	decw	X
1560  011c 26fd          	jrne	L27
1561  011e 9d            	nop	
1562                     
1564                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1567  011f 4b00          	push	#0
1568  0121 1e07          	ldw	x,(OFST-4,sp)
1569  0123 1c0004        	addw	x,#4
1570  0126 cd0000        	call	_NHALgpio_Write
1572  0129 ae000f        	ldw	x,#15
1573  012c 9d            	nop	
1574  012d 84            	pop	a
1575                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1580  012e               L67:
1581  012e 5a            	decw	X
1582  012f 26fd          	jrne	L67
1583  0131 9d            	nop	
1584                     
1586                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1589  0132 4b01          	push	#1
1590  0134 1e07          	ldw	x,(OFST-4,sp)
1591  0136 1c0004        	addw	x,#4
1592  0139 cd0000        	call	_NHALgpio_Write
1594  013c ae000f        	ldw	x,#15
1595  013f 9d            	nop	
1596  0140 84            	pop	a
1597                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1602  0141               L201:
1603  0141 5a            	decw	X
1604  0142 26fd          	jrne	L201
1605  0144 9d            	nop	
1606                     
1608                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1611  0145 4b00          	push	#0
1612  0147 1e07          	ldw	x,(OFST-4,sp)
1613  0149 1c0004        	addw	x,#4
1614  014c cd0000        	call	_NHALgpio_Write
1616  014f ae000f        	ldw	x,#15
1617  0152 9d            	nop	
1618  0153 84            	pop	a
1619                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1624  0154               L601:
1625  0154 5a            	decw	X
1626  0155 26fd          	jrne	L601
1627  0157 9d            	nop	
1628                     
1630                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1633  0158 4b01          	push	#1
1634  015a 1e07          	ldw	x,(OFST-4,sp)
1635  015c 1c0004        	addw	x,#4
1636  015f cd0000        	call	_NHALgpio_Write
1638  0162 ae000f        	ldw	x,#15
1639  0165 9d            	nop	
1640  0166 84            	pop	a
1641                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1646  0167               L211:
1647  0167 5a            	decw	X
1648  0168 26fd          	jrne	L211
1649  016a 9d            	nop	
1650                     
1652                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1655  016b 4b00          	push	#0
1656  016d 1e07          	ldw	x,(OFST-4,sp)
1657  016f 1c0004        	addw	x,#4
1658  0172 cd0000        	call	_NHALgpio_Write
1660  0175 ae000f        	ldw	x,#15
1661  0178 9d            	nop	
1662  0179 84            	pop	a
1663                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1668  017a               L611:
1669  017a 5a            	decw	X
1670  017b 26fd          	jrne	L611
1671                     
1673  017d cc00f9        	jp	LC001
1674  0180               L5101:
1675                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1678  0180 4b01          	push	#1
1679  0182 1e07          	ldw	x,(OFST-4,sp)
1680  0184 1c0004        	addw	x,#4
1681  0187 cd0000        	call	_NHALgpio_Write
1683  018a ae000f        	ldw	x,#15
1684  018d 9d            	nop	
1685  018e 84            	pop	a
1686                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1691  018f               L221:
1692  018f 5a            	decw	X
1693  0190 26fd          	jrne	L221
1694  0192 9d            	nop	
1695                     
1697                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1700  0193 4b00          	push	#0
1701  0195 1e07          	ldw	x,(OFST-4,sp)
1702  0197 1c0004        	addw	x,#4
1703  019a cd0000        	call	_NHALgpio_Write
1705  019d ae000f        	ldw	x,#15
1706  01a0 9d            	nop	
1707  01a1 84            	pop	a
1708                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1713  01a2               L621:
1714  01a2 5a            	decw	X
1715  01a3 26fd          	jrne	L621
1716  01a5 9d            	nop	
1717                     
1719                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1722  01a6 4b01          	push	#1
1723  01a8 1e07          	ldw	x,(OFST-4,sp)
1724  01aa 1c0004        	addw	x,#4
1725  01ad cd0000        	call	_NHALgpio_Write
1727  01b0 ae000f        	ldw	x,#15
1728  01b3 9d            	nop	
1729  01b4 84            	pop	a
1730                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1735  01b5               L231:
1736  01b5 5a            	decw	X
1737  01b6 26fd          	jrne	L231
1738  01b8 9d            	nop	
1739                     
1741                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1744  01b9 4b00          	push	#0
1745  01bb 1e07          	ldw	x,(OFST-4,sp)
1746  01bd 1c0004        	addw	x,#4
1747  01c0 cd0000        	call	_NHALgpio_Write
1749  01c3 ae000f        	ldw	x,#15
1750  01c6 9d            	nop	
1751  01c7 84            	pop	a
1752                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1757  01c8               L631:
1758  01c8 5a            	decw	X
1759  01c9 26fd          	jrne	L631
1760                     
1762  01cb cc00f9        	jp	LC001
1763  01ce               L3311:
1764                     ; 219 		return semilla;
1769                     ; 313 	aDormir( hx711 );
1772  01ce 1e0c          	ldw	x,(OFST+1,sp)
1773  01d0 1f06          	ldw	(OFST-5,sp),x
1775                     ; 106 	NHALgpio_Write( &hx711->Config.PD_SCK, true );
1777  01d2 4b01          	push	#1
1778  01d4 1e07          	ldw	x,(OFST-4,sp)
1779  01d6 1c0004        	addw	x,#4
1780  01d9 cd0000        	call	_NHALgpio_Write
1782  01dc ae0174        	ldw	x,#372
1783  01df 9d            	nop	
1784  01e0 84            	pop	a
1785                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1790  01e1               L441:
1791  01e1 5a            	decw	X
1792  01e2 26fd          	jrne	L441
1793  01e4 9d            	nop	
1794                     
1796                     ; 109 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1798  01e5 1e06          	ldw	x,(OFST-5,sp)
1799  01e7 e615          	ld	a,(21,x)
1800  01e9 4a            	dec	a
1801  01ea 2704          	jreq	L1601
1802                     ; 111 		hx711->Datos.Estado = SLEEP;
1804  01ec a602          	ld	a,#2
1805  01ee e715          	ld	(21,x),a
1807  01f0               L1601:
1808                     ; 315 	if( ( semilla > hx711->Config.ValorZero ) )
1810  01f0 1e0c          	ldw	x,(OFST+1,sp)
1811  01f2 1c000b        	addw	x,#11
1812  01f5 cd0000        	call	c_ltor
1814  01f8 96            	ldw	x,sp
1815  01f9 1c0008        	addw	x,#OFST-3
1816  01fc cd0000        	call	c_lcmp
1818  01ff 2424          	jruge	L7711
1819                     ; 317 		return ( ( semilla - hx711->Config.ValorZero ) / hx711->Config.ValorConversion );
1821  0201 1e0c          	ldw	x,(OFST+1,sp)
1822  0203 ee09          	ldw	x,(9,x)
1823  0205 cd0000        	call	c_uitolx
1825  0208 96            	ldw	x,sp
1826  0209 5c            	incw	x
1827  020a cd0000        	call	c_rtol
1830  020d 96            	ldw	x,sp
1831  020e 1c0008        	addw	x,#OFST-3
1832  0211 cd0000        	call	c_ltor
1834  0214 1e0c          	ldw	x,(OFST+1,sp)
1835  0216 1c000b        	addw	x,#11
1836  0219 cd0000        	call	c_lsub
1838  021c 96            	ldw	x,sp
1839  021d 5c            	incw	x
1840  021e cd0000        	call	c_ludv
1842  0221 be02          	ldw	x,c_lreg+2
1844  0223 2001          	jra	L641
1845  0225               L7711:
1846                     ; 321 		return 0;
1848  0225 5f            	clrw	x
1850  0226               L641:
1852  0226 5b0d          	addw	sp,#13
1853  0228 81            	ret	
1966                     ; 358 uint16_t hx711_Tarar( HX711_t_ptr hx711 )
1966                     ; 359 {
1967                     .text:	section	.text,new
1968  0000               _hx711_Tarar:
1970  0000 89            	pushw	x
1971  0001 5210          	subw	sp,#16
1972       00000010      OFST:	set	16
1975                     ; 360 	uint32_t valorMedio = 0;
1977  0003 5f            	clrw	x
1978  0004 1f0e          	ldw	(OFST-2,sp),x
1979  0006 1f0c          	ldw	(OFST-4,sp),x
1981                     ; 361 	uint8_t repeticiones = 4;
1983  0008 a604          	ld	a,#4
1984  000a 6b10          	ld	(OFST+0,sp),a
1986  000c               L5241:
1987                     ; 365 		valorMedio = valorMedio + leer( hx711 );
1990  000c 1e11          	ldw	x,(OFST+1,sp)
1991  000e 1f06          	ldw	(OFST-10,sp),x
1993                     ; 185 	uint32_t semilla = 0;
1995  0010 5f            	clrw	x
1996  0011 1f04          	ldw	(OFST-12,sp),x
1997  0013 1f02          	ldw	(OFST-14,sp),x
1999                     ; 186 	uint8_t contadorBucle = 0;
2001  0015 0f01          	clr	(OFST-15,sp)
2003                     ; 188 	if( hx711->Datos.Estado != SINVALORCONVERSION )
2005  0017 1e06          	ldw	x,(OFST-10,sp)
2006  0019 e615          	ld	a,(21,x)
2007  001b 4a            	dec	a
2008  001c 2603cc01d9    	jreq	L3341
2009                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2012  0021 4b00          	push	#0
2013  0023 1e07          	ldw	x,(OFST-9,sp)
2014  0025 1c0004        	addw	x,#4
2015  0028 cd0000        	call	_NHALgpio_Write
2017  002b ae000f        	ldw	x,#15
2018  002e 9d            	nop	
2019  002f 84            	pop	a
2020                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2025  0030               L451:
2026  0030 5a            	decw	X
2027  0031 26fd          	jrne	L451
2028  0033 9d            	nop	
2029                     
2031                     ; 159 	if( hx711->Timeout != NULL )
2034  0034 1e06          	ldw	x,(OFST-10,sp)
2035  0036 e617          	ld	a,(23,x)
2036  0038 ea16          	or	a,(22,x)
2037  003a 2737          	jreq	L3541
2038                     ; 161 		Timeout_Start( hx711->Timeout, 40 );
2040  003c ae0028        	ldw	x,#40
2041  003f 89            	pushw	x
2042  0040 1e08          	ldw	x,(OFST-8,sp)
2043  0042 ee16          	ldw	x,(22,x)
2044  0044 cd0000        	call	_Timeout_Start
2046  0047 85            	popw	x
2048  0048               L1441:
2049                     ; 162 		while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) || ( hx711->Timeout->Config.Notificacion( ) == 0 ) )
2051  0048 1e06          	ldw	x,(OFST-10,sp)
2052  004a cd0000        	call	_NHALgpio_Read
2054  004d 4d            	tnz	a
2055  004e 26f8          	jrne	L1441
2057  0050 1e06          	ldw	x,(OFST-10,sp)
2058  0052 ee16          	ldw	x,(22,x)
2059  0054 ee02          	ldw	x,(2,x)
2060  0056 fd            	call	(x)
2062  0057 4d            	tnz	a
2063  0058 27ee          	jreq	L1441
2064                     ; 167 		if( hx711->Timeout->Config.Notificacion( ) )
2066  005a 1e06          	ldw	x,(OFST-10,sp)
2067  005c ee16          	ldw	x,(22,x)
2068  005e ee02          	ldw	x,(2,x)
2069  0060 fd            	call	(x)
2071  0061 4d            	tnz	a
2072  0062 2706          	jreq	L5441
2073                     ; 169 			hx711->Datos.Estado = TIMEOUT;
2075  0064 1e06          	ldw	x,(OFST-10,sp)
2076  0066 a604          	ld	a,#4
2077  0068 e715          	ld	(21,x),a
2078  006a               L5441:
2079                     ; 171 		Timeout_Stop( hx711->Timeout );
2081  006a 1e06          	ldw	x,(OFST-10,sp)
2082  006c ee16          	ldw	x,(22,x)
2083  006e cd0000        	call	_Timeout_Stop
2086  0071 2008          	jra	L7441
2087  0073               L3541:
2088                     ; 175 		while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) )
2090  0073 1e06          	ldw	x,(OFST-10,sp)
2091  0075 cd0000        	call	_NHALgpio_Read
2093  0078 4d            	tnz	a
2094  0079 26f8          	jrne	L3541
2095  007b               L7441:
2096                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2100  007b ae000f        	ldw	x,#15
2102  007e 9d            	nop	
2103  007f               L271:
2104  007f 5a            	decw	X
2105  0080 26fd          	jrne	L271
2106                     
2108  0082 2043          	jra	L1641
2109  0084               L7541:
2110                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2113  0084 4b01          	push	#1
2114  0086 1e07          	ldw	x,(OFST-9,sp)
2115  0088 1c0004        	addw	x,#4
2116  008b cd0000        	call	_NHALgpio_Write
2118  008e ae000f        	ldw	x,#15
2119  0091 9d            	nop	
2120  0092 84            	pop	a
2121                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2126  0093               L671:
2127  0093 5a            	decw	X
2128  0094 26fd          	jrne	L671
2129  0096 9d            	nop	
2130                     
2132                     ; 203 			semilla |= NHALgpio_Read( &hx711->Config.DOUT );
2134  0097 1e06          	ldw	x,(OFST-10,sp)
2135  0099 cd0000        	call	_NHALgpio_Read
2137  009c b703          	ld	c_lreg+3,a
2138  009e 3f02          	clr	c_lreg+2
2139  00a0 3f01          	clr	c_lreg+1
2140  00a2 3f00          	clr	c_lreg
2141  00a4 96            	ldw	x,sp
2142  00a5 1c0002        	addw	x,#OFST-14
2143  00a8 cd0000        	call	c_lgor
2146                     ; 204 			semilla <<= 1;
2148  00ab 0805          	sll	(OFST-11,sp)
2149  00ad 0904          	rlc	(OFST-12,sp)
2150  00af 0903          	rlc	(OFST-13,sp)
2151  00b1 0902          	rlc	(OFST-14,sp)
2153                     ; 206 			contadorBucle++;
2155  00b3 0c01          	inc	(OFST-15,sp)
2157                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2160  00b5 4b00          	push	#0
2161  00b7 1e07          	ldw	x,(OFST-9,sp)
2162  00b9 1c0004        	addw	x,#4
2163  00bc cd0000        	call	_NHALgpio_Write
2165  00bf ae000f        	ldw	x,#15
2166  00c2 9d            	nop	
2167  00c3 84            	pop	a
2168                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2173  00c4               L402:
2174  00c4 5a            	decw	X
2175  00c5 26fd          	jrne	L402
2176                     
2178  00c7               L1641:
2179  00c7 9d            	nop	
2180                     ; 197 		while( contadorBucle < HX711_LONGITUDTRAMA ) 
2182  00c8 7b01          	ld	a,(OFST-15,sp)
2183  00ca a118          	cp	a,#24
2184  00cc 25b6          	jrult	L7541
2185                     ; 126 	switch( hx711->Config.Ganancia )
2188  00ce 1e06          	ldw	x,(OFST-10,sp)
2189  00d0 e608          	ld	a,(8,x)
2191                     ; 151 		default:
2191                     ; 152 		
2191                     ; 153 		;
2192  00d2 270b          	jreq	L3321
2193  00d4 4a            	dec	a
2194  00d5 2740          	jreq	L1521
2195  00d7 4a            	dec	a
2196  00d8 2603cc018b    	jreq	L7131
2197  00dd 2028          	jra	L3531
2198  00df               L3321:
2199                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2202  00df 4b01          	push	#1
2203  00e1 1e07          	ldw	x,(OFST-9,sp)
2204  00e3 1c0004        	addw	x,#4
2205  00e6 cd0000        	call	_NHALgpio_Write
2207  00e9 ae000f        	ldw	x,#15
2208  00ec 9d            	nop	
2209  00ed 84            	pop	a
2210                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2215  00ee               L012:
2216  00ee 5a            	decw	X
2217  00ef 26fd          	jrne	L012
2218  00f1 9d            	nop	
2219                     
2221                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2224  00f2 4b00          	push	#0
2225  00f4 1e07          	ldw	x,(OFST-9,sp)
2226  00f6 1c0004        	addw	x,#4
2227  00f9 cd0000        	call	_NHALgpio_Write
2229  00fc ae000f        	ldw	x,#15
2230  00ff 9d            	nop	
2231  0100 84            	pop	a
2232                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2237  0101               L412:
2238  0101 5a            	decw	X
2239  0102 26fd          	jrne	L412
2240  0104               LC002:
2241  0104 9d            	nop	
2242                     
2244  0105 1e06          	ldw	x,(OFST-10,sp)
2245  0107               L3531:
2246                     ; 214 		if( hx711->Datos.Estado != TIMEOUT )
2248  0107 e615          	ld	a,(21,x)
2249  0109 a104          	cp	a,#4
2250  010b 2603cc01d9    	jreq	L3341
2251                     ; 216 			hx711->Datos.Estado = NUEVA_LECTURA;
2253  0110 a603          	ld	a,#3
2254  0112 e715          	ld	(21,x),a
2255  0114 cc01d9        	jra	L3341
2256  0117               L1521:
2257                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2260  0117 4b01          	push	#1
2261  0119 1e07          	ldw	x,(OFST-9,sp)
2262  011b 1c0004        	addw	x,#4
2263  011e cd0000        	call	_NHALgpio_Write
2265  0121 ae000f        	ldw	x,#15
2266  0124 9d            	nop	
2267  0125 84            	pop	a
2268                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2273  0126               L022:
2274  0126 5a            	decw	X
2275  0127 26fd          	jrne	L022
2276  0129 9d            	nop	
2277                     
2279                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2282  012a 4b00          	push	#0
2283  012c 1e07          	ldw	x,(OFST-9,sp)
2284  012e 1c0004        	addw	x,#4
2285  0131 cd0000        	call	_NHALgpio_Write
2287  0134 ae000f        	ldw	x,#15
2288  0137 9d            	nop	
2289  0138 84            	pop	a
2290                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2295  0139               L422:
2296  0139 5a            	decw	X
2297  013a 26fd          	jrne	L422
2298  013c 9d            	nop	
2299                     
2301                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2304  013d 4b01          	push	#1
2305  013f 1e07          	ldw	x,(OFST-9,sp)
2306  0141 1c0004        	addw	x,#4
2307  0144 cd0000        	call	_NHALgpio_Write
2309  0147 ae000f        	ldw	x,#15
2310  014a 9d            	nop	
2311  014b 84            	pop	a
2312                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2317  014c               L032:
2318  014c 5a            	decw	X
2319  014d 26fd          	jrne	L032
2320  014f 9d            	nop	
2321                     
2323                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2326  0150 4b00          	push	#0
2327  0152 1e07          	ldw	x,(OFST-9,sp)
2328  0154 1c0004        	addw	x,#4
2329  0157 cd0000        	call	_NHALgpio_Write
2331  015a ae000f        	ldw	x,#15
2332  015d 9d            	nop	
2333  015e 84            	pop	a
2334                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2339  015f               L432:
2340  015f 5a            	decw	X
2341  0160 26fd          	jrne	L432
2342  0162 9d            	nop	
2343                     
2345                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2348  0163 4b01          	push	#1
2349  0165 1e07          	ldw	x,(OFST-9,sp)
2350  0167 1c0004        	addw	x,#4
2351  016a cd0000        	call	_NHALgpio_Write
2353  016d ae000f        	ldw	x,#15
2354  0170 9d            	nop	
2355  0171 84            	pop	a
2356                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2361  0172               L042:
2362  0172 5a            	decw	X
2363  0173 26fd          	jrne	L042
2364  0175 9d            	nop	
2365                     
2367                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2370  0176 4b00          	push	#0
2371  0178 1e07          	ldw	x,(OFST-9,sp)
2372  017a 1c0004        	addw	x,#4
2373  017d cd0000        	call	_NHALgpio_Write
2375  0180 ae000f        	ldw	x,#15
2376  0183 9d            	nop	
2377  0184 84            	pop	a
2378                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2383  0185               L442:
2384  0185 5a            	decw	X
2385  0186 26fd          	jrne	L442
2386                     
2388  0188 cc0104        	jp	LC002
2389  018b               L7131:
2390                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2393  018b 4b01          	push	#1
2394  018d 1e07          	ldw	x,(OFST-9,sp)
2395  018f 1c0004        	addw	x,#4
2396  0192 cd0000        	call	_NHALgpio_Write
2398  0195 ae000f        	ldw	x,#15
2399  0198 9d            	nop	
2400  0199 84            	pop	a
2401                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2406  019a               L052:
2407  019a 5a            	decw	X
2408  019b 26fd          	jrne	L052
2409  019d 9d            	nop	
2410                     
2412                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2415  019e 4b00          	push	#0
2416  01a0 1e07          	ldw	x,(OFST-9,sp)
2417  01a2 1c0004        	addw	x,#4
2418  01a5 cd0000        	call	_NHALgpio_Write
2420  01a8 ae000f        	ldw	x,#15
2421  01ab 9d            	nop	
2422  01ac 84            	pop	a
2423                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2428  01ad               L452:
2429  01ad 5a            	decw	X
2430  01ae 26fd          	jrne	L452
2431  01b0 9d            	nop	
2432                     
2434                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2437  01b1 4b01          	push	#1
2438  01b3 1e07          	ldw	x,(OFST-9,sp)
2439  01b5 1c0004        	addw	x,#4
2440  01b8 cd0000        	call	_NHALgpio_Write
2442  01bb ae000f        	ldw	x,#15
2443  01be 9d            	nop	
2444  01bf 84            	pop	a
2445                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2450  01c0               L062:
2451  01c0 5a            	decw	X
2452  01c1 26fd          	jrne	L062
2453  01c3 9d            	nop	
2454                     
2456                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2459  01c4 4b00          	push	#0
2460  01c6 1e07          	ldw	x,(OFST-9,sp)
2461  01c8 1c0004        	addw	x,#4
2462  01cb cd0000        	call	_NHALgpio_Write
2464  01ce ae000f        	ldw	x,#15
2465  01d1 9d            	nop	
2466  01d2 84            	pop	a
2467                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2472  01d3               L462:
2473  01d3 5a            	decw	X
2474  01d4 26fd          	jrne	L462
2475                     
2477  01d6 cc0104        	jp	LC002
2478  01d9               L3341:
2479                     ; 219 		return semilla;
2481  01d9 1e04          	ldw	x,(OFST-12,sp)
2482  01db 1f0a          	ldw	(OFST-6,sp),x
2483  01dd 1e02          	ldw	x,(OFST-14,sp)
2484  01df 1f08          	ldw	(OFST-8,sp),x
2488  01e1 96            	ldw	x,sp
2489  01e2 1c0008        	addw	x,#OFST-8
2490  01e5 cd0000        	call	c_ltor
2492  01e8 96            	ldw	x,sp
2493  01e9 1c000c        	addw	x,#OFST-4
2494  01ec cd0000        	call	c_lgadd
2497                     ; 366 		--repeticiones;
2499  01ef 0a10          	dec	(OFST+0,sp)
2501                     ; 363 	while( ( repeticiones > 0 ) )
2503  01f1 2703cc000c    	jrne	L5241
2504                     ; 368 	repeticiones = 4;
2506                     ; 370 	return valorMedio/repeticiones;
2508  01f6 96            	ldw	x,sp
2509  01f7 1c000c        	addw	x,#OFST-4
2510  01fa cd0000        	call	c_ltor
2512  01fd a602          	ld	a,#2
2513  01ff cd0000        	call	c_lursh
2515  0202 be02          	ldw	x,c_lreg+2
2518  0204 5b12          	addw	sp,#18
2519  0206 81            	ret	
2532                     	xdef	_hx711_Tarar
2533                     	xdef	_hx711_Lectura
2534                     	xdef	_HX711_Init
2535                     	xref	_Timeout_Stop
2536                     	xref	_Timeout_Start
2537                     	xref	_NHALgpio_Write
2538                     	xref	_NHALgpio_Read
2539                     	xref	_NHALgpio_Init
2540                     	xref	_NHALgpioConfig_SetType
2541                     	xref.b	c_lreg
2542                     	xref.b	c_x
2561                     	xref	c_lursh
2562                     	xref	c_lgadd
2563                     	xref	c_ludv
2564                     	xref	c_rtol
2565                     	xref	c_uitolx
2566                     	xref	c_lsub
2567                     	xref	c_lcmp
2568                     	xref	c_ltor
2569                     	xref	c_lgor
2570                     	end

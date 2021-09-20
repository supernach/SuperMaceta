   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  50                     .const:	section	.text
  51  0000               L72_HX711_LONGITUDTRAMA:
  52  0000 18            	dc.b	24
  53  0001               L13_HX711_TIEMPOCLOCK:
  54  0001 03            	dc.b	3
  55  0002               L33_HX711_TIEMPOCLOCKSLEEP:
  56  0002 46            	dc.b	70
1015                     ; 265 void HX711_Init( HX711_t_ptr hx711, HX711_fPtr Lectura, HX711_fPtr Tarar, Timeout_t_ptr Timeout )
1015                     ; 266 {
1017                     .text:	section	.text,new
1018  0000               _HX711_Init:
1020  0000 89            	pushw	x
1021  0001 5204          	subw	sp,#4
1022       00000004      OFST:	set	4
1025                     ; 267 	initPtrFunciones( hx711, Lectura, Tarar );
1029                     ; 73 	hx711->Lectura = Lectura;
1031  0003 1609          	ldw	y,(OFST+5,sp)
1032  0005 ef18          	ldw	(24,x),y
1033                     ; 74 	hx711->Tarar = Tarar;
1035  0007 160b          	ldw	y,(OFST+7,sp)
1036  0009 ef1a          	ldw	(26,x),y
1037                     ; 269 	hx711->Timeout = Timeout;
1039  000b 160d          	ldw	y,(OFST+9,sp)
1040  000d ef16          	ldw	(22,x),y
1041                     ; 271 	initVariables( &hx711->Config, &hx711->Datos );
1044  000f 1f03          	ldw	(OFST-1,sp),x
1048  0011 1c0011        	addw	x,#17
1049  0014 1f01          	ldw	(OFST-3,sp),x
1051                     ; 79 	hx711Datos->UltimaLectura = 0;
1053  0016 4f            	clr	a
1054  0017 e703          	ld	(3,x),a
1055  0019 e702          	ld	(2,x),a
1056  001b e701          	ld	(1,x),a
1057  001d f7            	ld	(x),a
1058                     ; 80 	hx711Config->ValorTara = 0;
1060  001e 1e03          	ldw	x,(OFST-1,sp)
1061  0020 905f          	clrw	y
1062  0022 ef0f          	ldw	(15,x),y
1063                     ; 81 	hx711Config->ValorConversion = 1;
1065  0024 905c          	incw	y
1066  0026 ef09          	ldw	(9,x),y
1067                     ; 82 	hx711Config->Ganancia = CHANNELA_128;
1069  0028 6f08          	clr	(8,x)
1070                     ; 273 	initDOUT( &hx711->Config.DOUT );
1073  002a 1e05          	ldw	x,(OFST+1,sp)
1074  002c 1f03          	ldw	(OFST-1,sp),x
1076                     ; 87 	NHALgpioConfig_SetType( dout,GPIO_MODE_IN_PU_NO_IT );
1078  002e 4b40          	push	#64
1079  0030 1e04          	ldw	x,(OFST+0,sp)
1080  0032 cd0000        	call	_NHALgpioConfig_SetType
1082  0035 84            	pop	a
1083                     ; 88 	NHALgpio_Init( dout );
1085  0036 1e03          	ldw	x,(OFST-1,sp)
1086  0038 cd0000        	call	_NHALgpio_Init
1088                     ; 274 	initPDSCK( &hx711->Config.PD_SCK );
1091  003b 1e05          	ldw	x,(OFST+1,sp)
1092  003d 1c0004        	addw	x,#4
1093  0040 1f03          	ldw	(OFST-1,sp),x
1095                     ; 93 	NHALgpioConfig_SetType( pdsck, GPIO_MODE_OUT_PP_LOW_FAST );
1097  0042 4be0          	push	#224
1098  0044 1e04          	ldw	x,(OFST+0,sp)
1099  0046 cd0000        	call	_NHALgpioConfig_SetType
1101  0049 84            	pop	a
1102                     ; 94 	NHALgpio_Init( pdsck );
1104  004a 1e03          	ldw	x,(OFST-1,sp)
1105  004c cd0000        	call	_NHALgpio_Init
1107                     ; 276 	chequearValorConversion( &hx711->Config, &hx711->Datos );
1110  004f 1e05          	ldw	x,(OFST+1,sp)
1111  0051 1f01          	ldw	(OFST-3,sp),x
1115  0053 1c0011        	addw	x,#17
1116  0056 1f03          	ldw	(OFST-1,sp),x
1118                     ; 99 	if( ( hx711Config->ValorConversion ) == 0 )
1120  0058 1e01          	ldw	x,(OFST-3,sp)
1121  005a e60a          	ld	a,(10,x)
1122  005c ea09          	or	a,(9,x)
1123  005e 260d          	jrne	L507
1124                     ; 101 		hx711Config->ValorConversion = 1;
1126  0060 90ae0001      	ldw	y,#1
1127  0064 ef09          	ldw	(9,x),y
1128                     ; 102 		hx711Datos->Estado = SINVALORCONVERSION;
1130  0066 1e03          	ldw	x,(OFST-1,sp)
1131  0068 4c            	inc	a
1132  0069 e704          	ld	(4,x),a
1134  006b 2004          	jra	L521
1135  006d               L507:
1136                     ; 106 		hx711Datos->Estado = INICIALIZADO;
1138  006d 1e03          	ldw	x,(OFST-1,sp)
1139  006f 6f04          	clr	(4,x)
1140  0071               L521:
1141                     ; 278 	aDormir( hx711 );
1144  0071 1e05          	ldw	x,(OFST+1,sp)
1145  0073 1f03          	ldw	(OFST-1,sp),x
1147                     ; 112 	NHALgpio_Write( &hx711->Config.PD_SCK, true );
1149  0075 4b01          	push	#1
1150  0077 1e04          	ldw	x,(OFST+0,sp)
1151  0079 1c0004        	addw	x,#4
1152  007c cd0000        	call	_NHALgpio_Write
1154  007f ae0174        	ldw	x,#372
1155  0082 9d            	nop	
1156  0083 84            	pop	a
1157                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1162  0084               L02:
1163  0084 5a            	decw	X
1164  0085 26fd          	jrne	L02
1165  0087 9d            	nop	
1166                     
1168                     ; 115 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1170  0088 1e03          	ldw	x,(OFST-1,sp)
1171  008a e615          	ld	a,(21,x)
1172  008c 4a            	dec	a
1173  008d 2704          	jreq	L331
1174                     ; 117 		hx711->Datos.Estado = SLEEP;
1176  008f a602          	ld	a,#2
1177  0091 e715          	ld	(21,x),a
1179  0093               L331:
1180                     ; 279 }
1183  0093 5b06          	addw	sp,#6
1184  0095 81            	ret	
1303                     ; 314 uint16_t hx711_Lectura( HX711_t_ptr hx711 )
1303                     ; 315 {
1304                     .text:	section	.text,new
1305  0000               _hx711_Lectura:
1307  0000 89            	pushw	x
1308  0001 520b          	subw	sp,#11
1309       0000000b      OFST:	set	11
1312                     ; 316 	uint32_t semilla = 0;
1314                     ; 318 	semilla = leer( hx711 );
1317  0003 1f06          	ldw	(OFST-5,sp),x
1319                     ; 191 	uint32_t semilla = 0;
1321  0005 5f            	clrw	x
1322  0006 1f0a          	ldw	(OFST-1,sp),x
1323  0008 1f08          	ldw	(OFST-3,sp),x
1325                     ; 192 	uint8_t contadorBucle = 0;
1327  000a 0f05          	clr	(OFST-6,sp)
1329                     ; 194 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1331  000c 1e06          	ldw	x,(OFST-5,sp)
1332  000e e615          	ld	a,(21,x)
1333  0010 4a            	dec	a
1334  0011 2603cc01d2    	jreq	L7411
1335                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1338  0016 4b00          	push	#0
1339  0018 1e07          	ldw	x,(OFST-4,sp)
1340  001a 1c0004        	addw	x,#4
1341  001d cd0000        	call	_NHALgpio_Write
1343  0020 ae000f        	ldw	x,#15
1344  0023 9d            	nop	
1345  0024 84            	pop	a
1346                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1351  0025               L62:
1352  0025 5a            	decw	X
1353  0026 26fd          	jrne	L62
1354  0028 9d            	nop	
1355                     
1357                     ; 165 	if( hx711->Timeout != NULL )
1360  0029 1e06          	ldw	x,(OFST-5,sp)
1361  002b e617          	ld	a,(23,x)
1362  002d ea16          	or	a,(22,x)
1363  002f 273b          	jreq	L1711
1364                     ; 167 		Timeout_Start( hx711->Timeout, TIMEOUT_1MS );
1366  0031 ae03e8        	ldw	x,#1000
1367  0034 89            	pushw	x
1368  0035 1e08          	ldw	x,(OFST-3,sp)
1369  0037 ee16          	ldw	x,(22,x)
1370  0039 cd0000        	call	_Timeout_Start
1372  003c 85            	popw	x
1374  003d               L5511:
1375                     ; 168 		while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) && ( hx711->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) )
1377  003d 1e06          	ldw	x,(OFST-5,sp)
1378  003f cd0000        	call	_NHALgpio_Read
1380  0042 4d            	tnz	a
1381  0043 270c          	jreq	L1611
1383  0045 1e06          	ldw	x,(OFST-5,sp)
1384  0047 ee16          	ldw	x,(22,x)
1385  0049 ee02          	ldw	x,(2,x)
1386  004b fd            	call	(x)
1388  004c a301f4        	cpw	x,#500
1389  004f 25ec          	jrult	L5511
1390  0051               L1611:
1391                     ; 173 		if( hx711->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
1393  0051 1e06          	ldw	x,(OFST-5,sp)
1394  0053 ee16          	ldw	x,(22,x)
1395  0055 ee02          	ldw	x,(2,x)
1396  0057 fd            	call	(x)
1398  0058 a301f4        	cpw	x,#500
1399  005b 2506          	jrult	L3611
1400                     ; 175 			hx711->Datos.Estado = TIMEOUT;
1402  005d 1e06          	ldw	x,(OFST-5,sp)
1403  005f a604          	ld	a,#4
1404  0061 e715          	ld	(21,x),a
1405  0063               L3611:
1406                     ; 177 		Timeout_Stop( hx711->Timeout );
1408  0063 1e06          	ldw	x,(OFST-5,sp)
1409  0065 ee16          	ldw	x,(22,x)
1410  0067 cd0000        	call	_Timeout_Stop
1413  006a 2008          	jra	L5611
1414  006c               L1711:
1415                     ; 181 		while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) )
1417  006c 1e06          	ldw	x,(OFST-5,sp)
1418  006e cd0000        	call	_NHALgpio_Read
1420  0071 4d            	tnz	a
1421  0072 26f8          	jrne	L1711
1422  0074               L5611:
1423                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1427  0074 ae000f        	ldw	x,#15
1429  0077 9d            	nop	
1430  0078               L44:
1431  0078 5a            	decw	X
1432  0079 26fd          	jrne	L44
1433                     
1435  007b 2043          	jra	L7711
1436  007d               L5711:
1437                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1440  007d 4b01          	push	#1
1441  007f 1e07          	ldw	x,(OFST-4,sp)
1442  0081 1c0004        	addw	x,#4
1443  0084 cd0000        	call	_NHALgpio_Write
1445  0087 ae000f        	ldw	x,#15
1446  008a 9d            	nop	
1447  008b 84            	pop	a
1448                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1453  008c               L05:
1454  008c 5a            	decw	X
1455  008d 26fd          	jrne	L05
1456  008f 9d            	nop	
1457                     
1459                     ; 209 			semilla |= NHALgpio_Read( &hx711->Config.DOUT );
1461  0090 1e06          	ldw	x,(OFST-5,sp)
1462  0092 cd0000        	call	_NHALgpio_Read
1464  0095 b703          	ld	c_lreg+3,a
1465  0097 3f02          	clr	c_lreg+2
1466  0099 3f01          	clr	c_lreg+1
1467  009b 3f00          	clr	c_lreg
1468  009d 96            	ldw	x,sp
1469  009e 1c0008        	addw	x,#OFST-3
1470  00a1 cd0000        	call	c_lgor
1473                     ; 210 			semilla <<= 1;
1475  00a4 080b          	sll	(OFST+0,sp)
1476  00a6 090a          	rlc	(OFST-1,sp)
1477  00a8 0909          	rlc	(OFST-2,sp)
1478  00aa 0908          	rlc	(OFST-3,sp)
1480                     ; 212 			contadorBucle++;
1482  00ac 0c05          	inc	(OFST-6,sp)
1484                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1487  00ae 4b00          	push	#0
1488  00b0 1e07          	ldw	x,(OFST-4,sp)
1489  00b2 1c0004        	addw	x,#4
1490  00b5 cd0000        	call	_NHALgpio_Write
1492  00b8 ae000f        	ldw	x,#15
1493  00bb 9d            	nop	
1494  00bc 84            	pop	a
1495                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1500  00bd               L65:
1501  00bd 5a            	decw	X
1502  00be 26fd          	jrne	L65
1503                     
1505  00c0               L7711:
1506  00c0 9d            	nop	
1507                     ; 203 		while( contadorBucle < HX711_LONGITUDTRAMA ) 
1509  00c1 7b05          	ld	a,(OFST-6,sp)
1510  00c3 a118          	cp	a,#24
1511  00c5 25b6          	jrult	L5711
1512                     ; 132 	switch( hx711->Config.Ganancia )
1515  00c7 1e06          	ldw	x,(OFST-5,sp)
1516  00c9 e608          	ld	a,(8,x)
1518                     ; 157 		default:
1518                     ; 158 		
1518                     ; 159 		;
1519  00cb 270b          	jreq	L547
1520  00cd 4a            	dec	a
1521  00ce 2740          	jreq	L367
1522  00d0 4a            	dec	a
1523  00d1 2603cc0184    	jreq	L1301
1524  00d6 2028          	jra	L5601
1525  00d8               L547:
1526                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1529  00d8 4b01          	push	#1
1530  00da 1e07          	ldw	x,(OFST-4,sp)
1531  00dc 1c0004        	addw	x,#4
1532  00df cd0000        	call	_NHALgpio_Write
1534  00e2 ae000f        	ldw	x,#15
1535  00e5 9d            	nop	
1536  00e6 84            	pop	a
1537                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1542  00e7               L26:
1543  00e7 5a            	decw	X
1544  00e8 26fd          	jrne	L26
1545  00ea 9d            	nop	
1546                     
1548                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1551  00eb 4b00          	push	#0
1552  00ed 1e07          	ldw	x,(OFST-4,sp)
1553  00ef 1c0004        	addw	x,#4
1554  00f2 cd0000        	call	_NHALgpio_Write
1556  00f5 ae000f        	ldw	x,#15
1557  00f8 9d            	nop	
1558  00f9 84            	pop	a
1559                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1564  00fa               L66:
1565  00fa 5a            	decw	X
1566  00fb 26fd          	jrne	L66
1567  00fd               LC001:
1568  00fd 9d            	nop	
1569                     
1571  00fe 1e06          	ldw	x,(OFST-5,sp)
1572  0100               L5601:
1573                     ; 220 		if( hx711->Datos.Estado != TIMEOUT )
1575  0100 e615          	ld	a,(21,x)
1576  0102 a104          	cp	a,#4
1577  0104 2603cc01d2    	jreq	L7411
1578                     ; 222 			hx711->Datos.Estado = NUEVA_LECTURA;
1580  0109 a603          	ld	a,#3
1581  010b e715          	ld	(21,x),a
1582  010d cc01d2        	jra	L7411
1583  0110               L367:
1584                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1587  0110 4b01          	push	#1
1588  0112 1e07          	ldw	x,(OFST-4,sp)
1589  0114 1c0004        	addw	x,#4
1590  0117 cd0000        	call	_NHALgpio_Write
1592  011a ae000f        	ldw	x,#15
1593  011d 9d            	nop	
1594  011e 84            	pop	a
1595                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1600  011f               L27:
1601  011f 5a            	decw	X
1602  0120 26fd          	jrne	L27
1603  0122 9d            	nop	
1604                     
1606                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1609  0123 4b00          	push	#0
1610  0125 1e07          	ldw	x,(OFST-4,sp)
1611  0127 1c0004        	addw	x,#4
1612  012a cd0000        	call	_NHALgpio_Write
1614  012d ae000f        	ldw	x,#15
1615  0130 9d            	nop	
1616  0131 84            	pop	a
1617                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1622  0132               L67:
1623  0132 5a            	decw	X
1624  0133 26fd          	jrne	L67
1625  0135 9d            	nop	
1626                     
1628                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1631  0136 4b01          	push	#1
1632  0138 1e07          	ldw	x,(OFST-4,sp)
1633  013a 1c0004        	addw	x,#4
1634  013d cd0000        	call	_NHALgpio_Write
1636  0140 ae000f        	ldw	x,#15
1637  0143 9d            	nop	
1638  0144 84            	pop	a
1639                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1644  0145               L201:
1645  0145 5a            	decw	X
1646  0146 26fd          	jrne	L201
1647  0148 9d            	nop	
1648                     
1650                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1653  0149 4b00          	push	#0
1654  014b 1e07          	ldw	x,(OFST-4,sp)
1655  014d 1c0004        	addw	x,#4
1656  0150 cd0000        	call	_NHALgpio_Write
1658  0153 ae000f        	ldw	x,#15
1659  0156 9d            	nop	
1660  0157 84            	pop	a
1661                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1666  0158               L601:
1667  0158 5a            	decw	X
1668  0159 26fd          	jrne	L601
1669  015b 9d            	nop	
1670                     
1672                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1675  015c 4b01          	push	#1
1676  015e 1e07          	ldw	x,(OFST-4,sp)
1677  0160 1c0004        	addw	x,#4
1678  0163 cd0000        	call	_NHALgpio_Write
1680  0166 ae000f        	ldw	x,#15
1681  0169 9d            	nop	
1682  016a 84            	pop	a
1683                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1688  016b               L211:
1689  016b 5a            	decw	X
1690  016c 26fd          	jrne	L211
1691  016e 9d            	nop	
1692                     
1694                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1697  016f 4b00          	push	#0
1698  0171 1e07          	ldw	x,(OFST-4,sp)
1699  0173 1c0004        	addw	x,#4
1700  0176 cd0000        	call	_NHALgpio_Write
1702  0179 ae000f        	ldw	x,#15
1703  017c 9d            	nop	
1704  017d 84            	pop	a
1705                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1710  017e               L611:
1711  017e 5a            	decw	X
1712  017f 26fd          	jrne	L611
1713                     
1715  0181 cc00fd        	jp	LC001
1716  0184               L1301:
1717                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1720  0184 4b01          	push	#1
1721  0186 1e07          	ldw	x,(OFST-4,sp)
1722  0188 1c0004        	addw	x,#4
1723  018b cd0000        	call	_NHALgpio_Write
1725  018e ae000f        	ldw	x,#15
1726  0191 9d            	nop	
1727  0192 84            	pop	a
1728                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1733  0193               L221:
1734  0193 5a            	decw	X
1735  0194 26fd          	jrne	L221
1736  0196 9d            	nop	
1737                     
1739                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1742  0197 4b00          	push	#0
1743  0199 1e07          	ldw	x,(OFST-4,sp)
1744  019b 1c0004        	addw	x,#4
1745  019e cd0000        	call	_NHALgpio_Write
1747  01a1 ae000f        	ldw	x,#15
1748  01a4 9d            	nop	
1749  01a5 84            	pop	a
1750                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1755  01a6               L621:
1756  01a6 5a            	decw	X
1757  01a7 26fd          	jrne	L621
1758  01a9 9d            	nop	
1759                     
1761                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1764  01aa 4b01          	push	#1
1765  01ac 1e07          	ldw	x,(OFST-4,sp)
1766  01ae 1c0004        	addw	x,#4
1767  01b1 cd0000        	call	_NHALgpio_Write
1769  01b4 ae000f        	ldw	x,#15
1770  01b7 9d            	nop	
1771  01b8 84            	pop	a
1772                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1777  01b9               L231:
1778  01b9 5a            	decw	X
1779  01ba 26fd          	jrne	L231
1780  01bc 9d            	nop	
1781                     
1783                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1786  01bd 4b00          	push	#0
1787  01bf 1e07          	ldw	x,(OFST-4,sp)
1788  01c1 1c0004        	addw	x,#4
1789  01c4 cd0000        	call	_NHALgpio_Write
1791  01c7 ae000f        	ldw	x,#15
1792  01ca 9d            	nop	
1793  01cb 84            	pop	a
1794                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1799  01cc               L631:
1800  01cc 5a            	decw	X
1801  01cd 26fd          	jrne	L631
1802                     
1804  01cf cc00fd        	jp	LC001
1805  01d2               L7411:
1806                     ; 225 		return semilla;
1811                     ; 319 	aDormir( hx711 );
1814  01d2 1e0c          	ldw	x,(OFST+1,sp)
1815  01d4 1f06          	ldw	(OFST-5,sp),x
1817                     ; 112 	NHALgpio_Write( &hx711->Config.PD_SCK, true );
1819  01d6 4b01          	push	#1
1820  01d8 1e07          	ldw	x,(OFST-4,sp)
1821  01da 1c0004        	addw	x,#4
1822  01dd cd0000        	call	_NHALgpio_Write
1824  01e0 ae0174        	ldw	x,#372
1825  01e3 9d            	nop	
1826  01e4 84            	pop	a
1827                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1832  01e5               L441:
1833  01e5 5a            	decw	X
1834  01e6 26fd          	jrne	L441
1835  01e8 9d            	nop	
1836                     
1838                     ; 115 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1840  01e9 1e06          	ldw	x,(OFST-5,sp)
1841  01eb e615          	ld	a,(21,x)
1842  01ed 4a            	dec	a
1843  01ee 2704          	jreq	L5701
1844                     ; 117 		hx711->Datos.Estado = SLEEP;
1846  01f0 a602          	ld	a,#2
1847  01f2 e715          	ld	(21,x),a
1849  01f4               L5701:
1850                     ; 321 	if( ( semilla > hx711->Config.ValorZero ) )
1852  01f4 1e0c          	ldw	x,(OFST+1,sp)
1853  01f6 1c000b        	addw	x,#11
1854  01f9 cd0000        	call	c_ltor
1856  01fc 96            	ldw	x,sp
1857  01fd 1c0008        	addw	x,#OFST-3
1858  0200 cd0000        	call	c_lcmp
1860  0203 2424          	jruge	L5121
1861                     ; 323 		return ( ( semilla - hx711->Config.ValorZero ) / hx711->Config.ValorConversion );
1863  0205 1e0c          	ldw	x,(OFST+1,sp)
1864  0207 ee09          	ldw	x,(9,x)
1865  0209 cd0000        	call	c_uitolx
1867  020c 96            	ldw	x,sp
1868  020d 5c            	incw	x
1869  020e cd0000        	call	c_rtol
1872  0211 96            	ldw	x,sp
1873  0212 1c0008        	addw	x,#OFST-3
1874  0215 cd0000        	call	c_ltor
1876  0218 1e0c          	ldw	x,(OFST+1,sp)
1877  021a 1c000b        	addw	x,#11
1878  021d cd0000        	call	c_lsub
1880  0220 96            	ldw	x,sp
1881  0221 5c            	incw	x
1882  0222 cd0000        	call	c_ludv
1884  0225 be02          	ldw	x,c_lreg+2
1886  0227 2001          	jra	L641
1887  0229               L5121:
1888                     ; 327 		return 0;
1890  0229 5f            	clrw	x
1892  022a               L641:
1894  022a 5b0d          	addw	sp,#13
1895  022c 81            	ret	
2008                     ; 364 uint16_t hx711_Tarar( HX711_t_ptr hx711 )
2008                     ; 365 {
2009                     .text:	section	.text,new
2010  0000               _hx711_Tarar:
2012  0000 89            	pushw	x
2013  0001 5210          	subw	sp,#16
2014       00000010      OFST:	set	16
2017                     ; 366 	uint32_t valorMedio = 0;
2019  0003 5f            	clrw	x
2020  0004 1f0e          	ldw	(OFST-2,sp),x
2021  0006 1f0c          	ldw	(OFST-4,sp),x
2023                     ; 367 	uint8_t repeticiones = 4;
2025  0008 a604          	ld	a,#4
2026  000a 6b10          	ld	(OFST+0,sp),a
2028  000c               L3441:
2029                     ; 371 		valorMedio = valorMedio + leer( hx711 );
2032  000c 1e11          	ldw	x,(OFST+1,sp)
2033  000e 1f06          	ldw	(OFST-10,sp),x
2035                     ; 191 	uint32_t semilla = 0;
2037  0010 5f            	clrw	x
2038  0011 1f04          	ldw	(OFST-12,sp),x
2039  0013 1f02          	ldw	(OFST-14,sp),x
2041                     ; 192 	uint8_t contadorBucle = 0;
2043  0015 0f01          	clr	(OFST-15,sp)
2045                     ; 194 	if( hx711->Datos.Estado != SINVALORCONVERSION )
2047  0017 1e06          	ldw	x,(OFST-10,sp)
2048  0019 e615          	ld	a,(21,x)
2049  001b 4a            	dec	a
2050  001c 2603cc01dd    	jreq	L1541
2051                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2054  0021 4b00          	push	#0
2055  0023 1e07          	ldw	x,(OFST-9,sp)
2056  0025 1c0004        	addw	x,#4
2057  0028 cd0000        	call	_NHALgpio_Write
2059  002b ae000f        	ldw	x,#15
2060  002e 9d            	nop	
2061  002f 84            	pop	a
2062                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2067  0030               L451:
2068  0030 5a            	decw	X
2069  0031 26fd          	jrne	L451
2070  0033 9d            	nop	
2071                     
2073                     ; 165 	if( hx711->Timeout != NULL )
2076  0034 1e06          	ldw	x,(OFST-10,sp)
2077  0036 e617          	ld	a,(23,x)
2078  0038 ea16          	or	a,(22,x)
2079  003a 273b          	jreq	L3741
2080                     ; 167 		Timeout_Start( hx711->Timeout, TIMEOUT_1MS );
2082  003c ae03e8        	ldw	x,#1000
2083  003f 89            	pushw	x
2084  0040 1e08          	ldw	x,(OFST-8,sp)
2085  0042 ee16          	ldw	x,(22,x)
2086  0044 cd0000        	call	_Timeout_Start
2088  0047 85            	popw	x
2090  0048               L7541:
2091                     ; 168 		while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) && ( hx711->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) )
2093  0048 1e06          	ldw	x,(OFST-10,sp)
2094  004a cd0000        	call	_NHALgpio_Read
2096  004d 4d            	tnz	a
2097  004e 270c          	jreq	L3641
2099  0050 1e06          	ldw	x,(OFST-10,sp)
2100  0052 ee16          	ldw	x,(22,x)
2101  0054 ee02          	ldw	x,(2,x)
2102  0056 fd            	call	(x)
2104  0057 a301f4        	cpw	x,#500
2105  005a 25ec          	jrult	L7541
2106  005c               L3641:
2107                     ; 173 		if( hx711->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
2109  005c 1e06          	ldw	x,(OFST-10,sp)
2110  005e ee16          	ldw	x,(22,x)
2111  0060 ee02          	ldw	x,(2,x)
2112  0062 fd            	call	(x)
2114  0063 a301f4        	cpw	x,#500
2115  0066 2506          	jrult	L5641
2116                     ; 175 			hx711->Datos.Estado = TIMEOUT;
2118  0068 1e06          	ldw	x,(OFST-10,sp)
2119  006a a604          	ld	a,#4
2120  006c e715          	ld	(21,x),a
2121  006e               L5641:
2122                     ; 177 		Timeout_Stop( hx711->Timeout );
2124  006e 1e06          	ldw	x,(OFST-10,sp)
2125  0070 ee16          	ldw	x,(22,x)
2126  0072 cd0000        	call	_Timeout_Stop
2129  0075 2008          	jra	L7641
2130  0077               L3741:
2131                     ; 181 		while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) )
2133  0077 1e06          	ldw	x,(OFST-10,sp)
2134  0079 cd0000        	call	_NHALgpio_Read
2136  007c 4d            	tnz	a
2137  007d 26f8          	jrne	L3741
2138  007f               L7641:
2139                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2143  007f ae000f        	ldw	x,#15
2145  0082 9d            	nop	
2146  0083               L271:
2147  0083 5a            	decw	X
2148  0084 26fd          	jrne	L271
2149                     
2151  0086 2043          	jra	L1051
2152  0088               L7741:
2153                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2156  0088 4b01          	push	#1
2157  008a 1e07          	ldw	x,(OFST-9,sp)
2158  008c 1c0004        	addw	x,#4
2159  008f cd0000        	call	_NHALgpio_Write
2161  0092 ae000f        	ldw	x,#15
2162  0095 9d            	nop	
2163  0096 84            	pop	a
2164                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2169  0097               L671:
2170  0097 5a            	decw	X
2171  0098 26fd          	jrne	L671
2172  009a 9d            	nop	
2173                     
2175                     ; 209 			semilla |= NHALgpio_Read( &hx711->Config.DOUT );
2177  009b 1e06          	ldw	x,(OFST-10,sp)
2178  009d cd0000        	call	_NHALgpio_Read
2180  00a0 b703          	ld	c_lreg+3,a
2181  00a2 3f02          	clr	c_lreg+2
2182  00a4 3f01          	clr	c_lreg+1
2183  00a6 3f00          	clr	c_lreg
2184  00a8 96            	ldw	x,sp
2185  00a9 1c0002        	addw	x,#OFST-14
2186  00ac cd0000        	call	c_lgor
2189                     ; 210 			semilla <<= 1;
2191  00af 0805          	sll	(OFST-11,sp)
2192  00b1 0904          	rlc	(OFST-12,sp)
2193  00b3 0903          	rlc	(OFST-13,sp)
2194  00b5 0902          	rlc	(OFST-14,sp)
2196                     ; 212 			contadorBucle++;
2198  00b7 0c01          	inc	(OFST-15,sp)
2200                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2203  00b9 4b00          	push	#0
2204  00bb 1e07          	ldw	x,(OFST-9,sp)
2205  00bd 1c0004        	addw	x,#4
2206  00c0 cd0000        	call	_NHALgpio_Write
2208  00c3 ae000f        	ldw	x,#15
2209  00c6 9d            	nop	
2210  00c7 84            	pop	a
2211                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2216  00c8               L402:
2217  00c8 5a            	decw	X
2218  00c9 26fd          	jrne	L402
2219                     
2221  00cb               L1051:
2222  00cb 9d            	nop	
2223                     ; 203 		while( contadorBucle < HX711_LONGITUDTRAMA ) 
2225  00cc 7b01          	ld	a,(OFST-15,sp)
2226  00ce a118          	cp	a,#24
2227  00d0 25b6          	jrult	L7741
2228                     ; 132 	switch( hx711->Config.Ganancia )
2231  00d2 1e06          	ldw	x,(OFST-10,sp)
2232  00d4 e608          	ld	a,(8,x)
2234                     ; 157 		default:
2234                     ; 158 		
2234                     ; 159 		;
2235  00d6 270b          	jreq	L1521
2236  00d8 4a            	dec	a
2237  00d9 2740          	jreq	L7621
2238  00db 4a            	dec	a
2239  00dc 2603cc018f    	jreq	L5331
2240  00e1 2028          	jra	L1731
2241  00e3               L1521:
2242                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2245  00e3 4b01          	push	#1
2246  00e5 1e07          	ldw	x,(OFST-9,sp)
2247  00e7 1c0004        	addw	x,#4
2248  00ea cd0000        	call	_NHALgpio_Write
2250  00ed ae000f        	ldw	x,#15
2251  00f0 9d            	nop	
2252  00f1 84            	pop	a
2253                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2258  00f2               L012:
2259  00f2 5a            	decw	X
2260  00f3 26fd          	jrne	L012
2261  00f5 9d            	nop	
2262                     
2264                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2267  00f6 4b00          	push	#0
2268  00f8 1e07          	ldw	x,(OFST-9,sp)
2269  00fa 1c0004        	addw	x,#4
2270  00fd cd0000        	call	_NHALgpio_Write
2272  0100 ae000f        	ldw	x,#15
2273  0103 9d            	nop	
2274  0104 84            	pop	a
2275                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2280  0105               L412:
2281  0105 5a            	decw	X
2282  0106 26fd          	jrne	L412
2283  0108               LC002:
2284  0108 9d            	nop	
2285                     
2287  0109 1e06          	ldw	x,(OFST-10,sp)
2288  010b               L1731:
2289                     ; 220 		if( hx711->Datos.Estado != TIMEOUT )
2291  010b e615          	ld	a,(21,x)
2292  010d a104          	cp	a,#4
2293  010f 2603cc01dd    	jreq	L1541
2294                     ; 222 			hx711->Datos.Estado = NUEVA_LECTURA;
2296  0114 a603          	ld	a,#3
2297  0116 e715          	ld	(21,x),a
2298  0118 cc01dd        	jra	L1541
2299  011b               L7621:
2300                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2303  011b 4b01          	push	#1
2304  011d 1e07          	ldw	x,(OFST-9,sp)
2305  011f 1c0004        	addw	x,#4
2306  0122 cd0000        	call	_NHALgpio_Write
2308  0125 ae000f        	ldw	x,#15
2309  0128 9d            	nop	
2310  0129 84            	pop	a
2311                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2316  012a               L022:
2317  012a 5a            	decw	X
2318  012b 26fd          	jrne	L022
2319  012d 9d            	nop	
2320                     
2322                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2325  012e 4b00          	push	#0
2326  0130 1e07          	ldw	x,(OFST-9,sp)
2327  0132 1c0004        	addw	x,#4
2328  0135 cd0000        	call	_NHALgpio_Write
2330  0138 ae000f        	ldw	x,#15
2331  013b 9d            	nop	
2332  013c 84            	pop	a
2333                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2338  013d               L422:
2339  013d 5a            	decw	X
2340  013e 26fd          	jrne	L422
2341  0140 9d            	nop	
2342                     
2344                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2347  0141 4b01          	push	#1
2348  0143 1e07          	ldw	x,(OFST-9,sp)
2349  0145 1c0004        	addw	x,#4
2350  0148 cd0000        	call	_NHALgpio_Write
2352  014b ae000f        	ldw	x,#15
2353  014e 9d            	nop	
2354  014f 84            	pop	a
2355                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2360  0150               L032:
2361  0150 5a            	decw	X
2362  0151 26fd          	jrne	L032
2363  0153 9d            	nop	
2364                     
2366                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2369  0154 4b00          	push	#0
2370  0156 1e07          	ldw	x,(OFST-9,sp)
2371  0158 1c0004        	addw	x,#4
2372  015b cd0000        	call	_NHALgpio_Write
2374  015e ae000f        	ldw	x,#15
2375  0161 9d            	nop	
2376  0162 84            	pop	a
2377                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2382  0163               L432:
2383  0163 5a            	decw	X
2384  0164 26fd          	jrne	L432
2385  0166 9d            	nop	
2386                     
2388                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2391  0167 4b01          	push	#1
2392  0169 1e07          	ldw	x,(OFST-9,sp)
2393  016b 1c0004        	addw	x,#4
2394  016e cd0000        	call	_NHALgpio_Write
2396  0171 ae000f        	ldw	x,#15
2397  0174 9d            	nop	
2398  0175 84            	pop	a
2399                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2404  0176               L042:
2405  0176 5a            	decw	X
2406  0177 26fd          	jrne	L042
2407  0179 9d            	nop	
2408                     
2410                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2413  017a 4b00          	push	#0
2414  017c 1e07          	ldw	x,(OFST-9,sp)
2415  017e 1c0004        	addw	x,#4
2416  0181 cd0000        	call	_NHALgpio_Write
2418  0184 ae000f        	ldw	x,#15
2419  0187 9d            	nop	
2420  0188 84            	pop	a
2421                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2426  0189               L442:
2427  0189 5a            	decw	X
2428  018a 26fd          	jrne	L442
2429                     
2431  018c cc0108        	jp	LC002
2432  018f               L5331:
2433                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2436  018f 4b01          	push	#1
2437  0191 1e07          	ldw	x,(OFST-9,sp)
2438  0193 1c0004        	addw	x,#4
2439  0196 cd0000        	call	_NHALgpio_Write
2441  0199 ae000f        	ldw	x,#15
2442  019c 9d            	nop	
2443  019d 84            	pop	a
2444                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2449  019e               L052:
2450  019e 5a            	decw	X
2451  019f 26fd          	jrne	L052
2452  01a1 9d            	nop	
2453                     
2455                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2458  01a2 4b00          	push	#0
2459  01a4 1e07          	ldw	x,(OFST-9,sp)
2460  01a6 1c0004        	addw	x,#4
2461  01a9 cd0000        	call	_NHALgpio_Write
2463  01ac ae000f        	ldw	x,#15
2464  01af 9d            	nop	
2465  01b0 84            	pop	a
2466                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2471  01b1               L452:
2472  01b1 5a            	decw	X
2473  01b2 26fd          	jrne	L452
2474  01b4 9d            	nop	
2475                     
2477                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2480  01b5 4b01          	push	#1
2481  01b7 1e07          	ldw	x,(OFST-9,sp)
2482  01b9 1c0004        	addw	x,#4
2483  01bc cd0000        	call	_NHALgpio_Write
2485  01bf ae000f        	ldw	x,#15
2486  01c2 9d            	nop	
2487  01c3 84            	pop	a
2488                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2493  01c4               L062:
2494  01c4 5a            	decw	X
2495  01c5 26fd          	jrne	L062
2496  01c7 9d            	nop	
2497                     
2499                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2502  01c8 4b00          	push	#0
2503  01ca 1e07          	ldw	x,(OFST-9,sp)
2504  01cc 1c0004        	addw	x,#4
2505  01cf cd0000        	call	_NHALgpio_Write
2507  01d2 ae000f        	ldw	x,#15
2508  01d5 9d            	nop	
2509  01d6 84            	pop	a
2510                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2515  01d7               L462:
2516  01d7 5a            	decw	X
2517  01d8 26fd          	jrne	L462
2518                     
2520  01da cc0108        	jp	LC002
2521  01dd               L1541:
2522                     ; 225 		return semilla;
2524  01dd 1e04          	ldw	x,(OFST-12,sp)
2525  01df 1f0a          	ldw	(OFST-6,sp),x
2526  01e1 1e02          	ldw	x,(OFST-14,sp)
2527  01e3 1f08          	ldw	(OFST-8,sp),x
2531  01e5 96            	ldw	x,sp
2532  01e6 1c0008        	addw	x,#OFST-8
2533  01e9 cd0000        	call	c_ltor
2535  01ec 96            	ldw	x,sp
2536  01ed 1c000c        	addw	x,#OFST-4
2537  01f0 cd0000        	call	c_lgadd
2540                     ; 372 		--repeticiones;
2542  01f3 0a10          	dec	(OFST+0,sp)
2544                     ; 369 	while( ( repeticiones > 0 ) )
2546  01f5 2703cc000c    	jrne	L3441
2547                     ; 374 	repeticiones = 4;
2549                     ; 376 	return valorMedio/repeticiones;
2551  01fa 96            	ldw	x,sp
2552  01fb 1c000c        	addw	x,#OFST-4
2553  01fe cd0000        	call	c_ltor
2555  0201 a602          	ld	a,#2
2556  0203 cd0000        	call	c_lursh
2558  0206 be02          	ldw	x,c_lreg+2
2561  0208 5b12          	addw	sp,#18
2562  020a 81            	ret	
2575                     	xdef	_hx711_Tarar
2576                     	xdef	_hx711_Lectura
2577                     	xdef	_HX711_Init
2578                     	xref	_Timeout_Stop
2579                     	xref	_Timeout_Start
2580                     	xref	_NHALgpio_Write
2581                     	xref	_NHALgpio_Read
2582                     	xref	_NHALgpio_Init
2583                     	xref	_NHALgpioConfig_SetType
2584                     	xref.b	c_lreg
2585                     	xref.b	c_x
2604                     	xref	c_lursh
2605                     	xref	c_lgadd
2606                     	xref	c_ludv
2607                     	xref	c_rtol
2608                     	xref	c_uitolx
2609                     	xref	c_lsub
2610                     	xref	c_lcmp
2611                     	xref	c_ltor
2612                     	xref	c_lgor
2613                     	end

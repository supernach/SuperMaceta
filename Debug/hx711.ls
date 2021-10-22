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
  84  0000               L75_HX711_LONGITUDTRAMA:
  85  0000 18            	dc.b	24
  86  0001               L16_HX711_TIEMPOCLOCK:
  87  0001 03            	dc.b	3
  88  0002               L36_HX711_TIEMPOCLOCKSLEEP:
  89  0002 46            	dc.b	70
1062                     ; 615 void HX711_Init( HX711_t_ptr hx711, HX711_fPtr Lectura, HX711_fPtr Tarar, Timeout_t_ptr Timeout )
1062                     ; 616 {
1064                     .text:	section	.text,new
1065  0000               _HX711_Init:
1067  0000 89            	pushw	x
1068  0001 5204          	subw	sp,#4
1069       00000004      OFST:	set	4
1072                     ; 617 	initPtrFunciones( hx711, Lectura, Tarar );
1076                     ; 108 	hx711->Lectura = Lectura;
1078  0003 1609          	ldw	y,(OFST+5,sp)
1079  0005 ef18          	ldw	(24,x),y
1080                     ; 109 	hx711->Tarar = Tarar;
1082  0007 160b          	ldw	y,(OFST+7,sp)
1083  0009 ef1a          	ldw	(26,x),y
1084                     ; 619 	hx711->Timeout = Timeout;
1086  000b 160d          	ldw	y,(OFST+9,sp)
1087  000d ef16          	ldw	(22,x),y
1088                     ; 621 	initVariables( &hx711->Config, &hx711->Datos );
1091  000f 1f03          	ldw	(OFST-1,sp),x
1095  0011 1c0011        	addw	x,#17
1096  0014 1f01          	ldw	(OFST-3,sp),x
1098                     ; 149 	hx711Datos->UltimaLectura = 0;
1100  0016 4f            	clr	a
1101  0017 e703          	ld	(3,x),a
1102  0019 e702          	ld	(2,x),a
1103  001b e701          	ld	(1,x),a
1104  001d f7            	ld	(x),a
1105                     ; 150 	hx711Config->ValorTara = 0;
1107  001e 1e03          	ldw	x,(OFST-1,sp)
1108  0020 905f          	clrw	y
1109  0022 ef0f          	ldw	(15,x),y
1110                     ; 151 	hx711Config->ValorConversion = 1;
1112  0024 905c          	incw	y
1113  0026 ef09          	ldw	(9,x),y
1114                     ; 152 	hx711Config->Ganancia = CHANNELA_128;
1116  0028 6f08          	clr	(8,x)
1117                     ; 623 	initDOUT( &hx711->Config.DOUT );
1120  002a 1e05          	ldw	x,(OFST+1,sp)
1121  002c 1f03          	ldw	(OFST-1,sp),x
1123                     ; 192 	NHALgpioConfig_SetType( dout,GPIO_MODE_IN_PU_NO_IT );
1125  002e 4b40          	push	#64
1126  0030 1e04          	ldw	x,(OFST+0,sp)
1127  0032 cd0000        	call	_NHALgpioConfig_SetType
1129  0035 84            	pop	a
1130                     ; 193 	NHALgpio_Init( dout );
1132  0036 1e03          	ldw	x,(OFST-1,sp)
1133  0038 cd0000        	call	_NHALgpio_Init
1135                     ; 624 	initPDSCK( &hx711->Config.PD_SCK );
1138  003b 1e05          	ldw	x,(OFST+1,sp)
1139  003d 1c0004        	addw	x,#4
1140  0040 1f03          	ldw	(OFST-1,sp),x
1142                     ; 233 	NHALgpioConfig_SetType( pdsck, GPIO_MODE_OUT_PP_LOW_FAST );
1144  0042 4be0          	push	#224
1145  0044 1e04          	ldw	x,(OFST+0,sp)
1146  0046 cd0000        	call	_NHALgpioConfig_SetType
1148  0049 84            	pop	a
1149                     ; 234 	NHALgpio_Init( pdsck );
1151  004a 1e03          	ldw	x,(OFST-1,sp)
1152  004c cd0000        	call	_NHALgpio_Init
1154                     ; 626 	chequearValorConversion( &hx711->Config, &hx711->Datos );
1157  004f 1e05          	ldw	x,(OFST+1,sp)
1158  0051 1f01          	ldw	(OFST-3,sp),x
1162  0053 1c0011        	addw	x,#17
1163  0056 1f03          	ldw	(OFST-1,sp),x
1165                     ; 274 	if( ( hx711Config->ValorConversion ) == 0 )
1167  0058 1e01          	ldw	x,(OFST-3,sp)
1168  005a e60a          	ld	a,(10,x)
1169  005c ea09          	or	a,(9,x)
1170  005e 260d          	jrne	L147
1171                     ; 276 		hx711Config->ValorConversion = 1;
1173  0060 90ae0001      	ldw	y,#1
1174  0064 ef09          	ldw	(9,x),y
1175                     ; 277 		hx711Datos->Estado = SINVALORCONVERSION;
1177  0066 1e03          	ldw	x,(OFST-1,sp)
1178  0068 4c            	inc	a
1179  0069 e704          	ld	(4,x),a
1181  006b 2004          	jra	L551
1182  006d               L147:
1183                     ; 281 		hx711Datos->Estado = INICIALIZADO;
1185  006d 1e03          	ldw	x,(OFST-1,sp)
1186  006f 6f04          	clr	(4,x)
1187  0071               L551:
1188                     ; 628 	aDormir( hx711 );
1191  0071 1e05          	ldw	x,(OFST+1,sp)
1192  0073 1f03          	ldw	(OFST-1,sp),x
1194                     ; 322 	NHALgpio_Write( &hx711->Config.PD_SCK, true );
1196  0075 4b01          	push	#1
1197  0077 1e04          	ldw	x,(OFST+0,sp)
1198  0079 1c0004        	addw	x,#4
1199  007c cd0000        	call	_NHALgpio_Write
1201  007f ae0174        	ldw	x,#372
1202  0082 9d            	nop	
1203  0083 84            	pop	a
1204                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1209  0084               L02:
1210  0084 5a            	decw	X
1211  0085 26fd          	jrne	L02
1212  0087 9d            	nop	
1213                     
1215                     ; 325 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1217  0088 1e03          	ldw	x,(OFST-1,sp)
1218  008a e615          	ld	a,(21,x)
1219  008c 4a            	dec	a
1220  008d 2704          	jreq	L361
1221                     ; 327 		hx711->Datos.Estado = SLEEP;
1223  008f a602          	ld	a,#2
1224  0091 e715          	ld	(21,x),a
1226  0093               L361:
1227                     ; 629 }
1230  0093 5b06          	addw	sp,#6
1231  0095 81            	ret	
1350                     ; 664 uint16_t hx711_Lectura( HX711_t_ptr hx711 )
1350                     ; 665 {
1351                     .text:	section	.text,new
1352  0000               _hx711_Lectura:
1354  0000 89            	pushw	x
1355  0001 520b          	subw	sp,#11
1356       0000000b      OFST:	set	11
1359                     ; 666 	uint32_t semilla = 0;
1361                     ; 668 	semilla = leer( hx711 );
1364  0003 1f06          	ldw	(OFST-5,sp),x
1366                     ; 541 	uint32_t semilla = 0;
1368  0005 5f            	clrw	x
1369  0006 1f0a          	ldw	(OFST-1,sp),x
1370  0008 1f08          	ldw	(OFST-3,sp),x
1372                     ; 542 	uint8_t contadorBucle = 0;
1374  000a 0f05          	clr	(OFST-6,sp)
1376                     ; 544 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1378  000c 1e06          	ldw	x,(OFST-5,sp)
1379  000e e615          	ld	a,(21,x)
1380  0010 4a            	dec	a
1381  0011 2603cc01d2    	jreq	L3021
1382                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1385  0016 4b00          	push	#0
1386  0018 1e07          	ldw	x,(OFST-4,sp)
1387  001a 1c0004        	addw	x,#4
1388  001d cd0000        	call	_NHALgpio_Write
1390  0020 ae000f        	ldw	x,#15
1391  0023 9d            	nop	
1392  0024 84            	pop	a
1393                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1398  0025               L62:
1399  0025 5a            	decw	X
1400  0026 26fd          	jrne	L62
1401  0028 9d            	nop	
1402                     
1404                     ; 480 	if( hx711->Timeout != NULL )
1407  0029 1e06          	ldw	x,(OFST-5,sp)
1408  002b e617          	ld	a,(23,x)
1409  002d ea16          	or	a,(22,x)
1410  002f 273b          	jreq	L5221
1411                     ; 482 		Timeout_Start( hx711->Timeout, TIMEOUT_1MS );
1413  0031 ae03e8        	ldw	x,#1000
1414  0034 89            	pushw	x
1415  0035 1e08          	ldw	x,(OFST-3,sp)
1416  0037 ee16          	ldw	x,(22,x)
1417  0039 cd0000        	call	_Timeout_Start
1419  003c 85            	popw	x
1421  003d               L1121:
1422                     ; 483 		while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) && ( hx711->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) )
1424  003d 1e06          	ldw	x,(OFST-5,sp)
1425  003f cd0000        	call	_NHALgpio_Read
1427  0042 4d            	tnz	a
1428  0043 270c          	jreq	L5121
1430  0045 1e06          	ldw	x,(OFST-5,sp)
1431  0047 ee16          	ldw	x,(22,x)
1432  0049 ee02          	ldw	x,(2,x)
1433  004b fd            	call	(x)
1435  004c a301f4        	cpw	x,#500
1436  004f 25ec          	jrult	L1121
1437  0051               L5121:
1438                     ; 488 		if( hx711->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
1440  0051 1e06          	ldw	x,(OFST-5,sp)
1441  0053 ee16          	ldw	x,(22,x)
1442  0055 ee02          	ldw	x,(2,x)
1443  0057 fd            	call	(x)
1445  0058 a301f4        	cpw	x,#500
1446  005b 2506          	jrult	L7121
1447                     ; 490 			hx711->Datos.Estado = TIMEOUT;
1449  005d 1e06          	ldw	x,(OFST-5,sp)
1450  005f a604          	ld	a,#4
1451  0061 e715          	ld	(21,x),a
1452  0063               L7121:
1453                     ; 492 		Timeout_Stop( hx711->Timeout );
1455  0063 1e06          	ldw	x,(OFST-5,sp)
1456  0065 ee16          	ldw	x,(22,x)
1457  0067 cd0000        	call	_Timeout_Stop
1460  006a 2008          	jra	L1221
1461  006c               L5221:
1462                     ; 496 		while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) )
1464  006c 1e06          	ldw	x,(OFST-5,sp)
1465  006e cd0000        	call	_NHALgpio_Read
1467  0071 4d            	tnz	a
1468  0072 26f8          	jrne	L5221
1469  0074               L1221:
1470                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1474  0074 ae000f        	ldw	x,#15
1476  0077 9d            	nop	
1477  0078               L44:
1478  0078 5a            	decw	X
1479  0079 26fd          	jrne	L44
1480                     
1482  007b 2043          	jra	L3321
1483  007d               L1321:
1484                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1487  007d 4b01          	push	#1
1488  007f 1e07          	ldw	x,(OFST-4,sp)
1489  0081 1c0004        	addw	x,#4
1490  0084 cd0000        	call	_NHALgpio_Write
1492  0087 ae000f        	ldw	x,#15
1493  008a 9d            	nop	
1494  008b 84            	pop	a
1495                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1500  008c               L05:
1501  008c 5a            	decw	X
1502  008d 26fd          	jrne	L05
1503  008f 9d            	nop	
1504                     
1506                     ; 559 			semilla |= NHALgpio_Read( &hx711->Config.DOUT );
1508  0090 1e06          	ldw	x,(OFST-5,sp)
1509  0092 cd0000        	call	_NHALgpio_Read
1511  0095 b703          	ld	c_lreg+3,a
1512  0097 3f02          	clr	c_lreg+2
1513  0099 3f01          	clr	c_lreg+1
1514  009b 3f00          	clr	c_lreg
1515  009d 96            	ldw	x,sp
1516  009e 1c0008        	addw	x,#OFST-3
1517  00a1 cd0000        	call	c_lgor
1520                     ; 560 			semilla <<= 1;
1522  00a4 080b          	sll	(OFST+0,sp)
1523  00a6 090a          	rlc	(OFST-1,sp)
1524  00a8 0909          	rlc	(OFST-2,sp)
1525  00aa 0908          	rlc	(OFST-3,sp)
1527                     ; 562 			contadorBucle++;
1529  00ac 0c05          	inc	(OFST-6,sp)
1531                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1534  00ae 4b00          	push	#0
1535  00b0 1e07          	ldw	x,(OFST-4,sp)
1536  00b2 1c0004        	addw	x,#4
1537  00b5 cd0000        	call	_NHALgpio_Write
1539  00b8 ae000f        	ldw	x,#15
1540  00bb 9d            	nop	
1541  00bc 84            	pop	a
1542                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1547  00bd               L65:
1548  00bd 5a            	decw	X
1549  00be 26fd          	jrne	L65
1550                     
1552  00c0               L3321:
1553  00c0 9d            	nop	
1554                     ; 553 		while( contadorBucle < HX711_LONGITUDTRAMA ) 
1556  00c1 7b05          	ld	a,(OFST-6,sp)
1557  00c3 a118          	cp	a,#24
1558  00c5 25b6          	jrult	L1321
1559                     ; 412 	switch( hx711->Config.Ganancia )
1562  00c7 1e06          	ldw	x,(OFST-5,sp)
1563  00c9 e608          	ld	a,(8,x)
1565                     ; 437 		default:
1565                     ; 438 		
1565                     ; 439 		;
1566  00cb 270b          	jreq	L1001
1567  00cd 4a            	dec	a
1568  00ce 2740          	jreq	L7101
1569  00d0 4a            	dec	a
1570  00d1 2603cc0184    	jreq	L5601
1571  00d6 2028          	jra	L1211
1572  00d8               L1001:
1573                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1576  00d8 4b01          	push	#1
1577  00da 1e07          	ldw	x,(OFST-4,sp)
1578  00dc 1c0004        	addw	x,#4
1579  00df cd0000        	call	_NHALgpio_Write
1581  00e2 ae000f        	ldw	x,#15
1582  00e5 9d            	nop	
1583  00e6 84            	pop	a
1584                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1589  00e7               L26:
1590  00e7 5a            	decw	X
1591  00e8 26fd          	jrne	L26
1592  00ea 9d            	nop	
1593                     
1595                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1598  00eb 4b00          	push	#0
1599  00ed 1e07          	ldw	x,(OFST-4,sp)
1600  00ef 1c0004        	addw	x,#4
1601  00f2 cd0000        	call	_NHALgpio_Write
1603  00f5 ae000f        	ldw	x,#15
1604  00f8 9d            	nop	
1605  00f9 84            	pop	a
1606                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1611  00fa               L66:
1612  00fa 5a            	decw	X
1613  00fb 26fd          	jrne	L66
1614  00fd               LC001:
1615  00fd 9d            	nop	
1616                     
1618  00fe 1e06          	ldw	x,(OFST-5,sp)
1619  0100               L1211:
1620                     ; 570 		if( hx711->Datos.Estado != TIMEOUT )
1622  0100 e615          	ld	a,(21,x)
1623  0102 a104          	cp	a,#4
1624  0104 2603cc01d2    	jreq	L3021
1625                     ; 572 			hx711->Datos.Estado = NUEVA_LECTURA;
1627  0109 a603          	ld	a,#3
1628  010b e715          	ld	(21,x),a
1629  010d cc01d2        	jra	L3021
1630  0110               L7101:
1631                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1634  0110 4b01          	push	#1
1635  0112 1e07          	ldw	x,(OFST-4,sp)
1636  0114 1c0004        	addw	x,#4
1637  0117 cd0000        	call	_NHALgpio_Write
1639  011a ae000f        	ldw	x,#15
1640  011d 9d            	nop	
1641  011e 84            	pop	a
1642                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1647  011f               L27:
1648  011f 5a            	decw	X
1649  0120 26fd          	jrne	L27
1650  0122 9d            	nop	
1651                     
1653                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1656  0123 4b00          	push	#0
1657  0125 1e07          	ldw	x,(OFST-4,sp)
1658  0127 1c0004        	addw	x,#4
1659  012a cd0000        	call	_NHALgpio_Write
1661  012d ae000f        	ldw	x,#15
1662  0130 9d            	nop	
1663  0131 84            	pop	a
1664                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1669  0132               L67:
1670  0132 5a            	decw	X
1671  0133 26fd          	jrne	L67
1672  0135 9d            	nop	
1673                     
1675                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1678  0136 4b01          	push	#1
1679  0138 1e07          	ldw	x,(OFST-4,sp)
1680  013a 1c0004        	addw	x,#4
1681  013d cd0000        	call	_NHALgpio_Write
1683  0140 ae000f        	ldw	x,#15
1684  0143 9d            	nop	
1685  0144 84            	pop	a
1686                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1691  0145               L201:
1692  0145 5a            	decw	X
1693  0146 26fd          	jrne	L201
1694  0148 9d            	nop	
1695                     
1697                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1700  0149 4b00          	push	#0
1701  014b 1e07          	ldw	x,(OFST-4,sp)
1702  014d 1c0004        	addw	x,#4
1703  0150 cd0000        	call	_NHALgpio_Write
1705  0153 ae000f        	ldw	x,#15
1706  0156 9d            	nop	
1707  0157 84            	pop	a
1708                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1713  0158               L601:
1714  0158 5a            	decw	X
1715  0159 26fd          	jrne	L601
1716  015b 9d            	nop	
1717                     
1719                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1722  015c 4b01          	push	#1
1723  015e 1e07          	ldw	x,(OFST-4,sp)
1724  0160 1c0004        	addw	x,#4
1725  0163 cd0000        	call	_NHALgpio_Write
1727  0166 ae000f        	ldw	x,#15
1728  0169 9d            	nop	
1729  016a 84            	pop	a
1730                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1735  016b               L211:
1736  016b 5a            	decw	X
1737  016c 26fd          	jrne	L211
1738  016e 9d            	nop	
1739                     
1741                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1744  016f 4b00          	push	#0
1745  0171 1e07          	ldw	x,(OFST-4,sp)
1746  0173 1c0004        	addw	x,#4
1747  0176 cd0000        	call	_NHALgpio_Write
1749  0179 ae000f        	ldw	x,#15
1750  017c 9d            	nop	
1751  017d 84            	pop	a
1752                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1757  017e               L611:
1758  017e 5a            	decw	X
1759  017f 26fd          	jrne	L611
1760                     
1762  0181 cc00fd        	jp	LC001
1763  0184               L5601:
1764                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1767  0184 4b01          	push	#1
1768  0186 1e07          	ldw	x,(OFST-4,sp)
1769  0188 1c0004        	addw	x,#4
1770  018b cd0000        	call	_NHALgpio_Write
1772  018e ae000f        	ldw	x,#15
1773  0191 9d            	nop	
1774  0192 84            	pop	a
1775                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1780  0193               L221:
1781  0193 5a            	decw	X
1782  0194 26fd          	jrne	L221
1783  0196 9d            	nop	
1784                     
1786                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1789  0197 4b00          	push	#0
1790  0199 1e07          	ldw	x,(OFST-4,sp)
1791  019b 1c0004        	addw	x,#4
1792  019e cd0000        	call	_NHALgpio_Write
1794  01a1 ae000f        	ldw	x,#15
1795  01a4 9d            	nop	
1796  01a5 84            	pop	a
1797                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1802  01a6               L621:
1803  01a6 5a            	decw	X
1804  01a7 26fd          	jrne	L621
1805  01a9 9d            	nop	
1806                     
1808                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1811  01aa 4b01          	push	#1
1812  01ac 1e07          	ldw	x,(OFST-4,sp)
1813  01ae 1c0004        	addw	x,#4
1814  01b1 cd0000        	call	_NHALgpio_Write
1816  01b4 ae000f        	ldw	x,#15
1817  01b7 9d            	nop	
1818  01b8 84            	pop	a
1819                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1824  01b9               L231:
1825  01b9 5a            	decw	X
1826  01ba 26fd          	jrne	L231
1827  01bc 9d            	nop	
1828                     
1830                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1833  01bd 4b00          	push	#0
1834  01bf 1e07          	ldw	x,(OFST-4,sp)
1835  01c1 1c0004        	addw	x,#4
1836  01c4 cd0000        	call	_NHALgpio_Write
1838  01c7 ae000f        	ldw	x,#15
1839  01ca 9d            	nop	
1840  01cb 84            	pop	a
1841                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1846  01cc               L631:
1847  01cc 5a            	decw	X
1848  01cd 26fd          	jrne	L631
1849                     
1851  01cf cc00fd        	jp	LC001
1852  01d2               L3021:
1853                     ; 575 		return semilla;
1858                     ; 670 	aDormir( hx711 );
1861  01d2 1e0c          	ldw	x,(OFST+1,sp)
1862  01d4 1f06          	ldw	(OFST-5,sp),x
1864                     ; 322 	NHALgpio_Write( &hx711->Config.PD_SCK, true );
1866  01d6 4b01          	push	#1
1867  01d8 1e07          	ldw	x,(OFST-4,sp)
1868  01da 1c0004        	addw	x,#4
1869  01dd cd0000        	call	_NHALgpio_Write
1871  01e0 ae0174        	ldw	x,#372
1872  01e3 9d            	nop	
1873  01e4 84            	pop	a
1874                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1879  01e5               L441:
1880  01e5 5a            	decw	X
1881  01e6 26fd          	jrne	L441
1882  01e8 9d            	nop	
1883                     
1885                     ; 325 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1887  01e9 1e06          	ldw	x,(OFST-5,sp)
1888  01eb e615          	ld	a,(21,x)
1889  01ed 4a            	dec	a
1890  01ee 2704          	jreq	L1311
1891                     ; 327 		hx711->Datos.Estado = SLEEP;
1893  01f0 a602          	ld	a,#2
1894  01f2 e715          	ld	(21,x),a
1896  01f4               L1311:
1897                     ; 672 	if( ( semilla > hx711->Config.ValorZero ) )
1899  01f4 1e0c          	ldw	x,(OFST+1,sp)
1900  01f6 1c000b        	addw	x,#11
1901  01f9 cd0000        	call	c_ltor
1903  01fc 96            	ldw	x,sp
1904  01fd 1c0008        	addw	x,#OFST-3
1905  0200 cd0000        	call	c_lcmp
1907  0203 2424          	jruge	L1521
1908                     ; 674 		return ( ( semilla - hx711->Config.ValorZero ) / hx711->Config.ValorConversion );
1910  0205 1e0c          	ldw	x,(OFST+1,sp)
1911  0207 ee09          	ldw	x,(9,x)
1912  0209 cd0000        	call	c_uitolx
1914  020c 96            	ldw	x,sp
1915  020d 5c            	incw	x
1916  020e cd0000        	call	c_rtol
1919  0211 96            	ldw	x,sp
1920  0212 1c0008        	addw	x,#OFST-3
1921  0215 cd0000        	call	c_ltor
1923  0218 1e0c          	ldw	x,(OFST+1,sp)
1924  021a 1c000b        	addw	x,#11
1925  021d cd0000        	call	c_lsub
1927  0220 96            	ldw	x,sp
1928  0221 5c            	incw	x
1929  0222 cd0000        	call	c_ludv
1931  0225 be02          	ldw	x,c_lreg+2
1933  0227 2001          	jra	L641
1934  0229               L1521:
1935                     ; 678 		return 0;
1937  0229 5f            	clrw	x
1939  022a               L641:
1941  022a 5b0d          	addw	sp,#13
1942  022c 81            	ret	
2055                     ; 715 uint16_t hx711_Tarar( HX711_t_ptr hx711 )
2055                     ; 716 {
2056                     .text:	section	.text,new
2057  0000               _hx711_Tarar:
2059  0000 89            	pushw	x
2060  0001 5210          	subw	sp,#16
2061       00000010      OFST:	set	16
2064                     ; 717 	uint32_t valorMedio = 0;
2066  0003 5f            	clrw	x
2067  0004 1f0e          	ldw	(OFST-2,sp),x
2068  0006 1f0c          	ldw	(OFST-4,sp),x
2070                     ; 718 	uint8_t repeticiones = 4;
2072  0008 a604          	ld	a,#4
2073  000a 6b10          	ld	(OFST+0,sp),a
2075  000c               L7741:
2076                     ; 722 		valorMedio = valorMedio + leer( hx711 );
2079  000c 1e11          	ldw	x,(OFST+1,sp)
2080  000e 1f06          	ldw	(OFST-10,sp),x
2082                     ; 541 	uint32_t semilla = 0;
2084  0010 5f            	clrw	x
2085  0011 1f04          	ldw	(OFST-12,sp),x
2086  0013 1f02          	ldw	(OFST-14,sp),x
2088                     ; 542 	uint8_t contadorBucle = 0;
2090  0015 0f01          	clr	(OFST-15,sp)
2092                     ; 544 	if( hx711->Datos.Estado != SINVALORCONVERSION )
2094  0017 1e06          	ldw	x,(OFST-10,sp)
2095  0019 e615          	ld	a,(21,x)
2096  001b 4a            	dec	a
2097  001c 2603cc01dd    	jreq	L5051
2098                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2101  0021 4b00          	push	#0
2102  0023 1e07          	ldw	x,(OFST-9,sp)
2103  0025 1c0004        	addw	x,#4
2104  0028 cd0000        	call	_NHALgpio_Write
2106  002b ae000f        	ldw	x,#15
2107  002e 9d            	nop	
2108  002f 84            	pop	a
2109                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2114  0030               L451:
2115  0030 5a            	decw	X
2116  0031 26fd          	jrne	L451
2117  0033 9d            	nop	
2118                     
2120                     ; 480 	if( hx711->Timeout != NULL )
2123  0034 1e06          	ldw	x,(OFST-10,sp)
2124  0036 e617          	ld	a,(23,x)
2125  0038 ea16          	or	a,(22,x)
2126  003a 273b          	jreq	L7251
2127                     ; 482 		Timeout_Start( hx711->Timeout, TIMEOUT_1MS );
2129  003c ae03e8        	ldw	x,#1000
2130  003f 89            	pushw	x
2131  0040 1e08          	ldw	x,(OFST-8,sp)
2132  0042 ee16          	ldw	x,(22,x)
2133  0044 cd0000        	call	_Timeout_Start
2135  0047 85            	popw	x
2137  0048               L3151:
2138                     ; 483 		while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) && ( hx711->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) )
2140  0048 1e06          	ldw	x,(OFST-10,sp)
2141  004a cd0000        	call	_NHALgpio_Read
2143  004d 4d            	tnz	a
2144  004e 270c          	jreq	L7151
2146  0050 1e06          	ldw	x,(OFST-10,sp)
2147  0052 ee16          	ldw	x,(22,x)
2148  0054 ee02          	ldw	x,(2,x)
2149  0056 fd            	call	(x)
2151  0057 a301f4        	cpw	x,#500
2152  005a 25ec          	jrult	L3151
2153  005c               L7151:
2154                     ; 488 		if( hx711->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
2156  005c 1e06          	ldw	x,(OFST-10,sp)
2157  005e ee16          	ldw	x,(22,x)
2158  0060 ee02          	ldw	x,(2,x)
2159  0062 fd            	call	(x)
2161  0063 a301f4        	cpw	x,#500
2162  0066 2506          	jrult	L1251
2163                     ; 490 			hx711->Datos.Estado = TIMEOUT;
2165  0068 1e06          	ldw	x,(OFST-10,sp)
2166  006a a604          	ld	a,#4
2167  006c e715          	ld	(21,x),a
2168  006e               L1251:
2169                     ; 492 		Timeout_Stop( hx711->Timeout );
2171  006e 1e06          	ldw	x,(OFST-10,sp)
2172  0070 ee16          	ldw	x,(22,x)
2173  0072 cd0000        	call	_Timeout_Stop
2176  0075 2008          	jra	L3251
2177  0077               L7251:
2178                     ; 496 		while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) )
2180  0077 1e06          	ldw	x,(OFST-10,sp)
2181  0079 cd0000        	call	_NHALgpio_Read
2183  007c 4d            	tnz	a
2184  007d 26f8          	jrne	L7251
2185  007f               L3251:
2186                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2190  007f ae000f        	ldw	x,#15
2192  0082 9d            	nop	
2193  0083               L271:
2194  0083 5a            	decw	X
2195  0084 26fd          	jrne	L271
2196                     
2198  0086 2043          	jra	L5351
2199  0088               L3351:
2200                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2203  0088 4b01          	push	#1
2204  008a 1e07          	ldw	x,(OFST-9,sp)
2205  008c 1c0004        	addw	x,#4
2206  008f cd0000        	call	_NHALgpio_Write
2208  0092 ae000f        	ldw	x,#15
2209  0095 9d            	nop	
2210  0096 84            	pop	a
2211                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2216  0097               L671:
2217  0097 5a            	decw	X
2218  0098 26fd          	jrne	L671
2219  009a 9d            	nop	
2220                     
2222                     ; 559 			semilla |= NHALgpio_Read( &hx711->Config.DOUT );
2224  009b 1e06          	ldw	x,(OFST-10,sp)
2225  009d cd0000        	call	_NHALgpio_Read
2227  00a0 b703          	ld	c_lreg+3,a
2228  00a2 3f02          	clr	c_lreg+2
2229  00a4 3f01          	clr	c_lreg+1
2230  00a6 3f00          	clr	c_lreg
2231  00a8 96            	ldw	x,sp
2232  00a9 1c0002        	addw	x,#OFST-14
2233  00ac cd0000        	call	c_lgor
2236                     ; 560 			semilla <<= 1;
2238  00af 0805          	sll	(OFST-11,sp)
2239  00b1 0904          	rlc	(OFST-12,sp)
2240  00b3 0903          	rlc	(OFST-13,sp)
2241  00b5 0902          	rlc	(OFST-14,sp)
2243                     ; 562 			contadorBucle++;
2245  00b7 0c01          	inc	(OFST-15,sp)
2247                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2250  00b9 4b00          	push	#0
2251  00bb 1e07          	ldw	x,(OFST-9,sp)
2252  00bd 1c0004        	addw	x,#4
2253  00c0 cd0000        	call	_NHALgpio_Write
2255  00c3 ae000f        	ldw	x,#15
2256  00c6 9d            	nop	
2257  00c7 84            	pop	a
2258                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2263  00c8               L402:
2264  00c8 5a            	decw	X
2265  00c9 26fd          	jrne	L402
2266                     
2268  00cb               L5351:
2269  00cb 9d            	nop	
2270                     ; 553 		while( contadorBucle < HX711_LONGITUDTRAMA ) 
2272  00cc 7b01          	ld	a,(OFST-15,sp)
2273  00ce a118          	cp	a,#24
2274  00d0 25b6          	jrult	L3351
2275                     ; 412 	switch( hx711->Config.Ganancia )
2278  00d2 1e06          	ldw	x,(OFST-10,sp)
2279  00d4 e608          	ld	a,(8,x)
2281                     ; 437 		default:
2281                     ; 438 		
2281                     ; 439 		;
2282  00d6 270b          	jreq	L5031
2283  00d8 4a            	dec	a
2284  00d9 2740          	jreq	L3231
2285  00db 4a            	dec	a
2286  00dc 2603cc018f    	jreq	L1731
2287  00e1 2028          	jra	L5241
2288  00e3               L5031:
2289                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2292  00e3 4b01          	push	#1
2293  00e5 1e07          	ldw	x,(OFST-9,sp)
2294  00e7 1c0004        	addw	x,#4
2295  00ea cd0000        	call	_NHALgpio_Write
2297  00ed ae000f        	ldw	x,#15
2298  00f0 9d            	nop	
2299  00f1 84            	pop	a
2300                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2305  00f2               L012:
2306  00f2 5a            	decw	X
2307  00f3 26fd          	jrne	L012
2308  00f5 9d            	nop	
2309                     
2311                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2314  00f6 4b00          	push	#0
2315  00f8 1e07          	ldw	x,(OFST-9,sp)
2316  00fa 1c0004        	addw	x,#4
2317  00fd cd0000        	call	_NHALgpio_Write
2319  0100 ae000f        	ldw	x,#15
2320  0103 9d            	nop	
2321  0104 84            	pop	a
2322                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2327  0105               L412:
2328  0105 5a            	decw	X
2329  0106 26fd          	jrne	L412
2330  0108               LC002:
2331  0108 9d            	nop	
2332                     
2334  0109 1e06          	ldw	x,(OFST-10,sp)
2335  010b               L5241:
2336                     ; 570 		if( hx711->Datos.Estado != TIMEOUT )
2338  010b e615          	ld	a,(21,x)
2339  010d a104          	cp	a,#4
2340  010f 2603cc01dd    	jreq	L5051
2341                     ; 572 			hx711->Datos.Estado = NUEVA_LECTURA;
2343  0114 a603          	ld	a,#3
2344  0116 e715          	ld	(21,x),a
2345  0118 cc01dd        	jra	L5051
2346  011b               L3231:
2347                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2350  011b 4b01          	push	#1
2351  011d 1e07          	ldw	x,(OFST-9,sp)
2352  011f 1c0004        	addw	x,#4
2353  0122 cd0000        	call	_NHALgpio_Write
2355  0125 ae000f        	ldw	x,#15
2356  0128 9d            	nop	
2357  0129 84            	pop	a
2358                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2363  012a               L022:
2364  012a 5a            	decw	X
2365  012b 26fd          	jrne	L022
2366  012d 9d            	nop	
2367                     
2369                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2372  012e 4b00          	push	#0
2373  0130 1e07          	ldw	x,(OFST-9,sp)
2374  0132 1c0004        	addw	x,#4
2375  0135 cd0000        	call	_NHALgpio_Write
2377  0138 ae000f        	ldw	x,#15
2378  013b 9d            	nop	
2379  013c 84            	pop	a
2380                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2385  013d               L422:
2386  013d 5a            	decw	X
2387  013e 26fd          	jrne	L422
2388  0140 9d            	nop	
2389                     
2391                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2394  0141 4b01          	push	#1
2395  0143 1e07          	ldw	x,(OFST-9,sp)
2396  0145 1c0004        	addw	x,#4
2397  0148 cd0000        	call	_NHALgpio_Write
2399  014b ae000f        	ldw	x,#15
2400  014e 9d            	nop	
2401  014f 84            	pop	a
2402                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2407  0150               L032:
2408  0150 5a            	decw	X
2409  0151 26fd          	jrne	L032
2410  0153 9d            	nop	
2411                     
2413                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2416  0154 4b00          	push	#0
2417  0156 1e07          	ldw	x,(OFST-9,sp)
2418  0158 1c0004        	addw	x,#4
2419  015b cd0000        	call	_NHALgpio_Write
2421  015e ae000f        	ldw	x,#15
2422  0161 9d            	nop	
2423  0162 84            	pop	a
2424                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2429  0163               L432:
2430  0163 5a            	decw	X
2431  0164 26fd          	jrne	L432
2432  0166 9d            	nop	
2433                     
2435                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2438  0167 4b01          	push	#1
2439  0169 1e07          	ldw	x,(OFST-9,sp)
2440  016b 1c0004        	addw	x,#4
2441  016e cd0000        	call	_NHALgpio_Write
2443  0171 ae000f        	ldw	x,#15
2444  0174 9d            	nop	
2445  0175 84            	pop	a
2446                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2451  0176               L042:
2452  0176 5a            	decw	X
2453  0177 26fd          	jrne	L042
2454  0179 9d            	nop	
2455                     
2457                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2460  017a 4b00          	push	#0
2461  017c 1e07          	ldw	x,(OFST-9,sp)
2462  017e 1c0004        	addw	x,#4
2463  0181 cd0000        	call	_NHALgpio_Write
2465  0184 ae000f        	ldw	x,#15
2466  0187 9d            	nop	
2467  0188 84            	pop	a
2468                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2473  0189               L442:
2474  0189 5a            	decw	X
2475  018a 26fd          	jrne	L442
2476                     
2478  018c cc0108        	jp	LC002
2479  018f               L1731:
2480                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2483  018f 4b01          	push	#1
2484  0191 1e07          	ldw	x,(OFST-9,sp)
2485  0193 1c0004        	addw	x,#4
2486  0196 cd0000        	call	_NHALgpio_Write
2488  0199 ae000f        	ldw	x,#15
2489  019c 9d            	nop	
2490  019d 84            	pop	a
2491                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2496  019e               L052:
2497  019e 5a            	decw	X
2498  019f 26fd          	jrne	L052
2499  01a1 9d            	nop	
2500                     
2502                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2505  01a2 4b00          	push	#0
2506  01a4 1e07          	ldw	x,(OFST-9,sp)
2507  01a6 1c0004        	addw	x,#4
2508  01a9 cd0000        	call	_NHALgpio_Write
2510  01ac ae000f        	ldw	x,#15
2511  01af 9d            	nop	
2512  01b0 84            	pop	a
2513                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2518  01b1               L452:
2519  01b1 5a            	decw	X
2520  01b2 26fd          	jrne	L452
2521  01b4 9d            	nop	
2522                     
2524                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2527  01b5 4b01          	push	#1
2528  01b7 1e07          	ldw	x,(OFST-9,sp)
2529  01b9 1c0004        	addw	x,#4
2530  01bc cd0000        	call	_NHALgpio_Write
2532  01bf ae000f        	ldw	x,#15
2533  01c2 9d            	nop	
2534  01c3 84            	pop	a
2535                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2540  01c4               L062:
2541  01c4 5a            	decw	X
2542  01c5 26fd          	jrne	L062
2543  01c7 9d            	nop	
2544                     
2546                     ; 371 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2549  01c8 4b00          	push	#0
2550  01ca 1e07          	ldw	x,(OFST-9,sp)
2551  01cc 1c0004        	addw	x,#4
2552  01cf cd0000        	call	_NHALgpio_Write
2554  01d2 ae000f        	ldw	x,#15
2555  01d5 9d            	nop	
2556  01d6 84            	pop	a
2557                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2562  01d7               L462:
2563  01d7 5a            	decw	X
2564  01d8 26fd          	jrne	L462
2565                     
2567  01da cc0108        	jp	LC002
2568  01dd               L5051:
2569                     ; 575 		return semilla;
2571  01dd 1e04          	ldw	x,(OFST-12,sp)
2572  01df 1f0a          	ldw	(OFST-6,sp),x
2573  01e1 1e02          	ldw	x,(OFST-14,sp)
2574  01e3 1f08          	ldw	(OFST-8,sp),x
2578  01e5 96            	ldw	x,sp
2579  01e6 1c0008        	addw	x,#OFST-8
2580  01e9 cd0000        	call	c_ltor
2582  01ec 96            	ldw	x,sp
2583  01ed 1c000c        	addw	x,#OFST-4
2584  01f0 cd0000        	call	c_lgadd
2587                     ; 723 		--repeticiones;
2589  01f3 0a10          	dec	(OFST+0,sp)
2591                     ; 720 	while( ( repeticiones > 0 ) )
2593  01f5 2703cc000c    	jrne	L7741
2594                     ; 725 	repeticiones = 4;
2596                     ; 727 	return valorMedio/repeticiones;
2598  01fa 96            	ldw	x,sp
2599  01fb 1c000c        	addw	x,#OFST-4
2600  01fe cd0000        	call	c_ltor
2602  0201 a602          	ld	a,#2
2603  0203 cd0000        	call	c_lursh
2605  0206 be02          	ldw	x,c_lreg+2
2608  0208 5b12          	addw	sp,#18
2609  020a 81            	ret	
2622                     	xdef	_hx711_Tarar
2623                     	xdef	_hx711_Lectura
2624                     	xdef	_HX711_Init
2625                     	xref	_Timeout_Stop
2626                     	xref	_Timeout_Start
2627                     	xref	_NHALgpio_Write
2628                     	xref	_NHALgpio_Read
2629                     	xref	_NHALgpio_Init
2630                     	xref	_NHALgpioConfig_SetType
2631                     	xref.b	c_lreg
2632                     	xref.b	c_x
2651                     	xref	c_lursh
2652                     	xref	c_lgadd
2653                     	xref	c_ludv
2654                     	xref	c_rtol
2655                     	xref	c_uitolx
2656                     	xref	c_lsub
2657                     	xref	c_lcmp
2658                     	xref	c_ltor
2659                     	xref	c_lgor
2660                     	end

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
  62  0000               L53_HX711_LONGITUDTRAMA:
  63  0000 18            	dc.b	24
  64  0001               L73_HX711_TIEMPOCLOCK:
  65  0001 03            	dc.b	3
  66  0002               L14_HX711_TIEMPOCLOCKSLEEP:
  67  0002 46            	dc.b	70
1026                     ; 265 void HX711_Init( HX711_t_ptr hx711, HX711_fPtr Lectura, HX711_fPtr Tarar, Timeout_t_ptr Timeout )
1026                     ; 266 {
1028                     .text:	section	.text,new
1029  0000               _HX711_Init:
1031  0000 89            	pushw	x
1032  0001 5204          	subw	sp,#4
1033       00000004      OFST:	set	4
1036                     ; 267 	initPtrFunciones( hx711, Lectura, Tarar );
1040                     ; 73 	hx711->Lectura = Lectura;
1042  0003 1609          	ldw	y,(OFST+5,sp)
1043  0005 ef18          	ldw	(24,x),y
1044                     ; 74 	hx711->Tarar = Tarar;
1046  0007 160b          	ldw	y,(OFST+7,sp)
1047  0009 ef1a          	ldw	(26,x),y
1048                     ; 269 	hx711->Timeout = Timeout;
1050  000b 160d          	ldw	y,(OFST+9,sp)
1051  000d ef16          	ldw	(22,x),y
1052                     ; 271 	initVariables( &hx711->Config, &hx711->Datos );
1055  000f 1f03          	ldw	(OFST-1,sp),x
1059  0011 1c0011        	addw	x,#17
1060  0014 1f01          	ldw	(OFST-3,sp),x
1062                     ; 79 	hx711Datos->UltimaLectura = 0;
1064  0016 4f            	clr	a
1065  0017 e703          	ld	(3,x),a
1066  0019 e702          	ld	(2,x),a
1067  001b e701          	ld	(1,x),a
1068  001d f7            	ld	(x),a
1069                     ; 80 	hx711Config->ValorTara = 0;
1071  001e 1e03          	ldw	x,(OFST-1,sp)
1072  0020 905f          	clrw	y
1073  0022 ef0f          	ldw	(15,x),y
1074                     ; 81 	hx711Config->ValorConversion = 1;
1076  0024 905c          	incw	y
1077  0026 ef09          	ldw	(9,x),y
1078                     ; 82 	hx711Config->Ganancia = CHANNELA_128;
1080  0028 6f08          	clr	(8,x)
1081                     ; 273 	initDOUT( &hx711->Config.DOUT );
1084  002a 1e05          	ldw	x,(OFST+1,sp)
1085  002c 1f03          	ldw	(OFST-1,sp),x
1087                     ; 87 	NHALgpioConfig_SetType( dout,GPIO_MODE_IN_PU_NO_IT );
1089  002e 4b40          	push	#64
1090  0030 1e04          	ldw	x,(OFST+0,sp)
1091  0032 cd0000        	call	_NHALgpioConfig_SetType
1093  0035 84            	pop	a
1094                     ; 88 	NHALgpio_Init( dout );
1096  0036 1e03          	ldw	x,(OFST-1,sp)
1097  0038 cd0000        	call	_NHALgpio_Init
1099                     ; 274 	initPDSCK( &hx711->Config.PD_SCK );
1102  003b 1e05          	ldw	x,(OFST+1,sp)
1103  003d 1c0004        	addw	x,#4
1104  0040 1f03          	ldw	(OFST-1,sp),x
1106                     ; 93 	NHALgpioConfig_SetType( pdsck, GPIO_MODE_OUT_PP_LOW_FAST );
1108  0042 4be0          	push	#224
1109  0044 1e04          	ldw	x,(OFST+0,sp)
1110  0046 cd0000        	call	_NHALgpioConfig_SetType
1112  0049 84            	pop	a
1113                     ; 94 	NHALgpio_Init( pdsck );
1115  004a 1e03          	ldw	x,(OFST-1,sp)
1116  004c cd0000        	call	_NHALgpio_Init
1118                     ; 276 	chequearValorConversion( &hx711->Config, &hx711->Datos );
1121  004f 1e05          	ldw	x,(OFST+1,sp)
1122  0051 1f01          	ldw	(OFST-3,sp),x
1126  0053 1c0011        	addw	x,#17
1127  0056 1f03          	ldw	(OFST-1,sp),x
1129                     ; 99 	if( ( hx711Config->ValorConversion ) == 0 )
1131  0058 1e01          	ldw	x,(OFST-3,sp)
1132  005a e60a          	ld	a,(10,x)
1133  005c ea09          	or	a,(9,x)
1134  005e 260d          	jrne	L317
1135                     ; 101 		hx711Config->ValorConversion = 1;
1137  0060 90ae0001      	ldw	y,#1
1138  0064 ef09          	ldw	(9,x),y
1139                     ; 102 		hx711Datos->Estado = SINVALORCONVERSION;
1141  0066 1e03          	ldw	x,(OFST-1,sp)
1142  0068 4c            	inc	a
1143  0069 e704          	ld	(4,x),a
1145  006b 2004          	jra	L331
1146  006d               L317:
1147                     ; 106 		hx711Datos->Estado = INICIALIZADO;
1149  006d 1e03          	ldw	x,(OFST-1,sp)
1150  006f 6f04          	clr	(4,x)
1151  0071               L331:
1152                     ; 278 	aDormir( hx711 );
1155  0071 1e05          	ldw	x,(OFST+1,sp)
1156  0073 1f03          	ldw	(OFST-1,sp),x
1158                     ; 112 	NHALgpio_Write( &hx711->Config.PD_SCK, true );
1160  0075 4b01          	push	#1
1161  0077 1e04          	ldw	x,(OFST+0,sp)
1162  0079 1c0004        	addw	x,#4
1163  007c cd0000        	call	_NHALgpio_Write
1165  007f ae0174        	ldw	x,#372
1166  0082 9d            	nop	
1167  0083 84            	pop	a
1168                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1173  0084               L02:
1174  0084 5a            	decw	X
1175  0085 26fd          	jrne	L02
1176  0087 9d            	nop	
1177                     
1179                     ; 115 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1181  0088 1e03          	ldw	x,(OFST-1,sp)
1182  008a e615          	ld	a,(21,x)
1183  008c 4a            	dec	a
1184  008d 2704          	jreq	L141
1185                     ; 117 		hx711->Datos.Estado = SLEEP;
1187  008f a602          	ld	a,#2
1188  0091 e715          	ld	(21,x),a
1190  0093               L141:
1191                     ; 279 }
1194  0093 5b06          	addw	sp,#6
1195  0095 81            	ret	
1314                     ; 314 uint16_t hx711_Lectura( HX711_t_ptr hx711 )
1314                     ; 315 {
1315                     .text:	section	.text,new
1316  0000               _hx711_Lectura:
1318  0000 89            	pushw	x
1319  0001 520b          	subw	sp,#11
1320       0000000b      OFST:	set	11
1323                     ; 316 	uint32_t semilla = 0;
1325                     ; 318 	semilla = leer( hx711 );
1328  0003 1f06          	ldw	(OFST-5,sp),x
1330                     ; 191 	uint32_t semilla = 0;
1332  0005 5f            	clrw	x
1333  0006 1f0a          	ldw	(OFST-1,sp),x
1334  0008 1f08          	ldw	(OFST-3,sp),x
1336                     ; 192 	uint8_t contadorBucle = 0;
1338  000a 0f05          	clr	(OFST-6,sp)
1340                     ; 194 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1342  000c 1e06          	ldw	x,(OFST-5,sp)
1343  000e e615          	ld	a,(21,x)
1344  0010 4a            	dec	a
1345  0011 2603cc01d2    	jreq	L5511
1346                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1349  0016 4b00          	push	#0
1350  0018 1e07          	ldw	x,(OFST-4,sp)
1351  001a 1c0004        	addw	x,#4
1352  001d cd0000        	call	_NHALgpio_Write
1354  0020 ae000f        	ldw	x,#15
1355  0023 9d            	nop	
1356  0024 84            	pop	a
1357                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1362  0025               L62:
1363  0025 5a            	decw	X
1364  0026 26fd          	jrne	L62
1365  0028 9d            	nop	
1366                     
1368                     ; 165 	if( hx711->Timeout != NULL )
1371  0029 1e06          	ldw	x,(OFST-5,sp)
1372  002b e617          	ld	a,(23,x)
1373  002d ea16          	or	a,(22,x)
1374  002f 273b          	jreq	L7711
1375                     ; 167 		Timeout_Start( hx711->Timeout, TIMEOUT_1MS );
1377  0031 ae03e8        	ldw	x,#1000
1378  0034 89            	pushw	x
1379  0035 1e08          	ldw	x,(OFST-3,sp)
1380  0037 ee16          	ldw	x,(22,x)
1381  0039 cd0000        	call	_Timeout_Start
1383  003c 85            	popw	x
1385  003d               L3611:
1386                     ; 168 		while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) && ( hx711->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) )
1388  003d 1e06          	ldw	x,(OFST-5,sp)
1389  003f cd0000        	call	_NHALgpio_Read
1391  0042 4d            	tnz	a
1392  0043 270c          	jreq	L7611
1394  0045 1e06          	ldw	x,(OFST-5,sp)
1395  0047 ee16          	ldw	x,(22,x)
1396  0049 ee02          	ldw	x,(2,x)
1397  004b fd            	call	(x)
1399  004c a301f4        	cpw	x,#500
1400  004f 25ec          	jrult	L3611
1401  0051               L7611:
1402                     ; 173 		if( hx711->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
1404  0051 1e06          	ldw	x,(OFST-5,sp)
1405  0053 ee16          	ldw	x,(22,x)
1406  0055 ee02          	ldw	x,(2,x)
1407  0057 fd            	call	(x)
1409  0058 a301f4        	cpw	x,#500
1410  005b 2506          	jrult	L1711
1411                     ; 175 			hx711->Datos.Estado = TIMEOUT;
1413  005d 1e06          	ldw	x,(OFST-5,sp)
1414  005f a604          	ld	a,#4
1415  0061 e715          	ld	(21,x),a
1416  0063               L1711:
1417                     ; 177 		Timeout_Stop( hx711->Timeout );
1419  0063 1e06          	ldw	x,(OFST-5,sp)
1420  0065 ee16          	ldw	x,(22,x)
1421  0067 cd0000        	call	_Timeout_Stop
1424  006a 2008          	jra	L3711
1425  006c               L7711:
1426                     ; 181 		while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) )
1428  006c 1e06          	ldw	x,(OFST-5,sp)
1429  006e cd0000        	call	_NHALgpio_Read
1431  0071 4d            	tnz	a
1432  0072 26f8          	jrne	L7711
1433  0074               L3711:
1434                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1438  0074 ae000f        	ldw	x,#15
1440  0077 9d            	nop	
1441  0078               L44:
1442  0078 5a            	decw	X
1443  0079 26fd          	jrne	L44
1444                     
1446  007b 2043          	jra	L5021
1447  007d               L3021:
1448                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1451  007d 4b01          	push	#1
1452  007f 1e07          	ldw	x,(OFST-4,sp)
1453  0081 1c0004        	addw	x,#4
1454  0084 cd0000        	call	_NHALgpio_Write
1456  0087 ae000f        	ldw	x,#15
1457  008a 9d            	nop	
1458  008b 84            	pop	a
1459                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1464  008c               L05:
1465  008c 5a            	decw	X
1466  008d 26fd          	jrne	L05
1467  008f 9d            	nop	
1468                     
1470                     ; 209 			semilla |= NHALgpio_Read( &hx711->Config.DOUT );
1472  0090 1e06          	ldw	x,(OFST-5,sp)
1473  0092 cd0000        	call	_NHALgpio_Read
1475  0095 b703          	ld	c_lreg+3,a
1476  0097 3f02          	clr	c_lreg+2
1477  0099 3f01          	clr	c_lreg+1
1478  009b 3f00          	clr	c_lreg
1479  009d 96            	ldw	x,sp
1480  009e 1c0008        	addw	x,#OFST-3
1481  00a1 cd0000        	call	c_lgor
1484                     ; 210 			semilla <<= 1;
1486  00a4 080b          	sll	(OFST+0,sp)
1487  00a6 090a          	rlc	(OFST-1,sp)
1488  00a8 0909          	rlc	(OFST-2,sp)
1489  00aa 0908          	rlc	(OFST-3,sp)
1491                     ; 212 			contadorBucle++;
1493  00ac 0c05          	inc	(OFST-6,sp)
1495                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1498  00ae 4b00          	push	#0
1499  00b0 1e07          	ldw	x,(OFST-4,sp)
1500  00b2 1c0004        	addw	x,#4
1501  00b5 cd0000        	call	_NHALgpio_Write
1503  00b8 ae000f        	ldw	x,#15
1504  00bb 9d            	nop	
1505  00bc 84            	pop	a
1506                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1511  00bd               L65:
1512  00bd 5a            	decw	X
1513  00be 26fd          	jrne	L65
1514                     
1516  00c0               L5021:
1517  00c0 9d            	nop	
1518                     ; 203 		while( contadorBucle < HX711_LONGITUDTRAMA ) 
1520  00c1 7b05          	ld	a,(OFST-6,sp)
1521  00c3 a118          	cp	a,#24
1522  00c5 25b6          	jrult	L3021
1523                     ; 132 	switch( hx711->Config.Ganancia )
1526  00c7 1e06          	ldw	x,(OFST-5,sp)
1527  00c9 e608          	ld	a,(8,x)
1529                     ; 157 		default:
1529                     ; 158 		
1529                     ; 159 		;
1530  00cb 270b          	jreq	L357
1531  00cd 4a            	dec	a
1532  00ce 2740          	jreq	L177
1533  00d0 4a            	dec	a
1534  00d1 2603cc0184    	jreq	L7301
1535  00d6 2028          	jra	L3701
1536  00d8               L357:
1537                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1540  00d8 4b01          	push	#1
1541  00da 1e07          	ldw	x,(OFST-4,sp)
1542  00dc 1c0004        	addw	x,#4
1543  00df cd0000        	call	_NHALgpio_Write
1545  00e2 ae000f        	ldw	x,#15
1546  00e5 9d            	nop	
1547  00e6 84            	pop	a
1548                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1553  00e7               L26:
1554  00e7 5a            	decw	X
1555  00e8 26fd          	jrne	L26
1556  00ea 9d            	nop	
1557                     
1559                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1562  00eb 4b00          	push	#0
1563  00ed 1e07          	ldw	x,(OFST-4,sp)
1564  00ef 1c0004        	addw	x,#4
1565  00f2 cd0000        	call	_NHALgpio_Write
1567  00f5 ae000f        	ldw	x,#15
1568  00f8 9d            	nop	
1569  00f9 84            	pop	a
1570                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1575  00fa               L66:
1576  00fa 5a            	decw	X
1577  00fb 26fd          	jrne	L66
1578  00fd               LC001:
1579  00fd 9d            	nop	
1580                     
1582  00fe 1e06          	ldw	x,(OFST-5,sp)
1583  0100               L3701:
1584                     ; 220 		if( hx711->Datos.Estado != TIMEOUT )
1586  0100 e615          	ld	a,(21,x)
1587  0102 a104          	cp	a,#4
1588  0104 2603cc01d2    	jreq	L5511
1589                     ; 222 			hx711->Datos.Estado = NUEVA_LECTURA;
1591  0109 a603          	ld	a,#3
1592  010b e715          	ld	(21,x),a
1593  010d cc01d2        	jra	L5511
1594  0110               L177:
1595                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1598  0110 4b01          	push	#1
1599  0112 1e07          	ldw	x,(OFST-4,sp)
1600  0114 1c0004        	addw	x,#4
1601  0117 cd0000        	call	_NHALgpio_Write
1603  011a ae000f        	ldw	x,#15
1604  011d 9d            	nop	
1605  011e 84            	pop	a
1606                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1611  011f               L27:
1612  011f 5a            	decw	X
1613  0120 26fd          	jrne	L27
1614  0122 9d            	nop	
1615                     
1617                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1620  0123 4b00          	push	#0
1621  0125 1e07          	ldw	x,(OFST-4,sp)
1622  0127 1c0004        	addw	x,#4
1623  012a cd0000        	call	_NHALgpio_Write
1625  012d ae000f        	ldw	x,#15
1626  0130 9d            	nop	
1627  0131 84            	pop	a
1628                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1633  0132               L67:
1634  0132 5a            	decw	X
1635  0133 26fd          	jrne	L67
1636  0135 9d            	nop	
1637                     
1639                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1642  0136 4b01          	push	#1
1643  0138 1e07          	ldw	x,(OFST-4,sp)
1644  013a 1c0004        	addw	x,#4
1645  013d cd0000        	call	_NHALgpio_Write
1647  0140 ae000f        	ldw	x,#15
1648  0143 9d            	nop	
1649  0144 84            	pop	a
1650                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1655  0145               L201:
1656  0145 5a            	decw	X
1657  0146 26fd          	jrne	L201
1658  0148 9d            	nop	
1659                     
1661                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1664  0149 4b00          	push	#0
1665  014b 1e07          	ldw	x,(OFST-4,sp)
1666  014d 1c0004        	addw	x,#4
1667  0150 cd0000        	call	_NHALgpio_Write
1669  0153 ae000f        	ldw	x,#15
1670  0156 9d            	nop	
1671  0157 84            	pop	a
1672                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1677  0158               L601:
1678  0158 5a            	decw	X
1679  0159 26fd          	jrne	L601
1680  015b 9d            	nop	
1681                     
1683                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1686  015c 4b01          	push	#1
1687  015e 1e07          	ldw	x,(OFST-4,sp)
1688  0160 1c0004        	addw	x,#4
1689  0163 cd0000        	call	_NHALgpio_Write
1691  0166 ae000f        	ldw	x,#15
1692  0169 9d            	nop	
1693  016a 84            	pop	a
1694                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1699  016b               L211:
1700  016b 5a            	decw	X
1701  016c 26fd          	jrne	L211
1702  016e 9d            	nop	
1703                     
1705                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1708  016f 4b00          	push	#0
1709  0171 1e07          	ldw	x,(OFST-4,sp)
1710  0173 1c0004        	addw	x,#4
1711  0176 cd0000        	call	_NHALgpio_Write
1713  0179 ae000f        	ldw	x,#15
1714  017c 9d            	nop	
1715  017d 84            	pop	a
1716                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1721  017e               L611:
1722  017e 5a            	decw	X
1723  017f 26fd          	jrne	L611
1724                     
1726  0181 cc00fd        	jp	LC001
1727  0184               L7301:
1728                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1731  0184 4b01          	push	#1
1732  0186 1e07          	ldw	x,(OFST-4,sp)
1733  0188 1c0004        	addw	x,#4
1734  018b cd0000        	call	_NHALgpio_Write
1736  018e ae000f        	ldw	x,#15
1737  0191 9d            	nop	
1738  0192 84            	pop	a
1739                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1744  0193               L221:
1745  0193 5a            	decw	X
1746  0194 26fd          	jrne	L221
1747  0196 9d            	nop	
1748                     
1750                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1753  0197 4b00          	push	#0
1754  0199 1e07          	ldw	x,(OFST-4,sp)
1755  019b 1c0004        	addw	x,#4
1756  019e cd0000        	call	_NHALgpio_Write
1758  01a1 ae000f        	ldw	x,#15
1759  01a4 9d            	nop	
1760  01a5 84            	pop	a
1761                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1766  01a6               L621:
1767  01a6 5a            	decw	X
1768  01a7 26fd          	jrne	L621
1769  01a9 9d            	nop	
1770                     
1772                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1775  01aa 4b01          	push	#1
1776  01ac 1e07          	ldw	x,(OFST-4,sp)
1777  01ae 1c0004        	addw	x,#4
1778  01b1 cd0000        	call	_NHALgpio_Write
1780  01b4 ae000f        	ldw	x,#15
1781  01b7 9d            	nop	
1782  01b8 84            	pop	a
1783                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1788  01b9               L231:
1789  01b9 5a            	decw	X
1790  01ba 26fd          	jrne	L231
1791  01bc 9d            	nop	
1792                     
1794                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1797  01bd 4b00          	push	#0
1798  01bf 1e07          	ldw	x,(OFST-4,sp)
1799  01c1 1c0004        	addw	x,#4
1800  01c4 cd0000        	call	_NHALgpio_Write
1802  01c7 ae000f        	ldw	x,#15
1803  01ca 9d            	nop	
1804  01cb 84            	pop	a
1805                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1810  01cc               L631:
1811  01cc 5a            	decw	X
1812  01cd 26fd          	jrne	L631
1813                     
1815  01cf cc00fd        	jp	LC001
1816  01d2               L5511:
1817                     ; 225 		return semilla;
1822                     ; 319 	aDormir( hx711 );
1825  01d2 1e0c          	ldw	x,(OFST+1,sp)
1826  01d4 1f06          	ldw	(OFST-5,sp),x
1828                     ; 112 	NHALgpio_Write( &hx711->Config.PD_SCK, true );
1830  01d6 4b01          	push	#1
1831  01d8 1e07          	ldw	x,(OFST-4,sp)
1832  01da 1c0004        	addw	x,#4
1833  01dd cd0000        	call	_NHALgpio_Write
1835  01e0 ae0174        	ldw	x,#372
1836  01e3 9d            	nop	
1837  01e4 84            	pop	a
1838                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1843  01e5               L441:
1844  01e5 5a            	decw	X
1845  01e6 26fd          	jrne	L441
1846  01e8 9d            	nop	
1847                     
1849                     ; 115 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1851  01e9 1e06          	ldw	x,(OFST-5,sp)
1852  01eb e615          	ld	a,(21,x)
1853  01ed 4a            	dec	a
1854  01ee 2704          	jreq	L3011
1855                     ; 117 		hx711->Datos.Estado = SLEEP;
1857  01f0 a602          	ld	a,#2
1858  01f2 e715          	ld	(21,x),a
1860  01f4               L3011:
1861                     ; 321 	if( ( semilla > hx711->Config.ValorZero ) )
1863  01f4 1e0c          	ldw	x,(OFST+1,sp)
1864  01f6 1c000b        	addw	x,#11
1865  01f9 cd0000        	call	c_ltor
1867  01fc 96            	ldw	x,sp
1868  01fd 1c0008        	addw	x,#OFST-3
1869  0200 cd0000        	call	c_lcmp
1871  0203 2424          	jruge	L3221
1872                     ; 323 		return ( ( semilla - hx711->Config.ValorZero ) / hx711->Config.ValorConversion );
1874  0205 1e0c          	ldw	x,(OFST+1,sp)
1875  0207 ee09          	ldw	x,(9,x)
1876  0209 cd0000        	call	c_uitolx
1878  020c 96            	ldw	x,sp
1879  020d 5c            	incw	x
1880  020e cd0000        	call	c_rtol
1883  0211 96            	ldw	x,sp
1884  0212 1c0008        	addw	x,#OFST-3
1885  0215 cd0000        	call	c_ltor
1887  0218 1e0c          	ldw	x,(OFST+1,sp)
1888  021a 1c000b        	addw	x,#11
1889  021d cd0000        	call	c_lsub
1891  0220 96            	ldw	x,sp
1892  0221 5c            	incw	x
1893  0222 cd0000        	call	c_ludv
1895  0225 be02          	ldw	x,c_lreg+2
1897  0227 2001          	jra	L641
1898  0229               L3221:
1899                     ; 327 		return 0;
1901  0229 5f            	clrw	x
1903  022a               L641:
1905  022a 5b0d          	addw	sp,#13
1906  022c 81            	ret	
2019                     ; 364 uint16_t hx711_Tarar( HX711_t_ptr hx711 )
2019                     ; 365 {
2020                     .text:	section	.text,new
2021  0000               _hx711_Tarar:
2023  0000 89            	pushw	x
2024  0001 5210          	subw	sp,#16
2025       00000010      OFST:	set	16
2028                     ; 366 	uint32_t valorMedio = 0;
2030  0003 5f            	clrw	x
2031  0004 1f0e          	ldw	(OFST-2,sp),x
2032  0006 1f0c          	ldw	(OFST-4,sp),x
2034                     ; 367 	uint8_t repeticiones = 4;
2036  0008 a604          	ld	a,#4
2037  000a 6b10          	ld	(OFST+0,sp),a
2039  000c               L1541:
2040                     ; 371 		valorMedio = valorMedio + leer( hx711 );
2043  000c 1e11          	ldw	x,(OFST+1,sp)
2044  000e 1f06          	ldw	(OFST-10,sp),x
2046                     ; 191 	uint32_t semilla = 0;
2048  0010 5f            	clrw	x
2049  0011 1f04          	ldw	(OFST-12,sp),x
2050  0013 1f02          	ldw	(OFST-14,sp),x
2052                     ; 192 	uint8_t contadorBucle = 0;
2054  0015 0f01          	clr	(OFST-15,sp)
2056                     ; 194 	if( hx711->Datos.Estado != SINVALORCONVERSION )
2058  0017 1e06          	ldw	x,(OFST-10,sp)
2059  0019 e615          	ld	a,(21,x)
2060  001b 4a            	dec	a
2061  001c 2603cc01dd    	jreq	L7541
2062                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2065  0021 4b00          	push	#0
2066  0023 1e07          	ldw	x,(OFST-9,sp)
2067  0025 1c0004        	addw	x,#4
2068  0028 cd0000        	call	_NHALgpio_Write
2070  002b ae000f        	ldw	x,#15
2071  002e 9d            	nop	
2072  002f 84            	pop	a
2073                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2078  0030               L451:
2079  0030 5a            	decw	X
2080  0031 26fd          	jrne	L451
2081  0033 9d            	nop	
2082                     
2084                     ; 165 	if( hx711->Timeout != NULL )
2087  0034 1e06          	ldw	x,(OFST-10,sp)
2088  0036 e617          	ld	a,(23,x)
2089  0038 ea16          	or	a,(22,x)
2090  003a 273b          	jreq	L1051
2091                     ; 167 		Timeout_Start( hx711->Timeout, TIMEOUT_1MS );
2093  003c ae03e8        	ldw	x,#1000
2094  003f 89            	pushw	x
2095  0040 1e08          	ldw	x,(OFST-8,sp)
2096  0042 ee16          	ldw	x,(22,x)
2097  0044 cd0000        	call	_Timeout_Start
2099  0047 85            	popw	x
2101  0048               L5641:
2102                     ; 168 		while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) && ( hx711->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) )
2104  0048 1e06          	ldw	x,(OFST-10,sp)
2105  004a cd0000        	call	_NHALgpio_Read
2107  004d 4d            	tnz	a
2108  004e 270c          	jreq	L1741
2110  0050 1e06          	ldw	x,(OFST-10,sp)
2111  0052 ee16          	ldw	x,(22,x)
2112  0054 ee02          	ldw	x,(2,x)
2113  0056 fd            	call	(x)
2115  0057 a301f4        	cpw	x,#500
2116  005a 25ec          	jrult	L5641
2117  005c               L1741:
2118                     ; 173 		if( hx711->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
2120  005c 1e06          	ldw	x,(OFST-10,sp)
2121  005e ee16          	ldw	x,(22,x)
2122  0060 ee02          	ldw	x,(2,x)
2123  0062 fd            	call	(x)
2125  0063 a301f4        	cpw	x,#500
2126  0066 2506          	jrult	L3741
2127                     ; 175 			hx711->Datos.Estado = TIMEOUT;
2129  0068 1e06          	ldw	x,(OFST-10,sp)
2130  006a a604          	ld	a,#4
2131  006c e715          	ld	(21,x),a
2132  006e               L3741:
2133                     ; 177 		Timeout_Stop( hx711->Timeout );
2135  006e 1e06          	ldw	x,(OFST-10,sp)
2136  0070 ee16          	ldw	x,(22,x)
2137  0072 cd0000        	call	_Timeout_Stop
2140  0075 2008          	jra	L5741
2141  0077               L1051:
2142                     ; 181 		while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) )
2144  0077 1e06          	ldw	x,(OFST-10,sp)
2145  0079 cd0000        	call	_NHALgpio_Read
2147  007c 4d            	tnz	a
2148  007d 26f8          	jrne	L1051
2149  007f               L5741:
2150                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2154  007f ae000f        	ldw	x,#15
2156  0082 9d            	nop	
2157  0083               L271:
2158  0083 5a            	decw	X
2159  0084 26fd          	jrne	L271
2160                     
2162  0086 2043          	jra	L7051
2163  0088               L5051:
2164                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2167  0088 4b01          	push	#1
2168  008a 1e07          	ldw	x,(OFST-9,sp)
2169  008c 1c0004        	addw	x,#4
2170  008f cd0000        	call	_NHALgpio_Write
2172  0092 ae000f        	ldw	x,#15
2173  0095 9d            	nop	
2174  0096 84            	pop	a
2175                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2180  0097               L671:
2181  0097 5a            	decw	X
2182  0098 26fd          	jrne	L671
2183  009a 9d            	nop	
2184                     
2186                     ; 209 			semilla |= NHALgpio_Read( &hx711->Config.DOUT );
2188  009b 1e06          	ldw	x,(OFST-10,sp)
2189  009d cd0000        	call	_NHALgpio_Read
2191  00a0 b703          	ld	c_lreg+3,a
2192  00a2 3f02          	clr	c_lreg+2
2193  00a4 3f01          	clr	c_lreg+1
2194  00a6 3f00          	clr	c_lreg
2195  00a8 96            	ldw	x,sp
2196  00a9 1c0002        	addw	x,#OFST-14
2197  00ac cd0000        	call	c_lgor
2200                     ; 210 			semilla <<= 1;
2202  00af 0805          	sll	(OFST-11,sp)
2203  00b1 0904          	rlc	(OFST-12,sp)
2204  00b3 0903          	rlc	(OFST-13,sp)
2205  00b5 0902          	rlc	(OFST-14,sp)
2207                     ; 212 			contadorBucle++;
2209  00b7 0c01          	inc	(OFST-15,sp)
2211                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2214  00b9 4b00          	push	#0
2215  00bb 1e07          	ldw	x,(OFST-9,sp)
2216  00bd 1c0004        	addw	x,#4
2217  00c0 cd0000        	call	_NHALgpio_Write
2219  00c3 ae000f        	ldw	x,#15
2220  00c6 9d            	nop	
2221  00c7 84            	pop	a
2222                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2227  00c8               L402:
2228  00c8 5a            	decw	X
2229  00c9 26fd          	jrne	L402
2230                     
2232  00cb               L7051:
2233  00cb 9d            	nop	
2234                     ; 203 		while( contadorBucle < HX711_LONGITUDTRAMA ) 
2236  00cc 7b01          	ld	a,(OFST-15,sp)
2237  00ce a118          	cp	a,#24
2238  00d0 25b6          	jrult	L5051
2239                     ; 132 	switch( hx711->Config.Ganancia )
2242  00d2 1e06          	ldw	x,(OFST-10,sp)
2243  00d4 e608          	ld	a,(8,x)
2245                     ; 157 		default:
2245                     ; 158 		
2245                     ; 159 		;
2246  00d6 270b          	jreq	L7521
2247  00d8 4a            	dec	a
2248  00d9 2740          	jreq	L5721
2249  00db 4a            	dec	a
2250  00dc 2603cc018f    	jreq	L3431
2251  00e1 2028          	jra	L7731
2252  00e3               L7521:
2253                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2256  00e3 4b01          	push	#1
2257  00e5 1e07          	ldw	x,(OFST-9,sp)
2258  00e7 1c0004        	addw	x,#4
2259  00ea cd0000        	call	_NHALgpio_Write
2261  00ed ae000f        	ldw	x,#15
2262  00f0 9d            	nop	
2263  00f1 84            	pop	a
2264                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2269  00f2               L012:
2270  00f2 5a            	decw	X
2271  00f3 26fd          	jrne	L012
2272  00f5 9d            	nop	
2273                     
2275                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2278  00f6 4b00          	push	#0
2279  00f8 1e07          	ldw	x,(OFST-9,sp)
2280  00fa 1c0004        	addw	x,#4
2281  00fd cd0000        	call	_NHALgpio_Write
2283  0100 ae000f        	ldw	x,#15
2284  0103 9d            	nop	
2285  0104 84            	pop	a
2286                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2291  0105               L412:
2292  0105 5a            	decw	X
2293  0106 26fd          	jrne	L412
2294  0108               LC002:
2295  0108 9d            	nop	
2296                     
2298  0109 1e06          	ldw	x,(OFST-10,sp)
2299  010b               L7731:
2300                     ; 220 		if( hx711->Datos.Estado != TIMEOUT )
2302  010b e615          	ld	a,(21,x)
2303  010d a104          	cp	a,#4
2304  010f 2603cc01dd    	jreq	L7541
2305                     ; 222 			hx711->Datos.Estado = NUEVA_LECTURA;
2307  0114 a603          	ld	a,#3
2308  0116 e715          	ld	(21,x),a
2309  0118 cc01dd        	jra	L7541
2310  011b               L5721:
2311                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2314  011b 4b01          	push	#1
2315  011d 1e07          	ldw	x,(OFST-9,sp)
2316  011f 1c0004        	addw	x,#4
2317  0122 cd0000        	call	_NHALgpio_Write
2319  0125 ae000f        	ldw	x,#15
2320  0128 9d            	nop	
2321  0129 84            	pop	a
2322                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2327  012a               L022:
2328  012a 5a            	decw	X
2329  012b 26fd          	jrne	L022
2330  012d 9d            	nop	
2331                     
2333                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2336  012e 4b00          	push	#0
2337  0130 1e07          	ldw	x,(OFST-9,sp)
2338  0132 1c0004        	addw	x,#4
2339  0135 cd0000        	call	_NHALgpio_Write
2341  0138 ae000f        	ldw	x,#15
2342  013b 9d            	nop	
2343  013c 84            	pop	a
2344                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2349  013d               L422:
2350  013d 5a            	decw	X
2351  013e 26fd          	jrne	L422
2352  0140 9d            	nop	
2353                     
2355                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2358  0141 4b01          	push	#1
2359  0143 1e07          	ldw	x,(OFST-9,sp)
2360  0145 1c0004        	addw	x,#4
2361  0148 cd0000        	call	_NHALgpio_Write
2363  014b ae000f        	ldw	x,#15
2364  014e 9d            	nop	
2365  014f 84            	pop	a
2366                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2371  0150               L032:
2372  0150 5a            	decw	X
2373  0151 26fd          	jrne	L032
2374  0153 9d            	nop	
2375                     
2377                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2380  0154 4b00          	push	#0
2381  0156 1e07          	ldw	x,(OFST-9,sp)
2382  0158 1c0004        	addw	x,#4
2383  015b cd0000        	call	_NHALgpio_Write
2385  015e ae000f        	ldw	x,#15
2386  0161 9d            	nop	
2387  0162 84            	pop	a
2388                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2393  0163               L432:
2394  0163 5a            	decw	X
2395  0164 26fd          	jrne	L432
2396  0166 9d            	nop	
2397                     
2399                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2402  0167 4b01          	push	#1
2403  0169 1e07          	ldw	x,(OFST-9,sp)
2404  016b 1c0004        	addw	x,#4
2405  016e cd0000        	call	_NHALgpio_Write
2407  0171 ae000f        	ldw	x,#15
2408  0174 9d            	nop	
2409  0175 84            	pop	a
2410                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2415  0176               L042:
2416  0176 5a            	decw	X
2417  0177 26fd          	jrne	L042
2418  0179 9d            	nop	
2419                     
2421                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2424  017a 4b00          	push	#0
2425  017c 1e07          	ldw	x,(OFST-9,sp)
2426  017e 1c0004        	addw	x,#4
2427  0181 cd0000        	call	_NHALgpio_Write
2429  0184 ae000f        	ldw	x,#15
2430  0187 9d            	nop	
2431  0188 84            	pop	a
2432                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2437  0189               L442:
2438  0189 5a            	decw	X
2439  018a 26fd          	jrne	L442
2440                     
2442  018c cc0108        	jp	LC002
2443  018f               L3431:
2444                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2447  018f 4b01          	push	#1
2448  0191 1e07          	ldw	x,(OFST-9,sp)
2449  0193 1c0004        	addw	x,#4
2450  0196 cd0000        	call	_NHALgpio_Write
2452  0199 ae000f        	ldw	x,#15
2453  019c 9d            	nop	
2454  019d 84            	pop	a
2455                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2460  019e               L052:
2461  019e 5a            	decw	X
2462  019f 26fd          	jrne	L052
2463  01a1 9d            	nop	
2464                     
2466                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2469  01a2 4b00          	push	#0
2470  01a4 1e07          	ldw	x,(OFST-9,sp)
2471  01a6 1c0004        	addw	x,#4
2472  01a9 cd0000        	call	_NHALgpio_Write
2474  01ac ae000f        	ldw	x,#15
2475  01af 9d            	nop	
2476  01b0 84            	pop	a
2477                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2482  01b1               L452:
2483  01b1 5a            	decw	X
2484  01b2 26fd          	jrne	L452
2485  01b4 9d            	nop	
2486                     
2488                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2491  01b5 4b01          	push	#1
2492  01b7 1e07          	ldw	x,(OFST-9,sp)
2493  01b9 1c0004        	addw	x,#4
2494  01bc cd0000        	call	_NHALgpio_Write
2496  01bf ae000f        	ldw	x,#15
2497  01c2 9d            	nop	
2498  01c3 84            	pop	a
2499                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2504  01c4               L062:
2505  01c4 5a            	decw	X
2506  01c5 26fd          	jrne	L062
2507  01c7 9d            	nop	
2508                     
2510                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2513  01c8 4b00          	push	#0
2514  01ca 1e07          	ldw	x,(OFST-9,sp)
2515  01cc 1c0004        	addw	x,#4
2516  01cf cd0000        	call	_NHALgpio_Write
2518  01d2 ae000f        	ldw	x,#15
2519  01d5 9d            	nop	
2520  01d6 84            	pop	a
2521                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2526  01d7               L462:
2527  01d7 5a            	decw	X
2528  01d8 26fd          	jrne	L462
2529                     
2531  01da cc0108        	jp	LC002
2532  01dd               L7541:
2533                     ; 225 		return semilla;
2535  01dd 1e04          	ldw	x,(OFST-12,sp)
2536  01df 1f0a          	ldw	(OFST-6,sp),x
2537  01e1 1e02          	ldw	x,(OFST-14,sp)
2538  01e3 1f08          	ldw	(OFST-8,sp),x
2542  01e5 96            	ldw	x,sp
2543  01e6 1c0008        	addw	x,#OFST-8
2544  01e9 cd0000        	call	c_ltor
2546  01ec 96            	ldw	x,sp
2547  01ed 1c000c        	addw	x,#OFST-4
2548  01f0 cd0000        	call	c_lgadd
2551                     ; 372 		--repeticiones;
2553  01f3 0a10          	dec	(OFST+0,sp)
2555                     ; 369 	while( ( repeticiones > 0 ) )
2557  01f5 2703cc000c    	jrne	L1541
2558                     ; 374 	repeticiones = 4;
2560                     ; 376 	return valorMedio/repeticiones;
2562  01fa 96            	ldw	x,sp
2563  01fb 1c000c        	addw	x,#OFST-4
2564  01fe cd0000        	call	c_ltor
2566  0201 a602          	ld	a,#2
2567  0203 cd0000        	call	c_lursh
2569  0206 be02          	ldw	x,c_lreg+2
2572  0208 5b12          	addw	sp,#18
2573  020a 81            	ret	
2586                     	xdef	_hx711_Tarar
2587                     	xdef	_hx711_Lectura
2588                     	xdef	_HX711_Init
2589                     	xref	_Timeout_Stop
2590                     	xref	_Timeout_Start
2591                     	xref	_NHALgpio_Write
2592                     	xref	_NHALgpio_Read
2593                     	xref	_NHALgpio_Init
2594                     	xref	_NHALgpioConfig_SetType
2595                     	xref.b	c_lreg
2596                     	xref.b	c_x
2615                     	xref	c_lursh
2616                     	xref	c_lgadd
2617                     	xref	c_ludv
2618                     	xref	c_rtol
2619                     	xref	c_uitolx
2620                     	xref	c_lsub
2621                     	xref	c_lcmp
2622                     	xref	c_ltor
2623                     	xref	c_lgor
2624                     	end

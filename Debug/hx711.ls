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
  73  0000               L15_HX711_LONGITUDTRAMA:
  74  0000 18            	dc.b	24
  75  0001               L35_HX711_TIEMPOCLOCK:
  76  0001 03            	dc.b	3
  77  0002               L55_HX711_TIEMPOCLOCKSLEEP:
  78  0002 46            	dc.b	70
1037                     ; 265 void HX711_Init( HX711_t_ptr hx711, HX711_fPtr Lectura, HX711_fPtr Tarar, Timeout_t_ptr Timeout )
1037                     ; 266 {
1039                     .text:	section	.text,new
1040  0000               _HX711_Init:
1042  0000 89            	pushw	x
1043  0001 5204          	subw	sp,#4
1044       00000004      OFST:	set	4
1047                     ; 267 	initPtrFunciones( hx711, Lectura, Tarar );
1051                     ; 73 	hx711->Lectura = Lectura;
1053  0003 1609          	ldw	y,(OFST+5,sp)
1054  0005 ef18          	ldw	(24,x),y
1055                     ; 74 	hx711->Tarar = Tarar;
1057  0007 160b          	ldw	y,(OFST+7,sp)
1058  0009 ef1a          	ldw	(26,x),y
1059                     ; 269 	hx711->Timeout = Timeout;
1061  000b 160d          	ldw	y,(OFST+9,sp)
1062  000d ef16          	ldw	(22,x),y
1063                     ; 271 	initVariables( &hx711->Config, &hx711->Datos );
1066  000f 1f03          	ldw	(OFST-1,sp),x
1070  0011 1c0011        	addw	x,#17
1071  0014 1f01          	ldw	(OFST-3,sp),x
1073                     ; 79 	hx711Datos->UltimaLectura = 0;
1075  0016 4f            	clr	a
1076  0017 e703          	ld	(3,x),a
1077  0019 e702          	ld	(2,x),a
1078  001b e701          	ld	(1,x),a
1079  001d f7            	ld	(x),a
1080                     ; 80 	hx711Config->ValorTara = 0;
1082  001e 1e03          	ldw	x,(OFST-1,sp)
1083  0020 905f          	clrw	y
1084  0022 ef0f          	ldw	(15,x),y
1085                     ; 81 	hx711Config->ValorConversion = 1;
1087  0024 905c          	incw	y
1088  0026 ef09          	ldw	(9,x),y
1089                     ; 82 	hx711Config->Ganancia = CHANNELA_128;
1091  0028 6f08          	clr	(8,x)
1092                     ; 273 	initDOUT( &hx711->Config.DOUT );
1095  002a 1e05          	ldw	x,(OFST+1,sp)
1096  002c 1f03          	ldw	(OFST-1,sp),x
1098                     ; 87 	NHALgpioConfig_SetType( dout,GPIO_MODE_IN_PU_NO_IT );
1100  002e 4b40          	push	#64
1101  0030 1e04          	ldw	x,(OFST+0,sp)
1102  0032 cd0000        	call	_NHALgpioConfig_SetType
1104  0035 84            	pop	a
1105                     ; 88 	NHALgpio_Init( dout );
1107  0036 1e03          	ldw	x,(OFST-1,sp)
1108  0038 cd0000        	call	_NHALgpio_Init
1110                     ; 274 	initPDSCK( &hx711->Config.PD_SCK );
1113  003b 1e05          	ldw	x,(OFST+1,sp)
1114  003d 1c0004        	addw	x,#4
1115  0040 1f03          	ldw	(OFST-1,sp),x
1117                     ; 93 	NHALgpioConfig_SetType( pdsck, GPIO_MODE_OUT_PP_LOW_FAST );
1119  0042 4be0          	push	#224
1120  0044 1e04          	ldw	x,(OFST+0,sp)
1121  0046 cd0000        	call	_NHALgpioConfig_SetType
1123  0049 84            	pop	a
1124                     ; 94 	NHALgpio_Init( pdsck );
1126  004a 1e03          	ldw	x,(OFST-1,sp)
1127  004c cd0000        	call	_NHALgpio_Init
1129                     ; 276 	chequearValorConversion( &hx711->Config, &hx711->Datos );
1132  004f 1e05          	ldw	x,(OFST+1,sp)
1133  0051 1f01          	ldw	(OFST-3,sp),x
1137  0053 1c0011        	addw	x,#17
1138  0056 1f03          	ldw	(OFST-1,sp),x
1140                     ; 99 	if( ( hx711Config->ValorConversion ) == 0 )
1142  0058 1e01          	ldw	x,(OFST-3,sp)
1143  005a e60a          	ld	a,(10,x)
1144  005c ea09          	or	a,(9,x)
1145  005e 260d          	jrne	L727
1146                     ; 101 		hx711Config->ValorConversion = 1;
1148  0060 90ae0001      	ldw	y,#1
1149  0064 ef09          	ldw	(9,x),y
1150                     ; 102 		hx711Datos->Estado = SINVALORCONVERSION;
1152  0066 1e03          	ldw	x,(OFST-1,sp)
1153  0068 4c            	inc	a
1154  0069 e704          	ld	(4,x),a
1156  006b 2004          	jra	L741
1157  006d               L727:
1158                     ; 106 		hx711Datos->Estado = INICIALIZADO;
1160  006d 1e03          	ldw	x,(OFST-1,sp)
1161  006f 6f04          	clr	(4,x)
1162  0071               L741:
1163                     ; 278 	aDormir( hx711 );
1166  0071 1e05          	ldw	x,(OFST+1,sp)
1167  0073 1f03          	ldw	(OFST-1,sp),x
1169                     ; 112 	NHALgpio_Write( &hx711->Config.PD_SCK, true );
1171  0075 4b01          	push	#1
1172  0077 1e04          	ldw	x,(OFST+0,sp)
1173  0079 1c0004        	addw	x,#4
1174  007c cd0000        	call	_NHALgpio_Write
1176  007f ae0174        	ldw	x,#372
1177  0082 9d            	nop	
1178  0083 84            	pop	a
1179                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1184  0084               L02:
1185  0084 5a            	decw	X
1186  0085 26fd          	jrne	L02
1187  0087 9d            	nop	
1188                     
1190                     ; 115 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1192  0088 1e03          	ldw	x,(OFST-1,sp)
1193  008a e615          	ld	a,(21,x)
1194  008c 4a            	dec	a
1195  008d 2704          	jreq	L551
1196                     ; 117 		hx711->Datos.Estado = SLEEP;
1198  008f a602          	ld	a,#2
1199  0091 e715          	ld	(21,x),a
1201  0093               L551:
1202                     ; 279 }
1205  0093 5b06          	addw	sp,#6
1206  0095 81            	ret	
1325                     ; 314 uint16_t hx711_Lectura( HX711_t_ptr hx711 )
1325                     ; 315 {
1326                     .text:	section	.text,new
1327  0000               _hx711_Lectura:
1329  0000 89            	pushw	x
1330  0001 520b          	subw	sp,#11
1331       0000000b      OFST:	set	11
1334                     ; 316 	uint32_t semilla = 0;
1336                     ; 318 	semilla = leer( hx711 );
1339  0003 1f06          	ldw	(OFST-5,sp),x
1341                     ; 191 	uint32_t semilla = 0;
1343  0005 5f            	clrw	x
1344  0006 1f0a          	ldw	(OFST-1,sp),x
1345  0008 1f08          	ldw	(OFST-3,sp),x
1347                     ; 192 	uint8_t contadorBucle = 0;
1349  000a 0f05          	clr	(OFST-6,sp)
1351                     ; 194 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1353  000c 1e06          	ldw	x,(OFST-5,sp)
1354  000e e615          	ld	a,(21,x)
1355  0010 4a            	dec	a
1356  0011 2603cc01d2    	jreq	L1711
1357                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1360  0016 4b00          	push	#0
1361  0018 1e07          	ldw	x,(OFST-4,sp)
1362  001a 1c0004        	addw	x,#4
1363  001d cd0000        	call	_NHALgpio_Write
1365  0020 ae000f        	ldw	x,#15
1366  0023 9d            	nop	
1367  0024 84            	pop	a
1368                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1373  0025               L62:
1374  0025 5a            	decw	X
1375  0026 26fd          	jrne	L62
1376  0028 9d            	nop	
1377                     
1379                     ; 165 	if( hx711->Timeout != NULL )
1382  0029 1e06          	ldw	x,(OFST-5,sp)
1383  002b e617          	ld	a,(23,x)
1384  002d ea16          	or	a,(22,x)
1385  002f 273b          	jreq	L3121
1386                     ; 167 		Timeout_Start( hx711->Timeout, TIMEOUT_1MS );
1388  0031 ae03e8        	ldw	x,#1000
1389  0034 89            	pushw	x
1390  0035 1e08          	ldw	x,(OFST-3,sp)
1391  0037 ee16          	ldw	x,(22,x)
1392  0039 cd0000        	call	_Timeout_Start
1394  003c 85            	popw	x
1396  003d               L7711:
1397                     ; 168 		while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) && ( hx711->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) )
1399  003d 1e06          	ldw	x,(OFST-5,sp)
1400  003f cd0000        	call	_NHALgpio_Read
1402  0042 4d            	tnz	a
1403  0043 270c          	jreq	L3021
1405  0045 1e06          	ldw	x,(OFST-5,sp)
1406  0047 ee16          	ldw	x,(22,x)
1407  0049 ee02          	ldw	x,(2,x)
1408  004b fd            	call	(x)
1410  004c a301f4        	cpw	x,#500
1411  004f 25ec          	jrult	L7711
1412  0051               L3021:
1413                     ; 173 		if( hx711->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
1415  0051 1e06          	ldw	x,(OFST-5,sp)
1416  0053 ee16          	ldw	x,(22,x)
1417  0055 ee02          	ldw	x,(2,x)
1418  0057 fd            	call	(x)
1420  0058 a301f4        	cpw	x,#500
1421  005b 2506          	jrult	L5021
1422                     ; 175 			hx711->Datos.Estado = TIMEOUT;
1424  005d 1e06          	ldw	x,(OFST-5,sp)
1425  005f a604          	ld	a,#4
1426  0061 e715          	ld	(21,x),a
1427  0063               L5021:
1428                     ; 177 		Timeout_Stop( hx711->Timeout );
1430  0063 1e06          	ldw	x,(OFST-5,sp)
1431  0065 ee16          	ldw	x,(22,x)
1432  0067 cd0000        	call	_Timeout_Stop
1435  006a 2008          	jra	L7021
1436  006c               L3121:
1437                     ; 181 		while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) )
1439  006c 1e06          	ldw	x,(OFST-5,sp)
1440  006e cd0000        	call	_NHALgpio_Read
1442  0071 4d            	tnz	a
1443  0072 26f8          	jrne	L3121
1444  0074               L7021:
1445                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1449  0074 ae000f        	ldw	x,#15
1451  0077 9d            	nop	
1452  0078               L44:
1453  0078 5a            	decw	X
1454  0079 26fd          	jrne	L44
1455                     
1457  007b 2043          	jra	L1221
1458  007d               L7121:
1459                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1462  007d 4b01          	push	#1
1463  007f 1e07          	ldw	x,(OFST-4,sp)
1464  0081 1c0004        	addw	x,#4
1465  0084 cd0000        	call	_NHALgpio_Write
1467  0087 ae000f        	ldw	x,#15
1468  008a 9d            	nop	
1469  008b 84            	pop	a
1470                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1475  008c               L05:
1476  008c 5a            	decw	X
1477  008d 26fd          	jrne	L05
1478  008f 9d            	nop	
1479                     
1481                     ; 209 			semilla |= NHALgpio_Read( &hx711->Config.DOUT );
1483  0090 1e06          	ldw	x,(OFST-5,sp)
1484  0092 cd0000        	call	_NHALgpio_Read
1486  0095 b703          	ld	c_lreg+3,a
1487  0097 3f02          	clr	c_lreg+2
1488  0099 3f01          	clr	c_lreg+1
1489  009b 3f00          	clr	c_lreg
1490  009d 96            	ldw	x,sp
1491  009e 1c0008        	addw	x,#OFST-3
1492  00a1 cd0000        	call	c_lgor
1495                     ; 210 			semilla <<= 1;
1497  00a4 080b          	sll	(OFST+0,sp)
1498  00a6 090a          	rlc	(OFST-1,sp)
1499  00a8 0909          	rlc	(OFST-2,sp)
1500  00aa 0908          	rlc	(OFST-3,sp)
1502                     ; 212 			contadorBucle++;
1504  00ac 0c05          	inc	(OFST-6,sp)
1506                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1509  00ae 4b00          	push	#0
1510  00b0 1e07          	ldw	x,(OFST-4,sp)
1511  00b2 1c0004        	addw	x,#4
1512  00b5 cd0000        	call	_NHALgpio_Write
1514  00b8 ae000f        	ldw	x,#15
1515  00bb 9d            	nop	
1516  00bc 84            	pop	a
1517                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1522  00bd               L65:
1523  00bd 5a            	decw	X
1524  00be 26fd          	jrne	L65
1525                     
1527  00c0               L1221:
1528  00c0 9d            	nop	
1529                     ; 203 		while( contadorBucle < HX711_LONGITUDTRAMA ) 
1531  00c1 7b05          	ld	a,(OFST-6,sp)
1532  00c3 a118          	cp	a,#24
1533  00c5 25b6          	jrult	L7121
1534                     ; 132 	switch( hx711->Config.Ganancia )
1537  00c7 1e06          	ldw	x,(OFST-5,sp)
1538  00c9 e608          	ld	a,(8,x)
1540                     ; 157 		default:
1540                     ; 158 		
1540                     ; 159 		;
1541  00cb 270b          	jreq	L767
1542  00cd 4a            	dec	a
1543  00ce 2740          	jreq	L5001
1544  00d0 4a            	dec	a
1545  00d1 2603cc0184    	jreq	L3501
1546  00d6 2028          	jra	L7011
1547  00d8               L767:
1548                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1551  00d8 4b01          	push	#1
1552  00da 1e07          	ldw	x,(OFST-4,sp)
1553  00dc 1c0004        	addw	x,#4
1554  00df cd0000        	call	_NHALgpio_Write
1556  00e2 ae000f        	ldw	x,#15
1557  00e5 9d            	nop	
1558  00e6 84            	pop	a
1559                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1564  00e7               L26:
1565  00e7 5a            	decw	X
1566  00e8 26fd          	jrne	L26
1567  00ea 9d            	nop	
1568                     
1570                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1573  00eb 4b00          	push	#0
1574  00ed 1e07          	ldw	x,(OFST-4,sp)
1575  00ef 1c0004        	addw	x,#4
1576  00f2 cd0000        	call	_NHALgpio_Write
1578  00f5 ae000f        	ldw	x,#15
1579  00f8 9d            	nop	
1580  00f9 84            	pop	a
1581                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1586  00fa               L66:
1587  00fa 5a            	decw	X
1588  00fb 26fd          	jrne	L66
1589  00fd               LC001:
1590  00fd 9d            	nop	
1591                     
1593  00fe 1e06          	ldw	x,(OFST-5,sp)
1594  0100               L7011:
1595                     ; 220 		if( hx711->Datos.Estado != TIMEOUT )
1597  0100 e615          	ld	a,(21,x)
1598  0102 a104          	cp	a,#4
1599  0104 2603cc01d2    	jreq	L1711
1600                     ; 222 			hx711->Datos.Estado = NUEVA_LECTURA;
1602  0109 a603          	ld	a,#3
1603  010b e715          	ld	(21,x),a
1604  010d cc01d2        	jra	L1711
1605  0110               L5001:
1606                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1609  0110 4b01          	push	#1
1610  0112 1e07          	ldw	x,(OFST-4,sp)
1611  0114 1c0004        	addw	x,#4
1612  0117 cd0000        	call	_NHALgpio_Write
1614  011a ae000f        	ldw	x,#15
1615  011d 9d            	nop	
1616  011e 84            	pop	a
1617                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1622  011f               L27:
1623  011f 5a            	decw	X
1624  0120 26fd          	jrne	L27
1625  0122 9d            	nop	
1626                     
1628                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1631  0123 4b00          	push	#0
1632  0125 1e07          	ldw	x,(OFST-4,sp)
1633  0127 1c0004        	addw	x,#4
1634  012a cd0000        	call	_NHALgpio_Write
1636  012d ae000f        	ldw	x,#15
1637  0130 9d            	nop	
1638  0131 84            	pop	a
1639                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1644  0132               L67:
1645  0132 5a            	decw	X
1646  0133 26fd          	jrne	L67
1647  0135 9d            	nop	
1648                     
1650                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1653  0136 4b01          	push	#1
1654  0138 1e07          	ldw	x,(OFST-4,sp)
1655  013a 1c0004        	addw	x,#4
1656  013d cd0000        	call	_NHALgpio_Write
1658  0140 ae000f        	ldw	x,#15
1659  0143 9d            	nop	
1660  0144 84            	pop	a
1661                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1666  0145               L201:
1667  0145 5a            	decw	X
1668  0146 26fd          	jrne	L201
1669  0148 9d            	nop	
1670                     
1672                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1675  0149 4b00          	push	#0
1676  014b 1e07          	ldw	x,(OFST-4,sp)
1677  014d 1c0004        	addw	x,#4
1678  0150 cd0000        	call	_NHALgpio_Write
1680  0153 ae000f        	ldw	x,#15
1681  0156 9d            	nop	
1682  0157 84            	pop	a
1683                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1688  0158               L601:
1689  0158 5a            	decw	X
1690  0159 26fd          	jrne	L601
1691  015b 9d            	nop	
1692                     
1694                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1697  015c 4b01          	push	#1
1698  015e 1e07          	ldw	x,(OFST-4,sp)
1699  0160 1c0004        	addw	x,#4
1700  0163 cd0000        	call	_NHALgpio_Write
1702  0166 ae000f        	ldw	x,#15
1703  0169 9d            	nop	
1704  016a 84            	pop	a
1705                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1710  016b               L211:
1711  016b 5a            	decw	X
1712  016c 26fd          	jrne	L211
1713  016e 9d            	nop	
1714                     
1716                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1719  016f 4b00          	push	#0
1720  0171 1e07          	ldw	x,(OFST-4,sp)
1721  0173 1c0004        	addw	x,#4
1722  0176 cd0000        	call	_NHALgpio_Write
1724  0179 ae000f        	ldw	x,#15
1725  017c 9d            	nop	
1726  017d 84            	pop	a
1727                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1732  017e               L611:
1733  017e 5a            	decw	X
1734  017f 26fd          	jrne	L611
1735                     
1737  0181 cc00fd        	jp	LC001
1738  0184               L3501:
1739                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1742  0184 4b01          	push	#1
1743  0186 1e07          	ldw	x,(OFST-4,sp)
1744  0188 1c0004        	addw	x,#4
1745  018b cd0000        	call	_NHALgpio_Write
1747  018e ae000f        	ldw	x,#15
1748  0191 9d            	nop	
1749  0192 84            	pop	a
1750                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1755  0193               L221:
1756  0193 5a            	decw	X
1757  0194 26fd          	jrne	L221
1758  0196 9d            	nop	
1759                     
1761                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1764  0197 4b00          	push	#0
1765  0199 1e07          	ldw	x,(OFST-4,sp)
1766  019b 1c0004        	addw	x,#4
1767  019e cd0000        	call	_NHALgpio_Write
1769  01a1 ae000f        	ldw	x,#15
1770  01a4 9d            	nop	
1771  01a5 84            	pop	a
1772                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1777  01a6               L621:
1778  01a6 5a            	decw	X
1779  01a7 26fd          	jrne	L621
1780  01a9 9d            	nop	
1781                     
1783                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1786  01aa 4b01          	push	#1
1787  01ac 1e07          	ldw	x,(OFST-4,sp)
1788  01ae 1c0004        	addw	x,#4
1789  01b1 cd0000        	call	_NHALgpio_Write
1791  01b4 ae000f        	ldw	x,#15
1792  01b7 9d            	nop	
1793  01b8 84            	pop	a
1794                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1799  01b9               L231:
1800  01b9 5a            	decw	X
1801  01ba 26fd          	jrne	L231
1802  01bc 9d            	nop	
1803                     
1805                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1808  01bd 4b00          	push	#0
1809  01bf 1e07          	ldw	x,(OFST-4,sp)
1810  01c1 1c0004        	addw	x,#4
1811  01c4 cd0000        	call	_NHALgpio_Write
1813  01c7 ae000f        	ldw	x,#15
1814  01ca 9d            	nop	
1815  01cb 84            	pop	a
1816                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1821  01cc               L631:
1822  01cc 5a            	decw	X
1823  01cd 26fd          	jrne	L631
1824                     
1826  01cf cc00fd        	jp	LC001
1827  01d2               L1711:
1828                     ; 225 		return semilla;
1833                     ; 320 	aDormir( hx711 );
1836  01d2 1e0c          	ldw	x,(OFST+1,sp)
1837  01d4 1f06          	ldw	(OFST-5,sp),x
1839                     ; 112 	NHALgpio_Write( &hx711->Config.PD_SCK, true );
1841  01d6 4b01          	push	#1
1842  01d8 1e07          	ldw	x,(OFST-4,sp)
1843  01da 1c0004        	addw	x,#4
1844  01dd cd0000        	call	_NHALgpio_Write
1846  01e0 ae0174        	ldw	x,#372
1847  01e3 9d            	nop	
1848  01e4 84            	pop	a
1849                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1854  01e5               L441:
1855  01e5 5a            	decw	X
1856  01e6 26fd          	jrne	L441
1857  01e8 9d            	nop	
1858                     
1860                     ; 115 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1862  01e9 1e06          	ldw	x,(OFST-5,sp)
1863  01eb e615          	ld	a,(21,x)
1864  01ed 4a            	dec	a
1865  01ee 2704          	jreq	L7111
1866                     ; 117 		hx711->Datos.Estado = SLEEP;
1868  01f0 a602          	ld	a,#2
1869  01f2 e715          	ld	(21,x),a
1871  01f4               L7111:
1872                     ; 322 	if( ( semilla > hx711->Config.ValorZero ) )
1874  01f4 1e0c          	ldw	x,(OFST+1,sp)
1875  01f6 1c000b        	addw	x,#11
1876  01f9 cd0000        	call	c_ltor
1878  01fc 96            	ldw	x,sp
1879  01fd 1c0008        	addw	x,#OFST-3
1880  0200 cd0000        	call	c_lcmp
1882  0203 2424          	jruge	L7321
1883                     ; 324 		return ( ( semilla - hx711->Config.ValorZero ) / hx711->Config.ValorConversion );
1885  0205 1e0c          	ldw	x,(OFST+1,sp)
1886  0207 ee09          	ldw	x,(9,x)
1887  0209 cd0000        	call	c_uitolx
1889  020c 96            	ldw	x,sp
1890  020d 5c            	incw	x
1891  020e cd0000        	call	c_rtol
1894  0211 96            	ldw	x,sp
1895  0212 1c0008        	addw	x,#OFST-3
1896  0215 cd0000        	call	c_ltor
1898  0218 1e0c          	ldw	x,(OFST+1,sp)
1899  021a 1c000b        	addw	x,#11
1900  021d cd0000        	call	c_lsub
1902  0220 96            	ldw	x,sp
1903  0221 5c            	incw	x
1904  0222 cd0000        	call	c_ludv
1906  0225 be02          	ldw	x,c_lreg+2
1908  0227 2001          	jra	L641
1909  0229               L7321:
1910                     ; 328 		return 0;
1912  0229 5f            	clrw	x
1914  022a               L641:
1916  022a 5b0d          	addw	sp,#13
1917  022c 81            	ret	
2030                     ; 365 uint16_t hx711_Tarar( HX711_t_ptr hx711 )
2030                     ; 366 {
2031                     .text:	section	.text,new
2032  0000               _hx711_Tarar:
2034  0000 89            	pushw	x
2035  0001 5210          	subw	sp,#16
2036       00000010      OFST:	set	16
2039                     ; 367 	uint32_t valorMedio = 0;
2041  0003 5f            	clrw	x
2042  0004 1f0e          	ldw	(OFST-2,sp),x
2043  0006 1f0c          	ldw	(OFST-4,sp),x
2045                     ; 368 	uint8_t repeticiones = 4;
2047  0008 a604          	ld	a,#4
2048  000a 6b10          	ld	(OFST+0,sp),a
2050  000c               L5641:
2051                     ; 372 		valorMedio = valorMedio + leer( hx711 );
2054  000c 1e11          	ldw	x,(OFST+1,sp)
2055  000e 1f06          	ldw	(OFST-10,sp),x
2057                     ; 191 	uint32_t semilla = 0;
2059  0010 5f            	clrw	x
2060  0011 1f04          	ldw	(OFST-12,sp),x
2061  0013 1f02          	ldw	(OFST-14,sp),x
2063                     ; 192 	uint8_t contadorBucle = 0;
2065  0015 0f01          	clr	(OFST-15,sp)
2067                     ; 194 	if( hx711->Datos.Estado != SINVALORCONVERSION )
2069  0017 1e06          	ldw	x,(OFST-10,sp)
2070  0019 e615          	ld	a,(21,x)
2071  001b 4a            	dec	a
2072  001c 2603cc01dd    	jreq	L3741
2073                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2076  0021 4b00          	push	#0
2077  0023 1e07          	ldw	x,(OFST-9,sp)
2078  0025 1c0004        	addw	x,#4
2079  0028 cd0000        	call	_NHALgpio_Write
2081  002b ae000f        	ldw	x,#15
2082  002e 9d            	nop	
2083  002f 84            	pop	a
2084                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2089  0030               L451:
2090  0030 5a            	decw	X
2091  0031 26fd          	jrne	L451
2092  0033 9d            	nop	
2093                     
2095                     ; 165 	if( hx711->Timeout != NULL )
2098  0034 1e06          	ldw	x,(OFST-10,sp)
2099  0036 e617          	ld	a,(23,x)
2100  0038 ea16          	or	a,(22,x)
2101  003a 273b          	jreq	L5151
2102                     ; 167 		Timeout_Start( hx711->Timeout, TIMEOUT_1MS );
2104  003c ae03e8        	ldw	x,#1000
2105  003f 89            	pushw	x
2106  0040 1e08          	ldw	x,(OFST-8,sp)
2107  0042 ee16          	ldw	x,(22,x)
2108  0044 cd0000        	call	_Timeout_Start
2110  0047 85            	popw	x
2112  0048               L1051:
2113                     ; 168 		while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) && ( hx711->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) )
2115  0048 1e06          	ldw	x,(OFST-10,sp)
2116  004a cd0000        	call	_NHALgpio_Read
2118  004d 4d            	tnz	a
2119  004e 270c          	jreq	L5051
2121  0050 1e06          	ldw	x,(OFST-10,sp)
2122  0052 ee16          	ldw	x,(22,x)
2123  0054 ee02          	ldw	x,(2,x)
2124  0056 fd            	call	(x)
2126  0057 a301f4        	cpw	x,#500
2127  005a 25ec          	jrult	L1051
2128  005c               L5051:
2129                     ; 173 		if( hx711->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
2131  005c 1e06          	ldw	x,(OFST-10,sp)
2132  005e ee16          	ldw	x,(22,x)
2133  0060 ee02          	ldw	x,(2,x)
2134  0062 fd            	call	(x)
2136  0063 a301f4        	cpw	x,#500
2137  0066 2506          	jrult	L7051
2138                     ; 175 			hx711->Datos.Estado = TIMEOUT;
2140  0068 1e06          	ldw	x,(OFST-10,sp)
2141  006a a604          	ld	a,#4
2142  006c e715          	ld	(21,x),a
2143  006e               L7051:
2144                     ; 177 		Timeout_Stop( hx711->Timeout );
2146  006e 1e06          	ldw	x,(OFST-10,sp)
2147  0070 ee16          	ldw	x,(22,x)
2148  0072 cd0000        	call	_Timeout_Stop
2151  0075 2008          	jra	L1151
2152  0077               L5151:
2153                     ; 181 		while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) )
2155  0077 1e06          	ldw	x,(OFST-10,sp)
2156  0079 cd0000        	call	_NHALgpio_Read
2158  007c 4d            	tnz	a
2159  007d 26f8          	jrne	L5151
2160  007f               L1151:
2161                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2165  007f ae000f        	ldw	x,#15
2167  0082 9d            	nop	
2168  0083               L271:
2169  0083 5a            	decw	X
2170  0084 26fd          	jrne	L271
2171                     
2173  0086 2043          	jra	L3251
2174  0088               L1251:
2175                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2178  0088 4b01          	push	#1
2179  008a 1e07          	ldw	x,(OFST-9,sp)
2180  008c 1c0004        	addw	x,#4
2181  008f cd0000        	call	_NHALgpio_Write
2183  0092 ae000f        	ldw	x,#15
2184  0095 9d            	nop	
2185  0096 84            	pop	a
2186                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2191  0097               L671:
2192  0097 5a            	decw	X
2193  0098 26fd          	jrne	L671
2194  009a 9d            	nop	
2195                     
2197                     ; 209 			semilla |= NHALgpio_Read( &hx711->Config.DOUT );
2199  009b 1e06          	ldw	x,(OFST-10,sp)
2200  009d cd0000        	call	_NHALgpio_Read
2202  00a0 b703          	ld	c_lreg+3,a
2203  00a2 3f02          	clr	c_lreg+2
2204  00a4 3f01          	clr	c_lreg+1
2205  00a6 3f00          	clr	c_lreg
2206  00a8 96            	ldw	x,sp
2207  00a9 1c0002        	addw	x,#OFST-14
2208  00ac cd0000        	call	c_lgor
2211                     ; 210 			semilla <<= 1;
2213  00af 0805          	sll	(OFST-11,sp)
2214  00b1 0904          	rlc	(OFST-12,sp)
2215  00b3 0903          	rlc	(OFST-13,sp)
2216  00b5 0902          	rlc	(OFST-14,sp)
2218                     ; 212 			contadorBucle++;
2220  00b7 0c01          	inc	(OFST-15,sp)
2222                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2225  00b9 4b00          	push	#0
2226  00bb 1e07          	ldw	x,(OFST-9,sp)
2227  00bd 1c0004        	addw	x,#4
2228  00c0 cd0000        	call	_NHALgpio_Write
2230  00c3 ae000f        	ldw	x,#15
2231  00c6 9d            	nop	
2232  00c7 84            	pop	a
2233                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2238  00c8               L402:
2239  00c8 5a            	decw	X
2240  00c9 26fd          	jrne	L402
2241                     
2243  00cb               L3251:
2244  00cb 9d            	nop	
2245                     ; 203 		while( contadorBucle < HX711_LONGITUDTRAMA ) 
2247  00cc 7b01          	ld	a,(OFST-15,sp)
2248  00ce a118          	cp	a,#24
2249  00d0 25b6          	jrult	L1251
2250                     ; 132 	switch( hx711->Config.Ganancia )
2253  00d2 1e06          	ldw	x,(OFST-10,sp)
2254  00d4 e608          	ld	a,(8,x)
2256                     ; 157 		default:
2256                     ; 158 		
2256                     ; 159 		;
2257  00d6 270b          	jreq	L3721
2258  00d8 4a            	dec	a
2259  00d9 2740          	jreq	L1131
2260  00db 4a            	dec	a
2261  00dc 2603cc018f    	jreq	L7531
2262  00e1 2028          	jra	L3141
2263  00e3               L3721:
2264                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2267  00e3 4b01          	push	#1
2268  00e5 1e07          	ldw	x,(OFST-9,sp)
2269  00e7 1c0004        	addw	x,#4
2270  00ea cd0000        	call	_NHALgpio_Write
2272  00ed ae000f        	ldw	x,#15
2273  00f0 9d            	nop	
2274  00f1 84            	pop	a
2275                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2280  00f2               L012:
2281  00f2 5a            	decw	X
2282  00f3 26fd          	jrne	L012
2283  00f5 9d            	nop	
2284                     
2286                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2289  00f6 4b00          	push	#0
2290  00f8 1e07          	ldw	x,(OFST-9,sp)
2291  00fa 1c0004        	addw	x,#4
2292  00fd cd0000        	call	_NHALgpio_Write
2294  0100 ae000f        	ldw	x,#15
2295  0103 9d            	nop	
2296  0104 84            	pop	a
2297                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2302  0105               L412:
2303  0105 5a            	decw	X
2304  0106 26fd          	jrne	L412
2305  0108               LC002:
2306  0108 9d            	nop	
2307                     
2309  0109 1e06          	ldw	x,(OFST-10,sp)
2310  010b               L3141:
2311                     ; 220 		if( hx711->Datos.Estado != TIMEOUT )
2313  010b e615          	ld	a,(21,x)
2314  010d a104          	cp	a,#4
2315  010f 2603cc01dd    	jreq	L3741
2316                     ; 222 			hx711->Datos.Estado = NUEVA_LECTURA;
2318  0114 a603          	ld	a,#3
2319  0116 e715          	ld	(21,x),a
2320  0118 cc01dd        	jra	L3741
2321  011b               L1131:
2322                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2325  011b 4b01          	push	#1
2326  011d 1e07          	ldw	x,(OFST-9,sp)
2327  011f 1c0004        	addw	x,#4
2328  0122 cd0000        	call	_NHALgpio_Write
2330  0125 ae000f        	ldw	x,#15
2331  0128 9d            	nop	
2332  0129 84            	pop	a
2333                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2338  012a               L022:
2339  012a 5a            	decw	X
2340  012b 26fd          	jrne	L022
2341  012d 9d            	nop	
2342                     
2344                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2347  012e 4b00          	push	#0
2348  0130 1e07          	ldw	x,(OFST-9,sp)
2349  0132 1c0004        	addw	x,#4
2350  0135 cd0000        	call	_NHALgpio_Write
2352  0138 ae000f        	ldw	x,#15
2353  013b 9d            	nop	
2354  013c 84            	pop	a
2355                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2360  013d               L422:
2361  013d 5a            	decw	X
2362  013e 26fd          	jrne	L422
2363  0140 9d            	nop	
2364                     
2366                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2369  0141 4b01          	push	#1
2370  0143 1e07          	ldw	x,(OFST-9,sp)
2371  0145 1c0004        	addw	x,#4
2372  0148 cd0000        	call	_NHALgpio_Write
2374  014b ae000f        	ldw	x,#15
2375  014e 9d            	nop	
2376  014f 84            	pop	a
2377                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2382  0150               L032:
2383  0150 5a            	decw	X
2384  0151 26fd          	jrne	L032
2385  0153 9d            	nop	
2386                     
2388                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2391  0154 4b00          	push	#0
2392  0156 1e07          	ldw	x,(OFST-9,sp)
2393  0158 1c0004        	addw	x,#4
2394  015b cd0000        	call	_NHALgpio_Write
2396  015e ae000f        	ldw	x,#15
2397  0161 9d            	nop	
2398  0162 84            	pop	a
2399                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2404  0163               L432:
2405  0163 5a            	decw	X
2406  0164 26fd          	jrne	L432
2407  0166 9d            	nop	
2408                     
2410                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2413  0167 4b01          	push	#1
2414  0169 1e07          	ldw	x,(OFST-9,sp)
2415  016b 1c0004        	addw	x,#4
2416  016e cd0000        	call	_NHALgpio_Write
2418  0171 ae000f        	ldw	x,#15
2419  0174 9d            	nop	
2420  0175 84            	pop	a
2421                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2426  0176               L042:
2427  0176 5a            	decw	X
2428  0177 26fd          	jrne	L042
2429  0179 9d            	nop	
2430                     
2432                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2435  017a 4b00          	push	#0
2436  017c 1e07          	ldw	x,(OFST-9,sp)
2437  017e 1c0004        	addw	x,#4
2438  0181 cd0000        	call	_NHALgpio_Write
2440  0184 ae000f        	ldw	x,#15
2441  0187 9d            	nop	
2442  0188 84            	pop	a
2443                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2448  0189               L442:
2449  0189 5a            	decw	X
2450  018a 26fd          	jrne	L442
2451                     
2453  018c cc0108        	jp	LC002
2454  018f               L7531:
2455                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2458  018f 4b01          	push	#1
2459  0191 1e07          	ldw	x,(OFST-9,sp)
2460  0193 1c0004        	addw	x,#4
2461  0196 cd0000        	call	_NHALgpio_Write
2463  0199 ae000f        	ldw	x,#15
2464  019c 9d            	nop	
2465  019d 84            	pop	a
2466                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2471  019e               L052:
2472  019e 5a            	decw	X
2473  019f 26fd          	jrne	L052
2474  01a1 9d            	nop	
2475                     
2477                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2480  01a2 4b00          	push	#0
2481  01a4 1e07          	ldw	x,(OFST-9,sp)
2482  01a6 1c0004        	addw	x,#4
2483  01a9 cd0000        	call	_NHALgpio_Write
2485  01ac ae000f        	ldw	x,#15
2486  01af 9d            	nop	
2487  01b0 84            	pop	a
2488                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2493  01b1               L452:
2494  01b1 5a            	decw	X
2495  01b2 26fd          	jrne	L452
2496  01b4 9d            	nop	
2497                     
2499                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2502  01b5 4b01          	push	#1
2503  01b7 1e07          	ldw	x,(OFST-9,sp)
2504  01b9 1c0004        	addw	x,#4
2505  01bc cd0000        	call	_NHALgpio_Write
2507  01bf ae000f        	ldw	x,#15
2508  01c2 9d            	nop	
2509  01c3 84            	pop	a
2510                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2515  01c4               L062:
2516  01c4 5a            	decw	X
2517  01c5 26fd          	jrne	L062
2518  01c7 9d            	nop	
2519                     
2521                     ; 126 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2524  01c8 4b00          	push	#0
2525  01ca 1e07          	ldw	x,(OFST-9,sp)
2526  01cc 1c0004        	addw	x,#4
2527  01cf cd0000        	call	_NHALgpio_Write
2529  01d2 ae000f        	ldw	x,#15
2530  01d5 9d            	nop	
2531  01d6 84            	pop	a
2532                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2537  01d7               L462:
2538  01d7 5a            	decw	X
2539  01d8 26fd          	jrne	L462
2540                     
2542  01da cc0108        	jp	LC002
2543  01dd               L3741:
2544                     ; 225 		return semilla;
2546  01dd 1e04          	ldw	x,(OFST-12,sp)
2547  01df 1f0a          	ldw	(OFST-6,sp),x
2548  01e1 1e02          	ldw	x,(OFST-14,sp)
2549  01e3 1f08          	ldw	(OFST-8,sp),x
2553  01e5 96            	ldw	x,sp
2554  01e6 1c0008        	addw	x,#OFST-8
2555  01e9 cd0000        	call	c_ltor
2557  01ec 96            	ldw	x,sp
2558  01ed 1c000c        	addw	x,#OFST-4
2559  01f0 cd0000        	call	c_lgadd
2562                     ; 373 		--repeticiones;
2564  01f3 0a10          	dec	(OFST+0,sp)
2566                     ; 370 	while( ( repeticiones > 0 ) )
2568  01f5 2703cc000c    	jrne	L5641
2569                     ; 375 	repeticiones = 4;
2571                     ; 377 	return valorMedio/repeticiones;
2573  01fa 96            	ldw	x,sp
2574  01fb 1c000c        	addw	x,#OFST-4
2575  01fe cd0000        	call	c_ltor
2577  0201 a602          	ld	a,#2
2578  0203 cd0000        	call	c_lursh
2580  0206 be02          	ldw	x,c_lreg+2
2583  0208 5b12          	addw	sp,#18
2584  020a 81            	ret	
2597                     	xdef	_hx711_Tarar
2598                     	xdef	_hx711_Lectura
2599                     	xdef	_HX711_Init
2600                     	xref	_Timeout_Stop
2601                     	xref	_Timeout_Start
2602                     	xref	_NHALgpio_Write
2603                     	xref	_NHALgpio_Read
2604                     	xref	_NHALgpio_Init
2605                     	xref	_NHALgpioConfig_SetType
2606                     	xref.b	c_lreg
2607                     	xref.b	c_x
2626                     	xref	c_lursh
2627                     	xref	c_lgadd
2628                     	xref	c_ludv
2629                     	xref	c_rtol
2630                     	xref	c_uitolx
2631                     	xref	c_lsub
2632                     	xref	c_lcmp
2633                     	xref	c_ltor
2634                     	xref	c_lgor
2635                     	end

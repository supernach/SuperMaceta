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
1247                     ; 308 uint16_t hx711_Lectura( HX711_t_ptr hx711 )
1247                     ; 309 {
1248                     .text:	section	.text,new
1249  0000               _hx711_Lectura:
1251  0000 89            	pushw	x
1252  0001 520b          	subw	sp,#11
1253       0000000b      OFST:	set	11
1256                     ; 310 	uint32_t semilla = 0;
1258                     ; 312 	semilla = leer( hx711 );
1261  0003 1f06          	ldw	(OFST-5,sp),x
1263                     ; 185 	uint32_t semilla = 0;
1265  0005 5f            	clrw	x
1266  0006 1f0a          	ldw	(OFST-1,sp),x
1267  0008 1f08          	ldw	(OFST-3,sp),x
1269                     ; 186 	uint8_t contadorBucle = 0;
1271  000a 0f05          	clr	(OFST-6,sp)
1273                     ; 188 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1275  000c 1e06          	ldw	x,(OFST-5,sp)
1276  000e e615          	ld	a,(21,x)
1277  0010 4a            	dec	a
1278  0011 2603cc01d2    	jreq	L7111
1279                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1282  0016 4b00          	push	#0
1283  0018 1e07          	ldw	x,(OFST-4,sp)
1284  001a 1c0004        	addw	x,#4
1285  001d cd0000        	call	_NHALgpio_Write
1287  0020 ae000f        	ldw	x,#15
1288  0023 9d            	nop	
1289  0024 84            	pop	a
1290                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1295  0025               L62:
1296  0025 5a            	decw	X
1297  0026 26fd          	jrne	L62
1298  0028 9d            	nop	
1299                     
1301                     ; 159 	if( hx711->Timeout != NULL )
1304  0029 1e06          	ldw	x,(OFST-5,sp)
1305  002b e617          	ld	a,(23,x)
1306  002d ea16          	or	a,(22,x)
1307  002f 273b          	jreq	L1411
1308                     ; 161 		Timeout_Start( hx711->Timeout, TIMEOUT_1MS );
1310  0031 ae03e8        	ldw	x,#1000
1311  0034 89            	pushw	x
1312  0035 1e08          	ldw	x,(OFST-3,sp)
1313  0037 ee16          	ldw	x,(22,x)
1314  0039 cd0000        	call	_Timeout_Start
1316  003c 85            	popw	x
1318  003d               L5211:
1319                     ; 162 		while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) && ( hx711->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) )
1321  003d 1e06          	ldw	x,(OFST-5,sp)
1322  003f cd0000        	call	_NHALgpio_Read
1324  0042 4d            	tnz	a
1325  0043 270c          	jreq	L1311
1327  0045 1e06          	ldw	x,(OFST-5,sp)
1328  0047 ee16          	ldw	x,(22,x)
1329  0049 ee02          	ldw	x,(2,x)
1330  004b fd            	call	(x)
1332  004c a301f4        	cpw	x,#500
1333  004f 25ec          	jrult	L5211
1334  0051               L1311:
1335                     ; 167 		if( hx711->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
1337  0051 1e06          	ldw	x,(OFST-5,sp)
1338  0053 ee16          	ldw	x,(22,x)
1339  0055 ee02          	ldw	x,(2,x)
1340  0057 fd            	call	(x)
1342  0058 a301f4        	cpw	x,#500
1343  005b 2506          	jrult	L3311
1344                     ; 169 			hx711->Datos.Estado = TIMEOUT;
1346  005d 1e06          	ldw	x,(OFST-5,sp)
1347  005f a604          	ld	a,#4
1348  0061 e715          	ld	(21,x),a
1349  0063               L3311:
1350                     ; 171 		Timeout_Stop( hx711->Timeout );
1352  0063 1e06          	ldw	x,(OFST-5,sp)
1353  0065 ee16          	ldw	x,(22,x)
1354  0067 cd0000        	call	_Timeout_Stop
1357  006a 2008          	jra	L5311
1358  006c               L1411:
1359                     ; 175 		while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) )
1361  006c 1e06          	ldw	x,(OFST-5,sp)
1362  006e cd0000        	call	_NHALgpio_Read
1364  0071 4d            	tnz	a
1365  0072 26f8          	jrne	L1411
1366  0074               L5311:
1367                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1371  0074 ae000f        	ldw	x,#15
1373  0077 9d            	nop	
1374  0078               L44:
1375  0078 5a            	decw	X
1376  0079 26fd          	jrne	L44
1377                     
1379  007b 2043          	jra	L7411
1380  007d               L5411:
1381                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1384  007d 4b01          	push	#1
1385  007f 1e07          	ldw	x,(OFST-4,sp)
1386  0081 1c0004        	addw	x,#4
1387  0084 cd0000        	call	_NHALgpio_Write
1389  0087 ae000f        	ldw	x,#15
1390  008a 9d            	nop	
1391  008b 84            	pop	a
1392                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1397  008c               L05:
1398  008c 5a            	decw	X
1399  008d 26fd          	jrne	L05
1400  008f 9d            	nop	
1401                     
1403                     ; 203 			semilla |= NHALgpio_Read( &hx711->Config.DOUT );
1405  0090 1e06          	ldw	x,(OFST-5,sp)
1406  0092 cd0000        	call	_NHALgpio_Read
1408  0095 b703          	ld	c_lreg+3,a
1409  0097 3f02          	clr	c_lreg+2
1410  0099 3f01          	clr	c_lreg+1
1411  009b 3f00          	clr	c_lreg
1412  009d 96            	ldw	x,sp
1413  009e 1c0008        	addw	x,#OFST-3
1414  00a1 cd0000        	call	c_lgor
1417                     ; 204 			semilla <<= 1;
1419  00a4 080b          	sll	(OFST+0,sp)
1420  00a6 090a          	rlc	(OFST-1,sp)
1421  00a8 0909          	rlc	(OFST-2,sp)
1422  00aa 0908          	rlc	(OFST-3,sp)
1424                     ; 206 			contadorBucle++;
1426  00ac 0c05          	inc	(OFST-6,sp)
1428                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1431  00ae 4b00          	push	#0
1432  00b0 1e07          	ldw	x,(OFST-4,sp)
1433  00b2 1c0004        	addw	x,#4
1434  00b5 cd0000        	call	_NHALgpio_Write
1436  00b8 ae000f        	ldw	x,#15
1437  00bb 9d            	nop	
1438  00bc 84            	pop	a
1439                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1444  00bd               L65:
1445  00bd 5a            	decw	X
1446  00be 26fd          	jrne	L65
1447                     
1449  00c0               L7411:
1450  00c0 9d            	nop	
1451                     ; 197 		while( contadorBucle < HX711_LONGITUDTRAMA ) 
1453  00c1 7b05          	ld	a,(OFST-6,sp)
1454  00c3 a118          	cp	a,#24
1455  00c5 25b6          	jrult	L5411
1456                     ; 126 	switch( hx711->Config.Ganancia )
1459  00c7 1e06          	ldw	x,(OFST-5,sp)
1460  00c9 e608          	ld	a,(8,x)
1462                     ; 151 		default:
1462                     ; 152 		
1462                     ; 153 		;
1463  00cb 270b          	jreq	L137
1464  00cd 4a            	dec	a
1465  00ce 2740          	jreq	L747
1466  00d0 4a            	dec	a
1467  00d1 2603cc0184    	jreq	L5101
1468  00d6 2028          	jra	L1501
1469  00d8               L137:
1470                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1473  00d8 4b01          	push	#1
1474  00da 1e07          	ldw	x,(OFST-4,sp)
1475  00dc 1c0004        	addw	x,#4
1476  00df cd0000        	call	_NHALgpio_Write
1478  00e2 ae000f        	ldw	x,#15
1479  00e5 9d            	nop	
1480  00e6 84            	pop	a
1481                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1486  00e7               L26:
1487  00e7 5a            	decw	X
1488  00e8 26fd          	jrne	L26
1489  00ea 9d            	nop	
1490                     
1492                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1495  00eb 4b00          	push	#0
1496  00ed 1e07          	ldw	x,(OFST-4,sp)
1497  00ef 1c0004        	addw	x,#4
1498  00f2 cd0000        	call	_NHALgpio_Write
1500  00f5 ae000f        	ldw	x,#15
1501  00f8 9d            	nop	
1502  00f9 84            	pop	a
1503                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1508  00fa               L66:
1509  00fa 5a            	decw	X
1510  00fb 26fd          	jrne	L66
1511  00fd               LC001:
1512  00fd 9d            	nop	
1513                     
1515  00fe 1e06          	ldw	x,(OFST-5,sp)
1516  0100               L1501:
1517                     ; 214 		if( hx711->Datos.Estado != TIMEOUT )
1519  0100 e615          	ld	a,(21,x)
1520  0102 a104          	cp	a,#4
1521  0104 2603cc01d2    	jreq	L7111
1522                     ; 216 			hx711->Datos.Estado = NUEVA_LECTURA;
1524  0109 a603          	ld	a,#3
1525  010b e715          	ld	(21,x),a
1526  010d cc01d2        	jra	L7111
1527  0110               L747:
1528                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1531  0110 4b01          	push	#1
1532  0112 1e07          	ldw	x,(OFST-4,sp)
1533  0114 1c0004        	addw	x,#4
1534  0117 cd0000        	call	_NHALgpio_Write
1536  011a ae000f        	ldw	x,#15
1537  011d 9d            	nop	
1538  011e 84            	pop	a
1539                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1544  011f               L27:
1545  011f 5a            	decw	X
1546  0120 26fd          	jrne	L27
1547  0122 9d            	nop	
1548                     
1550                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1553  0123 4b00          	push	#0
1554  0125 1e07          	ldw	x,(OFST-4,sp)
1555  0127 1c0004        	addw	x,#4
1556  012a cd0000        	call	_NHALgpio_Write
1558  012d ae000f        	ldw	x,#15
1559  0130 9d            	nop	
1560  0131 84            	pop	a
1561                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1566  0132               L67:
1567  0132 5a            	decw	X
1568  0133 26fd          	jrne	L67
1569  0135 9d            	nop	
1570                     
1572                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1575  0136 4b01          	push	#1
1576  0138 1e07          	ldw	x,(OFST-4,sp)
1577  013a 1c0004        	addw	x,#4
1578  013d cd0000        	call	_NHALgpio_Write
1580  0140 ae000f        	ldw	x,#15
1581  0143 9d            	nop	
1582  0144 84            	pop	a
1583                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1588  0145               L201:
1589  0145 5a            	decw	X
1590  0146 26fd          	jrne	L201
1591  0148 9d            	nop	
1592                     
1594                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1597  0149 4b00          	push	#0
1598  014b 1e07          	ldw	x,(OFST-4,sp)
1599  014d 1c0004        	addw	x,#4
1600  0150 cd0000        	call	_NHALgpio_Write
1602  0153 ae000f        	ldw	x,#15
1603  0156 9d            	nop	
1604  0157 84            	pop	a
1605                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1610  0158               L601:
1611  0158 5a            	decw	X
1612  0159 26fd          	jrne	L601
1613  015b 9d            	nop	
1614                     
1616                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1619  015c 4b01          	push	#1
1620  015e 1e07          	ldw	x,(OFST-4,sp)
1621  0160 1c0004        	addw	x,#4
1622  0163 cd0000        	call	_NHALgpio_Write
1624  0166 ae000f        	ldw	x,#15
1625  0169 9d            	nop	
1626  016a 84            	pop	a
1627                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1632  016b               L211:
1633  016b 5a            	decw	X
1634  016c 26fd          	jrne	L211
1635  016e 9d            	nop	
1636                     
1638                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1641  016f 4b00          	push	#0
1642  0171 1e07          	ldw	x,(OFST-4,sp)
1643  0173 1c0004        	addw	x,#4
1644  0176 cd0000        	call	_NHALgpio_Write
1646  0179 ae000f        	ldw	x,#15
1647  017c 9d            	nop	
1648  017d 84            	pop	a
1649                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1654  017e               L611:
1655  017e 5a            	decw	X
1656  017f 26fd          	jrne	L611
1657                     
1659  0181 cc00fd        	jp	LC001
1660  0184               L5101:
1661                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1664  0184 4b01          	push	#1
1665  0186 1e07          	ldw	x,(OFST-4,sp)
1666  0188 1c0004        	addw	x,#4
1667  018b cd0000        	call	_NHALgpio_Write
1669  018e ae000f        	ldw	x,#15
1670  0191 9d            	nop	
1671  0192 84            	pop	a
1672                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1677  0193               L221:
1678  0193 5a            	decw	X
1679  0194 26fd          	jrne	L221
1680  0196 9d            	nop	
1681                     
1683                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1686  0197 4b00          	push	#0
1687  0199 1e07          	ldw	x,(OFST-4,sp)
1688  019b 1c0004        	addw	x,#4
1689  019e cd0000        	call	_NHALgpio_Write
1691  01a1 ae000f        	ldw	x,#15
1692  01a4 9d            	nop	
1693  01a5 84            	pop	a
1694                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1699  01a6               L621:
1700  01a6 5a            	decw	X
1701  01a7 26fd          	jrne	L621
1702  01a9 9d            	nop	
1703                     
1705                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1708  01aa 4b01          	push	#1
1709  01ac 1e07          	ldw	x,(OFST-4,sp)
1710  01ae 1c0004        	addw	x,#4
1711  01b1 cd0000        	call	_NHALgpio_Write
1713  01b4 ae000f        	ldw	x,#15
1714  01b7 9d            	nop	
1715  01b8 84            	pop	a
1716                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1721  01b9               L231:
1722  01b9 5a            	decw	X
1723  01ba 26fd          	jrne	L231
1724  01bc 9d            	nop	
1725                     
1727                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1730  01bd 4b00          	push	#0
1731  01bf 1e07          	ldw	x,(OFST-4,sp)
1732  01c1 1c0004        	addw	x,#4
1733  01c4 cd0000        	call	_NHALgpio_Write
1735  01c7 ae000f        	ldw	x,#15
1736  01ca 9d            	nop	
1737  01cb 84            	pop	a
1738                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1743  01cc               L631:
1744  01cc 5a            	decw	X
1745  01cd 26fd          	jrne	L631
1746                     
1748  01cf cc00fd        	jp	LC001
1749  01d2               L7111:
1750                     ; 219 		return semilla;
1755                     ; 315 	if( ( semilla > hx711->Config.ValorZero ) )
1757  01d2 1e0c          	ldw	x,(OFST+1,sp)
1758  01d4 1c000b        	addw	x,#11
1759  01d7 cd0000        	call	c_ltor
1761  01da 96            	ldw	x,sp
1762  01db 1c0008        	addw	x,#OFST-3
1763  01de cd0000        	call	c_lcmp
1765  01e1 2424          	jruge	L1611
1766                     ; 317 		return ( ( semilla - hx711->Config.ValorZero ) / hx711->Config.ValorConversion );
1768  01e3 1e0c          	ldw	x,(OFST+1,sp)
1769  01e5 ee09          	ldw	x,(9,x)
1770  01e7 cd0000        	call	c_uitolx
1772  01ea 96            	ldw	x,sp
1773  01eb 5c            	incw	x
1774  01ec cd0000        	call	c_rtol
1777  01ef 96            	ldw	x,sp
1778  01f0 1c0008        	addw	x,#OFST-3
1779  01f3 cd0000        	call	c_ltor
1781  01f6 1e0c          	ldw	x,(OFST+1,sp)
1782  01f8 1c000b        	addw	x,#11
1783  01fb cd0000        	call	c_lsub
1785  01fe 96            	ldw	x,sp
1786  01ff 5c            	incw	x
1787  0200 cd0000        	call	c_ludv
1789  0203 be02          	ldw	x,c_lreg+2
1791  0205 2001          	jra	L241
1792  0207               L1611:
1793                     ; 321 		return 0;
1795  0207 5f            	clrw	x
1797  0208               L241:
1799  0208 5b0d          	addw	sp,#13
1800  020a 81            	ret	
1913                     ; 358 uint16_t hx711_Tarar( HX711_t_ptr hx711 )
1913                     ; 359 {
1914                     .text:	section	.text,new
1915  0000               _hx711_Tarar:
1917  0000 89            	pushw	x
1918  0001 5210          	subw	sp,#16
1919       00000010      OFST:	set	16
1922                     ; 360 	uint32_t valorMedio = 0;
1924  0003 5f            	clrw	x
1925  0004 1f0e          	ldw	(OFST-2,sp),x
1926  0006 1f0c          	ldw	(OFST-4,sp),x
1928                     ; 361 	uint8_t repeticiones = 4;
1930  0008 a604          	ld	a,#4
1931  000a 6b10          	ld	(OFST+0,sp),a
1933  000c               L7041:
1934                     ; 365 		valorMedio = valorMedio + leer( hx711 );
1937  000c 1e11          	ldw	x,(OFST+1,sp)
1938  000e 1f06          	ldw	(OFST-10,sp),x
1940                     ; 185 	uint32_t semilla = 0;
1942  0010 5f            	clrw	x
1943  0011 1f04          	ldw	(OFST-12,sp),x
1944  0013 1f02          	ldw	(OFST-14,sp),x
1946                     ; 186 	uint8_t contadorBucle = 0;
1948  0015 0f01          	clr	(OFST-15,sp)
1950                     ; 188 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1952  0017 1e06          	ldw	x,(OFST-10,sp)
1953  0019 e615          	ld	a,(21,x)
1954  001b 4a            	dec	a
1955  001c 2603cc01dd    	jreq	L5141
1956                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1959  0021 4b00          	push	#0
1960  0023 1e07          	ldw	x,(OFST-9,sp)
1961  0025 1c0004        	addw	x,#4
1962  0028 cd0000        	call	_NHALgpio_Write
1964  002b ae000f        	ldw	x,#15
1965  002e 9d            	nop	
1966  002f 84            	pop	a
1967                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1972  0030               L051:
1973  0030 5a            	decw	X
1974  0031 26fd          	jrne	L051
1975  0033 9d            	nop	
1976                     
1978                     ; 159 	if( hx711->Timeout != NULL )
1981  0034 1e06          	ldw	x,(OFST-10,sp)
1982  0036 e617          	ld	a,(23,x)
1983  0038 ea16          	or	a,(22,x)
1984  003a 273b          	jreq	L7341
1985                     ; 161 		Timeout_Start( hx711->Timeout, TIMEOUT_1MS );
1987  003c ae03e8        	ldw	x,#1000
1988  003f 89            	pushw	x
1989  0040 1e08          	ldw	x,(OFST-8,sp)
1990  0042 ee16          	ldw	x,(22,x)
1991  0044 cd0000        	call	_Timeout_Start
1993  0047 85            	popw	x
1995  0048               L3241:
1996                     ; 162 		while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) && ( hx711->Timeout->Config.Notificacion( ) < TIMEOUT_MAX_500MS ) )
1998  0048 1e06          	ldw	x,(OFST-10,sp)
1999  004a cd0000        	call	_NHALgpio_Read
2001  004d 4d            	tnz	a
2002  004e 270c          	jreq	L7241
2004  0050 1e06          	ldw	x,(OFST-10,sp)
2005  0052 ee16          	ldw	x,(22,x)
2006  0054 ee02          	ldw	x,(2,x)
2007  0056 fd            	call	(x)
2009  0057 a301f4        	cpw	x,#500
2010  005a 25ec          	jrult	L3241
2011  005c               L7241:
2012                     ; 167 		if( hx711->Timeout->Config.Notificacion( ) >= TIMEOUT_MAX_500MS )
2014  005c 1e06          	ldw	x,(OFST-10,sp)
2015  005e ee16          	ldw	x,(22,x)
2016  0060 ee02          	ldw	x,(2,x)
2017  0062 fd            	call	(x)
2019  0063 a301f4        	cpw	x,#500
2020  0066 2506          	jrult	L1341
2021                     ; 169 			hx711->Datos.Estado = TIMEOUT;
2023  0068 1e06          	ldw	x,(OFST-10,sp)
2024  006a a604          	ld	a,#4
2025  006c e715          	ld	(21,x),a
2026  006e               L1341:
2027                     ; 171 		Timeout_Stop( hx711->Timeout );
2029  006e 1e06          	ldw	x,(OFST-10,sp)
2030  0070 ee16          	ldw	x,(22,x)
2031  0072 cd0000        	call	_Timeout_Stop
2034  0075 2008          	jra	L3341
2035  0077               L7341:
2036                     ; 175 		while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) )
2038  0077 1e06          	ldw	x,(OFST-10,sp)
2039  0079 cd0000        	call	_NHALgpio_Read
2041  007c 4d            	tnz	a
2042  007d 26f8          	jrne	L7341
2043  007f               L3341:
2044                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2048  007f ae000f        	ldw	x,#15
2050  0082 9d            	nop	
2051  0083               L661:
2052  0083 5a            	decw	X
2053  0084 26fd          	jrne	L661
2054                     
2056  0086 2043          	jra	L5441
2057  0088               L3441:
2058                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2061  0088 4b01          	push	#1
2062  008a 1e07          	ldw	x,(OFST-9,sp)
2063  008c 1c0004        	addw	x,#4
2064  008f cd0000        	call	_NHALgpio_Write
2066  0092 ae000f        	ldw	x,#15
2067  0095 9d            	nop	
2068  0096 84            	pop	a
2069                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2074  0097               L271:
2075  0097 5a            	decw	X
2076  0098 26fd          	jrne	L271
2077  009a 9d            	nop	
2078                     
2080                     ; 203 			semilla |= NHALgpio_Read( &hx711->Config.DOUT );
2082  009b 1e06          	ldw	x,(OFST-10,sp)
2083  009d cd0000        	call	_NHALgpio_Read
2085  00a0 b703          	ld	c_lreg+3,a
2086  00a2 3f02          	clr	c_lreg+2
2087  00a4 3f01          	clr	c_lreg+1
2088  00a6 3f00          	clr	c_lreg
2089  00a8 96            	ldw	x,sp
2090  00a9 1c0002        	addw	x,#OFST-14
2091  00ac cd0000        	call	c_lgor
2094                     ; 204 			semilla <<= 1;
2096  00af 0805          	sll	(OFST-11,sp)
2097  00b1 0904          	rlc	(OFST-12,sp)
2098  00b3 0903          	rlc	(OFST-13,sp)
2099  00b5 0902          	rlc	(OFST-14,sp)
2101                     ; 206 			contadorBucle++;
2103  00b7 0c01          	inc	(OFST-15,sp)
2105                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2108  00b9 4b00          	push	#0
2109  00bb 1e07          	ldw	x,(OFST-9,sp)
2110  00bd 1c0004        	addw	x,#4
2111  00c0 cd0000        	call	_NHALgpio_Write
2113  00c3 ae000f        	ldw	x,#15
2114  00c6 9d            	nop	
2115  00c7 84            	pop	a
2116                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2121  00c8               L002:
2122  00c8 5a            	decw	X
2123  00c9 26fd          	jrne	L002
2124                     
2126  00cb               L5441:
2127  00cb 9d            	nop	
2128                     ; 197 		while( contadorBucle < HX711_LONGITUDTRAMA ) 
2130  00cc 7b01          	ld	a,(OFST-15,sp)
2131  00ce a118          	cp	a,#24
2132  00d0 25b6          	jrult	L3441
2133                     ; 126 	switch( hx711->Config.Ganancia )
2136  00d2 1e06          	ldw	x,(OFST-10,sp)
2137  00d4 e608          	ld	a,(8,x)
2139                     ; 151 		default:
2139                     ; 152 		
2139                     ; 153 		;
2140  00d6 270b          	jreq	L5121
2141  00d8 4a            	dec	a
2142  00d9 2740          	jreq	L3321
2143  00db 4a            	dec	a
2144  00dc 2603cc018f    	jreq	L1031
2145  00e1 2028          	jra	L5331
2146  00e3               L5121:
2147                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2150  00e3 4b01          	push	#1
2151  00e5 1e07          	ldw	x,(OFST-9,sp)
2152  00e7 1c0004        	addw	x,#4
2153  00ea cd0000        	call	_NHALgpio_Write
2155  00ed ae000f        	ldw	x,#15
2156  00f0 9d            	nop	
2157  00f1 84            	pop	a
2158                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2163  00f2               L402:
2164  00f2 5a            	decw	X
2165  00f3 26fd          	jrne	L402
2166  00f5 9d            	nop	
2167                     
2169                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2172  00f6 4b00          	push	#0
2173  00f8 1e07          	ldw	x,(OFST-9,sp)
2174  00fa 1c0004        	addw	x,#4
2175  00fd cd0000        	call	_NHALgpio_Write
2177  0100 ae000f        	ldw	x,#15
2178  0103 9d            	nop	
2179  0104 84            	pop	a
2180                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2185  0105               L012:
2186  0105 5a            	decw	X
2187  0106 26fd          	jrne	L012
2188  0108               LC002:
2189  0108 9d            	nop	
2190                     
2192  0109 1e06          	ldw	x,(OFST-10,sp)
2193  010b               L5331:
2194                     ; 214 		if( hx711->Datos.Estado != TIMEOUT )
2196  010b e615          	ld	a,(21,x)
2197  010d a104          	cp	a,#4
2198  010f 2603cc01dd    	jreq	L5141
2199                     ; 216 			hx711->Datos.Estado = NUEVA_LECTURA;
2201  0114 a603          	ld	a,#3
2202  0116 e715          	ld	(21,x),a
2203  0118 cc01dd        	jra	L5141
2204  011b               L3321:
2205                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2208  011b 4b01          	push	#1
2209  011d 1e07          	ldw	x,(OFST-9,sp)
2210  011f 1c0004        	addw	x,#4
2211  0122 cd0000        	call	_NHALgpio_Write
2213  0125 ae000f        	ldw	x,#15
2214  0128 9d            	nop	
2215  0129 84            	pop	a
2216                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2221  012a               L412:
2222  012a 5a            	decw	X
2223  012b 26fd          	jrne	L412
2224  012d 9d            	nop	
2225                     
2227                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2230  012e 4b00          	push	#0
2231  0130 1e07          	ldw	x,(OFST-9,sp)
2232  0132 1c0004        	addw	x,#4
2233  0135 cd0000        	call	_NHALgpio_Write
2235  0138 ae000f        	ldw	x,#15
2236  013b 9d            	nop	
2237  013c 84            	pop	a
2238                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2243  013d               L022:
2244  013d 5a            	decw	X
2245  013e 26fd          	jrne	L022
2246  0140 9d            	nop	
2247                     
2249                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2252  0141 4b01          	push	#1
2253  0143 1e07          	ldw	x,(OFST-9,sp)
2254  0145 1c0004        	addw	x,#4
2255  0148 cd0000        	call	_NHALgpio_Write
2257  014b ae000f        	ldw	x,#15
2258  014e 9d            	nop	
2259  014f 84            	pop	a
2260                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2265  0150               L422:
2266  0150 5a            	decw	X
2267  0151 26fd          	jrne	L422
2268  0153 9d            	nop	
2269                     
2271                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2274  0154 4b00          	push	#0
2275  0156 1e07          	ldw	x,(OFST-9,sp)
2276  0158 1c0004        	addw	x,#4
2277  015b cd0000        	call	_NHALgpio_Write
2279  015e ae000f        	ldw	x,#15
2280  0161 9d            	nop	
2281  0162 84            	pop	a
2282                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2287  0163               L032:
2288  0163 5a            	decw	X
2289  0164 26fd          	jrne	L032
2290  0166 9d            	nop	
2291                     
2293                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2296  0167 4b01          	push	#1
2297  0169 1e07          	ldw	x,(OFST-9,sp)
2298  016b 1c0004        	addw	x,#4
2299  016e cd0000        	call	_NHALgpio_Write
2301  0171 ae000f        	ldw	x,#15
2302  0174 9d            	nop	
2303  0175 84            	pop	a
2304                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2309  0176               L432:
2310  0176 5a            	decw	X
2311  0177 26fd          	jrne	L432
2312  0179 9d            	nop	
2313                     
2315                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2318  017a 4b00          	push	#0
2319  017c 1e07          	ldw	x,(OFST-9,sp)
2320  017e 1c0004        	addw	x,#4
2321  0181 cd0000        	call	_NHALgpio_Write
2323  0184 ae000f        	ldw	x,#15
2324  0187 9d            	nop	
2325  0188 84            	pop	a
2326                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2331  0189               L042:
2332  0189 5a            	decw	X
2333  018a 26fd          	jrne	L042
2334                     
2336  018c cc0108        	jp	LC002
2337  018f               L1031:
2338                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2341  018f 4b01          	push	#1
2342  0191 1e07          	ldw	x,(OFST-9,sp)
2343  0193 1c0004        	addw	x,#4
2344  0196 cd0000        	call	_NHALgpio_Write
2346  0199 ae000f        	ldw	x,#15
2347  019c 9d            	nop	
2348  019d 84            	pop	a
2349                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2354  019e               L442:
2355  019e 5a            	decw	X
2356  019f 26fd          	jrne	L442
2357  01a1 9d            	nop	
2358                     
2360                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2363  01a2 4b00          	push	#0
2364  01a4 1e07          	ldw	x,(OFST-9,sp)
2365  01a6 1c0004        	addw	x,#4
2366  01a9 cd0000        	call	_NHALgpio_Write
2368  01ac ae000f        	ldw	x,#15
2369  01af 9d            	nop	
2370  01b0 84            	pop	a
2371                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2376  01b1               L052:
2377  01b1 5a            	decw	X
2378  01b2 26fd          	jrne	L052
2379  01b4 9d            	nop	
2380                     
2382                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2385  01b5 4b01          	push	#1
2386  01b7 1e07          	ldw	x,(OFST-9,sp)
2387  01b9 1c0004        	addw	x,#4
2388  01bc cd0000        	call	_NHALgpio_Write
2390  01bf ae000f        	ldw	x,#15
2391  01c2 9d            	nop	
2392  01c3 84            	pop	a
2393                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2398  01c4               L452:
2399  01c4 5a            	decw	X
2400  01c5 26fd          	jrne	L452
2401  01c7 9d            	nop	
2402                     
2404                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2407  01c8 4b00          	push	#0
2408  01ca 1e07          	ldw	x,(OFST-9,sp)
2409  01cc 1c0004        	addw	x,#4
2410  01cf cd0000        	call	_NHALgpio_Write
2412  01d2 ae000f        	ldw	x,#15
2413  01d5 9d            	nop	
2414  01d6 84            	pop	a
2415                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2420  01d7               L062:
2421  01d7 5a            	decw	X
2422  01d8 26fd          	jrne	L062
2423                     
2425  01da cc0108        	jp	LC002
2426  01dd               L5141:
2427                     ; 219 		return semilla;
2429  01dd 1e04          	ldw	x,(OFST-12,sp)
2430  01df 1f0a          	ldw	(OFST-6,sp),x
2431  01e1 1e02          	ldw	x,(OFST-14,sp)
2432  01e3 1f08          	ldw	(OFST-8,sp),x
2436  01e5 96            	ldw	x,sp
2437  01e6 1c0008        	addw	x,#OFST-8
2438  01e9 cd0000        	call	c_ltor
2440  01ec 96            	ldw	x,sp
2441  01ed 1c000c        	addw	x,#OFST-4
2442  01f0 cd0000        	call	c_lgadd
2445                     ; 366 		--repeticiones;
2447  01f3 0a10          	dec	(OFST+0,sp)
2449                     ; 363 	while( ( repeticiones > 0 ) )
2451  01f5 2703cc000c    	jrne	L7041
2452                     ; 368 	repeticiones = 4;
2454                     ; 370 	return valorMedio/repeticiones;
2456  01fa 96            	ldw	x,sp
2457  01fb 1c000c        	addw	x,#OFST-4
2458  01fe cd0000        	call	c_ltor
2460  0201 a602          	ld	a,#2
2461  0203 cd0000        	call	c_lursh
2463  0206 be02          	ldw	x,c_lreg+2
2466  0208 5b12          	addw	sp,#18
2467  020a 81            	ret	
2480                     	xdef	_hx711_Tarar
2481                     	xdef	_hx711_Lectura
2482                     	xdef	_HX711_Init
2483                     	xref	_Timeout_Stop
2484                     	xref	_Timeout_Start
2485                     	xref	_NHALgpio_Write
2486                     	xref	_NHALgpio_Read
2487                     	xref	_NHALgpio_Init
2488                     	xref	_NHALgpioConfig_SetType
2489                     	xref.b	c_lreg
2490                     	xref.b	c_x
2509                     	xref	c_lursh
2510                     	xref	c_lgadd
2511                     	xref	c_ludv
2512                     	xref	c_rtol
2513                     	xref	c_uitolx
2514                     	xref	c_lsub
2515                     	xref	c_lcmp
2516                     	xref	c_ltor
2517                     	xref	c_lgor
2518                     	end

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
 991                     ; 249 void HX711_Init( HX711_t_ptr hx711, HX711_fPtr Lectura, HX711_fPtr Tarar, Timeout_t_ptr Timeout )
 991                     ; 250 {
 993                     .text:	section	.text,new
 994  0000               _HX711_Init:
 996  0000 89            	pushw	x
 997  0001 89            	pushw	x
 998       00000002      OFST:	set	2
1001                     ; 251 	initPtrFunciones( hx711, Lectura, Tarar );
1005                     ; 67 	hx711->Lectura = Lectura;
1007  0002 1607          	ldw	y,(OFST+5,sp)
1008  0004 ef16          	ldw	(22,x),y
1009                     ; 68 	hx711->Tarar = Tarar;
1011  0006 1609          	ldw	y,(OFST+7,sp)
1012  0008 ef18          	ldw	(24,x),y
1013                     ; 253 	hx711->Timeout = Timeout;
1015  000a 160b          	ldw	y,(OFST+9,sp)
1016  000c ef14          	ldw	(20,x),y
1017                     ; 255 	initVariables( hx711 );
1021                     ; 73 	hx711->Datos.UltimaLectura = 0;
1023  000e 4f            	clr	a
1024  000f e712          	ld	(18,x),a
1025  0011 e711          	ld	(17,x),a
1026  0013 e710          	ld	(16,x),a
1027  0015 e70f          	ld	(15,x),a
1028                     ; 74 	hx711->Config.ValorTara = 0;
1030  0017 905f          	clrw	y
1031  0019 ef0d          	ldw	(13,x),y
1032                     ; 75 	hx711->Config.ValorConversion = 1;
1034  001b 905c          	incw	y
1035  001d ef09          	ldw	(9,x),y
1036                     ; 76 	hx711->Config.Ganancia = CHANNELA_128;
1038  001f 6f08          	clr	(8,x)
1039                     ; 257 	initDOUT( &hx711->Config.DOUT );
1042  0021 1f01          	ldw	(OFST-1,sp),x
1044                     ; 81 	NHALgpioConfig_SetType( dout,GPIO_MODE_IN_PU_NO_IT );
1046  0023 4b40          	push	#64
1047  0025 1e02          	ldw	x,(OFST+0,sp)
1048  0027 cd0000        	call	_NHALgpioConfig_SetType
1050  002a 84            	pop	a
1051                     ; 82 	NHALgpio_Init( dout );
1053  002b 1e01          	ldw	x,(OFST-1,sp)
1054  002d cd0000        	call	_NHALgpio_Init
1056                     ; 258 	initPDSCK( &hx711->Config.PD_SCK );
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
1075                     ; 260 	chequearValorConversion( hx711 );
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
1093  0055 e713          	ld	(19,x),a
1095  0057 2002          	jra	L521
1096  0059               L176:
1097                     ; 100 		hx711->Datos.Estado = INICIALIZADO;
1099  0059 6f13          	clr	(19,x)
1100  005b               L521:
1101                     ; 262 	aDormir( hx711 );
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
1130  0072 e613          	ld	a,(19,x)
1131  0074 4a            	dec	a
1132  0075 2704          	jreq	L331
1133                     ; 111 		hx711->Datos.Estado = SLEEP;
1135  0077 a602          	ld	a,#2
1136  0079 e713          	ld	(19,x),a
1138  007b               L331:
1139                     ; 263 }
1142  007b 5b04          	addw	sp,#4
1143  007d 81            	ret	
1262                     ; 298 uint16_t hx711_Lectura( HX711_t_ptr hx711 )
1262                     ; 299 {
1263                     .text:	section	.text,new
1264  0000               _hx711_Lectura:
1266  0000 89            	pushw	x
1267  0001 520b          	subw	sp,#11
1268       0000000b      OFST:	set	11
1271                     ; 300 	uint32_t semilla = 0;
1273                     ; 302 	semilla = leer( hx711 );
1276  0003 1f06          	ldw	(OFST-5,sp),x
1278                     ; 175 	uint32_t semilla = 0;
1280  0005 5f            	clrw	x
1281  0006 1f0a          	ldw	(OFST-1,sp),x
1282  0008 1f08          	ldw	(OFST-3,sp),x
1284                     ; 176 	uint8_t contadorBucle = 0;
1286  000a 0f05          	clr	(OFST-6,sp)
1288                     ; 178 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1290  000c 1e06          	ldw	x,(OFST-5,sp)
1291  000e e613          	ld	a,(19,x)
1292  0010 4a            	dec	a
1293  0011 2603cc01bc    	jreq	L3311
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
1316                     ; 159 	Timeout_Start( hx711->Timeout, 40 );
1319  0029 ae0028        	ldw	x,#40
1320  002c 89            	pushw	x
1321  002d 1e08          	ldw	x,(OFST-3,sp)
1322  002f ee14          	ldw	x,(20,x)
1323  0031 cd0000        	call	_Timeout_Start
1325  0034 85            	popw	x
1327  0035               L7311:
1328                     ; 160 	while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) || ( hx711->Timeout->Config.Notificacion( ) == 0 ) )
1330  0035 1e06          	ldw	x,(OFST-5,sp)
1331  0037 cd0000        	call	_NHALgpio_Read
1333  003a 4d            	tnz	a
1334  003b 26f8          	jrne	L7311
1336  003d 1e06          	ldw	x,(OFST-5,sp)
1337  003f ee14          	ldw	x,(20,x)
1338  0041 ee02          	ldw	x,(2,x)
1339  0043 fd            	call	(x)
1341  0044 4d            	tnz	a
1342  0045 27ee          	jreq	L7311
1343                     ; 165 	if( hx711->Timeout->Config.Notificacion( ) )
1345  0047 1e06          	ldw	x,(OFST-5,sp)
1346  0049 ee14          	ldw	x,(20,x)
1347  004b ee02          	ldw	x,(2,x)
1348  004d fd            	call	(x)
1350  004e 4d            	tnz	a
1351  004f 2706          	jreq	L3411
1352                     ; 167 		hx711->Datos.Estado = TIMEOUT;
1354  0051 1e06          	ldw	x,(OFST-5,sp)
1355  0053 a604          	ld	a,#4
1356  0055 e713          	ld	(19,x),a
1357  0057               L3411:
1358                     ; 169 	Timeout_Stop( hx711->Timeout );
1360  0057 1e06          	ldw	x,(OFST-5,sp)
1361  0059 ee14          	ldw	x,(20,x)
1362  005b cd0000        	call	_Timeout_Stop
1364                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1368  005e ae000f        	ldw	x,#15
1370  0061 9d            	nop	
1371  0062               L24:
1372  0062 5a            	decw	X
1373  0063 26fd          	jrne	L24
1374                     
1376  0065 2043          	jra	L7411
1377  0067               L5411:
1378                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1381  0067 4b01          	push	#1
1382  0069 1e07          	ldw	x,(OFST-4,sp)
1383  006b 1c0004        	addw	x,#4
1384  006e cd0000        	call	_NHALgpio_Write
1386  0071 ae000f        	ldw	x,#15
1387  0074 9d            	nop	
1388  0075 84            	pop	a
1389                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1394  0076               L64:
1395  0076 5a            	decw	X
1396  0077 26fd          	jrne	L64
1397  0079 9d            	nop	
1398                     
1400                     ; 193 			semilla |= NHALgpio_Read( &hx711->Config.DOUT );
1402  007a 1e06          	ldw	x,(OFST-5,sp)
1403  007c cd0000        	call	_NHALgpio_Read
1405  007f b703          	ld	c_lreg+3,a
1406  0081 3f02          	clr	c_lreg+2
1407  0083 3f01          	clr	c_lreg+1
1408  0085 3f00          	clr	c_lreg
1409  0087 96            	ldw	x,sp
1410  0088 1c0008        	addw	x,#OFST-3
1411  008b cd0000        	call	c_lgor
1414                     ; 194 			semilla <<= 1;
1416  008e 080b          	sll	(OFST+0,sp)
1417  0090 090a          	rlc	(OFST-1,sp)
1418  0092 0909          	rlc	(OFST-2,sp)
1419  0094 0908          	rlc	(OFST-3,sp)
1421                     ; 196 			contadorBucle++;
1423  0096 0c05          	inc	(OFST-6,sp)
1425                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1428  0098 4b00          	push	#0
1429  009a 1e07          	ldw	x,(OFST-4,sp)
1430  009c 1c0004        	addw	x,#4
1431  009f cd0000        	call	_NHALgpio_Write
1433  00a2 ae000f        	ldw	x,#15
1434  00a5 9d            	nop	
1435  00a6 84            	pop	a
1436                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1441  00a7               L45:
1442  00a7 5a            	decw	X
1443  00a8 26fd          	jrne	L45
1444                     
1446  00aa               L7411:
1447  00aa 9d            	nop	
1448                     ; 187 		while( contadorBucle < HX711_LONGITUDTRAMA ) 
1450  00ab 7b05          	ld	a,(OFST-6,sp)
1451  00ad a118          	cp	a,#24
1452  00af 25b6          	jrult	L5411
1453                     ; 126 	switch( hx711->Config.Ganancia )
1456  00b1 1e06          	ldw	x,(OFST-5,sp)
1457  00b3 e608          	ld	a,(8,x)
1459                     ; 151 		default:
1459                     ; 152 		
1459                     ; 153 		;
1460  00b5 270b          	jreq	L137
1461  00b7 4a            	dec	a
1462  00b8 2740          	jreq	L747
1463  00ba 4a            	dec	a
1464  00bb 2603cc016e    	jreq	L5101
1465  00c0 2028          	jra	L1501
1466  00c2               L137:
1467                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1470  00c2 4b01          	push	#1
1471  00c4 1e07          	ldw	x,(OFST-4,sp)
1472  00c6 1c0004        	addw	x,#4
1473  00c9 cd0000        	call	_NHALgpio_Write
1475  00cc ae000f        	ldw	x,#15
1476  00cf 9d            	nop	
1477  00d0 84            	pop	a
1478                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1483  00d1               L06:
1484  00d1 5a            	decw	X
1485  00d2 26fd          	jrne	L06
1486  00d4 9d            	nop	
1487                     
1489                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1492  00d5 4b00          	push	#0
1493  00d7 1e07          	ldw	x,(OFST-4,sp)
1494  00d9 1c0004        	addw	x,#4
1495  00dc cd0000        	call	_NHALgpio_Write
1497  00df ae000f        	ldw	x,#15
1498  00e2 9d            	nop	
1499  00e3 84            	pop	a
1500                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1505  00e4               L46:
1506  00e4 5a            	decw	X
1507  00e5 26fd          	jrne	L46
1508  00e7               LC001:
1509  00e7 9d            	nop	
1510                     
1512  00e8 1e06          	ldw	x,(OFST-5,sp)
1513  00ea               L1501:
1514                     ; 204 		if( hx711->Datos.Estado != TIMEOUT )
1516  00ea e613          	ld	a,(19,x)
1517  00ec a104          	cp	a,#4
1518  00ee 2603cc01bc    	jreq	L3311
1519                     ; 206 			hx711->Datos.Estado = NUEVA_LECTURA;
1521  00f3 a603          	ld	a,#3
1522  00f5 e713          	ld	(19,x),a
1523  00f7 cc01bc        	jra	L3311
1524  00fa               L747:
1525                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1528  00fa 4b01          	push	#1
1529  00fc 1e07          	ldw	x,(OFST-4,sp)
1530  00fe 1c0004        	addw	x,#4
1531  0101 cd0000        	call	_NHALgpio_Write
1533  0104 ae000f        	ldw	x,#15
1534  0107 9d            	nop	
1535  0108 84            	pop	a
1536                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1541  0109               L07:
1542  0109 5a            	decw	X
1543  010a 26fd          	jrne	L07
1544  010c 9d            	nop	
1545                     
1547                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1550  010d 4b00          	push	#0
1551  010f 1e07          	ldw	x,(OFST-4,sp)
1552  0111 1c0004        	addw	x,#4
1553  0114 cd0000        	call	_NHALgpio_Write
1555  0117 ae000f        	ldw	x,#15
1556  011a 9d            	nop	
1557  011b 84            	pop	a
1558                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1563  011c               L47:
1564  011c 5a            	decw	X
1565  011d 26fd          	jrne	L47
1566  011f 9d            	nop	
1567                     
1569                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1572  0120 4b01          	push	#1
1573  0122 1e07          	ldw	x,(OFST-4,sp)
1574  0124 1c0004        	addw	x,#4
1575  0127 cd0000        	call	_NHALgpio_Write
1577  012a ae000f        	ldw	x,#15
1578  012d 9d            	nop	
1579  012e 84            	pop	a
1580                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1585  012f               L001:
1586  012f 5a            	decw	X
1587  0130 26fd          	jrne	L001
1588  0132 9d            	nop	
1589                     
1591                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1594  0133 4b00          	push	#0
1595  0135 1e07          	ldw	x,(OFST-4,sp)
1596  0137 1c0004        	addw	x,#4
1597  013a cd0000        	call	_NHALgpio_Write
1599  013d ae000f        	ldw	x,#15
1600  0140 9d            	nop	
1601  0141 84            	pop	a
1602                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1607  0142               L401:
1608  0142 5a            	decw	X
1609  0143 26fd          	jrne	L401
1610  0145 9d            	nop	
1611                     
1613                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1616  0146 4b01          	push	#1
1617  0148 1e07          	ldw	x,(OFST-4,sp)
1618  014a 1c0004        	addw	x,#4
1619  014d cd0000        	call	_NHALgpio_Write
1621  0150 ae000f        	ldw	x,#15
1622  0153 9d            	nop	
1623  0154 84            	pop	a
1624                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1629  0155               L011:
1630  0155 5a            	decw	X
1631  0156 26fd          	jrne	L011
1632  0158 9d            	nop	
1633                     
1635                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1638  0159 4b00          	push	#0
1639  015b 1e07          	ldw	x,(OFST-4,sp)
1640  015d 1c0004        	addw	x,#4
1641  0160 cd0000        	call	_NHALgpio_Write
1643  0163 ae000f        	ldw	x,#15
1644  0166 9d            	nop	
1645  0167 84            	pop	a
1646                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1651  0168               L411:
1652  0168 5a            	decw	X
1653  0169 26fd          	jrne	L411
1654                     
1656  016b cc00e7        	jp	LC001
1657  016e               L5101:
1658                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1661  016e 4b01          	push	#1
1662  0170 1e07          	ldw	x,(OFST-4,sp)
1663  0172 1c0004        	addw	x,#4
1664  0175 cd0000        	call	_NHALgpio_Write
1666  0178 ae000f        	ldw	x,#15
1667  017b 9d            	nop	
1668  017c 84            	pop	a
1669                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1674  017d               L021:
1675  017d 5a            	decw	X
1676  017e 26fd          	jrne	L021
1677  0180 9d            	nop	
1678                     
1680                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1683  0181 4b00          	push	#0
1684  0183 1e07          	ldw	x,(OFST-4,sp)
1685  0185 1c0004        	addw	x,#4
1686  0188 cd0000        	call	_NHALgpio_Write
1688  018b ae000f        	ldw	x,#15
1689  018e 9d            	nop	
1690  018f 84            	pop	a
1691                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1696  0190               L421:
1697  0190 5a            	decw	X
1698  0191 26fd          	jrne	L421
1699  0193 9d            	nop	
1700                     
1702                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1705  0194 4b01          	push	#1
1706  0196 1e07          	ldw	x,(OFST-4,sp)
1707  0198 1c0004        	addw	x,#4
1708  019b cd0000        	call	_NHALgpio_Write
1710  019e ae000f        	ldw	x,#15
1711  01a1 9d            	nop	
1712  01a2 84            	pop	a
1713                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1718  01a3               L031:
1719  01a3 5a            	decw	X
1720  01a4 26fd          	jrne	L031
1721  01a6 9d            	nop	
1722                     
1724                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1727  01a7 4b00          	push	#0
1728  01a9 1e07          	ldw	x,(OFST-4,sp)
1729  01ab 1c0004        	addw	x,#4
1730  01ae cd0000        	call	_NHALgpio_Write
1732  01b1 ae000f        	ldw	x,#15
1733  01b4 9d            	nop	
1734  01b5 84            	pop	a
1735                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1740  01b6               L431:
1741  01b6 5a            	decw	X
1742  01b7 26fd          	jrne	L431
1743                     
1745  01b9 cc00e7        	jp	LC001
1746  01bc               L3311:
1747                     ; 209 		return semilla;
1752                     ; 303 	aDormir( hx711 );
1755  01bc 1e0c          	ldw	x,(OFST+1,sp)
1756  01be 1f06          	ldw	(OFST-5,sp),x
1758                     ; 106 	NHALgpio_Write( &hx711->Config.PD_SCK, true );
1760  01c0 4b01          	push	#1
1761  01c2 1e07          	ldw	x,(OFST-4,sp)
1762  01c4 1c0004        	addw	x,#4
1763  01c7 cd0000        	call	_NHALgpio_Write
1765  01ca ae0174        	ldw	x,#372
1766  01cd 9d            	nop	
1767  01ce 84            	pop	a
1768                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1773  01cf               L241:
1774  01cf 5a            	decw	X
1775  01d0 26fd          	jrne	L241
1776  01d2 9d            	nop	
1777                     
1779                     ; 109 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1781  01d3 1e06          	ldw	x,(OFST-5,sp)
1782  01d5 e613          	ld	a,(19,x)
1783  01d7 4a            	dec	a
1784  01d8 2704          	jreq	L1601
1785                     ; 111 		hx711->Datos.Estado = SLEEP;
1787  01da a602          	ld	a,#2
1788  01dc e713          	ld	(19,x),a
1790  01de               L1601:
1791                     ; 305 	return ( semilla / hx711->Config.ValorConversion );
1793  01de 1e0c          	ldw	x,(OFST+1,sp)
1794  01e0 ee09          	ldw	x,(9,x)
1795  01e2 cd0000        	call	c_uitolx
1797  01e5 96            	ldw	x,sp
1798  01e6 5c            	incw	x
1799  01e7 cd0000        	call	c_rtol
1802  01ea 96            	ldw	x,sp
1803  01eb 1c0008        	addw	x,#OFST-3
1804  01ee cd0000        	call	c_ltor
1806  01f1 96            	ldw	x,sp
1807  01f2 5c            	incw	x
1808  01f3 cd0000        	call	c_ludv
1810  01f6 be02          	ldw	x,c_lreg+2
1813  01f8 5b0d          	addw	sp,#13
1814  01fa 81            	ret	
1927                     ; 341 uint16_t hx711_Tarar( HX711_t_ptr hx711 )
1927                     ; 342 {
1928                     .text:	section	.text,new
1929  0000               _hx711_Tarar:
1931  0000 89            	pushw	x
1932  0001 5210          	subw	sp,#16
1933       00000010      OFST:	set	16
1936                     ; 343 	uint32_t valorMedio = 0;
1938  0003 5f            	clrw	x
1939  0004 1f0e          	ldw	(OFST-2,sp),x
1940  0006 1f0c          	ldw	(OFST-4,sp),x
1942                     ; 344 	uint8_t repeticiones = 4;
1944  0008 a604          	ld	a,#4
1945  000a 6b10          	ld	(OFST+0,sp),a
1947  000c               L7041:
1948                     ; 348 		valorMedio = valorMedio + leer( hx711 );
1951  000c 1e11          	ldw	x,(OFST+1,sp)
1952  000e 1f06          	ldw	(OFST-10,sp),x
1954                     ; 175 	uint32_t semilla = 0;
1956  0010 5f            	clrw	x
1957  0011 1f04          	ldw	(OFST-12,sp),x
1958  0013 1f02          	ldw	(OFST-14,sp),x
1960                     ; 176 	uint8_t contadorBucle = 0;
1962  0015 0f01          	clr	(OFST-15,sp)
1964                     ; 178 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1966  0017 1e06          	ldw	x,(OFST-10,sp)
1967  0019 e613          	ld	a,(19,x)
1968  001b 4a            	dec	a
1969  001c 2603cc01c7    	jreq	L5141
1970                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1973  0021 4b00          	push	#0
1974  0023 1e07          	ldw	x,(OFST-9,sp)
1975  0025 1c0004        	addw	x,#4
1976  0028 cd0000        	call	_NHALgpio_Write
1978  002b ae000f        	ldw	x,#15
1979  002e 9d            	nop	
1980  002f 84            	pop	a
1981                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1986  0030               L051:
1987  0030 5a            	decw	X
1988  0031 26fd          	jrne	L051
1989  0033 9d            	nop	
1990                     
1992                     ; 159 	Timeout_Start( hx711->Timeout, 40 );
1995  0034 ae0028        	ldw	x,#40
1996  0037 89            	pushw	x
1997  0038 1e08          	ldw	x,(OFST-8,sp)
1998  003a ee14          	ldw	x,(20,x)
1999  003c cd0000        	call	_Timeout_Start
2001  003f 85            	popw	x
2003  0040               L1241:
2004                     ; 160 	while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) || ( hx711->Timeout->Config.Notificacion( ) == 0 ) )
2006  0040 1e06          	ldw	x,(OFST-10,sp)
2007  0042 cd0000        	call	_NHALgpio_Read
2009  0045 4d            	tnz	a
2010  0046 26f8          	jrne	L1241
2012  0048 1e06          	ldw	x,(OFST-10,sp)
2013  004a ee14          	ldw	x,(20,x)
2014  004c ee02          	ldw	x,(2,x)
2015  004e fd            	call	(x)
2017  004f 4d            	tnz	a
2018  0050 27ee          	jreq	L1241
2019                     ; 165 	if( hx711->Timeout->Config.Notificacion( ) )
2021  0052 1e06          	ldw	x,(OFST-10,sp)
2022  0054 ee14          	ldw	x,(20,x)
2023  0056 ee02          	ldw	x,(2,x)
2024  0058 fd            	call	(x)
2026  0059 4d            	tnz	a
2027  005a 2706          	jreq	L5241
2028                     ; 167 		hx711->Datos.Estado = TIMEOUT;
2030  005c 1e06          	ldw	x,(OFST-10,sp)
2031  005e a604          	ld	a,#4
2032  0060 e713          	ld	(19,x),a
2033  0062               L5241:
2034                     ; 169 	Timeout_Stop( hx711->Timeout );
2036  0062 1e06          	ldw	x,(OFST-10,sp)
2037  0064 ee14          	ldw	x,(20,x)
2038  0066 cd0000        	call	_Timeout_Stop
2040                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2044  0069 ae000f        	ldw	x,#15
2046  006c 9d            	nop	
2047  006d               L461:
2048  006d 5a            	decw	X
2049  006e 26fd          	jrne	L461
2050                     
2052  0070 2043          	jra	L1341
2053  0072               L7241:
2054                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2057  0072 4b01          	push	#1
2058  0074 1e07          	ldw	x,(OFST-9,sp)
2059  0076 1c0004        	addw	x,#4
2060  0079 cd0000        	call	_NHALgpio_Write
2062  007c ae000f        	ldw	x,#15
2063  007f 9d            	nop	
2064  0080 84            	pop	a
2065                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2070  0081               L071:
2071  0081 5a            	decw	X
2072  0082 26fd          	jrne	L071
2073  0084 9d            	nop	
2074                     
2076                     ; 193 			semilla |= NHALgpio_Read( &hx711->Config.DOUT );
2078  0085 1e06          	ldw	x,(OFST-10,sp)
2079  0087 cd0000        	call	_NHALgpio_Read
2081  008a b703          	ld	c_lreg+3,a
2082  008c 3f02          	clr	c_lreg+2
2083  008e 3f01          	clr	c_lreg+1
2084  0090 3f00          	clr	c_lreg
2085  0092 96            	ldw	x,sp
2086  0093 1c0002        	addw	x,#OFST-14
2087  0096 cd0000        	call	c_lgor
2090                     ; 194 			semilla <<= 1;
2092  0099 0805          	sll	(OFST-11,sp)
2093  009b 0904          	rlc	(OFST-12,sp)
2094  009d 0903          	rlc	(OFST-13,sp)
2095  009f 0902          	rlc	(OFST-14,sp)
2097                     ; 196 			contadorBucle++;
2099  00a1 0c01          	inc	(OFST-15,sp)
2101                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2104  00a3 4b00          	push	#0
2105  00a5 1e07          	ldw	x,(OFST-9,sp)
2106  00a7 1c0004        	addw	x,#4
2107  00aa cd0000        	call	_NHALgpio_Write
2109  00ad ae000f        	ldw	x,#15
2110  00b0 9d            	nop	
2111  00b1 84            	pop	a
2112                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2117  00b2               L671:
2118  00b2 5a            	decw	X
2119  00b3 26fd          	jrne	L671
2120                     
2122  00b5               L1341:
2123  00b5 9d            	nop	
2124                     ; 187 		while( contadorBucle < HX711_LONGITUDTRAMA ) 
2126  00b6 7b01          	ld	a,(OFST-15,sp)
2127  00b8 a118          	cp	a,#24
2128  00ba 25b6          	jrult	L7241
2129                     ; 126 	switch( hx711->Config.Ganancia )
2132  00bc 1e06          	ldw	x,(OFST-10,sp)
2133  00be e608          	ld	a,(8,x)
2135                     ; 151 		default:
2135                     ; 152 		
2135                     ; 153 		;
2136  00c0 270b          	jreq	L5121
2137  00c2 4a            	dec	a
2138  00c3 2740          	jreq	L3321
2139  00c5 4a            	dec	a
2140  00c6 2603cc0179    	jreq	L1031
2141  00cb 2028          	jra	L5331
2142  00cd               L5121:
2143                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2146  00cd 4b01          	push	#1
2147  00cf 1e07          	ldw	x,(OFST-9,sp)
2148  00d1 1c0004        	addw	x,#4
2149  00d4 cd0000        	call	_NHALgpio_Write
2151  00d7 ae000f        	ldw	x,#15
2152  00da 9d            	nop	
2153  00db 84            	pop	a
2154                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2159  00dc               L202:
2160  00dc 5a            	decw	X
2161  00dd 26fd          	jrne	L202
2162  00df 9d            	nop	
2163                     
2165                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2168  00e0 4b00          	push	#0
2169  00e2 1e07          	ldw	x,(OFST-9,sp)
2170  00e4 1c0004        	addw	x,#4
2171  00e7 cd0000        	call	_NHALgpio_Write
2173  00ea ae000f        	ldw	x,#15
2174  00ed 9d            	nop	
2175  00ee 84            	pop	a
2176                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2181  00ef               L602:
2182  00ef 5a            	decw	X
2183  00f0 26fd          	jrne	L602
2184  00f2               LC002:
2185  00f2 9d            	nop	
2186                     
2188  00f3 1e06          	ldw	x,(OFST-10,sp)
2189  00f5               L5331:
2190                     ; 204 		if( hx711->Datos.Estado != TIMEOUT )
2192  00f5 e613          	ld	a,(19,x)
2193  00f7 a104          	cp	a,#4
2194  00f9 2603cc01c7    	jreq	L5141
2195                     ; 206 			hx711->Datos.Estado = NUEVA_LECTURA;
2197  00fe a603          	ld	a,#3
2198  0100 e713          	ld	(19,x),a
2199  0102 cc01c7        	jra	L5141
2200  0105               L3321:
2201                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2204  0105 4b01          	push	#1
2205  0107 1e07          	ldw	x,(OFST-9,sp)
2206  0109 1c0004        	addw	x,#4
2207  010c cd0000        	call	_NHALgpio_Write
2209  010f ae000f        	ldw	x,#15
2210  0112 9d            	nop	
2211  0113 84            	pop	a
2212                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2217  0114               L212:
2218  0114 5a            	decw	X
2219  0115 26fd          	jrne	L212
2220  0117 9d            	nop	
2221                     
2223                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2226  0118 4b00          	push	#0
2227  011a 1e07          	ldw	x,(OFST-9,sp)
2228  011c 1c0004        	addw	x,#4
2229  011f cd0000        	call	_NHALgpio_Write
2231  0122 ae000f        	ldw	x,#15
2232  0125 9d            	nop	
2233  0126 84            	pop	a
2234                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2239  0127               L612:
2240  0127 5a            	decw	X
2241  0128 26fd          	jrne	L612
2242  012a 9d            	nop	
2243                     
2245                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2248  012b 4b01          	push	#1
2249  012d 1e07          	ldw	x,(OFST-9,sp)
2250  012f 1c0004        	addw	x,#4
2251  0132 cd0000        	call	_NHALgpio_Write
2253  0135 ae000f        	ldw	x,#15
2254  0138 9d            	nop	
2255  0139 84            	pop	a
2256                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2261  013a               L222:
2262  013a 5a            	decw	X
2263  013b 26fd          	jrne	L222
2264  013d 9d            	nop	
2265                     
2267                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2270  013e 4b00          	push	#0
2271  0140 1e07          	ldw	x,(OFST-9,sp)
2272  0142 1c0004        	addw	x,#4
2273  0145 cd0000        	call	_NHALgpio_Write
2275  0148 ae000f        	ldw	x,#15
2276  014b 9d            	nop	
2277  014c 84            	pop	a
2278                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2283  014d               L622:
2284  014d 5a            	decw	X
2285  014e 26fd          	jrne	L622
2286  0150 9d            	nop	
2287                     
2289                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2292  0151 4b01          	push	#1
2293  0153 1e07          	ldw	x,(OFST-9,sp)
2294  0155 1c0004        	addw	x,#4
2295  0158 cd0000        	call	_NHALgpio_Write
2297  015b ae000f        	ldw	x,#15
2298  015e 9d            	nop	
2299  015f 84            	pop	a
2300                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2305  0160               L232:
2306  0160 5a            	decw	X
2307  0161 26fd          	jrne	L232
2308  0163 9d            	nop	
2309                     
2311                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2314  0164 4b00          	push	#0
2315  0166 1e07          	ldw	x,(OFST-9,sp)
2316  0168 1c0004        	addw	x,#4
2317  016b cd0000        	call	_NHALgpio_Write
2319  016e ae000f        	ldw	x,#15
2320  0171 9d            	nop	
2321  0172 84            	pop	a
2322                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2327  0173               L632:
2328  0173 5a            	decw	X
2329  0174 26fd          	jrne	L632
2330                     
2332  0176 cc00f2        	jp	LC002
2333  0179               L1031:
2334                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2337  0179 4b01          	push	#1
2338  017b 1e07          	ldw	x,(OFST-9,sp)
2339  017d 1c0004        	addw	x,#4
2340  0180 cd0000        	call	_NHALgpio_Write
2342  0183 ae000f        	ldw	x,#15
2343  0186 9d            	nop	
2344  0187 84            	pop	a
2345                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2350  0188               L242:
2351  0188 5a            	decw	X
2352  0189 26fd          	jrne	L242
2353  018b 9d            	nop	
2354                     
2356                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2359  018c 4b00          	push	#0
2360  018e 1e07          	ldw	x,(OFST-9,sp)
2361  0190 1c0004        	addw	x,#4
2362  0193 cd0000        	call	_NHALgpio_Write
2364  0196 ae000f        	ldw	x,#15
2365  0199 9d            	nop	
2366  019a 84            	pop	a
2367                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2372  019b               L642:
2373  019b 5a            	decw	X
2374  019c 26fd          	jrne	L642
2375  019e 9d            	nop	
2376                     
2378                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2381  019f 4b01          	push	#1
2382  01a1 1e07          	ldw	x,(OFST-9,sp)
2383  01a3 1c0004        	addw	x,#4
2384  01a6 cd0000        	call	_NHALgpio_Write
2386  01a9 ae000f        	ldw	x,#15
2387  01ac 9d            	nop	
2388  01ad 84            	pop	a
2389                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2394  01ae               L252:
2395  01ae 5a            	decw	X
2396  01af 26fd          	jrne	L252
2397  01b1 9d            	nop	
2398                     
2400                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2403  01b2 4b00          	push	#0
2404  01b4 1e07          	ldw	x,(OFST-9,sp)
2405  01b6 1c0004        	addw	x,#4
2406  01b9 cd0000        	call	_NHALgpio_Write
2408  01bc ae000f        	ldw	x,#15
2409  01bf 9d            	nop	
2410  01c0 84            	pop	a
2411                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2416  01c1               L652:
2417  01c1 5a            	decw	X
2418  01c2 26fd          	jrne	L652
2419                     
2421  01c4 cc00f2        	jp	LC002
2422  01c7               L5141:
2423                     ; 209 		return semilla;
2425  01c7 1e04          	ldw	x,(OFST-12,sp)
2426  01c9 1f0a          	ldw	(OFST-6,sp),x
2427  01cb 1e02          	ldw	x,(OFST-14,sp)
2428  01cd 1f08          	ldw	(OFST-8,sp),x
2432  01cf 96            	ldw	x,sp
2433  01d0 1c0008        	addw	x,#OFST-8
2434  01d3 cd0000        	call	c_ltor
2436  01d6 96            	ldw	x,sp
2437  01d7 1c000c        	addw	x,#OFST-4
2438  01da cd0000        	call	c_lgadd
2441                     ; 350 		--repeticiones;
2443  01dd 0a10          	dec	(OFST+0,sp)
2445                     ; 346 	while( ( repeticiones > 0 ) )
2447  01df 2703cc000c    	jrne	L7041
2448                     ; 352 	repeticiones = 4;
2450                     ; 354 	return valorMedio/repeticiones;
2452  01e4 96            	ldw	x,sp
2453  01e5 1c000c        	addw	x,#OFST-4
2454  01e8 cd0000        	call	c_ltor
2456  01eb a602          	ld	a,#2
2457  01ed cd0000        	call	c_lursh
2459  01f0 be02          	ldw	x,c_lreg+2
2462  01f2 5b12          	addw	sp,#18
2463  01f4 81            	ret	
2476                     	xdef	_hx711_Tarar
2477                     	xdef	_hx711_Lectura
2478                     	xdef	_HX711_Init
2479                     	xref	_Timeout_Stop
2480                     	xref	_Timeout_Start
2481                     	xref	_NHALgpio_Write
2482                     	xref	_NHALgpio_Read
2483                     	xref	_NHALgpio_Init
2484                     	xref	_NHALgpioConfig_SetType
2485                     	xref.b	c_lreg
2486                     	xref.b	c_x
2505                     	xref	c_lursh
2506                     	xref	c_lgadd
2507                     	xref	c_ludv
2508                     	xref	c_rtol
2509                     	xref	c_uitolx
2510                     	xref	c_ltor
2511                     	xref	c_lgor
2512                     	end

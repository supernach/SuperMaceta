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
 927                     ; 249 void HX711_Init( HX711_t_ptr hx711, HX711_fPtr Lectura, HX711_fPtr Tarar, Timeout_t_ptr Timeout )
 927                     ; 250 {
 929                     .text:	section	.text,new
 930  0000               _HX711_Init:
 932  0000 89            	pushw	x
 933  0001 89            	pushw	x
 934       00000002      OFST:	set	2
 937                     ; 251 	initPtrFunciones( hx711, Lectura, Tarar );
 941                     ; 67 	hx711->Lectura = Lectura;
 943  0002 1607          	ldw	y,(OFST+5,sp)
 944  0004 ef16          	ldw	(22,x),y
 945                     ; 68 	hx711->Tarar = Tarar;
 947  0006 1609          	ldw	y,(OFST+7,sp)
 948  0008 ef18          	ldw	(24,x),y
 949                     ; 253 	hx711->Timeout = Timeout;
 951  000a 160b          	ldw	y,(OFST+9,sp)
 952  000c ef14          	ldw	(20,x),y
 953                     ; 255 	initVariables( hx711 );
 957                     ; 73 	hx711->Datos.UltimaLectura = 0;
 959  000e 4f            	clr	a
 960  000f e712          	ld	(18,x),a
 961  0011 e711          	ld	(17,x),a
 962  0013 e710          	ld	(16,x),a
 963  0015 e70f          	ld	(15,x),a
 964                     ; 74 	hx711->Config.ValorTara = 0;
 966  0017 905f          	clrw	y
 967  0019 ef0d          	ldw	(13,x),y
 968                     ; 75 	hx711->Config.ValorConversion = 1;
 970  001b 905c          	incw	y
 971  001d ef09          	ldw	(9,x),y
 972                     ; 76 	hx711->Config.Ganancia = CHANNELA_128;
 974  001f 6f08          	clr	(8,x)
 975                     ; 257 	initDOUT( &hx711->Config.DOUT );
 978  0021 1f01          	ldw	(OFST-1,sp),x
 980                     ; 81 	NHALgpioConfig_SetType( dout,GPIO_MODE_IN_PU_NO_IT );
 982  0023 4b40          	push	#64
 983  0025 1e02          	ldw	x,(OFST+0,sp)
 984  0027 cd0000        	call	_NHALgpioConfig_SetType
 986  002a 84            	pop	a
 987                     ; 82 	NHALgpio_Init( dout );
 989  002b 1e01          	ldw	x,(OFST-1,sp)
 990  002d cd0000        	call	_NHALgpio_Init
 992                     ; 258 	initPDSCK( &hx711->Config.PD_SCK );
 995  0030 1e03          	ldw	x,(OFST+1,sp)
 996  0032 1c0004        	addw	x,#4
 997  0035 1f01          	ldw	(OFST-1,sp),x
 999                     ; 87 	NHALgpioConfig_SetType( pdsck, GPIO_MODE_OUT_PP_LOW_FAST );
1001  0037 4be0          	push	#224
1002  0039 1e02          	ldw	x,(OFST+0,sp)
1003  003b cd0000        	call	_NHALgpioConfig_SetType
1005  003e 84            	pop	a
1006                     ; 88 	NHALgpio_Init( pdsck );
1008  003f 1e01          	ldw	x,(OFST-1,sp)
1009  0041 cd0000        	call	_NHALgpio_Init
1011                     ; 260 	chequearValorConversion( hx711 );
1014  0044 1e03          	ldw	x,(OFST+1,sp)
1015  0046 1f01          	ldw	(OFST-1,sp),x
1017                     ; 93 	if( ( hx711->Config.ValorConversion ) == 0 )
1019  0048 e60a          	ld	a,(10,x)
1020  004a ea09          	or	a,(9,x)
1021  004c 260b          	jrne	L336
1022                     ; 95 		hx711->Config.ValorConversion = 1;
1024  004e 90ae0001      	ldw	y,#1
1025  0052 ef09          	ldw	(9,x),y
1026                     ; 96 		hx711->Datos.Estado = SINVALORCONVERSION;
1028  0054 4c            	inc	a
1029  0055 e713          	ld	(19,x),a
1031  0057 2002          	jra	L521
1032  0059               L336:
1033                     ; 100 		hx711->Datos.Estado = INICIALIZADO;
1035  0059 6f13          	clr	(19,x)
1036  005b               L521:
1037                     ; 262 	aDormir( hx711 );
1040  005b 1f01          	ldw	(OFST-1,sp),x
1042                     ; 106 	NHALgpio_Write( &hx711->Config.PD_SCK, true );
1044  005d 4b01          	push	#1
1045  005f 1e02          	ldw	x,(OFST+0,sp)
1046  0061 1c0004        	addw	x,#4
1047  0064 cd0000        	call	_NHALgpio_Write
1049  0067 ae0174        	ldw	x,#372
1050  006a 9d            	nop	
1051  006b 84            	pop	a
1052                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1057  006c               L02:
1058  006c 5a            	decw	X
1059  006d 26fd          	jrne	L02
1060  006f 9d            	nop	
1061                     
1063                     ; 109 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1065  0070 1e01          	ldw	x,(OFST-1,sp)
1066  0072 e613          	ld	a,(19,x)
1067  0074 4a            	dec	a
1068  0075 2704          	jreq	L331
1069                     ; 111 		hx711->Datos.Estado = SLEEP;
1071  0077 a602          	ld	a,#2
1072  0079 e713          	ld	(19,x),a
1074  007b               L331:
1075                     ; 263 }
1078  007b 5b04          	addw	sp,#4
1079  007d 81            	ret	
1198                     ; 298 uint16_t hx711_Lectura( HX711_t_ptr hx711 )
1198                     ; 299 {
1199                     .text:	section	.text,new
1200  0000               _hx711_Lectura:
1202  0000 89            	pushw	x
1203  0001 520b          	subw	sp,#11
1204       0000000b      OFST:	set	11
1207                     ; 300 	uint32_t semilla = 0;
1209                     ; 302 	semilla = leer( hx711 );
1212  0003 1f06          	ldw	(OFST-5,sp),x
1214                     ; 175 	uint32_t semilla = 0;
1216  0005 5f            	clrw	x
1217  0006 1f0a          	ldw	(OFST-1,sp),x
1218  0008 1f08          	ldw	(OFST-3,sp),x
1220                     ; 176 	uint8_t contadorBucle = 0;
1222  000a 0f05          	clr	(OFST-6,sp)
1224                     ; 178 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1226  000c 1e06          	ldw	x,(OFST-5,sp)
1227  000e e613          	ld	a,(19,x)
1228  0010 4a            	dec	a
1229  0011 2603cc01bc    	jreq	L5701
1230                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1233  0016 4b00          	push	#0
1234  0018 1e07          	ldw	x,(OFST-4,sp)
1235  001a 1c0004        	addw	x,#4
1236  001d cd0000        	call	_NHALgpio_Write
1238  0020 ae000f        	ldw	x,#15
1239  0023 9d            	nop	
1240  0024 84            	pop	a
1241                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1246  0025               L62:
1247  0025 5a            	decw	X
1248  0026 26fd          	jrne	L62
1249  0028 9d            	nop	
1250                     
1252                     ; 159 	Timeout_Start( hx711->Timeout, 40 );
1255  0029 ae0028        	ldw	x,#40
1256  002c 89            	pushw	x
1257  002d 1e08          	ldw	x,(OFST-3,sp)
1258  002f ee14          	ldw	x,(20,x)
1259  0031 cd0000        	call	_Timeout_Start
1261  0034 85            	popw	x
1263  0035               L1011:
1264                     ; 160 	while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) || ( hx711->Timeout->Config.Notificacion( ) == 0 ) )
1266  0035 1e06          	ldw	x,(OFST-5,sp)
1267  0037 cd0000        	call	_NHALgpio_Read
1269  003a 4d            	tnz	a
1270  003b 26f8          	jrne	L1011
1272  003d 1e06          	ldw	x,(OFST-5,sp)
1273  003f ee14          	ldw	x,(20,x)
1274  0041 ee02          	ldw	x,(2,x)
1275  0043 fd            	call	(x)
1277  0044 4d            	tnz	a
1278  0045 27ee          	jreq	L1011
1279                     ; 165 	if( hx711->Timeout->Config.Notificacion( ) )
1281  0047 1e06          	ldw	x,(OFST-5,sp)
1282  0049 ee14          	ldw	x,(20,x)
1283  004b ee02          	ldw	x,(2,x)
1284  004d fd            	call	(x)
1286  004e 4d            	tnz	a
1287  004f 2706          	jreq	L5011
1288                     ; 167 		hx711->Datos.Estado = TIMEOUT;
1290  0051 1e06          	ldw	x,(OFST-5,sp)
1291  0053 a604          	ld	a,#4
1292  0055 e713          	ld	(19,x),a
1293  0057               L5011:
1294                     ; 169 	Timeout_Stop( hx711->Timeout );
1296  0057 1e06          	ldw	x,(OFST-5,sp)
1297  0059 ee14          	ldw	x,(20,x)
1298  005b cd0000        	call	_Timeout_Stop
1300                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1304  005e ae000f        	ldw	x,#15
1306  0061 9d            	nop	
1307  0062               L24:
1308  0062 5a            	decw	X
1309  0063 26fd          	jrne	L24
1310                     
1312  0065 2043          	jra	L1111
1313  0067               L7011:
1314                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1317  0067 4b01          	push	#1
1318  0069 1e07          	ldw	x,(OFST-4,sp)
1319  006b 1c0004        	addw	x,#4
1320  006e cd0000        	call	_NHALgpio_Write
1322  0071 ae000f        	ldw	x,#15
1323  0074 9d            	nop	
1324  0075 84            	pop	a
1325                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1330  0076               L64:
1331  0076 5a            	decw	X
1332  0077 26fd          	jrne	L64
1333  0079 9d            	nop	
1334                     
1336                     ; 193 			semilla |= NHALgpio_Read( &hx711->Config.DOUT );
1338  007a 1e06          	ldw	x,(OFST-5,sp)
1339  007c cd0000        	call	_NHALgpio_Read
1341  007f b703          	ld	c_lreg+3,a
1342  0081 3f02          	clr	c_lreg+2
1343  0083 3f01          	clr	c_lreg+1
1344  0085 3f00          	clr	c_lreg
1345  0087 96            	ldw	x,sp
1346  0088 1c0008        	addw	x,#OFST-3
1347  008b cd0000        	call	c_lgor
1350                     ; 194 			semilla <<= 1;
1352  008e 080b          	sll	(OFST+0,sp)
1353  0090 090a          	rlc	(OFST-1,sp)
1354  0092 0909          	rlc	(OFST-2,sp)
1355  0094 0908          	rlc	(OFST-3,sp)
1357                     ; 196 			contadorBucle++;
1359  0096 0c05          	inc	(OFST-6,sp)
1361                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1364  0098 4b00          	push	#0
1365  009a 1e07          	ldw	x,(OFST-4,sp)
1366  009c 1c0004        	addw	x,#4
1367  009f cd0000        	call	_NHALgpio_Write
1369  00a2 ae000f        	ldw	x,#15
1370  00a5 9d            	nop	
1371  00a6 84            	pop	a
1372                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1377  00a7               L45:
1378  00a7 5a            	decw	X
1379  00a8 26fd          	jrne	L45
1380                     
1382  00aa               L1111:
1383  00aa 9d            	nop	
1384                     ; 187 		while( contadorBucle < HX711_LONGITUDTRAMA ) 
1386  00ab 7b05          	ld	a,(OFST-6,sp)
1387  00ad a118          	cp	a,#24
1388  00af 25b6          	jrult	L7011
1389                     ; 126 	switch( hx711->Config.Ganancia )
1392  00b1 1e06          	ldw	x,(OFST-5,sp)
1393  00b3 e608          	ld	a,(8,x)
1395                     ; 151 		default:
1395                     ; 152 		
1395                     ; 153 		;
1396  00b5 270b          	jreq	L376
1397  00b7 4a            	dec	a
1398  00b8 2740          	jreq	L117
1399  00ba 4a            	dec	a
1400  00bb 2603cc016e    	jreq	L757
1401  00c0 2028          	jra	L3101
1402  00c2               L376:
1403                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1406  00c2 4b01          	push	#1
1407  00c4 1e07          	ldw	x,(OFST-4,sp)
1408  00c6 1c0004        	addw	x,#4
1409  00c9 cd0000        	call	_NHALgpio_Write
1411  00cc ae000f        	ldw	x,#15
1412  00cf 9d            	nop	
1413  00d0 84            	pop	a
1414                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1419  00d1               L06:
1420  00d1 5a            	decw	X
1421  00d2 26fd          	jrne	L06
1422  00d4 9d            	nop	
1423                     
1425                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1428  00d5 4b00          	push	#0
1429  00d7 1e07          	ldw	x,(OFST-4,sp)
1430  00d9 1c0004        	addw	x,#4
1431  00dc cd0000        	call	_NHALgpio_Write
1433  00df ae000f        	ldw	x,#15
1434  00e2 9d            	nop	
1435  00e3 84            	pop	a
1436                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1441  00e4               L46:
1442  00e4 5a            	decw	X
1443  00e5 26fd          	jrne	L46
1444  00e7               LC001:
1445  00e7 9d            	nop	
1446                     
1448  00e8 1e06          	ldw	x,(OFST-5,sp)
1449  00ea               L3101:
1450                     ; 204 		if( hx711->Datos.Estado != TIMEOUT )
1452  00ea e613          	ld	a,(19,x)
1453  00ec a104          	cp	a,#4
1454  00ee 2603cc01bc    	jreq	L5701
1455                     ; 206 			hx711->Datos.Estado = NUEVA_LECTURA;
1457  00f3 a603          	ld	a,#3
1458  00f5 e713          	ld	(19,x),a
1459  00f7 cc01bc        	jra	L5701
1460  00fa               L117:
1461                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1464  00fa 4b01          	push	#1
1465  00fc 1e07          	ldw	x,(OFST-4,sp)
1466  00fe 1c0004        	addw	x,#4
1467  0101 cd0000        	call	_NHALgpio_Write
1469  0104 ae000f        	ldw	x,#15
1470  0107 9d            	nop	
1471  0108 84            	pop	a
1472                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1477  0109               L07:
1478  0109 5a            	decw	X
1479  010a 26fd          	jrne	L07
1480  010c 9d            	nop	
1481                     
1483                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1486  010d 4b00          	push	#0
1487  010f 1e07          	ldw	x,(OFST-4,sp)
1488  0111 1c0004        	addw	x,#4
1489  0114 cd0000        	call	_NHALgpio_Write
1491  0117 ae000f        	ldw	x,#15
1492  011a 9d            	nop	
1493  011b 84            	pop	a
1494                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1499  011c               L47:
1500  011c 5a            	decw	X
1501  011d 26fd          	jrne	L47
1502  011f 9d            	nop	
1503                     
1505                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1508  0120 4b01          	push	#1
1509  0122 1e07          	ldw	x,(OFST-4,sp)
1510  0124 1c0004        	addw	x,#4
1511  0127 cd0000        	call	_NHALgpio_Write
1513  012a ae000f        	ldw	x,#15
1514  012d 9d            	nop	
1515  012e 84            	pop	a
1516                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1521  012f               L001:
1522  012f 5a            	decw	X
1523  0130 26fd          	jrne	L001
1524  0132 9d            	nop	
1525                     
1527                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1530  0133 4b00          	push	#0
1531  0135 1e07          	ldw	x,(OFST-4,sp)
1532  0137 1c0004        	addw	x,#4
1533  013a cd0000        	call	_NHALgpio_Write
1535  013d ae000f        	ldw	x,#15
1536  0140 9d            	nop	
1537  0141 84            	pop	a
1538                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1543  0142               L401:
1544  0142 5a            	decw	X
1545  0143 26fd          	jrne	L401
1546  0145 9d            	nop	
1547                     
1549                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1552  0146 4b01          	push	#1
1553  0148 1e07          	ldw	x,(OFST-4,sp)
1554  014a 1c0004        	addw	x,#4
1555  014d cd0000        	call	_NHALgpio_Write
1557  0150 ae000f        	ldw	x,#15
1558  0153 9d            	nop	
1559  0154 84            	pop	a
1560                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1565  0155               L011:
1566  0155 5a            	decw	X
1567  0156 26fd          	jrne	L011
1568  0158 9d            	nop	
1569                     
1571                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1574  0159 4b00          	push	#0
1575  015b 1e07          	ldw	x,(OFST-4,sp)
1576  015d 1c0004        	addw	x,#4
1577  0160 cd0000        	call	_NHALgpio_Write
1579  0163 ae000f        	ldw	x,#15
1580  0166 9d            	nop	
1581  0167 84            	pop	a
1582                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1587  0168               L411:
1588  0168 5a            	decw	X
1589  0169 26fd          	jrne	L411
1590                     
1592  016b cc00e7        	jp	LC001
1593  016e               L757:
1594                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1597  016e 4b01          	push	#1
1598  0170 1e07          	ldw	x,(OFST-4,sp)
1599  0172 1c0004        	addw	x,#4
1600  0175 cd0000        	call	_NHALgpio_Write
1602  0178 ae000f        	ldw	x,#15
1603  017b 9d            	nop	
1604  017c 84            	pop	a
1605                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1610  017d               L021:
1611  017d 5a            	decw	X
1612  017e 26fd          	jrne	L021
1613  0180 9d            	nop	
1614                     
1616                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1619  0181 4b00          	push	#0
1620  0183 1e07          	ldw	x,(OFST-4,sp)
1621  0185 1c0004        	addw	x,#4
1622  0188 cd0000        	call	_NHALgpio_Write
1624  018b ae000f        	ldw	x,#15
1625  018e 9d            	nop	
1626  018f 84            	pop	a
1627                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1632  0190               L421:
1633  0190 5a            	decw	X
1634  0191 26fd          	jrne	L421
1635  0193 9d            	nop	
1636                     
1638                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1641  0194 4b01          	push	#1
1642  0196 1e07          	ldw	x,(OFST-4,sp)
1643  0198 1c0004        	addw	x,#4
1644  019b cd0000        	call	_NHALgpio_Write
1646  019e ae000f        	ldw	x,#15
1647  01a1 9d            	nop	
1648  01a2 84            	pop	a
1649                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1654  01a3               L031:
1655  01a3 5a            	decw	X
1656  01a4 26fd          	jrne	L031
1657  01a6 9d            	nop	
1658                     
1660                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1663  01a7 4b00          	push	#0
1664  01a9 1e07          	ldw	x,(OFST-4,sp)
1665  01ab 1c0004        	addw	x,#4
1666  01ae cd0000        	call	_NHALgpio_Write
1668  01b1 ae000f        	ldw	x,#15
1669  01b4 9d            	nop	
1670  01b5 84            	pop	a
1671                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1676  01b6               L431:
1677  01b6 5a            	decw	X
1678  01b7 26fd          	jrne	L431
1679                     
1681  01b9 cc00e7        	jp	LC001
1682  01bc               L5701:
1683                     ; 209 		return semilla;
1688                     ; 303 	aDormir( hx711 );
1691  01bc 1e0c          	ldw	x,(OFST+1,sp)
1692  01be 1f06          	ldw	(OFST-5,sp),x
1694                     ; 106 	NHALgpio_Write( &hx711->Config.PD_SCK, true );
1696  01c0 4b01          	push	#1
1697  01c2 1e07          	ldw	x,(OFST-4,sp)
1698  01c4 1c0004        	addw	x,#4
1699  01c7 cd0000        	call	_NHALgpio_Write
1701  01ca ae0174        	ldw	x,#372
1702  01cd 9d            	nop	
1703  01ce 84            	pop	a
1704                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1709  01cf               L241:
1710  01cf 5a            	decw	X
1711  01d0 26fd          	jrne	L241
1712  01d2 9d            	nop	
1713                     
1715                     ; 109 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1717  01d3 1e06          	ldw	x,(OFST-5,sp)
1718  01d5 e613          	ld	a,(19,x)
1719  01d7 4a            	dec	a
1720  01d8 2704          	jreq	L3201
1721                     ; 111 		hx711->Datos.Estado = SLEEP;
1723  01da a602          	ld	a,#2
1724  01dc e713          	ld	(19,x),a
1726  01de               L3201:
1727                     ; 305 	return ( semilla / hx711->Config.ValorConversion );
1729  01de 1e0c          	ldw	x,(OFST+1,sp)
1730  01e0 ee09          	ldw	x,(9,x)
1731  01e2 cd0000        	call	c_uitolx
1733  01e5 96            	ldw	x,sp
1734  01e6 5c            	incw	x
1735  01e7 cd0000        	call	c_rtol
1738  01ea 96            	ldw	x,sp
1739  01eb 1c0008        	addw	x,#OFST-3
1740  01ee cd0000        	call	c_ltor
1742  01f1 96            	ldw	x,sp
1743  01f2 5c            	incw	x
1744  01f3 cd0000        	call	c_ludv
1746  01f6 be02          	ldw	x,c_lreg+2
1749  01f8 5b0d          	addw	sp,#13
1750  01fa 81            	ret	
1863                     ; 341 uint16_t hx711_Tarar( HX711_t_ptr hx711 )
1863                     ; 342 {
1864                     .text:	section	.text,new
1865  0000               _hx711_Tarar:
1867  0000 89            	pushw	x
1868  0001 5210          	subw	sp,#16
1869       00000010      OFST:	set	16
1872                     ; 343 	uint32_t valorMedio = 0;
1874  0003 5f            	clrw	x
1875  0004 1f0e          	ldw	(OFST-2,sp),x
1876  0006 1f0c          	ldw	(OFST-4,sp),x
1878                     ; 344 	uint8_t repeticiones = 4;
1880  0008 a604          	ld	a,#4
1881  000a 6b10          	ld	(OFST+0,sp),a
1883  000c               L1531:
1884                     ; 348 		valorMedio = valorMedio + leer( hx711 );
1887  000c 1e11          	ldw	x,(OFST+1,sp)
1888  000e 1f06          	ldw	(OFST-10,sp),x
1890                     ; 175 	uint32_t semilla = 0;
1892  0010 5f            	clrw	x
1893  0011 1f04          	ldw	(OFST-12,sp),x
1894  0013 1f02          	ldw	(OFST-14,sp),x
1896                     ; 176 	uint8_t contadorBucle = 0;
1898  0015 0f01          	clr	(OFST-15,sp)
1900                     ; 178 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1902  0017 1e06          	ldw	x,(OFST-10,sp)
1903  0019 e613          	ld	a,(19,x)
1904  001b 4a            	dec	a
1905  001c 2603cc01c7    	jreq	L7531
1906                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1909  0021 4b00          	push	#0
1910  0023 1e07          	ldw	x,(OFST-9,sp)
1911  0025 1c0004        	addw	x,#4
1912  0028 cd0000        	call	_NHALgpio_Write
1914  002b ae000f        	ldw	x,#15
1915  002e 9d            	nop	
1916  002f 84            	pop	a
1917                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1922  0030               L051:
1923  0030 5a            	decw	X
1924  0031 26fd          	jrne	L051
1925  0033 9d            	nop	
1926                     
1928                     ; 159 	Timeout_Start( hx711->Timeout, 40 );
1931  0034 ae0028        	ldw	x,#40
1932  0037 89            	pushw	x
1933  0038 1e08          	ldw	x,(OFST-8,sp)
1934  003a ee14          	ldw	x,(20,x)
1935  003c cd0000        	call	_Timeout_Start
1937  003f 85            	popw	x
1939  0040               L3631:
1940                     ; 160 	while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) || ( hx711->Timeout->Config.Notificacion( ) == 0 ) )
1942  0040 1e06          	ldw	x,(OFST-10,sp)
1943  0042 cd0000        	call	_NHALgpio_Read
1945  0045 4d            	tnz	a
1946  0046 26f8          	jrne	L3631
1948  0048 1e06          	ldw	x,(OFST-10,sp)
1949  004a ee14          	ldw	x,(20,x)
1950  004c ee02          	ldw	x,(2,x)
1951  004e fd            	call	(x)
1953  004f 4d            	tnz	a
1954  0050 27ee          	jreq	L3631
1955                     ; 165 	if( hx711->Timeout->Config.Notificacion( ) )
1957  0052 1e06          	ldw	x,(OFST-10,sp)
1958  0054 ee14          	ldw	x,(20,x)
1959  0056 ee02          	ldw	x,(2,x)
1960  0058 fd            	call	(x)
1962  0059 4d            	tnz	a
1963  005a 2706          	jreq	L7631
1964                     ; 167 		hx711->Datos.Estado = TIMEOUT;
1966  005c 1e06          	ldw	x,(OFST-10,sp)
1967  005e a604          	ld	a,#4
1968  0060 e713          	ld	(19,x),a
1969  0062               L7631:
1970                     ; 169 	Timeout_Stop( hx711->Timeout );
1972  0062 1e06          	ldw	x,(OFST-10,sp)
1973  0064 ee14          	ldw	x,(20,x)
1974  0066 cd0000        	call	_Timeout_Stop
1976                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1980  0069 ae000f        	ldw	x,#15
1982  006c 9d            	nop	
1983  006d               L461:
1984  006d 5a            	decw	X
1985  006e 26fd          	jrne	L461
1986                     
1988  0070 2043          	jra	L3731
1989  0072               L1731:
1990                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1993  0072 4b01          	push	#1
1994  0074 1e07          	ldw	x,(OFST-9,sp)
1995  0076 1c0004        	addw	x,#4
1996  0079 cd0000        	call	_NHALgpio_Write
1998  007c ae000f        	ldw	x,#15
1999  007f 9d            	nop	
2000  0080 84            	pop	a
2001                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2006  0081               L071:
2007  0081 5a            	decw	X
2008  0082 26fd          	jrne	L071
2009  0084 9d            	nop	
2010                     
2012                     ; 193 			semilla |= NHALgpio_Read( &hx711->Config.DOUT );
2014  0085 1e06          	ldw	x,(OFST-10,sp)
2015  0087 cd0000        	call	_NHALgpio_Read
2017  008a b703          	ld	c_lreg+3,a
2018  008c 3f02          	clr	c_lreg+2
2019  008e 3f01          	clr	c_lreg+1
2020  0090 3f00          	clr	c_lreg
2021  0092 96            	ldw	x,sp
2022  0093 1c0002        	addw	x,#OFST-14
2023  0096 cd0000        	call	c_lgor
2026                     ; 194 			semilla <<= 1;
2028  0099 0805          	sll	(OFST-11,sp)
2029  009b 0904          	rlc	(OFST-12,sp)
2030  009d 0903          	rlc	(OFST-13,sp)
2031  009f 0902          	rlc	(OFST-14,sp)
2033                     ; 196 			contadorBucle++;
2035  00a1 0c01          	inc	(OFST-15,sp)
2037                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2040  00a3 4b00          	push	#0
2041  00a5 1e07          	ldw	x,(OFST-9,sp)
2042  00a7 1c0004        	addw	x,#4
2043  00aa cd0000        	call	_NHALgpio_Write
2045  00ad ae000f        	ldw	x,#15
2046  00b0 9d            	nop	
2047  00b1 84            	pop	a
2048                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2053  00b2               L671:
2054  00b2 5a            	decw	X
2055  00b3 26fd          	jrne	L671
2056                     
2058  00b5               L3731:
2059  00b5 9d            	nop	
2060                     ; 187 		while( contadorBucle < HX711_LONGITUDTRAMA ) 
2062  00b6 7b01          	ld	a,(OFST-15,sp)
2063  00b8 a118          	cp	a,#24
2064  00ba 25b6          	jrult	L1731
2065                     ; 126 	switch( hx711->Config.Ganancia )
2068  00bc 1e06          	ldw	x,(OFST-10,sp)
2069  00be e608          	ld	a,(8,x)
2071                     ; 151 		default:
2071                     ; 152 		
2071                     ; 153 		;
2072  00c0 270b          	jreq	L7511
2073  00c2 4a            	dec	a
2074  00c3 2740          	jreq	L5711
2075  00c5 4a            	dec	a
2076  00c6 2603cc0179    	jreq	L3421
2077  00cb 2028          	jra	L7721
2078  00cd               L7511:
2079                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2082  00cd 4b01          	push	#1
2083  00cf 1e07          	ldw	x,(OFST-9,sp)
2084  00d1 1c0004        	addw	x,#4
2085  00d4 cd0000        	call	_NHALgpio_Write
2087  00d7 ae000f        	ldw	x,#15
2088  00da 9d            	nop	
2089  00db 84            	pop	a
2090                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2095  00dc               L202:
2096  00dc 5a            	decw	X
2097  00dd 26fd          	jrne	L202
2098  00df 9d            	nop	
2099                     
2101                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2104  00e0 4b00          	push	#0
2105  00e2 1e07          	ldw	x,(OFST-9,sp)
2106  00e4 1c0004        	addw	x,#4
2107  00e7 cd0000        	call	_NHALgpio_Write
2109  00ea ae000f        	ldw	x,#15
2110  00ed 9d            	nop	
2111  00ee 84            	pop	a
2112                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2117  00ef               L602:
2118  00ef 5a            	decw	X
2119  00f0 26fd          	jrne	L602
2120  00f2               LC002:
2121  00f2 9d            	nop	
2122                     
2124  00f3 1e06          	ldw	x,(OFST-10,sp)
2125  00f5               L7721:
2126                     ; 204 		if( hx711->Datos.Estado != TIMEOUT )
2128  00f5 e613          	ld	a,(19,x)
2129  00f7 a104          	cp	a,#4
2130  00f9 2603cc01c7    	jreq	L7531
2131                     ; 206 			hx711->Datos.Estado = NUEVA_LECTURA;
2133  00fe a603          	ld	a,#3
2134  0100 e713          	ld	(19,x),a
2135  0102 cc01c7        	jra	L7531
2136  0105               L5711:
2137                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2140  0105 4b01          	push	#1
2141  0107 1e07          	ldw	x,(OFST-9,sp)
2142  0109 1c0004        	addw	x,#4
2143  010c cd0000        	call	_NHALgpio_Write
2145  010f ae000f        	ldw	x,#15
2146  0112 9d            	nop	
2147  0113 84            	pop	a
2148                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2153  0114               L212:
2154  0114 5a            	decw	X
2155  0115 26fd          	jrne	L212
2156  0117 9d            	nop	
2157                     
2159                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2162  0118 4b00          	push	#0
2163  011a 1e07          	ldw	x,(OFST-9,sp)
2164  011c 1c0004        	addw	x,#4
2165  011f cd0000        	call	_NHALgpio_Write
2167  0122 ae000f        	ldw	x,#15
2168  0125 9d            	nop	
2169  0126 84            	pop	a
2170                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2175  0127               L612:
2176  0127 5a            	decw	X
2177  0128 26fd          	jrne	L612
2178  012a 9d            	nop	
2179                     
2181                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2184  012b 4b01          	push	#1
2185  012d 1e07          	ldw	x,(OFST-9,sp)
2186  012f 1c0004        	addw	x,#4
2187  0132 cd0000        	call	_NHALgpio_Write
2189  0135 ae000f        	ldw	x,#15
2190  0138 9d            	nop	
2191  0139 84            	pop	a
2192                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2197  013a               L222:
2198  013a 5a            	decw	X
2199  013b 26fd          	jrne	L222
2200  013d 9d            	nop	
2201                     
2203                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2206  013e 4b00          	push	#0
2207  0140 1e07          	ldw	x,(OFST-9,sp)
2208  0142 1c0004        	addw	x,#4
2209  0145 cd0000        	call	_NHALgpio_Write
2211  0148 ae000f        	ldw	x,#15
2212  014b 9d            	nop	
2213  014c 84            	pop	a
2214                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2219  014d               L622:
2220  014d 5a            	decw	X
2221  014e 26fd          	jrne	L622
2222  0150 9d            	nop	
2223                     
2225                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2228  0151 4b01          	push	#1
2229  0153 1e07          	ldw	x,(OFST-9,sp)
2230  0155 1c0004        	addw	x,#4
2231  0158 cd0000        	call	_NHALgpio_Write
2233  015b ae000f        	ldw	x,#15
2234  015e 9d            	nop	
2235  015f 84            	pop	a
2236                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2241  0160               L232:
2242  0160 5a            	decw	X
2243  0161 26fd          	jrne	L232
2244  0163 9d            	nop	
2245                     
2247                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2250  0164 4b00          	push	#0
2251  0166 1e07          	ldw	x,(OFST-9,sp)
2252  0168 1c0004        	addw	x,#4
2253  016b cd0000        	call	_NHALgpio_Write
2255  016e ae000f        	ldw	x,#15
2256  0171 9d            	nop	
2257  0172 84            	pop	a
2258                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2263  0173               L632:
2264  0173 5a            	decw	X
2265  0174 26fd          	jrne	L632
2266                     
2268  0176 cc00f2        	jp	LC002
2269  0179               L3421:
2270                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2273  0179 4b01          	push	#1
2274  017b 1e07          	ldw	x,(OFST-9,sp)
2275  017d 1c0004        	addw	x,#4
2276  0180 cd0000        	call	_NHALgpio_Write
2278  0183 ae000f        	ldw	x,#15
2279  0186 9d            	nop	
2280  0187 84            	pop	a
2281                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2286  0188               L242:
2287  0188 5a            	decw	X
2288  0189 26fd          	jrne	L242
2289  018b 9d            	nop	
2290                     
2292                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2295  018c 4b00          	push	#0
2296  018e 1e07          	ldw	x,(OFST-9,sp)
2297  0190 1c0004        	addw	x,#4
2298  0193 cd0000        	call	_NHALgpio_Write
2300  0196 ae000f        	ldw	x,#15
2301  0199 9d            	nop	
2302  019a 84            	pop	a
2303                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2308  019b               L642:
2309  019b 5a            	decw	X
2310  019c 26fd          	jrne	L642
2311  019e 9d            	nop	
2312                     
2314                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2317  019f 4b01          	push	#1
2318  01a1 1e07          	ldw	x,(OFST-9,sp)
2319  01a3 1c0004        	addw	x,#4
2320  01a6 cd0000        	call	_NHALgpio_Write
2322  01a9 ae000f        	ldw	x,#15
2323  01ac 9d            	nop	
2324  01ad 84            	pop	a
2325                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2330  01ae               L252:
2331  01ae 5a            	decw	X
2332  01af 26fd          	jrne	L252
2333  01b1 9d            	nop	
2334                     
2336                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2339  01b2 4b00          	push	#0
2340  01b4 1e07          	ldw	x,(OFST-9,sp)
2341  01b6 1c0004        	addw	x,#4
2342  01b9 cd0000        	call	_NHALgpio_Write
2344  01bc ae000f        	ldw	x,#15
2345  01bf 9d            	nop	
2346  01c0 84            	pop	a
2347                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2352  01c1               L652:
2353  01c1 5a            	decw	X
2354  01c2 26fd          	jrne	L652
2355                     
2357  01c4 cc00f2        	jp	LC002
2358  01c7               L7531:
2359                     ; 209 		return semilla;
2361  01c7 1e04          	ldw	x,(OFST-12,sp)
2362  01c9 1f0a          	ldw	(OFST-6,sp),x
2363  01cb 1e02          	ldw	x,(OFST-14,sp)
2364  01cd 1f08          	ldw	(OFST-8,sp),x
2368  01cf 96            	ldw	x,sp
2369  01d0 1c0008        	addw	x,#OFST-8
2370  01d3 cd0000        	call	c_ltor
2372  01d6 96            	ldw	x,sp
2373  01d7 1c000c        	addw	x,#OFST-4
2374  01da cd0000        	call	c_lgadd
2377                     ; 350 		--repeticiones;
2379  01dd 0a10          	dec	(OFST+0,sp)
2381                     ; 346 	while( ( repeticiones > 0 ) )
2383  01df 2703cc000c    	jrne	L1531
2384                     ; 352 	repeticiones = 4;
2386                     ; 354 	return valorMedio/repeticiones;
2388  01e4 96            	ldw	x,sp
2389  01e5 1c000c        	addw	x,#OFST-4
2390  01e8 cd0000        	call	c_ltor
2392  01eb a602          	ld	a,#2
2393  01ed cd0000        	call	c_lursh
2395  01f0 be02          	ldw	x,c_lreg+2
2398  01f2 5b12          	addw	sp,#18
2399  01f4 81            	ret	
2412                     	xdef	_hx711_Tarar
2413                     	xdef	_hx711_Lectura
2414                     	xdef	_HX711_Init
2415                     	xref	_Timeout_Stop
2416                     	xref	_Timeout_Start
2417                     	xref	_NHALgpio_Write
2418                     	xref	_NHALgpio_Read
2419                     	xref	_NHALgpio_Init
2420                     	xref	_NHALgpioConfig_SetType
2421                     	xref.b	c_lreg
2422                     	xref.b	c_x
2441                     	xref	c_lursh
2442                     	xref	c_lgadd
2443                     	xref	c_ludv
2444                     	xref	c_rtol
2445                     	xref	c_uitolx
2446                     	xref	c_ltor
2447                     	xref	c_lgor
2448                     	end

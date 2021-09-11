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
 916                     ; 249 void HX711_Init( HX711_t_ptr hx711, HX711_fPtr Lectura, HX711_fPtr Tarar, Timeout_t_ptr Timeout )
 916                     ; 250 {
 918                     .text:	section	.text,new
 919  0000               _HX711_Init:
 921  0000 89            	pushw	x
 922  0001 89            	pushw	x
 923       00000002      OFST:	set	2
 926                     ; 251 	initPtrFunciones( hx711, Lectura, Tarar );
 930                     ; 67 	hx711->Lectura = Lectura;
 932  0002 1607          	ldw	y,(OFST+5,sp)
 933  0004 ef16          	ldw	(22,x),y
 934                     ; 68 	hx711->Tarar = Tarar;
 936  0006 1609          	ldw	y,(OFST+7,sp)
 937  0008 ef18          	ldw	(24,x),y
 938                     ; 253 	hx711->Timeout = Timeout;
 940  000a 160b          	ldw	y,(OFST+9,sp)
 941  000c ef14          	ldw	(20,x),y
 942                     ; 255 	initVariables( hx711 );
 946                     ; 73 	hx711->Datos.UltimaLectura = 0;
 948  000e 4f            	clr	a
 949  000f e712          	ld	(18,x),a
 950  0011 e711          	ld	(17,x),a
 951  0013 e710          	ld	(16,x),a
 952  0015 e70f          	ld	(15,x),a
 953                     ; 74 	hx711->Config.ValorTara = 0;
 955  0017 905f          	clrw	y
 956  0019 ef0d          	ldw	(13,x),y
 957                     ; 75 	hx711->Config.ValorConversion = 1;
 959  001b 905c          	incw	y
 960  001d ef09          	ldw	(9,x),y
 961                     ; 76 	hx711->Config.Ganancia = CHANNELA_128;
 963  001f 6f08          	clr	(8,x)
 964                     ; 257 	initDOUT( &hx711->Config.DOUT );
 967  0021 1f01          	ldw	(OFST-1,sp),x
 969                     ; 81 	NHALgpioConfig_SetType( dout,GPIO_MODE_IN_PU_NO_IT );
 971  0023 4b40          	push	#64
 972  0025 1e02          	ldw	x,(OFST+0,sp)
 973  0027 cd0000        	call	_NHALgpioConfig_SetType
 975  002a 84            	pop	a
 976                     ; 82 	NHALgpio_Init( dout );
 978  002b 1e01          	ldw	x,(OFST-1,sp)
 979  002d cd0000        	call	_NHALgpio_Init
 981                     ; 258 	initPDSCK( &hx711->Config.PD_SCK );
 984  0030 1e03          	ldw	x,(OFST+1,sp)
 985  0032 1c0004        	addw	x,#4
 986  0035 1f01          	ldw	(OFST-1,sp),x
 988                     ; 87 	NHALgpioConfig_SetType( pdsck, GPIO_MODE_OUT_PP_LOW_FAST );
 990  0037 4be0          	push	#224
 991  0039 1e02          	ldw	x,(OFST+0,sp)
 992  003b cd0000        	call	_NHALgpioConfig_SetType
 994  003e 84            	pop	a
 995                     ; 88 	NHALgpio_Init( pdsck );
 997  003f 1e01          	ldw	x,(OFST-1,sp)
 998  0041 cd0000        	call	_NHALgpio_Init
1000                     ; 260 	chequearValorConversion( hx711 );
1003  0044 1e03          	ldw	x,(OFST+1,sp)
1004  0046 1f01          	ldw	(OFST-1,sp),x
1006                     ; 93 	if( ( hx711->Config.ValorConversion ) == 0 )
1008  0048 e60a          	ld	a,(10,x)
1009  004a ea09          	or	a,(9,x)
1010  004c 260b          	jrne	L726
1011                     ; 95 		hx711->Config.ValorConversion = 1;
1013  004e 90ae0001      	ldw	y,#1
1014  0052 ef09          	ldw	(9,x),y
1015                     ; 96 		hx711->Datos.Estado = SINVALORCONVERSION;
1017  0054 4c            	inc	a
1018  0055 e713          	ld	(19,x),a
1020  0057 2002          	jra	L521
1021  0059               L726:
1022                     ; 100 		hx711->Datos.Estado = INICIALIZADO;
1024  0059 6f13          	clr	(19,x)
1025  005b               L521:
1026                     ; 262 	aDormir( hx711 );
1029  005b 1f01          	ldw	(OFST-1,sp),x
1031                     ; 106 	NHALgpio_Write( &hx711->Config.PD_SCK, true );
1033  005d 4b01          	push	#1
1034  005f 1e02          	ldw	x,(OFST+0,sp)
1035  0061 1c0004        	addw	x,#4
1036  0064 cd0000        	call	_NHALgpio_Write
1038  0067 ae0174        	ldw	x,#372
1039  006a 9d            	nop	
1040  006b 84            	pop	a
1041                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1046  006c               L02:
1047  006c 5a            	decw	X
1048  006d 26fd          	jrne	L02
1049  006f 9d            	nop	
1050                     
1052                     ; 109 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1054  0070 1e01          	ldw	x,(OFST-1,sp)
1055  0072 e613          	ld	a,(19,x)
1056  0074 4a            	dec	a
1057  0075 2704          	jreq	L331
1058                     ; 111 		hx711->Datos.Estado = SLEEP;
1060  0077 a602          	ld	a,#2
1061  0079 e713          	ld	(19,x),a
1063  007b               L331:
1064                     ; 263 }
1067  007b 5b04          	addw	sp,#4
1068  007d 81            	ret	
1187                     ; 298 uint16_t hx711_Lectura( HX711_t_ptr hx711 )
1187                     ; 299 {
1188                     .text:	section	.text,new
1189  0000               _hx711_Lectura:
1191  0000 89            	pushw	x
1192  0001 520b          	subw	sp,#11
1193       0000000b      OFST:	set	11
1196                     ; 300 	uint32_t semilla = 0;
1198                     ; 302 	semilla = leer( hx711 );
1201  0003 1f06          	ldw	(OFST-5,sp),x
1203                     ; 175 	uint32_t semilla = 0;
1205  0005 5f            	clrw	x
1206  0006 1f0a          	ldw	(OFST-1,sp),x
1207  0008 1f08          	ldw	(OFST-3,sp),x
1209                     ; 176 	uint8_t contadorBucle = 0;
1211  000a 0f05          	clr	(OFST-6,sp)
1213                     ; 178 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1215  000c 1e06          	ldw	x,(OFST-5,sp)
1216  000e e613          	ld	a,(19,x)
1217  0010 4a            	dec	a
1218  0011 2603cc01bc    	jreq	L1701
1219                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1222  0016 4b00          	push	#0
1223  0018 1e07          	ldw	x,(OFST-4,sp)
1224  001a 1c0004        	addw	x,#4
1225  001d cd0000        	call	_NHALgpio_Write
1227  0020 ae000f        	ldw	x,#15
1228  0023 9d            	nop	
1229  0024 84            	pop	a
1230                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1235  0025               L62:
1236  0025 5a            	decw	X
1237  0026 26fd          	jrne	L62
1238  0028 9d            	nop	
1239                     
1241                     ; 159 	Timeout_Start( hx711->Timeout, 40 );
1244  0029 ae0028        	ldw	x,#40
1245  002c 89            	pushw	x
1246  002d 1e08          	ldw	x,(OFST-3,sp)
1247  002f ee14          	ldw	x,(20,x)
1248  0031 cd0000        	call	_Timeout_Start
1250  0034 85            	popw	x
1252  0035               L5701:
1253                     ; 160 	while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) || ( hx711->Timeout->Config.Notificacion( ) == 0 ) )
1255  0035 1e06          	ldw	x,(OFST-5,sp)
1256  0037 cd0000        	call	_NHALgpio_Read
1258  003a 4d            	tnz	a
1259  003b 26f8          	jrne	L5701
1261  003d 1e06          	ldw	x,(OFST-5,sp)
1262  003f ee14          	ldw	x,(20,x)
1263  0041 ee02          	ldw	x,(2,x)
1264  0043 fd            	call	(x)
1266  0044 4d            	tnz	a
1267  0045 27ee          	jreq	L5701
1268                     ; 165 	if( hx711->Timeout->Config.Notificacion( ) )
1270  0047 1e06          	ldw	x,(OFST-5,sp)
1271  0049 ee14          	ldw	x,(20,x)
1272  004b ee02          	ldw	x,(2,x)
1273  004d fd            	call	(x)
1275  004e 4d            	tnz	a
1276  004f 2706          	jreq	L1011
1277                     ; 167 		hx711->Datos.Estado = TIMEOUT;
1279  0051 1e06          	ldw	x,(OFST-5,sp)
1280  0053 a604          	ld	a,#4
1281  0055 e713          	ld	(19,x),a
1282  0057               L1011:
1283                     ; 169 	Timeout_Stop( hx711->Timeout );
1285  0057 1e06          	ldw	x,(OFST-5,sp)
1286  0059 ee14          	ldw	x,(20,x)
1287  005b cd0000        	call	_Timeout_Stop
1289                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1293  005e ae000f        	ldw	x,#15
1295  0061 9d            	nop	
1296  0062               L24:
1297  0062 5a            	decw	X
1298  0063 26fd          	jrne	L24
1299                     
1301  0065 2043          	jra	L5011
1302  0067               L3011:
1303                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1306  0067 4b01          	push	#1
1307  0069 1e07          	ldw	x,(OFST-4,sp)
1308  006b 1c0004        	addw	x,#4
1309  006e cd0000        	call	_NHALgpio_Write
1311  0071 ae000f        	ldw	x,#15
1312  0074 9d            	nop	
1313  0075 84            	pop	a
1314                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1319  0076               L64:
1320  0076 5a            	decw	X
1321  0077 26fd          	jrne	L64
1322  0079 9d            	nop	
1323                     
1325                     ; 193 			semilla |= NHALgpio_Read( &hx711->Config.DOUT );
1327  007a 1e06          	ldw	x,(OFST-5,sp)
1328  007c cd0000        	call	_NHALgpio_Read
1330  007f b703          	ld	c_lreg+3,a
1331  0081 3f02          	clr	c_lreg+2
1332  0083 3f01          	clr	c_lreg+1
1333  0085 3f00          	clr	c_lreg
1334  0087 96            	ldw	x,sp
1335  0088 1c0008        	addw	x,#OFST-3
1336  008b cd0000        	call	c_lgor
1339                     ; 194 			semilla <<= 1;
1341  008e 080b          	sll	(OFST+0,sp)
1342  0090 090a          	rlc	(OFST-1,sp)
1343  0092 0909          	rlc	(OFST-2,sp)
1344  0094 0908          	rlc	(OFST-3,sp)
1346                     ; 196 			contadorBucle++;
1348  0096 0c05          	inc	(OFST-6,sp)
1350                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1353  0098 4b00          	push	#0
1354  009a 1e07          	ldw	x,(OFST-4,sp)
1355  009c 1c0004        	addw	x,#4
1356  009f cd0000        	call	_NHALgpio_Write
1358  00a2 ae000f        	ldw	x,#15
1359  00a5 9d            	nop	
1360  00a6 84            	pop	a
1361                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1366  00a7               L45:
1367  00a7 5a            	decw	X
1368  00a8 26fd          	jrne	L45
1369                     
1371  00aa               L5011:
1372  00aa 9d            	nop	
1373                     ; 187 		while( contadorBucle < HX711_LONGITUDTRAMA ) 
1375  00ab 7b05          	ld	a,(OFST-6,sp)
1376  00ad a118          	cp	a,#24
1377  00af 25b6          	jrult	L3011
1378                     ; 126 	switch( hx711->Config.Ganancia )
1381  00b1 1e06          	ldw	x,(OFST-5,sp)
1382  00b3 e608          	ld	a,(8,x)
1384                     ; 151 		default:
1384                     ; 152 		
1384                     ; 153 		;
1385  00b5 270b          	jreq	L766
1386  00b7 4a            	dec	a
1387  00b8 2740          	jreq	L507
1388  00ba 4a            	dec	a
1389  00bb 2603cc016e    	jreq	L357
1390  00c0 2028          	jra	L7001
1391  00c2               L766:
1392                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1395  00c2 4b01          	push	#1
1396  00c4 1e07          	ldw	x,(OFST-4,sp)
1397  00c6 1c0004        	addw	x,#4
1398  00c9 cd0000        	call	_NHALgpio_Write
1400  00cc ae000f        	ldw	x,#15
1401  00cf 9d            	nop	
1402  00d0 84            	pop	a
1403                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1408  00d1               L06:
1409  00d1 5a            	decw	X
1410  00d2 26fd          	jrne	L06
1411  00d4 9d            	nop	
1412                     
1414                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1417  00d5 4b00          	push	#0
1418  00d7 1e07          	ldw	x,(OFST-4,sp)
1419  00d9 1c0004        	addw	x,#4
1420  00dc cd0000        	call	_NHALgpio_Write
1422  00df ae000f        	ldw	x,#15
1423  00e2 9d            	nop	
1424  00e3 84            	pop	a
1425                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1430  00e4               L46:
1431  00e4 5a            	decw	X
1432  00e5 26fd          	jrne	L46
1433  00e7               LC001:
1434  00e7 9d            	nop	
1435                     
1437  00e8 1e06          	ldw	x,(OFST-5,sp)
1438  00ea               L7001:
1439                     ; 204 		if( hx711->Datos.Estado != TIMEOUT )
1441  00ea e613          	ld	a,(19,x)
1442  00ec a104          	cp	a,#4
1443  00ee 2603cc01bc    	jreq	L1701
1444                     ; 206 			hx711->Datos.Estado = NUEVA_LECTURA;
1446  00f3 a603          	ld	a,#3
1447  00f5 e713          	ld	(19,x),a
1448  00f7 cc01bc        	jra	L1701
1449  00fa               L507:
1450                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1453  00fa 4b01          	push	#1
1454  00fc 1e07          	ldw	x,(OFST-4,sp)
1455  00fe 1c0004        	addw	x,#4
1456  0101 cd0000        	call	_NHALgpio_Write
1458  0104 ae000f        	ldw	x,#15
1459  0107 9d            	nop	
1460  0108 84            	pop	a
1461                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1466  0109               L07:
1467  0109 5a            	decw	X
1468  010a 26fd          	jrne	L07
1469  010c 9d            	nop	
1470                     
1472                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1475  010d 4b00          	push	#0
1476  010f 1e07          	ldw	x,(OFST-4,sp)
1477  0111 1c0004        	addw	x,#4
1478  0114 cd0000        	call	_NHALgpio_Write
1480  0117 ae000f        	ldw	x,#15
1481  011a 9d            	nop	
1482  011b 84            	pop	a
1483                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1488  011c               L47:
1489  011c 5a            	decw	X
1490  011d 26fd          	jrne	L47
1491  011f 9d            	nop	
1492                     
1494                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1497  0120 4b01          	push	#1
1498  0122 1e07          	ldw	x,(OFST-4,sp)
1499  0124 1c0004        	addw	x,#4
1500  0127 cd0000        	call	_NHALgpio_Write
1502  012a ae000f        	ldw	x,#15
1503  012d 9d            	nop	
1504  012e 84            	pop	a
1505                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1510  012f               L001:
1511  012f 5a            	decw	X
1512  0130 26fd          	jrne	L001
1513  0132 9d            	nop	
1514                     
1516                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1519  0133 4b00          	push	#0
1520  0135 1e07          	ldw	x,(OFST-4,sp)
1521  0137 1c0004        	addw	x,#4
1522  013a cd0000        	call	_NHALgpio_Write
1524  013d ae000f        	ldw	x,#15
1525  0140 9d            	nop	
1526  0141 84            	pop	a
1527                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1532  0142               L401:
1533  0142 5a            	decw	X
1534  0143 26fd          	jrne	L401
1535  0145 9d            	nop	
1536                     
1538                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1541  0146 4b01          	push	#1
1542  0148 1e07          	ldw	x,(OFST-4,sp)
1543  014a 1c0004        	addw	x,#4
1544  014d cd0000        	call	_NHALgpio_Write
1546  0150 ae000f        	ldw	x,#15
1547  0153 9d            	nop	
1548  0154 84            	pop	a
1549                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1554  0155               L011:
1555  0155 5a            	decw	X
1556  0156 26fd          	jrne	L011
1557  0158 9d            	nop	
1558                     
1560                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1563  0159 4b00          	push	#0
1564  015b 1e07          	ldw	x,(OFST-4,sp)
1565  015d 1c0004        	addw	x,#4
1566  0160 cd0000        	call	_NHALgpio_Write
1568  0163 ae000f        	ldw	x,#15
1569  0166 9d            	nop	
1570  0167 84            	pop	a
1571                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1576  0168               L411:
1577  0168 5a            	decw	X
1578  0169 26fd          	jrne	L411
1579                     
1581  016b cc00e7        	jp	LC001
1582  016e               L357:
1583                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1586  016e 4b01          	push	#1
1587  0170 1e07          	ldw	x,(OFST-4,sp)
1588  0172 1c0004        	addw	x,#4
1589  0175 cd0000        	call	_NHALgpio_Write
1591  0178 ae000f        	ldw	x,#15
1592  017b 9d            	nop	
1593  017c 84            	pop	a
1594                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1599  017d               L021:
1600  017d 5a            	decw	X
1601  017e 26fd          	jrne	L021
1602  0180 9d            	nop	
1603                     
1605                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1608  0181 4b00          	push	#0
1609  0183 1e07          	ldw	x,(OFST-4,sp)
1610  0185 1c0004        	addw	x,#4
1611  0188 cd0000        	call	_NHALgpio_Write
1613  018b ae000f        	ldw	x,#15
1614  018e 9d            	nop	
1615  018f 84            	pop	a
1616                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1621  0190               L421:
1622  0190 5a            	decw	X
1623  0191 26fd          	jrne	L421
1624  0193 9d            	nop	
1625                     
1627                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1630  0194 4b01          	push	#1
1631  0196 1e07          	ldw	x,(OFST-4,sp)
1632  0198 1c0004        	addw	x,#4
1633  019b cd0000        	call	_NHALgpio_Write
1635  019e ae000f        	ldw	x,#15
1636  01a1 9d            	nop	
1637  01a2 84            	pop	a
1638                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1643  01a3               L031:
1644  01a3 5a            	decw	X
1645  01a4 26fd          	jrne	L031
1646  01a6 9d            	nop	
1647                     
1649                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1652  01a7 4b00          	push	#0
1653  01a9 1e07          	ldw	x,(OFST-4,sp)
1654  01ab 1c0004        	addw	x,#4
1655  01ae cd0000        	call	_NHALgpio_Write
1657  01b1 ae000f        	ldw	x,#15
1658  01b4 9d            	nop	
1659  01b5 84            	pop	a
1660                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1665  01b6               L431:
1666  01b6 5a            	decw	X
1667  01b7 26fd          	jrne	L431
1668                     
1670  01b9 cc00e7        	jp	LC001
1671  01bc               L1701:
1672                     ; 209 		return semilla;
1677                     ; 303 	aDormir( hx711 );
1680  01bc 1e0c          	ldw	x,(OFST+1,sp)
1681  01be 1f06          	ldw	(OFST-5,sp),x
1683                     ; 106 	NHALgpio_Write( &hx711->Config.PD_SCK, true );
1685  01c0 4b01          	push	#1
1686  01c2 1e07          	ldw	x,(OFST-4,sp)
1687  01c4 1c0004        	addw	x,#4
1688  01c7 cd0000        	call	_NHALgpio_Write
1690  01ca ae0174        	ldw	x,#372
1691  01cd 9d            	nop	
1692  01ce 84            	pop	a
1693                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1698  01cf               L241:
1699  01cf 5a            	decw	X
1700  01d0 26fd          	jrne	L241
1701  01d2 9d            	nop	
1702                     
1704                     ; 109 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1706  01d3 1e06          	ldw	x,(OFST-5,sp)
1707  01d5 e613          	ld	a,(19,x)
1708  01d7 4a            	dec	a
1709  01d8 2704          	jreq	L7101
1710                     ; 111 		hx711->Datos.Estado = SLEEP;
1712  01da a602          	ld	a,#2
1713  01dc e713          	ld	(19,x),a
1715  01de               L7101:
1716                     ; 305 	return ( semilla / hx711->Config.ValorConversion );
1718  01de 1e0c          	ldw	x,(OFST+1,sp)
1719  01e0 ee09          	ldw	x,(9,x)
1720  01e2 cd0000        	call	c_uitolx
1722  01e5 96            	ldw	x,sp
1723  01e6 5c            	incw	x
1724  01e7 cd0000        	call	c_rtol
1727  01ea 96            	ldw	x,sp
1728  01eb 1c0008        	addw	x,#OFST-3
1729  01ee cd0000        	call	c_ltor
1731  01f1 96            	ldw	x,sp
1732  01f2 5c            	incw	x
1733  01f3 cd0000        	call	c_ludv
1735  01f6 be02          	ldw	x,c_lreg+2
1738  01f8 5b0d          	addw	sp,#13
1739  01fa 81            	ret	
1852                     ; 341 uint16_t hx711_Tarar( HX711_t_ptr hx711 )
1852                     ; 342 {
1853                     .text:	section	.text,new
1854  0000               _hx711_Tarar:
1856  0000 89            	pushw	x
1857  0001 5210          	subw	sp,#16
1858       00000010      OFST:	set	16
1861                     ; 343 	uint32_t valorMedio = 0;
1863  0003 5f            	clrw	x
1864  0004 1f0e          	ldw	(OFST-2,sp),x
1865  0006 1f0c          	ldw	(OFST-4,sp),x
1867                     ; 344 	uint8_t repeticiones = 4;
1869  0008 a604          	ld	a,#4
1870  000a 6b10          	ld	(OFST+0,sp),a
1872  000c               L5431:
1873                     ; 348 		valorMedio = valorMedio + leer( hx711 );
1876  000c 1e11          	ldw	x,(OFST+1,sp)
1877  000e 1f06          	ldw	(OFST-10,sp),x
1879                     ; 175 	uint32_t semilla = 0;
1881  0010 5f            	clrw	x
1882  0011 1f04          	ldw	(OFST-12,sp),x
1883  0013 1f02          	ldw	(OFST-14,sp),x
1885                     ; 176 	uint8_t contadorBucle = 0;
1887  0015 0f01          	clr	(OFST-15,sp)
1889                     ; 178 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1891  0017 1e06          	ldw	x,(OFST-10,sp)
1892  0019 e613          	ld	a,(19,x)
1893  001b 4a            	dec	a
1894  001c 2603cc01c7    	jreq	L3531
1895                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1898  0021 4b00          	push	#0
1899  0023 1e07          	ldw	x,(OFST-9,sp)
1900  0025 1c0004        	addw	x,#4
1901  0028 cd0000        	call	_NHALgpio_Write
1903  002b ae000f        	ldw	x,#15
1904  002e 9d            	nop	
1905  002f 84            	pop	a
1906                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1911  0030               L051:
1912  0030 5a            	decw	X
1913  0031 26fd          	jrne	L051
1914  0033 9d            	nop	
1915                     
1917                     ; 159 	Timeout_Start( hx711->Timeout, 40 );
1920  0034 ae0028        	ldw	x,#40
1921  0037 89            	pushw	x
1922  0038 1e08          	ldw	x,(OFST-8,sp)
1923  003a ee14          	ldw	x,(20,x)
1924  003c cd0000        	call	_Timeout_Start
1926  003f 85            	popw	x
1928  0040               L7531:
1929                     ; 160 	while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) || ( hx711->Timeout->Config.Notificacion( ) == 0 ) )
1931  0040 1e06          	ldw	x,(OFST-10,sp)
1932  0042 cd0000        	call	_NHALgpio_Read
1934  0045 4d            	tnz	a
1935  0046 26f8          	jrne	L7531
1937  0048 1e06          	ldw	x,(OFST-10,sp)
1938  004a ee14          	ldw	x,(20,x)
1939  004c ee02          	ldw	x,(2,x)
1940  004e fd            	call	(x)
1942  004f 4d            	tnz	a
1943  0050 27ee          	jreq	L7531
1944                     ; 165 	if( hx711->Timeout->Config.Notificacion( ) )
1946  0052 1e06          	ldw	x,(OFST-10,sp)
1947  0054 ee14          	ldw	x,(20,x)
1948  0056 ee02          	ldw	x,(2,x)
1949  0058 fd            	call	(x)
1951  0059 4d            	tnz	a
1952  005a 2706          	jreq	L3631
1953                     ; 167 		hx711->Datos.Estado = TIMEOUT;
1955  005c 1e06          	ldw	x,(OFST-10,sp)
1956  005e a604          	ld	a,#4
1957  0060 e713          	ld	(19,x),a
1958  0062               L3631:
1959                     ; 169 	Timeout_Stop( hx711->Timeout );
1961  0062 1e06          	ldw	x,(OFST-10,sp)
1962  0064 ee14          	ldw	x,(20,x)
1963  0066 cd0000        	call	_Timeout_Stop
1965                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1969  0069 ae000f        	ldw	x,#15
1971  006c 9d            	nop	
1972  006d               L461:
1973  006d 5a            	decw	X
1974  006e 26fd          	jrne	L461
1975                     
1977  0070 2043          	jra	L7631
1978  0072               L5631:
1979                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1982  0072 4b01          	push	#1
1983  0074 1e07          	ldw	x,(OFST-9,sp)
1984  0076 1c0004        	addw	x,#4
1985  0079 cd0000        	call	_NHALgpio_Write
1987  007c ae000f        	ldw	x,#15
1988  007f 9d            	nop	
1989  0080 84            	pop	a
1990                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1995  0081               L071:
1996  0081 5a            	decw	X
1997  0082 26fd          	jrne	L071
1998  0084 9d            	nop	
1999                     
2001                     ; 193 			semilla |= NHALgpio_Read( &hx711->Config.DOUT );
2003  0085 1e06          	ldw	x,(OFST-10,sp)
2004  0087 cd0000        	call	_NHALgpio_Read
2006  008a b703          	ld	c_lreg+3,a
2007  008c 3f02          	clr	c_lreg+2
2008  008e 3f01          	clr	c_lreg+1
2009  0090 3f00          	clr	c_lreg
2010  0092 96            	ldw	x,sp
2011  0093 1c0002        	addw	x,#OFST-14
2012  0096 cd0000        	call	c_lgor
2015                     ; 194 			semilla <<= 1;
2017  0099 0805          	sll	(OFST-11,sp)
2018  009b 0904          	rlc	(OFST-12,sp)
2019  009d 0903          	rlc	(OFST-13,sp)
2020  009f 0902          	rlc	(OFST-14,sp)
2022                     ; 196 			contadorBucle++;
2024  00a1 0c01          	inc	(OFST-15,sp)
2026                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2029  00a3 4b00          	push	#0
2030  00a5 1e07          	ldw	x,(OFST-9,sp)
2031  00a7 1c0004        	addw	x,#4
2032  00aa cd0000        	call	_NHALgpio_Write
2034  00ad ae000f        	ldw	x,#15
2035  00b0 9d            	nop	
2036  00b1 84            	pop	a
2037                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2042  00b2               L671:
2043  00b2 5a            	decw	X
2044  00b3 26fd          	jrne	L671
2045                     
2047  00b5               L7631:
2048  00b5 9d            	nop	
2049                     ; 187 		while( contadorBucle < HX711_LONGITUDTRAMA ) 
2051  00b6 7b01          	ld	a,(OFST-15,sp)
2052  00b8 a118          	cp	a,#24
2053  00ba 25b6          	jrult	L5631
2054                     ; 126 	switch( hx711->Config.Ganancia )
2057  00bc 1e06          	ldw	x,(OFST-10,sp)
2058  00be e608          	ld	a,(8,x)
2060                     ; 151 		default:
2060                     ; 152 		
2060                     ; 153 		;
2061  00c0 270b          	jreq	L3511
2062  00c2 4a            	dec	a
2063  00c3 2740          	jreq	L1711
2064  00c5 4a            	dec	a
2065  00c6 2603cc0179    	jreq	L7321
2066  00cb 2028          	jra	L3721
2067  00cd               L3511:
2068                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2071  00cd 4b01          	push	#1
2072  00cf 1e07          	ldw	x,(OFST-9,sp)
2073  00d1 1c0004        	addw	x,#4
2074  00d4 cd0000        	call	_NHALgpio_Write
2076  00d7 ae000f        	ldw	x,#15
2077  00da 9d            	nop	
2078  00db 84            	pop	a
2079                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2084  00dc               L202:
2085  00dc 5a            	decw	X
2086  00dd 26fd          	jrne	L202
2087  00df 9d            	nop	
2088                     
2090                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2093  00e0 4b00          	push	#0
2094  00e2 1e07          	ldw	x,(OFST-9,sp)
2095  00e4 1c0004        	addw	x,#4
2096  00e7 cd0000        	call	_NHALgpio_Write
2098  00ea ae000f        	ldw	x,#15
2099  00ed 9d            	nop	
2100  00ee 84            	pop	a
2101                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2106  00ef               L602:
2107  00ef 5a            	decw	X
2108  00f0 26fd          	jrne	L602
2109  00f2               LC002:
2110  00f2 9d            	nop	
2111                     
2113  00f3 1e06          	ldw	x,(OFST-10,sp)
2114  00f5               L3721:
2115                     ; 204 		if( hx711->Datos.Estado != TIMEOUT )
2117  00f5 e613          	ld	a,(19,x)
2118  00f7 a104          	cp	a,#4
2119  00f9 2603cc01c7    	jreq	L3531
2120                     ; 206 			hx711->Datos.Estado = NUEVA_LECTURA;
2122  00fe a603          	ld	a,#3
2123  0100 e713          	ld	(19,x),a
2124  0102 cc01c7        	jra	L3531
2125  0105               L1711:
2126                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2129  0105 4b01          	push	#1
2130  0107 1e07          	ldw	x,(OFST-9,sp)
2131  0109 1c0004        	addw	x,#4
2132  010c cd0000        	call	_NHALgpio_Write
2134  010f ae000f        	ldw	x,#15
2135  0112 9d            	nop	
2136  0113 84            	pop	a
2137                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2142  0114               L212:
2143  0114 5a            	decw	X
2144  0115 26fd          	jrne	L212
2145  0117 9d            	nop	
2146                     
2148                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2151  0118 4b00          	push	#0
2152  011a 1e07          	ldw	x,(OFST-9,sp)
2153  011c 1c0004        	addw	x,#4
2154  011f cd0000        	call	_NHALgpio_Write
2156  0122 ae000f        	ldw	x,#15
2157  0125 9d            	nop	
2158  0126 84            	pop	a
2159                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2164  0127               L612:
2165  0127 5a            	decw	X
2166  0128 26fd          	jrne	L612
2167  012a 9d            	nop	
2168                     
2170                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2173  012b 4b01          	push	#1
2174  012d 1e07          	ldw	x,(OFST-9,sp)
2175  012f 1c0004        	addw	x,#4
2176  0132 cd0000        	call	_NHALgpio_Write
2178  0135 ae000f        	ldw	x,#15
2179  0138 9d            	nop	
2180  0139 84            	pop	a
2181                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2186  013a               L222:
2187  013a 5a            	decw	X
2188  013b 26fd          	jrne	L222
2189  013d 9d            	nop	
2190                     
2192                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2195  013e 4b00          	push	#0
2196  0140 1e07          	ldw	x,(OFST-9,sp)
2197  0142 1c0004        	addw	x,#4
2198  0145 cd0000        	call	_NHALgpio_Write
2200  0148 ae000f        	ldw	x,#15
2201  014b 9d            	nop	
2202  014c 84            	pop	a
2203                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2208  014d               L622:
2209  014d 5a            	decw	X
2210  014e 26fd          	jrne	L622
2211  0150 9d            	nop	
2212                     
2214                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2217  0151 4b01          	push	#1
2218  0153 1e07          	ldw	x,(OFST-9,sp)
2219  0155 1c0004        	addw	x,#4
2220  0158 cd0000        	call	_NHALgpio_Write
2222  015b ae000f        	ldw	x,#15
2223  015e 9d            	nop	
2224  015f 84            	pop	a
2225                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2230  0160               L232:
2231  0160 5a            	decw	X
2232  0161 26fd          	jrne	L232
2233  0163 9d            	nop	
2234                     
2236                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2239  0164 4b00          	push	#0
2240  0166 1e07          	ldw	x,(OFST-9,sp)
2241  0168 1c0004        	addw	x,#4
2242  016b cd0000        	call	_NHALgpio_Write
2244  016e ae000f        	ldw	x,#15
2245  0171 9d            	nop	
2246  0172 84            	pop	a
2247                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2252  0173               L632:
2253  0173 5a            	decw	X
2254  0174 26fd          	jrne	L632
2255                     
2257  0176 cc00f2        	jp	LC002
2258  0179               L7321:
2259                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2262  0179 4b01          	push	#1
2263  017b 1e07          	ldw	x,(OFST-9,sp)
2264  017d 1c0004        	addw	x,#4
2265  0180 cd0000        	call	_NHALgpio_Write
2267  0183 ae000f        	ldw	x,#15
2268  0186 9d            	nop	
2269  0187 84            	pop	a
2270                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2275  0188               L242:
2276  0188 5a            	decw	X
2277  0189 26fd          	jrne	L242
2278  018b 9d            	nop	
2279                     
2281                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2284  018c 4b00          	push	#0
2285  018e 1e07          	ldw	x,(OFST-9,sp)
2286  0190 1c0004        	addw	x,#4
2287  0193 cd0000        	call	_NHALgpio_Write
2289  0196 ae000f        	ldw	x,#15
2290  0199 9d            	nop	
2291  019a 84            	pop	a
2292                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2297  019b               L642:
2298  019b 5a            	decw	X
2299  019c 26fd          	jrne	L642
2300  019e 9d            	nop	
2301                     
2303                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2306  019f 4b01          	push	#1
2307  01a1 1e07          	ldw	x,(OFST-9,sp)
2308  01a3 1c0004        	addw	x,#4
2309  01a6 cd0000        	call	_NHALgpio_Write
2311  01a9 ae000f        	ldw	x,#15
2312  01ac 9d            	nop	
2313  01ad 84            	pop	a
2314                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2319  01ae               L252:
2320  01ae 5a            	decw	X
2321  01af 26fd          	jrne	L252
2322  01b1 9d            	nop	
2323                     
2325                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2328  01b2 4b00          	push	#0
2329  01b4 1e07          	ldw	x,(OFST-9,sp)
2330  01b6 1c0004        	addw	x,#4
2331  01b9 cd0000        	call	_NHALgpio_Write
2333  01bc ae000f        	ldw	x,#15
2334  01bf 9d            	nop	
2335  01c0 84            	pop	a
2336                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2341  01c1               L652:
2342  01c1 5a            	decw	X
2343  01c2 26fd          	jrne	L652
2344                     
2346  01c4 cc00f2        	jp	LC002
2347  01c7               L3531:
2348                     ; 209 		return semilla;
2350  01c7 1e04          	ldw	x,(OFST-12,sp)
2351  01c9 1f0a          	ldw	(OFST-6,sp),x
2352  01cb 1e02          	ldw	x,(OFST-14,sp)
2353  01cd 1f08          	ldw	(OFST-8,sp),x
2357  01cf 96            	ldw	x,sp
2358  01d0 1c0008        	addw	x,#OFST-8
2359  01d3 cd0000        	call	c_ltor
2361  01d6 96            	ldw	x,sp
2362  01d7 1c000c        	addw	x,#OFST-4
2363  01da cd0000        	call	c_lgadd
2366                     ; 350 		--repeticiones;
2368  01dd 0a10          	dec	(OFST+0,sp)
2370                     ; 346 	while( ( repeticiones > 0 ) )
2372  01df 2703cc000c    	jrne	L5431
2373                     ; 352 	repeticiones = 4;
2375                     ; 354 	return valorMedio/repeticiones;
2377  01e4 96            	ldw	x,sp
2378  01e5 1c000c        	addw	x,#OFST-4
2379  01e8 cd0000        	call	c_ltor
2381  01eb a602          	ld	a,#2
2382  01ed cd0000        	call	c_lursh
2384  01f0 be02          	ldw	x,c_lreg+2
2387  01f2 5b12          	addw	sp,#18
2388  01f4 81            	ret	
2401                     	xdef	_hx711_Tarar
2402                     	xdef	_hx711_Lectura
2403                     	xdef	_HX711_Init
2404                     	xref	_Timeout_Stop
2405                     	xref	_Timeout_Start
2406                     	xref	_NHALgpio_Write
2407                     	xref	_NHALgpio_Read
2408                     	xref	_NHALgpio_Init
2409                     	xref	_NHALgpioConfig_SetType
2410                     	xref.b	c_lreg
2411                     	xref.b	c_x
2430                     	xref	c_lursh
2431                     	xref	c_lgadd
2432                     	xref	c_ludv
2433                     	xref	c_rtol
2434                     	xref	c_uitolx
2435                     	xref	c_ltor
2436                     	xref	c_lgor
2437                     	end

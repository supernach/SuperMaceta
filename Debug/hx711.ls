   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     .const:	section	.text
  19  0000               L11_HX711_LONGITUDTRAMA:
  20  0000 18            	dc.b	24
  21  0001               L31_HX711_TIEMPOCLOCK:
  22  0001 03            	dc.b	3
  23  0002               L51_HX711_TIEMPOCLOCKSLEEP:
  24  0002 46            	dc.b	70
 867                     ; 241 void HX711_Init( HX711_t_ptr hx711, HX711_fPtr Lectura, HX711_fPtr Tarar, Timeout_t_ptr Timeout )
 867                     ; 242 {
 869                     .text:	section	.text,new
 870  0000               _HX711_Init:
 872  0000 89            	pushw	x
 873  0001 89            	pushw	x
 874       00000002      OFST:	set	2
 877                     ; 243 	initPtrFunciones( hx711, Lectura, Tarar );
 881                     ; 67 	hx711->Lectura = Lectura;
 883  0002 1607          	ldw	y,(OFST+5,sp)
 884  0004 ef16          	ldw	(22,x),y
 885                     ; 68 	hx711->Tarar = Tarar;
 887  0006 1609          	ldw	y,(OFST+7,sp)
 888  0008 ef18          	ldw	(24,x),y
 889                     ; 245 	hx711->Timeout = Timeout;
 891  000a 160b          	ldw	y,(OFST+9,sp)
 892  000c ef14          	ldw	(20,x),y
 893                     ; 247 	initVariables( hx711 );
 897                     ; 73 	hx711->Datos.UltimaLectura = 0;
 899  000e 4f            	clr	a
 900  000f e712          	ld	(18,x),a
 901  0011 e711          	ld	(17,x),a
 902  0013 e710          	ld	(16,x),a
 903  0015 e70f          	ld	(15,x),a
 904                     ; 74 	hx711->Config.ValorTara = 0;
 906  0017 905f          	clrw	y
 907  0019 ef0d          	ldw	(13,x),y
 908                     ; 75 	hx711->Config.ValorConversion = 1;
 910  001b 905c          	incw	y
 911  001d ef09          	ldw	(9,x),y
 912                     ; 76 	hx711->Config.Ganancia = CHANNELA_128;
 914  001f 6f08          	clr	(8,x)
 915                     ; 249 	initDOUT( &hx711->Config.DOUT );
 918  0021 1f01          	ldw	(OFST-1,sp),x
 920                     ; 81 	NHALgpioConfig_SetType( dout,GPIO_MODE_IN_PU_NO_IT );
 922  0023 4b40          	push	#64
 923  0025 1e02          	ldw	x,(OFST+0,sp)
 924  0027 cd0000        	call	_NHALgpioConfig_SetType
 926  002a 84            	pop	a
 927                     ; 82 	NHALgpio_Init( dout );
 929  002b 1e01          	ldw	x,(OFST-1,sp)
 930  002d cd0000        	call	_NHALgpio_Init
 932                     ; 250 	initPDSCK( &hx711->Config.PD_SCK );
 935  0030 1e03          	ldw	x,(OFST+1,sp)
 936  0032 1c0004        	addw	x,#4
 937  0035 1f01          	ldw	(OFST-1,sp),x
 939                     ; 87 	NHALgpioConfig_SetType( pdsck, GPIO_MODE_OUT_PP_LOW_FAST );
 941  0037 4be0          	push	#224
 942  0039 1e02          	ldw	x,(OFST+0,sp)
 943  003b cd0000        	call	_NHALgpioConfig_SetType
 945  003e 84            	pop	a
 946                     ; 88 	NHALgpio_Init( pdsck );
 948  003f 1e01          	ldw	x,(OFST-1,sp)
 949  0041 cd0000        	call	_NHALgpio_Init
 951                     ; 252 	chequearValorConversion( hx711 );
 954  0044 1e03          	ldw	x,(OFST+1,sp)
 955  0046 1f01          	ldw	(OFST-1,sp),x
 957                     ; 93 	if( ( hx711->Config.ValorConversion ) == 0 )
 959  0048 e60a          	ld	a,(10,x)
 960  004a ea09          	or	a,(9,x)
 961  004c 260b          	jrne	L306
 962                     ; 95 		hx711->Config.ValorConversion = 1;
 964  004e 90ae0001      	ldw	y,#1
 965  0052 ef09          	ldw	(9,x),y
 966                     ; 96 		hx711->Datos.Estado = SINVALORCONVERSION;
 968  0054 4c            	inc	a
 969  0055 e713          	ld	(19,x),a
 971  0057 2002          	jra	L701
 972  0059               L306:
 973                     ; 100 		hx711->Datos.Estado = INICIALIZADO;
 975  0059 6f13          	clr	(19,x)
 976  005b               L701:
 977                     ; 254 	aDormir( hx711 );
 980  005b 1f01          	ldw	(OFST-1,sp),x
 982                     ; 106 	NHALgpio_Write( &hx711->Config.PD_SCK, true );
 984  005d 4b01          	push	#1
 985  005f 1e02          	ldw	x,(OFST+0,sp)
 986  0061 1c0004        	addw	x,#4
 987  0064 cd0000        	call	_NHALgpio_Write
 989  0067 ae0174        	ldw	x,#372
 990  006a 9d            	nop	
 991  006b 84            	pop	a
 992                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 997  006c               L02:
 998  006c 5a            	decw	X
 999  006d 26fd          	jrne	L02
1000  006f 9d            	nop	
1001                     
1003                     ; 109 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1005  0070 1e01          	ldw	x,(OFST-1,sp)
1006  0072 e613          	ld	a,(19,x)
1007  0074 4a            	dec	a
1008  0075 2704          	jreq	L511
1009                     ; 111 		hx711->Datos.Estado = SLEEP;
1011  0077 a602          	ld	a,#2
1012  0079 e713          	ld	(19,x),a
1014  007b               L511:
1015                     ; 255 }
1018  007b 5b04          	addw	sp,#4
1019  007d 81            	ret	
1139                     ; 290 uint16_t hx711_Lectura( HX711_t_ptr hx711 )
1139                     ; 291 {
1140                     .text:	section	.text,new
1141  0000               _hx711_Lectura:
1143  0000 89            	pushw	x
1144  0001 520b          	subw	sp,#11
1145       0000000b      OFST:	set	11
1148                     ; 292 	uint32_t semilla = 0;
1150                     ; 294 	semilla = leer( hx711 );
1153  0003 1f06          	ldw	(OFST-5,sp),x
1155                     ; 170 	uint32_t semilla = 0;
1157  0005 5f            	clrw	x
1158  0006 1f0a          	ldw	(OFST-1,sp),x
1159  0008 1f08          	ldw	(OFST-3,sp),x
1161                     ; 171 	uint8_t contadorBucle = 0;
1163  000a 0f05          	clr	(OFST-6,sp)
1165                     ; 173 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1167  000c 1e06          	ldw	x,(OFST-5,sp)
1168  000e e613          	ld	a,(19,x)
1169  0010 4a            	dec	a
1170  0011 2603cc01ab    	jreq	L5401
1171                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1174  0016 4b00          	push	#0
1175  0018 1e07          	ldw	x,(OFST-4,sp)
1176  001a 1c0004        	addw	x,#4
1177  001d cd0000        	call	_NHALgpio_Write
1179  0020 ae000f        	ldw	x,#15
1180  0023 9d            	nop	
1181  0024 84            	pop	a
1182                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1187  0025               L62:
1188  0025 5a            	decw	X
1189  0026 26fd          	jrne	L62
1190  0028 9d            	nop	
1191                     
1193                     ; 159 	Timeout_Start( hx711->Timeout, 40 );
1196  0029 ae0028        	ldw	x,#40
1197  002c 89            	pushw	x
1198  002d 1e08          	ldw	x,(OFST-3,sp)
1199  002f ee14          	ldw	x,(20,x)
1200  0031 cd0000        	call	_Timeout_Start
1202  0034 85            	popw	x
1204  0035 2007          	jra	L1501
1205  0037               L7401:
1206                     ; 162 		Timeout_Check( hx711->Timeout );
1208  0037 1e06          	ldw	x,(OFST-5,sp)
1209  0039 ee14          	ldw	x,(20,x)
1210  003b cd0000        	call	_Timeout_Check
1212  003e               L1501:
1213                     ; 160 	while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) || ( hx711->Timeout->Estado == DISPARADO ) )
1215  003e 1e06          	ldw	x,(OFST-5,sp)
1216  0040 cd0000        	call	_NHALgpio_Read
1218  0043 4d            	tnz	a
1219  0044 26f1          	jrne	L7401
1221  0046 1e06          	ldw	x,(OFST-5,sp)
1222  0048 ee14          	ldw	x,(20,x)
1223  004a e602          	ld	a,(2,x)
1224  004c a102          	cp	a,#2
1225  004e 27e7          	jreq	L7401
1226                     ; 164 	Timeout_Stop( hx711->Timeout );
1228  0050 1e06          	ldw	x,(OFST-5,sp)
1229  0052 ee14          	ldw	x,(20,x)
1230  0054 cd0000        	call	_Timeout_Stop
1232                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1236  0057 ae000f        	ldw	x,#15
1238  005a 9d            	nop	
1239  005b               L04:
1240  005b 5a            	decw	X
1241  005c 26fd          	jrne	L04
1242                     
1244  005e 2043          	jra	L7501
1245  0060               L5501:
1246                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1249  0060 4b01          	push	#1
1250  0062 1e07          	ldw	x,(OFST-4,sp)
1251  0064 1c0004        	addw	x,#4
1252  0067 cd0000        	call	_NHALgpio_Write
1254  006a ae000f        	ldw	x,#15
1255  006d 9d            	nop	
1256  006e 84            	pop	a
1257                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1262  006f               L44:
1263  006f 5a            	decw	X
1264  0070 26fd          	jrne	L44
1265  0072 9d            	nop	
1266                     
1268                     ; 188 			semilla |= NHALgpio_Read( &hx711->Config.DOUT );
1270  0073 1e06          	ldw	x,(OFST-5,sp)
1271  0075 cd0000        	call	_NHALgpio_Read
1273  0078 b703          	ld	c_lreg+3,a
1274  007a 3f02          	clr	c_lreg+2
1275  007c 3f01          	clr	c_lreg+1
1276  007e 3f00          	clr	c_lreg
1277  0080 96            	ldw	x,sp
1278  0081 1c0008        	addw	x,#OFST-3
1279  0084 cd0000        	call	c_lgor
1282                     ; 189 			semilla <<= 1;
1284  0087 080b          	sll	(OFST+0,sp)
1285  0089 090a          	rlc	(OFST-1,sp)
1286  008b 0909          	rlc	(OFST-2,sp)
1287  008d 0908          	rlc	(OFST-3,sp)
1289                     ; 191 			contadorBucle++;
1291  008f 0c05          	inc	(OFST-6,sp)
1293                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1296  0091 4b00          	push	#0
1297  0093 1e07          	ldw	x,(OFST-4,sp)
1298  0095 1c0004        	addw	x,#4
1299  0098 cd0000        	call	_NHALgpio_Write
1301  009b ae000f        	ldw	x,#15
1302  009e 9d            	nop	
1303  009f 84            	pop	a
1304                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1309  00a0               L25:
1310  00a0 5a            	decw	X
1311  00a1 26fd          	jrne	L25
1312                     
1314  00a3               L7501:
1315  00a3 9d            	nop	
1316                     ; 182 		while( contadorBucle < HX711_LONGITUDTRAMA ) 
1318  00a4 7b05          	ld	a,(OFST-6,sp)
1319  00a6 a118          	cp	a,#24
1320  00a8 25b6          	jrult	L5501
1321                     ; 126 	switch( hx711->Config.Ganancia )
1324  00aa 1e06          	ldw	x,(OFST-5,sp)
1325  00ac e608          	ld	a,(8,x)
1327                     ; 151 		default:
1327                     ; 152 		
1327                     ; 153 		;
1328  00ae 270b          	jreq	L346
1329  00b0 4a            	dec	a
1330  00b1 2737          	jreq	L166
1331  00b3 4a            	dec	a
1332  00b4 2603cc015d    	jreq	L727
1333  00b9 2028          	jra	L367
1334  00bb               L346:
1335                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1338  00bb 4b01          	push	#1
1339  00bd 1e07          	ldw	x,(OFST-4,sp)
1340  00bf 1c0004        	addw	x,#4
1341  00c2 cd0000        	call	_NHALgpio_Write
1343  00c5 ae000f        	ldw	x,#15
1344  00c8 9d            	nop	
1345  00c9 84            	pop	a
1346                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1351  00ca               L65:
1352  00ca 5a            	decw	X
1353  00cb 26fd          	jrne	L65
1354  00cd 9d            	nop	
1355                     
1357                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1360  00ce 4b00          	push	#0
1361  00d0 1e07          	ldw	x,(OFST-4,sp)
1362  00d2 1c0004        	addw	x,#4
1363  00d5 cd0000        	call	_NHALgpio_Write
1365  00d8 ae000f        	ldw	x,#15
1366  00db 9d            	nop	
1367  00dc 84            	pop	a
1368                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1373  00dd               L26:
1374  00dd 5a            	decw	X
1375  00de 26fd          	jrne	L26
1376  00e0               LC001:
1377  00e0 9d            	nop	
1378                     
1380  00e1 1e06          	ldw	x,(OFST-5,sp)
1381  00e3               L367:
1382                     ; 199 		hx711->Datos.Estado = NUEVA_LECTURA;
1384  00e3 a603          	ld	a,#3
1385  00e5 e713          	ld	(19,x),a
1386  00e7 cc01ab        	jra	L5401
1387  00ea               L166:
1388                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1391  00ea 4b01          	push	#1
1392  00ec 1e07          	ldw	x,(OFST-4,sp)
1393  00ee 1c0004        	addw	x,#4
1394  00f1 cd0000        	call	_NHALgpio_Write
1396  00f4 ae000f        	ldw	x,#15
1397  00f7 9d            	nop	
1398  00f8 84            	pop	a
1399                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1404  00f9               L66:
1405  00f9 5a            	decw	X
1406  00fa 26fd          	jrne	L66
1407  00fc 9d            	nop	
1408                     
1410                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1413  00fd 4b00          	push	#0
1414  00ff 1e07          	ldw	x,(OFST-4,sp)
1415  0101 1c0004        	addw	x,#4
1416  0104 cd0000        	call	_NHALgpio_Write
1418  0107 ae000f        	ldw	x,#15
1419  010a 9d            	nop	
1420  010b 84            	pop	a
1421                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1426  010c               L27:
1427  010c 5a            	decw	X
1428  010d 26fd          	jrne	L27
1429  010f 9d            	nop	
1430                     
1432                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1435  0110 4b01          	push	#1
1436  0112 1e07          	ldw	x,(OFST-4,sp)
1437  0114 1c0004        	addw	x,#4
1438  0117 cd0000        	call	_NHALgpio_Write
1440  011a ae000f        	ldw	x,#15
1441  011d 9d            	nop	
1442  011e 84            	pop	a
1443                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1448  011f               L67:
1449  011f 5a            	decw	X
1450  0120 26fd          	jrne	L67
1451  0122 9d            	nop	
1452                     
1454                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1457  0123 4b00          	push	#0
1458  0125 1e07          	ldw	x,(OFST-4,sp)
1459  0127 1c0004        	addw	x,#4
1460  012a cd0000        	call	_NHALgpio_Write
1462  012d ae000f        	ldw	x,#15
1463  0130 9d            	nop	
1464  0131 84            	pop	a
1465                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1470  0132               L201:
1471  0132 5a            	decw	X
1472  0133 26fd          	jrne	L201
1473  0135 9d            	nop	
1474                     
1476                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1479  0136 4b01          	push	#1
1480  0138 1e07          	ldw	x,(OFST-4,sp)
1481  013a 1c0004        	addw	x,#4
1482  013d cd0000        	call	_NHALgpio_Write
1484  0140 ae000f        	ldw	x,#15
1485  0143 9d            	nop	
1486  0144 84            	pop	a
1487                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1492  0145               L601:
1493  0145 5a            	decw	X
1494  0146 26fd          	jrne	L601
1495  0148 9d            	nop	
1496                     
1498                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1501  0149 4b00          	push	#0
1502  014b 1e07          	ldw	x,(OFST-4,sp)
1503  014d 1c0004        	addw	x,#4
1504  0150 cd0000        	call	_NHALgpio_Write
1506  0153 ae000f        	ldw	x,#15
1507  0156 9d            	nop	
1508  0157 84            	pop	a
1509                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1514  0158               L211:
1515  0158 5a            	decw	X
1516  0159 26fd          	jrne	L211
1517                     
1519  015b 2083          	jp	LC001
1520  015d               L727:
1521                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1524  015d 4b01          	push	#1
1525  015f 1e07          	ldw	x,(OFST-4,sp)
1526  0161 1c0004        	addw	x,#4
1527  0164 cd0000        	call	_NHALgpio_Write
1529  0167 ae000f        	ldw	x,#15
1530  016a 9d            	nop	
1531  016b 84            	pop	a
1532                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1537  016c               L611:
1538  016c 5a            	decw	X
1539  016d 26fd          	jrne	L611
1540  016f 9d            	nop	
1541                     
1543                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1546  0170 4b00          	push	#0
1547  0172 1e07          	ldw	x,(OFST-4,sp)
1548  0174 1c0004        	addw	x,#4
1549  0177 cd0000        	call	_NHALgpio_Write
1551  017a ae000f        	ldw	x,#15
1552  017d 9d            	nop	
1553  017e 84            	pop	a
1554                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1559  017f               L221:
1560  017f 5a            	decw	X
1561  0180 26fd          	jrne	L221
1562  0182 9d            	nop	
1563                     
1565                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1568  0183 4b01          	push	#1
1569  0185 1e07          	ldw	x,(OFST-4,sp)
1570  0187 1c0004        	addw	x,#4
1571  018a cd0000        	call	_NHALgpio_Write
1573  018d ae000f        	ldw	x,#15
1574  0190 9d            	nop	
1575  0191 84            	pop	a
1576                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1581  0192               L621:
1582  0192 5a            	decw	X
1583  0193 26fd          	jrne	L621
1584  0195 9d            	nop	
1585                     
1587                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1590  0196 4b00          	push	#0
1591  0198 1e07          	ldw	x,(OFST-4,sp)
1592  019a 1c0004        	addw	x,#4
1593  019d cd0000        	call	_NHALgpio_Write
1595  01a0 ae000f        	ldw	x,#15
1596  01a3 9d            	nop	
1597  01a4 84            	pop	a
1598                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1603  01a5               L231:
1604  01a5 5a            	decw	X
1605  01a6 26fd          	jrne	L231
1606                     
1608  01a8 cc00e0        	jp	LC001
1609  01ab               L5401:
1610                     ; 201 		return semilla;
1615                     ; 295 	aDormir( hx711 );
1618  01ab 1e0c          	ldw	x,(OFST+1,sp)
1619  01ad 1f06          	ldw	(OFST-5,sp),x
1621                     ; 106 	NHALgpio_Write( &hx711->Config.PD_SCK, true );
1623  01af 4b01          	push	#1
1624  01b1 1e07          	ldw	x,(OFST-4,sp)
1625  01b3 1c0004        	addw	x,#4
1626  01b6 cd0000        	call	_NHALgpio_Write
1628  01b9 ae0174        	ldw	x,#372
1629  01bc 9d            	nop	
1630  01bd 84            	pop	a
1631                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1636  01be               L041:
1637  01be 5a            	decw	X
1638  01bf 26fd          	jrne	L041
1639  01c1 9d            	nop	
1640                     
1642                     ; 109 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1644  01c2 1e06          	ldw	x,(OFST-5,sp)
1645  01c4 e613          	ld	a,(19,x)
1646  01c6 4a            	dec	a
1647  01c7 2704          	jreq	L377
1648                     ; 111 		hx711->Datos.Estado = SLEEP;
1650  01c9 a602          	ld	a,#2
1651  01cb e713          	ld	(19,x),a
1653  01cd               L377:
1654                     ; 297 	return ( semilla / hx711->Config.ValorConversion );
1656  01cd 1e0c          	ldw	x,(OFST+1,sp)
1657  01cf ee09          	ldw	x,(9,x)
1658  01d1 cd0000        	call	c_uitolx
1660  01d4 96            	ldw	x,sp
1661  01d5 5c            	incw	x
1662  01d6 cd0000        	call	c_rtol
1665  01d9 96            	ldw	x,sp
1666  01da 1c0008        	addw	x,#OFST-3
1667  01dd cd0000        	call	c_ltor
1669  01e0 96            	ldw	x,sp
1670  01e1 5c            	incw	x
1671  01e2 cd0000        	call	c_ludv
1673  01e5 be02          	ldw	x,c_lreg+2
1676  01e7 5b0d          	addw	sp,#13
1677  01e9 81            	ret	
1791                     ; 333 uint16_t hx711_Tarar( HX711_t_ptr hx711 )
1791                     ; 334 {
1792                     .text:	section	.text,new
1793  0000               _hx711_Tarar:
1795  0000 89            	pushw	x
1796  0001 5210          	subw	sp,#16
1797       00000010      OFST:	set	16
1800                     ; 335 	uint32_t valorMedio = 0;
1802  0003 5f            	clrw	x
1803  0004 1f0e          	ldw	(OFST-2,sp),x
1804  0006 1f0c          	ldw	(OFST-4,sp),x
1806                     ; 336 	uint8_t repeticiones = 4;
1808  0008 a604          	ld	a,#4
1809  000a 6b10          	ld	(OFST+0,sp),a
1811  000c               L5131:
1812                     ; 340 		valorMedio = valorMedio + leer( hx711 );
1815  000c 1e11          	ldw	x,(OFST+1,sp)
1816  000e 1f06          	ldw	(OFST-10,sp),x
1818                     ; 170 	uint32_t semilla = 0;
1820  0010 5f            	clrw	x
1821  0011 1f04          	ldw	(OFST-12,sp),x
1822  0013 1f02          	ldw	(OFST-14,sp),x
1824                     ; 171 	uint8_t contadorBucle = 0;
1826  0015 0f01          	clr	(OFST-15,sp)
1828                     ; 173 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1830  0017 1e06          	ldw	x,(OFST-10,sp)
1831  0019 e613          	ld	a,(19,x)
1832  001b 4a            	dec	a
1833  001c 2603cc01b6    	jreq	L3231
1834                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1837  0021 4b00          	push	#0
1838  0023 1e07          	ldw	x,(OFST-9,sp)
1839  0025 1c0004        	addw	x,#4
1840  0028 cd0000        	call	_NHALgpio_Write
1842  002b ae000f        	ldw	x,#15
1843  002e 9d            	nop	
1844  002f 84            	pop	a
1845                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1850  0030               L641:
1851  0030 5a            	decw	X
1852  0031 26fd          	jrne	L641
1853  0033 9d            	nop	
1854                     
1856                     ; 159 	Timeout_Start( hx711->Timeout, 40 );
1859  0034 ae0028        	ldw	x,#40
1860  0037 89            	pushw	x
1861  0038 1e08          	ldw	x,(OFST-8,sp)
1862  003a ee14          	ldw	x,(20,x)
1863  003c cd0000        	call	_Timeout_Start
1865  003f 85            	popw	x
1867  0040 2007          	jra	L7231
1868  0042               L5231:
1869                     ; 162 		Timeout_Check( hx711->Timeout );
1871  0042 1e06          	ldw	x,(OFST-10,sp)
1872  0044 ee14          	ldw	x,(20,x)
1873  0046 cd0000        	call	_Timeout_Check
1875  0049               L7231:
1876                     ; 160 	while( ( NHALgpio_Read( &hx711->Config.DOUT ) == true ) || ( hx711->Timeout->Estado == DISPARADO ) )
1878  0049 1e06          	ldw	x,(OFST-10,sp)
1879  004b cd0000        	call	_NHALgpio_Read
1881  004e 4d            	tnz	a
1882  004f 26f1          	jrne	L5231
1884  0051 1e06          	ldw	x,(OFST-10,sp)
1885  0053 ee14          	ldw	x,(20,x)
1886  0055 e602          	ld	a,(2,x)
1887  0057 a102          	cp	a,#2
1888  0059 27e7          	jreq	L5231
1889                     ; 164 	Timeout_Stop( hx711->Timeout );
1891  005b 1e06          	ldw	x,(OFST-10,sp)
1892  005d ee14          	ldw	x,(20,x)
1893  005f cd0000        	call	_Timeout_Stop
1895                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1899  0062 ae000f        	ldw	x,#15
1901  0065 9d            	nop	
1902  0066               L061:
1903  0066 5a            	decw	X
1904  0067 26fd          	jrne	L061
1905                     
1907  0069 2043          	jra	L5331
1908  006b               L3331:
1909                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1912  006b 4b01          	push	#1
1913  006d 1e07          	ldw	x,(OFST-9,sp)
1914  006f 1c0004        	addw	x,#4
1915  0072 cd0000        	call	_NHALgpio_Write
1917  0075 ae000f        	ldw	x,#15
1918  0078 9d            	nop	
1919  0079 84            	pop	a
1920                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1925  007a               L461:
1926  007a 5a            	decw	X
1927  007b 26fd          	jrne	L461
1928  007d 9d            	nop	
1929                     
1931                     ; 188 			semilla |= NHALgpio_Read( &hx711->Config.DOUT );
1933  007e 1e06          	ldw	x,(OFST-10,sp)
1934  0080 cd0000        	call	_NHALgpio_Read
1936  0083 b703          	ld	c_lreg+3,a
1937  0085 3f02          	clr	c_lreg+2
1938  0087 3f01          	clr	c_lreg+1
1939  0089 3f00          	clr	c_lreg
1940  008b 96            	ldw	x,sp
1941  008c 1c0002        	addw	x,#OFST-14
1942  008f cd0000        	call	c_lgor
1945                     ; 189 			semilla <<= 1;
1947  0092 0805          	sll	(OFST-11,sp)
1948  0094 0904          	rlc	(OFST-12,sp)
1949  0096 0903          	rlc	(OFST-13,sp)
1950  0098 0902          	rlc	(OFST-14,sp)
1952                     ; 191 			contadorBucle++;
1954  009a 0c01          	inc	(OFST-15,sp)
1956                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1959  009c 4b00          	push	#0
1960  009e 1e07          	ldw	x,(OFST-9,sp)
1961  00a0 1c0004        	addw	x,#4
1962  00a3 cd0000        	call	_NHALgpio_Write
1964  00a6 ae000f        	ldw	x,#15
1965  00a9 9d            	nop	
1966  00aa 84            	pop	a
1967                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1972  00ab               L271:
1973  00ab 5a            	decw	X
1974  00ac 26fd          	jrne	L271
1975                     
1977  00ae               L5331:
1978  00ae 9d            	nop	
1979                     ; 182 		while( contadorBucle < HX711_LONGITUDTRAMA ) 
1981  00af 7b01          	ld	a,(OFST-15,sp)
1982  00b1 a118          	cp	a,#24
1983  00b3 25b6          	jrult	L3331
1984                     ; 126 	switch( hx711->Config.Ganancia )
1987  00b5 1e06          	ldw	x,(OFST-10,sp)
1988  00b7 e608          	ld	a,(8,x)
1990                     ; 151 		default:
1990                     ; 152 		
1990                     ; 153 		;
1991  00b9 270b          	jreq	L3211
1992  00bb 4a            	dec	a
1993  00bc 2737          	jreq	L1411
1994  00be 4a            	dec	a
1995  00bf 2603cc0168    	jreq	L7021
1996  00c4 2028          	jra	L3421
1997  00c6               L3211:
1998                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2001  00c6 4b01          	push	#1
2002  00c8 1e07          	ldw	x,(OFST-9,sp)
2003  00ca 1c0004        	addw	x,#4
2004  00cd cd0000        	call	_NHALgpio_Write
2006  00d0 ae000f        	ldw	x,#15
2007  00d3 9d            	nop	
2008  00d4 84            	pop	a
2009                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2014  00d5               L671:
2015  00d5 5a            	decw	X
2016  00d6 26fd          	jrne	L671
2017  00d8 9d            	nop	
2018                     
2020                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2023  00d9 4b00          	push	#0
2024  00db 1e07          	ldw	x,(OFST-9,sp)
2025  00dd 1c0004        	addw	x,#4
2026  00e0 cd0000        	call	_NHALgpio_Write
2028  00e3 ae000f        	ldw	x,#15
2029  00e6 9d            	nop	
2030  00e7 84            	pop	a
2031                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2036  00e8               L202:
2037  00e8 5a            	decw	X
2038  00e9 26fd          	jrne	L202
2039  00eb               LC002:
2040  00eb 9d            	nop	
2041                     
2043  00ec 1e06          	ldw	x,(OFST-10,sp)
2044  00ee               L3421:
2045                     ; 199 		hx711->Datos.Estado = NUEVA_LECTURA;
2047  00ee a603          	ld	a,#3
2048  00f0 e713          	ld	(19,x),a
2049  00f2 cc01b6        	jra	L3231
2050  00f5               L1411:
2051                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2054  00f5 4b01          	push	#1
2055  00f7 1e07          	ldw	x,(OFST-9,sp)
2056  00f9 1c0004        	addw	x,#4
2057  00fc cd0000        	call	_NHALgpio_Write
2059  00ff ae000f        	ldw	x,#15
2060  0102 9d            	nop	
2061  0103 84            	pop	a
2062                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2067  0104               L602:
2068  0104 5a            	decw	X
2069  0105 26fd          	jrne	L602
2070  0107 9d            	nop	
2071                     
2073                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2076  0108 4b00          	push	#0
2077  010a 1e07          	ldw	x,(OFST-9,sp)
2078  010c 1c0004        	addw	x,#4
2079  010f cd0000        	call	_NHALgpio_Write
2081  0112 ae000f        	ldw	x,#15
2082  0115 9d            	nop	
2083  0116 84            	pop	a
2084                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2089  0117               L212:
2090  0117 5a            	decw	X
2091  0118 26fd          	jrne	L212
2092  011a 9d            	nop	
2093                     
2095                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2098  011b 4b01          	push	#1
2099  011d 1e07          	ldw	x,(OFST-9,sp)
2100  011f 1c0004        	addw	x,#4
2101  0122 cd0000        	call	_NHALgpio_Write
2103  0125 ae000f        	ldw	x,#15
2104  0128 9d            	nop	
2105  0129 84            	pop	a
2106                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2111  012a               L612:
2112  012a 5a            	decw	X
2113  012b 26fd          	jrne	L612
2114  012d 9d            	nop	
2115                     
2117                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2120  012e 4b00          	push	#0
2121  0130 1e07          	ldw	x,(OFST-9,sp)
2122  0132 1c0004        	addw	x,#4
2123  0135 cd0000        	call	_NHALgpio_Write
2125  0138 ae000f        	ldw	x,#15
2126  013b 9d            	nop	
2127  013c 84            	pop	a
2128                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2133  013d               L222:
2134  013d 5a            	decw	X
2135  013e 26fd          	jrne	L222
2136  0140 9d            	nop	
2137                     
2139                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2142  0141 4b01          	push	#1
2143  0143 1e07          	ldw	x,(OFST-9,sp)
2144  0145 1c0004        	addw	x,#4
2145  0148 cd0000        	call	_NHALgpio_Write
2147  014b ae000f        	ldw	x,#15
2148  014e 9d            	nop	
2149  014f 84            	pop	a
2150                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2155  0150               L622:
2156  0150 5a            	decw	X
2157  0151 26fd          	jrne	L622
2158  0153 9d            	nop	
2159                     
2161                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2164  0154 4b00          	push	#0
2165  0156 1e07          	ldw	x,(OFST-9,sp)
2166  0158 1c0004        	addw	x,#4
2167  015b cd0000        	call	_NHALgpio_Write
2169  015e ae000f        	ldw	x,#15
2170  0161 9d            	nop	
2171  0162 84            	pop	a
2172                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2177  0163               L232:
2178  0163 5a            	decw	X
2179  0164 26fd          	jrne	L232
2180                     
2182  0166 2083          	jp	LC002
2183  0168               L7021:
2184                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2187  0168 4b01          	push	#1
2188  016a 1e07          	ldw	x,(OFST-9,sp)
2189  016c 1c0004        	addw	x,#4
2190  016f cd0000        	call	_NHALgpio_Write
2192  0172 ae000f        	ldw	x,#15
2193  0175 9d            	nop	
2194  0176 84            	pop	a
2195                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2200  0177               L632:
2201  0177 5a            	decw	X
2202  0178 26fd          	jrne	L632
2203  017a 9d            	nop	
2204                     
2206                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2209  017b 4b00          	push	#0
2210  017d 1e07          	ldw	x,(OFST-9,sp)
2211  017f 1c0004        	addw	x,#4
2212  0182 cd0000        	call	_NHALgpio_Write
2214  0185 ae000f        	ldw	x,#15
2215  0188 9d            	nop	
2216  0189 84            	pop	a
2217                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2222  018a               L242:
2223  018a 5a            	decw	X
2224  018b 26fd          	jrne	L242
2225  018d 9d            	nop	
2226                     
2228                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2231  018e 4b01          	push	#1
2232  0190 1e07          	ldw	x,(OFST-9,sp)
2233  0192 1c0004        	addw	x,#4
2234  0195 cd0000        	call	_NHALgpio_Write
2236  0198 ae000f        	ldw	x,#15
2237  019b 9d            	nop	
2238  019c 84            	pop	a
2239                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2244  019d               L642:
2245  019d 5a            	decw	X
2246  019e 26fd          	jrne	L642
2247  01a0 9d            	nop	
2248                     
2250                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2253  01a1 4b00          	push	#0
2254  01a3 1e07          	ldw	x,(OFST-9,sp)
2255  01a5 1c0004        	addw	x,#4
2256  01a8 cd0000        	call	_NHALgpio_Write
2258  01ab ae000f        	ldw	x,#15
2259  01ae 9d            	nop	
2260  01af 84            	pop	a
2261                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2266  01b0               L252:
2267  01b0 5a            	decw	X
2268  01b1 26fd          	jrne	L252
2269                     
2271  01b3 cc00eb        	jp	LC002
2272  01b6               L3231:
2273                     ; 201 		return semilla;
2275  01b6 1e04          	ldw	x,(OFST-12,sp)
2276  01b8 1f0a          	ldw	(OFST-6,sp),x
2277  01ba 1e02          	ldw	x,(OFST-14,sp)
2278  01bc 1f08          	ldw	(OFST-8,sp),x
2282  01be 96            	ldw	x,sp
2283  01bf 1c0008        	addw	x,#OFST-8
2284  01c2 cd0000        	call	c_ltor
2286  01c5 96            	ldw	x,sp
2287  01c6 1c000c        	addw	x,#OFST-4
2288  01c9 cd0000        	call	c_lgadd
2291                     ; 342 		--repeticiones;
2293  01cc 0a10          	dec	(OFST+0,sp)
2295                     ; 338 	while( ( repeticiones > 0 ) )
2297  01ce 2703cc000c    	jrne	L5131
2298                     ; 344 	repeticiones = 4;
2300                     ; 346 	return valorMedio/repeticiones;
2302  01d3 96            	ldw	x,sp
2303  01d4 1c000c        	addw	x,#OFST-4
2304  01d7 cd0000        	call	c_ltor
2306  01da a602          	ld	a,#2
2307  01dc cd0000        	call	c_lursh
2309  01df be02          	ldw	x,c_lreg+2
2312  01e1 5b12          	addw	sp,#18
2313  01e3 81            	ret	
2326                     	xdef	_hx711_Tarar
2327                     	xdef	_hx711_Lectura
2328                     	xdef	_HX711_Init
2329                     	xref	_Timeout_Check
2330                     	xref	_Timeout_Stop
2331                     	xref	_Timeout_Start
2332                     	xref	_NHALgpio_Write
2333                     	xref	_NHALgpio_Read
2334                     	xref	_NHALgpio_Init
2335                     	xref	_NHALgpioConfig_SetType
2336                     	xref.b	c_lreg
2337                     	xref.b	c_x
2356                     	xref	c_lursh
2357                     	xref	c_lgadd
2358                     	xref	c_ludv
2359                     	xref	c_rtol
2360                     	xref	c_uitolx
2361                     	xref	c_ltor
2362                     	xref	c_lgor
2363                     	end

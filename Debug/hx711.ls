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
 694                     ; 238 void HX711_Init( HX711_t_ptr hx711, HX711_fPtr Lectura, HX711_fPtr Tarar )
 694                     ; 239 {
 696                     .text:	section	.text,new
 697  0000               _HX711_Init:
 699  0000 89            	pushw	x
 700  0001 89            	pushw	x
 701       00000002      OFST:	set	2
 704                     ; 240 	initPtrFunciones( hx711, Lectura, Tarar );
 708                     ; 67 	hx711->Lectura = Lectura;
 710  0002 1607          	ldw	y,(OFST+5,sp)
 711  0004 ef14          	ldw	(20,x),y
 712                     ; 68 	hx711->Tarar = Tarar;
 714  0006 1609          	ldw	y,(OFST+7,sp)
 715  0008 ef16          	ldw	(22,x),y
 716                     ; 242 	initVariables( hx711 );
 720                     ; 73 	hx711->Datos.UltimaLectura = 0;
 722  000a 4f            	clr	a
 723  000b e712          	ld	(18,x),a
 724  000d e711          	ld	(17,x),a
 725  000f e710          	ld	(16,x),a
 726  0011 e70f          	ld	(15,x),a
 727                     ; 74 	hx711->Config.ValorTara = 0;
 729  0013 905f          	clrw	y
 730  0015 ef0d          	ldw	(13,x),y
 731                     ; 75 	hx711->Config.ValorConversion = 1;
 733  0017 905c          	incw	y
 734  0019 ef09          	ldw	(9,x),y
 735                     ; 76 	hx711->Config.Ganancia = CHANNELA_128;
 737  001b 6f08          	clr	(8,x)
 738                     ; 244 	initDOUT( &hx711->Config.DOUT );
 741  001d 1f01          	ldw	(OFST-1,sp),x
 743                     ; 81 	NHALgpioConfig_SetType( dout,GPIO_MODE_IN_PU_NO_IT );
 745  001f 4b40          	push	#64
 746  0021 1e02          	ldw	x,(OFST+0,sp)
 747  0023 cd0000        	call	_NHALgpioConfig_SetType
 749  0026 84            	pop	a
 750                     ; 82 	NHALgpio_Init( dout );
 752  0027 1e01          	ldw	x,(OFST-1,sp)
 753  0029 cd0000        	call	_NHALgpio_Init
 755                     ; 245 	initPDSCK( &hx711->Config.PD_SCK );
 758  002c 1e03          	ldw	x,(OFST+1,sp)
 759  002e 1c0004        	addw	x,#4
 760  0031 1f01          	ldw	(OFST-1,sp),x
 762                     ; 87 	NHALgpioConfig_SetType( pdsck, GPIO_MODE_OUT_PP_LOW_FAST );
 764  0033 4be0          	push	#224
 765  0035 1e02          	ldw	x,(OFST+0,sp)
 766  0037 cd0000        	call	_NHALgpioConfig_SetType
 768  003a 84            	pop	a
 769                     ; 88 	NHALgpio_Init( pdsck );
 771  003b 1e01          	ldw	x,(OFST-1,sp)
 772  003d cd0000        	call	_NHALgpio_Init
 774                     ; 247 	chequearValorConversion( hx711 );
 777  0040 1e03          	ldw	x,(OFST+1,sp)
 778  0042 1f01          	ldw	(OFST-1,sp),x
 780                     ; 93 	if( ( hx711->Config.ValorConversion ) == 0 )
 782  0044 e60a          	ld	a,(10,x)
 783  0046 ea09          	or	a,(9,x)
 784  0048 260b          	jrne	L374
 785                     ; 95 		hx711->Config.ValorConversion = 1;
 787  004a 90ae0001      	ldw	y,#1
 788  004e ef09          	ldw	(9,x),y
 789                     ; 96 		hx711->Datos.Estado = SINVALORCONVERSION;
 791  0050 4c            	inc	a
 792  0051 e713          	ld	(19,x),a
 794  0053 2002          	jra	L701
 795  0055               L374:
 796                     ; 100 		hx711->Datos.Estado = INICIALIZADO;
 798  0055 6f13          	clr	(19,x)
 799  0057               L701:
 800                     ; 249 	aDormir( hx711 );
 803  0057 1f01          	ldw	(OFST-1,sp),x
 805                     ; 106 	NHALgpio_Write( &hx711->Config.PD_SCK, true );
 807  0059 4b01          	push	#1
 808  005b 1e02          	ldw	x,(OFST+0,sp)
 809  005d 1c0004        	addw	x,#4
 810  0060 cd0000        	call	_NHALgpio_Write
 812  0063 ae0174        	ldw	x,#372
 813  0066 9d            	nop	
 814  0067 84            	pop	a
 815                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 820  0068               L02:
 821  0068 5a            	decw	X
 822  0069 26fd          	jrne	L02
 823  006b 9d            	nop	
 824                     
 826                     ; 109 	if( hx711->Datos.Estado != SINVALORCONVERSION )
 828  006c 1e01          	ldw	x,(OFST-1,sp)
 829  006e e613          	ld	a,(19,x)
 830  0070 4a            	dec	a
 831  0071 2704          	jreq	L511
 832                     ; 111 		hx711->Datos.Estado = SLEEP;
 834  0073 a602          	ld	a,#2
 835  0075 e713          	ld	(19,x),a
 837  0077               L511:
 838                     ; 250 }
 841  0077 5b04          	addw	sp,#4
 842  0079 81            	ret	
 959                     ; 285 uint16_t hx711_Lectura( HX711_t_ptr hx711 )
 959                     ; 286 {
 960                     .text:	section	.text,new
 961  0000               _hx711_Lectura:
 963  0000 89            	pushw	x
 964  0001 520b          	subw	sp,#11
 965       0000000b      OFST:	set	11
 968                     ; 287 	uint32_t semilla = 0;
 970                     ; 289 	semilla = leer( hx711 );
 973  0003 1f06          	ldw	(OFST-5,sp),x
 975                     ; 167 	uint32_t semilla = 0;
 977  0005 5f            	clrw	x
 978  0006 1f0a          	ldw	(OFST-1,sp),x
 979  0008 1f08          	ldw	(OFST-3,sp),x
 981                     ; 168 	uint8_t contadorBucle = 0;
 983  000a 0f05          	clr	(OFST-6,sp)
 985                     ; 170 	if( hx711->Datos.Estado != SINVALORCONVERSION )
 987  000c 1e06          	ldw	x,(OFST-5,sp)
 988  000e e613          	ld	a,(19,x)
 989  0010 4a            	dec	a
 990  0011 2603cc0185    	jreq	L537
 991                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
 994  0016 4b00          	push	#0
 995  0018 1e07          	ldw	x,(OFST-4,sp)
 996  001a 1c0004        	addw	x,#4
 997  001d cd0000        	call	_NHALgpio_Write
 999  0020 ae000f        	ldw	x,#15
1000  0023 9d            	nop	
1001  0024 84            	pop	a
1002                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1007  0025               L62:
1008  0025 5a            	decw	X
1009  0026 26fd          	jrne	L62
1010  0028 9d            	nop	
1011                     
1013  0029               L147:
1014                     ; 159 	while( NHALgpio_Read( &hx711->Config.DOUT ) == true )
1016  0029 1e06          	ldw	x,(OFST-5,sp)
1017  002b cd0000        	call	_NHALgpio_Read
1019  002e 4d            	tnz	a
1020  002f 26f8          	jrne	L147
1021                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1025  0031 ae000f        	ldw	x,#15
1027  0034 9d            	nop	
1028  0035               L23:
1029  0035 5a            	decw	X
1030  0036 26fd          	jrne	L23
1031                     
1033  0038 2043          	jra	L747
1034  003a               L547:
1035                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1038  003a 4b01          	push	#1
1039  003c 1e07          	ldw	x,(OFST-4,sp)
1040  003e 1c0004        	addw	x,#4
1041  0041 cd0000        	call	_NHALgpio_Write
1043  0044 ae000f        	ldw	x,#15
1044  0047 9d            	nop	
1045  0048 84            	pop	a
1046                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1051  0049               L63:
1052  0049 5a            	decw	X
1053  004a 26fd          	jrne	L63
1054  004c 9d            	nop	
1055                     
1057                     ; 185 			semilla |= NHALgpio_Read( &hx711->Config.DOUT );
1059  004d 1e06          	ldw	x,(OFST-5,sp)
1060  004f cd0000        	call	_NHALgpio_Read
1062  0052 b703          	ld	c_lreg+3,a
1063  0054 3f02          	clr	c_lreg+2
1064  0056 3f01          	clr	c_lreg+1
1065  0058 3f00          	clr	c_lreg
1066  005a 96            	ldw	x,sp
1067  005b 1c0008        	addw	x,#OFST-3
1068  005e cd0000        	call	c_lgor
1071                     ; 186 			semilla <<= 1;
1073  0061 080b          	sll	(OFST+0,sp)
1074  0063 090a          	rlc	(OFST-1,sp)
1075  0065 0909          	rlc	(OFST-2,sp)
1076  0067 0908          	rlc	(OFST-3,sp)
1078                     ; 188 			contadorBucle++;
1080  0069 0c05          	inc	(OFST-6,sp)
1082                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1085  006b 4b00          	push	#0
1086  006d 1e07          	ldw	x,(OFST-4,sp)
1087  006f 1c0004        	addw	x,#4
1088  0072 cd0000        	call	_NHALgpio_Write
1090  0075 ae000f        	ldw	x,#15
1091  0078 9d            	nop	
1092  0079 84            	pop	a
1093                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1098  007a               L44:
1099  007a 5a            	decw	X
1100  007b 26fd          	jrne	L44
1101                     
1103  007d               L747:
1104  007d 9d            	nop	
1105                     ; 179 		while( contadorBucle < HX711_LONGITUDTRAMA ) 
1107  007e 7b05          	ld	a,(OFST-6,sp)
1108  0080 a118          	cp	a,#24
1109  0082 25b6          	jrult	L547
1110                     ; 126 	switch( hx711->Config.Ganancia )
1113  0084 1e06          	ldw	x,(OFST-5,sp)
1114  0086 e608          	ld	a,(8,x)
1116                     ; 151 		default:
1116                     ; 152 		
1116                     ; 153 		;
1117  0088 270b          	jreq	L335
1118  008a 4a            	dec	a
1119  008b 2737          	jreq	L155
1120  008d 4a            	dec	a
1121  008e 2603cc0137    	jreq	L716
1122  0093 2028          	jra	L356
1123  0095               L335:
1124                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1127  0095 4b01          	push	#1
1128  0097 1e07          	ldw	x,(OFST-4,sp)
1129  0099 1c0004        	addw	x,#4
1130  009c cd0000        	call	_NHALgpio_Write
1132  009f ae000f        	ldw	x,#15
1133  00a2 9d            	nop	
1134  00a3 84            	pop	a
1135                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1140  00a4               L05:
1141  00a4 5a            	decw	X
1142  00a5 26fd          	jrne	L05
1143  00a7 9d            	nop	
1144                     
1146                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1149  00a8 4b00          	push	#0
1150  00aa 1e07          	ldw	x,(OFST-4,sp)
1151  00ac 1c0004        	addw	x,#4
1152  00af cd0000        	call	_NHALgpio_Write
1154  00b2 ae000f        	ldw	x,#15
1155  00b5 9d            	nop	
1156  00b6 84            	pop	a
1157                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1162  00b7               L45:
1163  00b7 5a            	decw	X
1164  00b8 26fd          	jrne	L45
1165  00ba               LC001:
1166  00ba 9d            	nop	
1167                     
1169  00bb 1e06          	ldw	x,(OFST-5,sp)
1170  00bd               L356:
1171                     ; 196 		hx711->Datos.Estado = NUEVA_LECTURA;
1173  00bd a603          	ld	a,#3
1174  00bf e713          	ld	(19,x),a
1175  00c1 cc0185        	jra	L537
1176  00c4               L155:
1177                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1180  00c4 4b01          	push	#1
1181  00c6 1e07          	ldw	x,(OFST-4,sp)
1182  00c8 1c0004        	addw	x,#4
1183  00cb cd0000        	call	_NHALgpio_Write
1185  00ce ae000f        	ldw	x,#15
1186  00d1 9d            	nop	
1187  00d2 84            	pop	a
1188                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1193  00d3               L06:
1194  00d3 5a            	decw	X
1195  00d4 26fd          	jrne	L06
1196  00d6 9d            	nop	
1197                     
1199                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1202  00d7 4b00          	push	#0
1203  00d9 1e07          	ldw	x,(OFST-4,sp)
1204  00db 1c0004        	addw	x,#4
1205  00de cd0000        	call	_NHALgpio_Write
1207  00e1 ae000f        	ldw	x,#15
1208  00e4 9d            	nop	
1209  00e5 84            	pop	a
1210                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1215  00e6               L46:
1216  00e6 5a            	decw	X
1217  00e7 26fd          	jrne	L46
1218  00e9 9d            	nop	
1219                     
1221                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1224  00ea 4b01          	push	#1
1225  00ec 1e07          	ldw	x,(OFST-4,sp)
1226  00ee 1c0004        	addw	x,#4
1227  00f1 cd0000        	call	_NHALgpio_Write
1229  00f4 ae000f        	ldw	x,#15
1230  00f7 9d            	nop	
1231  00f8 84            	pop	a
1232                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1237  00f9               L07:
1238  00f9 5a            	decw	X
1239  00fa 26fd          	jrne	L07
1240  00fc 9d            	nop	
1241                     
1243                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1246  00fd 4b00          	push	#0
1247  00ff 1e07          	ldw	x,(OFST-4,sp)
1248  0101 1c0004        	addw	x,#4
1249  0104 cd0000        	call	_NHALgpio_Write
1251  0107 ae000f        	ldw	x,#15
1252  010a 9d            	nop	
1253  010b 84            	pop	a
1254                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1259  010c               L47:
1260  010c 5a            	decw	X
1261  010d 26fd          	jrne	L47
1262  010f 9d            	nop	
1263                     
1265                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1268  0110 4b01          	push	#1
1269  0112 1e07          	ldw	x,(OFST-4,sp)
1270  0114 1c0004        	addw	x,#4
1271  0117 cd0000        	call	_NHALgpio_Write
1273  011a ae000f        	ldw	x,#15
1274  011d 9d            	nop	
1275  011e 84            	pop	a
1276                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1281  011f               L001:
1282  011f 5a            	decw	X
1283  0120 26fd          	jrne	L001
1284  0122 9d            	nop	
1285                     
1287                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1290  0123 4b00          	push	#0
1291  0125 1e07          	ldw	x,(OFST-4,sp)
1292  0127 1c0004        	addw	x,#4
1293  012a cd0000        	call	_NHALgpio_Write
1295  012d ae000f        	ldw	x,#15
1296  0130 9d            	nop	
1297  0131 84            	pop	a
1298                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1303  0132               L401:
1304  0132 5a            	decw	X
1305  0133 26fd          	jrne	L401
1306                     
1308  0135 2083          	jp	LC001
1309  0137               L716:
1310                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1313  0137 4b01          	push	#1
1314  0139 1e07          	ldw	x,(OFST-4,sp)
1315  013b 1c0004        	addw	x,#4
1316  013e cd0000        	call	_NHALgpio_Write
1318  0141 ae000f        	ldw	x,#15
1319  0144 9d            	nop	
1320  0145 84            	pop	a
1321                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1326  0146               L011:
1327  0146 5a            	decw	X
1328  0147 26fd          	jrne	L011
1329  0149 9d            	nop	
1330                     
1332                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1335  014a 4b00          	push	#0
1336  014c 1e07          	ldw	x,(OFST-4,sp)
1337  014e 1c0004        	addw	x,#4
1338  0151 cd0000        	call	_NHALgpio_Write
1340  0154 ae000f        	ldw	x,#15
1341  0157 9d            	nop	
1342  0158 84            	pop	a
1343                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1348  0159               L411:
1349  0159 5a            	decw	X
1350  015a 26fd          	jrne	L411
1351  015c 9d            	nop	
1352                     
1354                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1357  015d 4b01          	push	#1
1358  015f 1e07          	ldw	x,(OFST-4,sp)
1359  0161 1c0004        	addw	x,#4
1360  0164 cd0000        	call	_NHALgpio_Write
1362  0167 ae000f        	ldw	x,#15
1363  016a 9d            	nop	
1364  016b 84            	pop	a
1365                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1370  016c               L021:
1371  016c 5a            	decw	X
1372  016d 26fd          	jrne	L021
1373  016f 9d            	nop	
1374                     
1376                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1379  0170 4b00          	push	#0
1380  0172 1e07          	ldw	x,(OFST-4,sp)
1381  0174 1c0004        	addw	x,#4
1382  0177 cd0000        	call	_NHALgpio_Write
1384  017a ae000f        	ldw	x,#15
1385  017d 9d            	nop	
1386  017e 84            	pop	a
1387                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1392  017f               L421:
1393  017f 5a            	decw	X
1394  0180 26fd          	jrne	L421
1395                     
1397  0182 cc00ba        	jp	LC001
1398  0185               L537:
1399                     ; 198 		return semilla;
1404                     ; 290 	aDormir( hx711 );
1407  0185 1e0c          	ldw	x,(OFST+1,sp)
1408  0187 1f06          	ldw	(OFST-5,sp),x
1410                     ; 106 	NHALgpio_Write( &hx711->Config.PD_SCK, true );
1412  0189 4b01          	push	#1
1413  018b 1e07          	ldw	x,(OFST-4,sp)
1414  018d 1c0004        	addw	x,#4
1415  0190 cd0000        	call	_NHALgpio_Write
1417  0193 ae0174        	ldw	x,#372
1418  0196 9d            	nop	
1419  0197 84            	pop	a
1420                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1425  0198               L231:
1426  0198 5a            	decw	X
1427  0199 26fd          	jrne	L231
1428  019b 9d            	nop	
1429                     
1431                     ; 109 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1433  019c 1e06          	ldw	x,(OFST-5,sp)
1434  019e e613          	ld	a,(19,x)
1435  01a0 4a            	dec	a
1436  01a1 2704          	jreq	L366
1437                     ; 111 		hx711->Datos.Estado = SLEEP;
1439  01a3 a602          	ld	a,#2
1440  01a5 e713          	ld	(19,x),a
1442  01a7               L366:
1443                     ; 292 	return ( semilla / hx711->Config.ValorConversion );
1445  01a7 1e0c          	ldw	x,(OFST+1,sp)
1446  01a9 ee09          	ldw	x,(9,x)
1447  01ab cd0000        	call	c_uitolx
1449  01ae 96            	ldw	x,sp
1450  01af 5c            	incw	x
1451  01b0 cd0000        	call	c_rtol
1454  01b3 96            	ldw	x,sp
1455  01b4 1c0008        	addw	x,#OFST-3
1456  01b7 cd0000        	call	c_ltor
1458  01ba 96            	ldw	x,sp
1459  01bb 5c            	incw	x
1460  01bc cd0000        	call	c_ludv
1462  01bf be02          	ldw	x,c_lreg+2
1465  01c1 5b0d          	addw	sp,#13
1466  01c3 81            	ret	
1577                     ; 328 uint16_t hx711_Tarar( HX711_t_ptr hx711 )
1577                     ; 329 {
1578                     .text:	section	.text,new
1579  0000               _hx711_Tarar:
1581  0000 89            	pushw	x
1582  0001 5210          	subw	sp,#16
1583       00000010      OFST:	set	16
1586                     ; 330 	uint32_t valorMedio = 0;
1588  0003 5f            	clrw	x
1589  0004 1f0e          	ldw	(OFST-2,sp),x
1590  0006 1f0c          	ldw	(OFST-4,sp),x
1592                     ; 331 	uint8_t repeticiones = 4;
1594  0008 a604          	ld	a,#4
1595  000a 6b10          	ld	(OFST+0,sp),a
1597  000c               L5021:
1598                     ; 335 		valorMedio = valorMedio + leer( hx711 );
1601  000c 1e11          	ldw	x,(OFST+1,sp)
1602  000e 1f06          	ldw	(OFST-10,sp),x
1604                     ; 167 	uint32_t semilla = 0;
1606  0010 5f            	clrw	x
1607  0011 1f04          	ldw	(OFST-12,sp),x
1608  0013 1f02          	ldw	(OFST-14,sp),x
1610                     ; 168 	uint8_t contadorBucle = 0;
1612  0015 0f01          	clr	(OFST-15,sp)
1614                     ; 170 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1616  0017 1e06          	ldw	x,(OFST-10,sp)
1617  0019 e613          	ld	a,(19,x)
1618  001b 4a            	dec	a
1619  001c 2603cc0190    	jreq	L3121
1620                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1623  0021 4b00          	push	#0
1624  0023 1e07          	ldw	x,(OFST-9,sp)
1625  0025 1c0004        	addw	x,#4
1626  0028 cd0000        	call	_NHALgpio_Write
1628  002b ae000f        	ldw	x,#15
1629  002e 9d            	nop	
1630  002f 84            	pop	a
1631                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1636  0030               L041:
1637  0030 5a            	decw	X
1638  0031 26fd          	jrne	L041
1639  0033 9d            	nop	
1640                     
1642  0034               L7121:
1643                     ; 159 	while( NHALgpio_Read( &hx711->Config.DOUT ) == true )
1645  0034 1e06          	ldw	x,(OFST-10,sp)
1646  0036 cd0000        	call	_NHALgpio_Read
1648  0039 4d            	tnz	a
1649  003a 26f8          	jrne	L7121
1650                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1654  003c ae000f        	ldw	x,#15
1656  003f 9d            	nop	
1657  0040               L441:
1658  0040 5a            	decw	X
1659  0041 26fd          	jrne	L441
1660                     
1662  0043 2043          	jra	L5221
1663  0045               L3221:
1664                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1667  0045 4b01          	push	#1
1668  0047 1e07          	ldw	x,(OFST-9,sp)
1669  0049 1c0004        	addw	x,#4
1670  004c cd0000        	call	_NHALgpio_Write
1672  004f ae000f        	ldw	x,#15
1673  0052 9d            	nop	
1674  0053 84            	pop	a
1675                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1680  0054               L051:
1681  0054 5a            	decw	X
1682  0055 26fd          	jrne	L051
1683  0057 9d            	nop	
1684                     
1686                     ; 185 			semilla |= NHALgpio_Read( &hx711->Config.DOUT );
1688  0058 1e06          	ldw	x,(OFST-10,sp)
1689  005a cd0000        	call	_NHALgpio_Read
1691  005d b703          	ld	c_lreg+3,a
1692  005f 3f02          	clr	c_lreg+2
1693  0061 3f01          	clr	c_lreg+1
1694  0063 3f00          	clr	c_lreg
1695  0065 96            	ldw	x,sp
1696  0066 1c0002        	addw	x,#OFST-14
1697  0069 cd0000        	call	c_lgor
1700                     ; 186 			semilla <<= 1;
1702  006c 0805          	sll	(OFST-11,sp)
1703  006e 0904          	rlc	(OFST-12,sp)
1704  0070 0903          	rlc	(OFST-13,sp)
1705  0072 0902          	rlc	(OFST-14,sp)
1707                     ; 188 			contadorBucle++;
1709  0074 0c01          	inc	(OFST-15,sp)
1711                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1714  0076 4b00          	push	#0
1715  0078 1e07          	ldw	x,(OFST-9,sp)
1716  007a 1c0004        	addw	x,#4
1717  007d cd0000        	call	_NHALgpio_Write
1719  0080 ae000f        	ldw	x,#15
1720  0083 9d            	nop	
1721  0084 84            	pop	a
1722                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1727  0085               L651:
1728  0085 5a            	decw	X
1729  0086 26fd          	jrne	L651
1730                     
1732  0088               L5221:
1733  0088 9d            	nop	
1734                     ; 179 		while( contadorBucle < HX711_LONGITUDTRAMA ) 
1736  0089 7b01          	ld	a,(OFST-15,sp)
1737  008b a118          	cp	a,#24
1738  008d 25b6          	jrult	L3221
1739                     ; 126 	switch( hx711->Config.Ganancia )
1742  008f 1e06          	ldw	x,(OFST-10,sp)
1743  0091 e608          	ld	a,(8,x)
1745                     ; 151 		default:
1745                     ; 152 		
1745                     ; 153 		;
1746  0093 270b          	jreq	L3101
1747  0095 4a            	dec	a
1748  0096 2737          	jreq	L1301
1749  0098 4a            	dec	a
1750  0099 2603cc0142    	jreq	L7701
1751  009e 2028          	jra	L3311
1752  00a0               L3101:
1753                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1756  00a0 4b01          	push	#1
1757  00a2 1e07          	ldw	x,(OFST-9,sp)
1758  00a4 1c0004        	addw	x,#4
1759  00a7 cd0000        	call	_NHALgpio_Write
1761  00aa ae000f        	ldw	x,#15
1762  00ad 9d            	nop	
1763  00ae 84            	pop	a
1764                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1769  00af               L261:
1770  00af 5a            	decw	X
1771  00b0 26fd          	jrne	L261
1772  00b2 9d            	nop	
1773                     
1775                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1778  00b3 4b00          	push	#0
1779  00b5 1e07          	ldw	x,(OFST-9,sp)
1780  00b7 1c0004        	addw	x,#4
1781  00ba cd0000        	call	_NHALgpio_Write
1783  00bd ae000f        	ldw	x,#15
1784  00c0 9d            	nop	
1785  00c1 84            	pop	a
1786                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1791  00c2               L661:
1792  00c2 5a            	decw	X
1793  00c3 26fd          	jrne	L661
1794  00c5               LC002:
1795  00c5 9d            	nop	
1796                     
1798  00c6 1e06          	ldw	x,(OFST-10,sp)
1799  00c8               L3311:
1800                     ; 196 		hx711->Datos.Estado = NUEVA_LECTURA;
1802  00c8 a603          	ld	a,#3
1803  00ca e713          	ld	(19,x),a
1804  00cc cc0190        	jra	L3121
1805  00cf               L1301:
1806                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1809  00cf 4b01          	push	#1
1810  00d1 1e07          	ldw	x,(OFST-9,sp)
1811  00d3 1c0004        	addw	x,#4
1812  00d6 cd0000        	call	_NHALgpio_Write
1814  00d9 ae000f        	ldw	x,#15
1815  00dc 9d            	nop	
1816  00dd 84            	pop	a
1817                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1822  00de               L271:
1823  00de 5a            	decw	X
1824  00df 26fd          	jrne	L271
1825  00e1 9d            	nop	
1826                     
1828                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1831  00e2 4b00          	push	#0
1832  00e4 1e07          	ldw	x,(OFST-9,sp)
1833  00e6 1c0004        	addw	x,#4
1834  00e9 cd0000        	call	_NHALgpio_Write
1836  00ec ae000f        	ldw	x,#15
1837  00ef 9d            	nop	
1838  00f0 84            	pop	a
1839                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1844  00f1               L671:
1845  00f1 5a            	decw	X
1846  00f2 26fd          	jrne	L671
1847  00f4 9d            	nop	
1848                     
1850                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1853  00f5 4b01          	push	#1
1854  00f7 1e07          	ldw	x,(OFST-9,sp)
1855  00f9 1c0004        	addw	x,#4
1856  00fc cd0000        	call	_NHALgpio_Write
1858  00ff ae000f        	ldw	x,#15
1859  0102 9d            	nop	
1860  0103 84            	pop	a
1861                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1866  0104               L202:
1867  0104 5a            	decw	X
1868  0105 26fd          	jrne	L202
1869  0107 9d            	nop	
1870                     
1872                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1875  0108 4b00          	push	#0
1876  010a 1e07          	ldw	x,(OFST-9,sp)
1877  010c 1c0004        	addw	x,#4
1878  010f cd0000        	call	_NHALgpio_Write
1880  0112 ae000f        	ldw	x,#15
1881  0115 9d            	nop	
1882  0116 84            	pop	a
1883                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1888  0117               L602:
1889  0117 5a            	decw	X
1890  0118 26fd          	jrne	L602
1891  011a 9d            	nop	
1892                     
1894                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1897  011b 4b01          	push	#1
1898  011d 1e07          	ldw	x,(OFST-9,sp)
1899  011f 1c0004        	addw	x,#4
1900  0122 cd0000        	call	_NHALgpio_Write
1902  0125 ae000f        	ldw	x,#15
1903  0128 9d            	nop	
1904  0129 84            	pop	a
1905                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1910  012a               L212:
1911  012a 5a            	decw	X
1912  012b 26fd          	jrne	L212
1913  012d 9d            	nop	
1914                     
1916                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1919  012e 4b00          	push	#0
1920  0130 1e07          	ldw	x,(OFST-9,sp)
1921  0132 1c0004        	addw	x,#4
1922  0135 cd0000        	call	_NHALgpio_Write
1924  0138 ae000f        	ldw	x,#15
1925  013b 9d            	nop	
1926  013c 84            	pop	a
1927                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1932  013d               L612:
1933  013d 5a            	decw	X
1934  013e 26fd          	jrne	L612
1935                     
1937  0140 2083          	jp	LC002
1938  0142               L7701:
1939                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1942  0142 4b01          	push	#1
1943  0144 1e07          	ldw	x,(OFST-9,sp)
1944  0146 1c0004        	addw	x,#4
1945  0149 cd0000        	call	_NHALgpio_Write
1947  014c ae000f        	ldw	x,#15
1948  014f 9d            	nop	
1949  0150 84            	pop	a
1950                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1955  0151               L222:
1956  0151 5a            	decw	X
1957  0152 26fd          	jrne	L222
1958  0154 9d            	nop	
1959                     
1961                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1964  0155 4b00          	push	#0
1965  0157 1e07          	ldw	x,(OFST-9,sp)
1966  0159 1c0004        	addw	x,#4
1967  015c cd0000        	call	_NHALgpio_Write
1969  015f ae000f        	ldw	x,#15
1970  0162 9d            	nop	
1971  0163 84            	pop	a
1972                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1977  0164               L622:
1978  0164 5a            	decw	X
1979  0165 26fd          	jrne	L622
1980  0167 9d            	nop	
1981                     
1983                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1986  0168 4b01          	push	#1
1987  016a 1e07          	ldw	x,(OFST-9,sp)
1988  016c 1c0004        	addw	x,#4
1989  016f cd0000        	call	_NHALgpio_Write
1991  0172 ae000f        	ldw	x,#15
1992  0175 9d            	nop	
1993  0176 84            	pop	a
1994                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1999  0177               L232:
2000  0177 5a            	decw	X
2001  0178 26fd          	jrne	L232
2002  017a 9d            	nop	
2003                     
2005                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
2008  017b 4b00          	push	#0
2009  017d 1e07          	ldw	x,(OFST-9,sp)
2010  017f 1c0004        	addw	x,#4
2011  0182 cd0000        	call	_NHALgpio_Write
2013  0185 ae000f        	ldw	x,#15
2014  0188 9d            	nop	
2015  0189 84            	pop	a
2016                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2021  018a               L632:
2022  018a 5a            	decw	X
2023  018b 26fd          	jrne	L632
2024                     
2026  018d cc00c5        	jp	LC002
2027  0190               L3121:
2028                     ; 198 		return semilla;
2030  0190 1e04          	ldw	x,(OFST-12,sp)
2031  0192 1f0a          	ldw	(OFST-6,sp),x
2032  0194 1e02          	ldw	x,(OFST-14,sp)
2033  0196 1f08          	ldw	(OFST-8,sp),x
2037  0198 96            	ldw	x,sp
2038  0199 1c0008        	addw	x,#OFST-8
2039  019c cd0000        	call	c_ltor
2041  019f 96            	ldw	x,sp
2042  01a0 1c000c        	addw	x,#OFST-4
2043  01a3 cd0000        	call	c_lgadd
2046                     ; 337 		--repeticiones;
2048  01a6 0a10          	dec	(OFST+0,sp)
2050                     ; 333 	while( ( repeticiones > 0 ) )
2052  01a8 2703cc000c    	jrne	L5021
2053                     ; 339 	repeticiones = 4;
2055                     ; 341 	return valorMedio/repeticiones;
2057  01ad 96            	ldw	x,sp
2058  01ae 1c000c        	addw	x,#OFST-4
2059  01b1 cd0000        	call	c_ltor
2061  01b4 a602          	ld	a,#2
2062  01b6 cd0000        	call	c_lursh
2064  01b9 be02          	ldw	x,c_lreg+2
2067  01bb 5b12          	addw	sp,#18
2068  01bd 81            	ret	
2081                     	xdef	_hx711_Tarar
2082                     	xdef	_hx711_Lectura
2083                     	xdef	_HX711_Init
2084                     	xref	_NHALgpio_Write
2085                     	xref	_NHALgpio_Read
2086                     	xref	_NHALgpio_Init
2087                     	xref	_NHALgpioConfig_SetType
2088                     	xref.b	c_lreg
2089                     	xref.b	c_x
2108                     	xref	c_lursh
2109                     	xref	c_lgadd
2110                     	xref	c_ludv
2111                     	xref	c_rtol
2112                     	xref	c_uitolx
2113                     	xref	c_ltor
2114                     	xref	c_lgor
2115                     	end

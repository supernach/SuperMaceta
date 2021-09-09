   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     .const:	section	.text
  19  0000               L11_LONGITUDTRAMA:
  20  0000 18            	dc.b	24
  21  0001               L31_HX711_TIEMPOCLOCK:
  22  0001 03            	dc.b	3
 680                     ; 238 void HX711_Init( HX711_t_ptr hx711, HX711_fPtr Lectura, HX711_fPtr Tarar )
 680                     ; 239 {
 682                     .text:	section	.text,new
 683  0000               _HX711_Init:
 685  0000 89            	pushw	x
 686  0001 89            	pushw	x
 687       00000002      OFST:	set	2
 690                     ; 240 	initPtrFunciones( hx711, Lectura, Tarar );
 694                     ; 67 	hx711->Lectura = Lectura;
 696  0002 1607          	ldw	y,(OFST+5,sp)
 697  0004 ef14          	ldw	(20,x),y
 698                     ; 68 	hx711->Tarar = Tarar;
 700  0006 1609          	ldw	y,(OFST+7,sp)
 701  0008 ef16          	ldw	(22,x),y
 702                     ; 242 	initVariables( hx711 );
 706                     ; 73 	hx711->Datos.UltimaLectura = 0;
 708  000a 4f            	clr	a
 709  000b e712          	ld	(18,x),a
 710  000d e711          	ld	(17,x),a
 711  000f e710          	ld	(16,x),a
 712  0011 e70f          	ld	(15,x),a
 713                     ; 74 	hx711->Config.ValorTara = 0;
 715  0013 905f          	clrw	y
 716  0015 ef0d          	ldw	(13,x),y
 717                     ; 75 	hx711->Config.ValorConversion = 1;
 719  0017 905c          	incw	y
 720  0019 ef09          	ldw	(9,x),y
 721                     ; 76 	hx711->Config.Ganancia = CHANNELA_128;
 723  001b 6f08          	clr	(8,x)
 724                     ; 244 	initDOUT( &hx711->Config.DOUT );
 727  001d 1f01          	ldw	(OFST-1,sp),x
 729                     ; 81 	NHALgpioConfig_SetType( dout,GPIO_MODE_IN_PU_NO_IT );
 731  001f 4b40          	push	#64
 732  0021 1e02          	ldw	x,(OFST+0,sp)
 733  0023 cd0000        	call	_NHALgpioConfig_SetType
 735  0026 84            	pop	a
 736                     ; 82 	NHALgpio_Init( dout );
 738  0027 1e01          	ldw	x,(OFST-1,sp)
 739  0029 cd0000        	call	_NHALgpio_Init
 741                     ; 245 	initPDSCK( &hx711->Config.PD_SCK );
 744  002c 1e03          	ldw	x,(OFST+1,sp)
 745  002e 1c0004        	addw	x,#4
 746  0031 1f01          	ldw	(OFST-1,sp),x
 748                     ; 87 	NHALgpioConfig_SetType( pdsck, GPIO_MODE_OUT_PP_LOW_FAST );
 750  0033 4be0          	push	#224
 751  0035 1e02          	ldw	x,(OFST+0,sp)
 752  0037 cd0000        	call	_NHALgpioConfig_SetType
 754  003a 84            	pop	a
 755                     ; 88 	NHALgpio_Init( pdsck );
 757  003b 1e01          	ldw	x,(OFST-1,sp)
 758  003d cd0000        	call	_NHALgpio_Init
 760                     ; 247 	chequearValorConversion( hx711 );
 763  0040 1e03          	ldw	x,(OFST+1,sp)
 764  0042 1f01          	ldw	(OFST-1,sp),x
 766                     ; 93 	if( ( hx711->Config.ValorConversion ) == 0 )
 768  0044 e60a          	ld	a,(10,x)
 769  0046 ea09          	or	a,(9,x)
 770  0048 260b          	jrne	L564
 771                     ; 95 		hx711->Config.ValorConversion = 1;
 773  004a 90ae0001      	ldw	y,#1
 774  004e ef09          	ldw	(9,x),y
 775                     ; 96 		hx711->Datos.Estado = SINVALORCONVERSION;
 777  0050 4c            	inc	a
 778  0051 e713          	ld	(19,x),a
 780  0053 2002          	jra	L101
 781  0055               L564:
 782                     ; 100 		hx711->Datos.Estado = INICIALIZADO;
 784  0055 6f13          	clr	(19,x)
 785  0057               L101:
 786                     ; 249 	aDormir( hx711 );
 789  0057 1f01          	ldw	(OFST-1,sp),x
 791                     ; 106 	NHALgpio_Write( &hx711->Config.PD_SCK, true );
 793  0059 4b01          	push	#1
 794  005b 1e02          	ldw	x,(OFST+0,sp)
 795  005d 1c0004        	addw	x,#4
 796  0060 cd0000        	call	_NHALgpio_Write
 798  0063 ae0174        	ldw	x,#372
 799  0066 9d            	nop	
 800  0067 84            	pop	a
 801                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 806  0068               L02:
 807  0068 5a            	decw	X
 808  0069 26fd          	jrne	L02
 809  006b 9d            	nop	
 810                     
 812                     ; 109 	if( hx711->Datos.Estado != SINVALORCONVERSION )
 814  006c 1e01          	ldw	x,(OFST-1,sp)
 815  006e e613          	ld	a,(19,x)
 816  0070 4a            	dec	a
 817  0071 2704          	jreq	L701
 818                     ; 111 		hx711->Datos.Estado = SLEEP;
 820  0073 a602          	ld	a,#2
 821  0075 e713          	ld	(19,x),a
 823  0077               L701:
 824                     ; 250 }
 827  0077 5b04          	addw	sp,#4
 828  0079 81            	ret	
 944                     ; 285 uint16_t hx711_Lectura( HX711_t_ptr hx711 )
 944                     ; 286 {
 945                     .text:	section	.text,new
 946  0000               _hx711_Lectura:
 948  0000 89            	pushw	x
 949  0001 520b          	subw	sp,#11
 950       0000000b      OFST:	set	11
 953                     ; 287 	uint32_t semilla = 0;
 955                     ; 289 	semilla = leer( hx711 );
 958  0003 1f06          	ldw	(OFST-5,sp),x
 960                     ; 167 	uint32_t semilla = 0;
 962  0005 5f            	clrw	x
 963  0006 1f0a          	ldw	(OFST-1,sp),x
 964  0008 1f08          	ldw	(OFST-3,sp),x
 966                     ; 168 	uint8_t contadorBucle = 0;
 968  000a 0f05          	clr	(OFST-6,sp)
 970                     ; 170 	if( hx711->Datos.Estado != SINVALORCONVERSION )
 972  000c 1e06          	ldw	x,(OFST-5,sp)
 973  000e e613          	ld	a,(19,x)
 974  0010 4a            	dec	a
 975  0011 2603cc0185    	jreq	L727
 976                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
 979  0016 4b00          	push	#0
 980  0018 1e07          	ldw	x,(OFST-4,sp)
 981  001a 1c0004        	addw	x,#4
 982  001d cd0000        	call	_NHALgpio_Write
 984  0020 ae000f        	ldw	x,#15
 985  0023 9d            	nop	
 986  0024 84            	pop	a
 987                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 992  0025               L62:
 993  0025 5a            	decw	X
 994  0026 26fd          	jrne	L62
 995  0028 9d            	nop	
 996                     
 998  0029               L337:
 999                     ; 159 	while( NHALgpio_Read( &hx711->Config.DOUT ) == true )
1001  0029 1e06          	ldw	x,(OFST-5,sp)
1002  002b cd0000        	call	_NHALgpio_Read
1004  002e 4d            	tnz	a
1005  002f 26f8          	jrne	L337
1006                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1010  0031 ae000f        	ldw	x,#15
1012  0034 9d            	nop	
1013  0035               L23:
1014  0035 5a            	decw	X
1015  0036 26fd          	jrne	L23
1016                     
1018  0038 2043          	jra	L147
1019  003a               L737:
1020                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1023  003a 4b01          	push	#1
1024  003c 1e07          	ldw	x,(OFST-4,sp)
1025  003e 1c0004        	addw	x,#4
1026  0041 cd0000        	call	_NHALgpio_Write
1028  0044 ae000f        	ldw	x,#15
1029  0047 9d            	nop	
1030  0048 84            	pop	a
1031                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1036  0049               L63:
1037  0049 5a            	decw	X
1038  004a 26fd          	jrne	L63
1039  004c 9d            	nop	
1040                     
1042                     ; 185 			semilla |= NHALgpio_Read( &hx711->Config.DOUT );
1044  004d 1e06          	ldw	x,(OFST-5,sp)
1045  004f cd0000        	call	_NHALgpio_Read
1047  0052 b703          	ld	c_lreg+3,a
1048  0054 3f02          	clr	c_lreg+2
1049  0056 3f01          	clr	c_lreg+1
1050  0058 3f00          	clr	c_lreg
1051  005a 96            	ldw	x,sp
1052  005b 1c0008        	addw	x,#OFST-3
1053  005e cd0000        	call	c_lgor
1056                     ; 186 			semilla <<= 1;
1058  0061 080b          	sll	(OFST+0,sp)
1059  0063 090a          	rlc	(OFST-1,sp)
1060  0065 0909          	rlc	(OFST-2,sp)
1061  0067 0908          	rlc	(OFST-3,sp)
1063                     ; 188 			contadorBucle++;
1065  0069 0c05          	inc	(OFST-6,sp)
1067                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1070  006b 4b00          	push	#0
1071  006d 1e07          	ldw	x,(OFST-4,sp)
1072  006f 1c0004        	addw	x,#4
1073  0072 cd0000        	call	_NHALgpio_Write
1075  0075 ae000f        	ldw	x,#15
1076  0078 9d            	nop	
1077  0079 84            	pop	a
1078                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1083  007a               L44:
1084  007a 5a            	decw	X
1085  007b 26fd          	jrne	L44
1086                     
1088  007d               L147:
1089  007d 9d            	nop	
1090                     ; 179 		while( contadorBucle < LONGITUDTRAMA ) 
1092  007e 7b05          	ld	a,(OFST-6,sp)
1093  0080 a118          	cp	a,#24
1094  0082 25b6          	jrult	L737
1095                     ; 126 	switch( hx711->Config.Ganancia )
1098  0084 1e06          	ldw	x,(OFST-5,sp)
1099  0086 e608          	ld	a,(8,x)
1101                     ; 151 		default:
1101                     ; 152 		
1101                     ; 153 		;
1102  0088 270b          	jreq	L525
1103  008a 4a            	dec	a
1104  008b 2737          	jreq	L345
1105  008d 4a            	dec	a
1106  008e 2603cc0137    	jreq	L116
1107  0093 2028          	jra	L546
1108  0095               L525:
1109                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1112  0095 4b01          	push	#1
1113  0097 1e07          	ldw	x,(OFST-4,sp)
1114  0099 1c0004        	addw	x,#4
1115  009c cd0000        	call	_NHALgpio_Write
1117  009f ae000f        	ldw	x,#15
1118  00a2 9d            	nop	
1119  00a3 84            	pop	a
1120                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1125  00a4               L05:
1126  00a4 5a            	decw	X
1127  00a5 26fd          	jrne	L05
1128  00a7 9d            	nop	
1129                     
1131                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1134  00a8 4b00          	push	#0
1135  00aa 1e07          	ldw	x,(OFST-4,sp)
1136  00ac 1c0004        	addw	x,#4
1137  00af cd0000        	call	_NHALgpio_Write
1139  00b2 ae000f        	ldw	x,#15
1140  00b5 9d            	nop	
1141  00b6 84            	pop	a
1142                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1147  00b7               L45:
1148  00b7 5a            	decw	X
1149  00b8 26fd          	jrne	L45
1150  00ba               LC001:
1151  00ba 9d            	nop	
1152                     
1154  00bb 1e06          	ldw	x,(OFST-5,sp)
1155  00bd               L546:
1156                     ; 196 		hx711->Datos.Estado = NUEVA_LECTURA;
1158  00bd a603          	ld	a,#3
1159  00bf e713          	ld	(19,x),a
1160  00c1 cc0185        	jra	L727
1161  00c4               L345:
1162                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1165  00c4 4b01          	push	#1
1166  00c6 1e07          	ldw	x,(OFST-4,sp)
1167  00c8 1c0004        	addw	x,#4
1168  00cb cd0000        	call	_NHALgpio_Write
1170  00ce ae000f        	ldw	x,#15
1171  00d1 9d            	nop	
1172  00d2 84            	pop	a
1173                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1178  00d3               L06:
1179  00d3 5a            	decw	X
1180  00d4 26fd          	jrne	L06
1181  00d6 9d            	nop	
1182                     
1184                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1187  00d7 4b00          	push	#0
1188  00d9 1e07          	ldw	x,(OFST-4,sp)
1189  00db 1c0004        	addw	x,#4
1190  00de cd0000        	call	_NHALgpio_Write
1192  00e1 ae000f        	ldw	x,#15
1193  00e4 9d            	nop	
1194  00e5 84            	pop	a
1195                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1200  00e6               L46:
1201  00e6 5a            	decw	X
1202  00e7 26fd          	jrne	L46
1203  00e9 9d            	nop	
1204                     
1206                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1209  00ea 4b01          	push	#1
1210  00ec 1e07          	ldw	x,(OFST-4,sp)
1211  00ee 1c0004        	addw	x,#4
1212  00f1 cd0000        	call	_NHALgpio_Write
1214  00f4 ae000f        	ldw	x,#15
1215  00f7 9d            	nop	
1216  00f8 84            	pop	a
1217                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1222  00f9               L07:
1223  00f9 5a            	decw	X
1224  00fa 26fd          	jrne	L07
1225  00fc 9d            	nop	
1226                     
1228                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1231  00fd 4b00          	push	#0
1232  00ff 1e07          	ldw	x,(OFST-4,sp)
1233  0101 1c0004        	addw	x,#4
1234  0104 cd0000        	call	_NHALgpio_Write
1236  0107 ae000f        	ldw	x,#15
1237  010a 9d            	nop	
1238  010b 84            	pop	a
1239                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1244  010c               L47:
1245  010c 5a            	decw	X
1246  010d 26fd          	jrne	L47
1247  010f 9d            	nop	
1248                     
1250                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1253  0110 4b01          	push	#1
1254  0112 1e07          	ldw	x,(OFST-4,sp)
1255  0114 1c0004        	addw	x,#4
1256  0117 cd0000        	call	_NHALgpio_Write
1258  011a ae000f        	ldw	x,#15
1259  011d 9d            	nop	
1260  011e 84            	pop	a
1261                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1266  011f               L001:
1267  011f 5a            	decw	X
1268  0120 26fd          	jrne	L001
1269  0122 9d            	nop	
1270                     
1272                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1275  0123 4b00          	push	#0
1276  0125 1e07          	ldw	x,(OFST-4,sp)
1277  0127 1c0004        	addw	x,#4
1278  012a cd0000        	call	_NHALgpio_Write
1280  012d ae000f        	ldw	x,#15
1281  0130 9d            	nop	
1282  0131 84            	pop	a
1283                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1288  0132               L401:
1289  0132 5a            	decw	X
1290  0133 26fd          	jrne	L401
1291                     
1293  0135 2083          	jp	LC001
1294  0137               L116:
1295                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1298  0137 4b01          	push	#1
1299  0139 1e07          	ldw	x,(OFST-4,sp)
1300  013b 1c0004        	addw	x,#4
1301  013e cd0000        	call	_NHALgpio_Write
1303  0141 ae000f        	ldw	x,#15
1304  0144 9d            	nop	
1305  0145 84            	pop	a
1306                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1311  0146               L011:
1312  0146 5a            	decw	X
1313  0147 26fd          	jrne	L011
1314  0149 9d            	nop	
1315                     
1317                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1320  014a 4b00          	push	#0
1321  014c 1e07          	ldw	x,(OFST-4,sp)
1322  014e 1c0004        	addw	x,#4
1323  0151 cd0000        	call	_NHALgpio_Write
1325  0154 ae000f        	ldw	x,#15
1326  0157 9d            	nop	
1327  0158 84            	pop	a
1328                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1333  0159               L411:
1334  0159 5a            	decw	X
1335  015a 26fd          	jrne	L411
1336  015c 9d            	nop	
1337                     
1339                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1342  015d 4b01          	push	#1
1343  015f 1e07          	ldw	x,(OFST-4,sp)
1344  0161 1c0004        	addw	x,#4
1345  0164 cd0000        	call	_NHALgpio_Write
1347  0167 ae000f        	ldw	x,#15
1348  016a 9d            	nop	
1349  016b 84            	pop	a
1350                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1355  016c               L021:
1356  016c 5a            	decw	X
1357  016d 26fd          	jrne	L021
1358  016f 9d            	nop	
1359                     
1361                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1364  0170 4b00          	push	#0
1365  0172 1e07          	ldw	x,(OFST-4,sp)
1366  0174 1c0004        	addw	x,#4
1367  0177 cd0000        	call	_NHALgpio_Write
1369  017a ae000f        	ldw	x,#15
1370  017d 9d            	nop	
1371  017e 84            	pop	a
1372                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1377  017f               L421:
1378  017f 5a            	decw	X
1379  0180 26fd          	jrne	L421
1380                     
1382  0182 cc00ba        	jp	LC001
1383  0185               L727:
1384                     ; 198 		return semilla;
1389                     ; 290 	aDormir( hx711 );
1392  0185 1e0c          	ldw	x,(OFST+1,sp)
1393  0187 1f06          	ldw	(OFST-5,sp),x
1395                     ; 106 	NHALgpio_Write( &hx711->Config.PD_SCK, true );
1397  0189 4b01          	push	#1
1398  018b 1e07          	ldw	x,(OFST-4,sp)
1399  018d 1c0004        	addw	x,#4
1400  0190 cd0000        	call	_NHALgpio_Write
1402  0193 ae0174        	ldw	x,#372
1403  0196 9d            	nop	
1404  0197 84            	pop	a
1405                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1410  0198               L231:
1411  0198 5a            	decw	X
1412  0199 26fd          	jrne	L231
1413  019b 9d            	nop	
1414                     
1416                     ; 109 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1418  019c 1e06          	ldw	x,(OFST-5,sp)
1419  019e e613          	ld	a,(19,x)
1420  01a0 4a            	dec	a
1421  01a1 2704          	jreq	L556
1422                     ; 111 		hx711->Datos.Estado = SLEEP;
1424  01a3 a602          	ld	a,#2
1425  01a5 e713          	ld	(19,x),a
1427  01a7               L556:
1428                     ; 292 	return ( semilla / hx711->Config.ValorConversion );
1430  01a7 1e0c          	ldw	x,(OFST+1,sp)
1431  01a9 ee09          	ldw	x,(9,x)
1432  01ab cd0000        	call	c_uitolx
1434  01ae 96            	ldw	x,sp
1435  01af 5c            	incw	x
1436  01b0 cd0000        	call	c_rtol
1439  01b3 96            	ldw	x,sp
1440  01b4 1c0008        	addw	x,#OFST-3
1441  01b7 cd0000        	call	c_ltor
1443  01ba 96            	ldw	x,sp
1444  01bb 5c            	incw	x
1445  01bc cd0000        	call	c_ludv
1447  01bf be02          	ldw	x,c_lreg+2
1450  01c1 5b0d          	addw	sp,#13
1451  01c3 81            	ret	
1562                     ; 328 uint16_t hx711_Tarar( HX711_t_ptr hx711 )
1562                     ; 329 {
1563                     .text:	section	.text,new
1564  0000               _hx711_Tarar:
1566  0000 89            	pushw	x
1567  0001 5210          	subw	sp,#16
1568       00000010      OFST:	set	16
1571                     ; 330 	uint32_t valorMedio = 0;
1573  0003 5f            	clrw	x
1574  0004 1f0e          	ldw	(OFST-2,sp),x
1575  0006 1f0c          	ldw	(OFST-4,sp),x
1577                     ; 331 	uint8_t repeticiones = 4;
1579  0008 a604          	ld	a,#4
1580  000a 6b10          	ld	(OFST+0,sp),a
1582  000c               L7711:
1583                     ; 335 		valorMedio = valorMedio + leer( hx711 );
1586  000c 1e11          	ldw	x,(OFST+1,sp)
1587  000e 1f06          	ldw	(OFST-10,sp),x
1589                     ; 167 	uint32_t semilla = 0;
1591  0010 5f            	clrw	x
1592  0011 1f04          	ldw	(OFST-12,sp),x
1593  0013 1f02          	ldw	(OFST-14,sp),x
1595                     ; 168 	uint8_t contadorBucle = 0;
1597  0015 0f01          	clr	(OFST-15,sp)
1599                     ; 170 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1601  0017 1e06          	ldw	x,(OFST-10,sp)
1602  0019 e613          	ld	a,(19,x)
1603  001b 4a            	dec	a
1604  001c 2603cc0190    	jreq	L5021
1605                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1608  0021 4b00          	push	#0
1609  0023 1e07          	ldw	x,(OFST-9,sp)
1610  0025 1c0004        	addw	x,#4
1611  0028 cd0000        	call	_NHALgpio_Write
1613  002b ae000f        	ldw	x,#15
1614  002e 9d            	nop	
1615  002f 84            	pop	a
1616                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1621  0030               L041:
1622  0030 5a            	decw	X
1623  0031 26fd          	jrne	L041
1624  0033 9d            	nop	
1625                     
1627  0034               L1121:
1628                     ; 159 	while( NHALgpio_Read( &hx711->Config.DOUT ) == true )
1630  0034 1e06          	ldw	x,(OFST-10,sp)
1631  0036 cd0000        	call	_NHALgpio_Read
1633  0039 4d            	tnz	a
1634  003a 26f8          	jrne	L1121
1635                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1639  003c ae000f        	ldw	x,#15
1641  003f 9d            	nop	
1642  0040               L441:
1643  0040 5a            	decw	X
1644  0041 26fd          	jrne	L441
1645                     
1647  0043 2043          	jra	L7121
1648  0045               L5121:
1649                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1652  0045 4b01          	push	#1
1653  0047 1e07          	ldw	x,(OFST-9,sp)
1654  0049 1c0004        	addw	x,#4
1655  004c cd0000        	call	_NHALgpio_Write
1657  004f ae000f        	ldw	x,#15
1658  0052 9d            	nop	
1659  0053 84            	pop	a
1660                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1665  0054               L051:
1666  0054 5a            	decw	X
1667  0055 26fd          	jrne	L051
1668  0057 9d            	nop	
1669                     
1671                     ; 185 			semilla |= NHALgpio_Read( &hx711->Config.DOUT );
1673  0058 1e06          	ldw	x,(OFST-10,sp)
1674  005a cd0000        	call	_NHALgpio_Read
1676  005d b703          	ld	c_lreg+3,a
1677  005f 3f02          	clr	c_lreg+2
1678  0061 3f01          	clr	c_lreg+1
1679  0063 3f00          	clr	c_lreg
1680  0065 96            	ldw	x,sp
1681  0066 1c0002        	addw	x,#OFST-14
1682  0069 cd0000        	call	c_lgor
1685                     ; 186 			semilla <<= 1;
1687  006c 0805          	sll	(OFST-11,sp)
1688  006e 0904          	rlc	(OFST-12,sp)
1689  0070 0903          	rlc	(OFST-13,sp)
1690  0072 0902          	rlc	(OFST-14,sp)
1692                     ; 188 			contadorBucle++;
1694  0074 0c01          	inc	(OFST-15,sp)
1696                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1699  0076 4b00          	push	#0
1700  0078 1e07          	ldw	x,(OFST-9,sp)
1701  007a 1c0004        	addw	x,#4
1702  007d cd0000        	call	_NHALgpio_Write
1704  0080 ae000f        	ldw	x,#15
1705  0083 9d            	nop	
1706  0084 84            	pop	a
1707                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1712  0085               L651:
1713  0085 5a            	decw	X
1714  0086 26fd          	jrne	L651
1715                     
1717  0088               L7121:
1718  0088 9d            	nop	
1719                     ; 179 		while( contadorBucle < LONGITUDTRAMA ) 
1721  0089 7b01          	ld	a,(OFST-15,sp)
1722  008b a118          	cp	a,#24
1723  008d 25b6          	jrult	L5121
1724                     ; 126 	switch( hx711->Config.Ganancia )
1727  008f 1e06          	ldw	x,(OFST-10,sp)
1728  0091 e608          	ld	a,(8,x)
1730                     ; 151 		default:
1730                     ; 152 		
1730                     ; 153 		;
1731  0093 270b          	jreq	L5001
1732  0095 4a            	dec	a
1733  0096 2737          	jreq	L3201
1734  0098 4a            	dec	a
1735  0099 2603cc0142    	jreq	L1701
1736  009e 2028          	jra	L5211
1737  00a0               L5001:
1738                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1741  00a0 4b01          	push	#1
1742  00a2 1e07          	ldw	x,(OFST-9,sp)
1743  00a4 1c0004        	addw	x,#4
1744  00a7 cd0000        	call	_NHALgpio_Write
1746  00aa ae000f        	ldw	x,#15
1747  00ad 9d            	nop	
1748  00ae 84            	pop	a
1749                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1754  00af               L261:
1755  00af 5a            	decw	X
1756  00b0 26fd          	jrne	L261
1757  00b2 9d            	nop	
1758                     
1760                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1763  00b3 4b00          	push	#0
1764  00b5 1e07          	ldw	x,(OFST-9,sp)
1765  00b7 1c0004        	addw	x,#4
1766  00ba cd0000        	call	_NHALgpio_Write
1768  00bd ae000f        	ldw	x,#15
1769  00c0 9d            	nop	
1770  00c1 84            	pop	a
1771                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1776  00c2               L661:
1777  00c2 5a            	decw	X
1778  00c3 26fd          	jrne	L661
1779  00c5               LC002:
1780  00c5 9d            	nop	
1781                     
1783  00c6 1e06          	ldw	x,(OFST-10,sp)
1784  00c8               L5211:
1785                     ; 196 		hx711->Datos.Estado = NUEVA_LECTURA;
1787  00c8 a603          	ld	a,#3
1788  00ca e713          	ld	(19,x),a
1789  00cc cc0190        	jra	L5021
1790  00cf               L3201:
1791                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1794  00cf 4b01          	push	#1
1795  00d1 1e07          	ldw	x,(OFST-9,sp)
1796  00d3 1c0004        	addw	x,#4
1797  00d6 cd0000        	call	_NHALgpio_Write
1799  00d9 ae000f        	ldw	x,#15
1800  00dc 9d            	nop	
1801  00dd 84            	pop	a
1802                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1807  00de               L271:
1808  00de 5a            	decw	X
1809  00df 26fd          	jrne	L271
1810  00e1 9d            	nop	
1811                     
1813                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1816  00e2 4b00          	push	#0
1817  00e4 1e07          	ldw	x,(OFST-9,sp)
1818  00e6 1c0004        	addw	x,#4
1819  00e9 cd0000        	call	_NHALgpio_Write
1821  00ec ae000f        	ldw	x,#15
1822  00ef 9d            	nop	
1823  00f0 84            	pop	a
1824                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1829  00f1               L671:
1830  00f1 5a            	decw	X
1831  00f2 26fd          	jrne	L671
1832  00f4 9d            	nop	
1833                     
1835                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1838  00f5 4b01          	push	#1
1839  00f7 1e07          	ldw	x,(OFST-9,sp)
1840  00f9 1c0004        	addw	x,#4
1841  00fc cd0000        	call	_NHALgpio_Write
1843  00ff ae000f        	ldw	x,#15
1844  0102 9d            	nop	
1845  0103 84            	pop	a
1846                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1851  0104               L202:
1852  0104 5a            	decw	X
1853  0105 26fd          	jrne	L202
1854  0107 9d            	nop	
1855                     
1857                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1860  0108 4b00          	push	#0
1861  010a 1e07          	ldw	x,(OFST-9,sp)
1862  010c 1c0004        	addw	x,#4
1863  010f cd0000        	call	_NHALgpio_Write
1865  0112 ae000f        	ldw	x,#15
1866  0115 9d            	nop	
1867  0116 84            	pop	a
1868                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1873  0117               L602:
1874  0117 5a            	decw	X
1875  0118 26fd          	jrne	L602
1876  011a 9d            	nop	
1877                     
1879                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1882  011b 4b01          	push	#1
1883  011d 1e07          	ldw	x,(OFST-9,sp)
1884  011f 1c0004        	addw	x,#4
1885  0122 cd0000        	call	_NHALgpio_Write
1887  0125 ae000f        	ldw	x,#15
1888  0128 9d            	nop	
1889  0129 84            	pop	a
1890                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1895  012a               L212:
1896  012a 5a            	decw	X
1897  012b 26fd          	jrne	L212
1898  012d 9d            	nop	
1899                     
1901                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1904  012e 4b00          	push	#0
1905  0130 1e07          	ldw	x,(OFST-9,sp)
1906  0132 1c0004        	addw	x,#4
1907  0135 cd0000        	call	_NHALgpio_Write
1909  0138 ae000f        	ldw	x,#15
1910  013b 9d            	nop	
1911  013c 84            	pop	a
1912                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1917  013d               L612:
1918  013d 5a            	decw	X
1919  013e 26fd          	jrne	L612
1920                     
1922  0140 2083          	jp	LC002
1923  0142               L1701:
1924                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1927  0142 4b01          	push	#1
1928  0144 1e07          	ldw	x,(OFST-9,sp)
1929  0146 1c0004        	addw	x,#4
1930  0149 cd0000        	call	_NHALgpio_Write
1932  014c ae000f        	ldw	x,#15
1933  014f 9d            	nop	
1934  0150 84            	pop	a
1935                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1940  0151               L222:
1941  0151 5a            	decw	X
1942  0152 26fd          	jrne	L222
1943  0154 9d            	nop	
1944                     
1946                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1949  0155 4b00          	push	#0
1950  0157 1e07          	ldw	x,(OFST-9,sp)
1951  0159 1c0004        	addw	x,#4
1952  015c cd0000        	call	_NHALgpio_Write
1954  015f ae000f        	ldw	x,#15
1955  0162 9d            	nop	
1956  0163 84            	pop	a
1957                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1962  0164               L622:
1963  0164 5a            	decw	X
1964  0165 26fd          	jrne	L622
1965  0167 9d            	nop	
1966                     
1968                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1971  0168 4b01          	push	#1
1972  016a 1e07          	ldw	x,(OFST-9,sp)
1973  016c 1c0004        	addw	x,#4
1974  016f cd0000        	call	_NHALgpio_Write
1976  0172 ae000f        	ldw	x,#15
1977  0175 9d            	nop	
1978  0176 84            	pop	a
1979                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1984  0177               L232:
1985  0177 5a            	decw	X
1986  0178 26fd          	jrne	L232
1987  017a 9d            	nop	
1988                     
1990                     ; 120 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1993  017b 4b00          	push	#0
1994  017d 1e07          	ldw	x,(OFST-9,sp)
1995  017f 1c0004        	addw	x,#4
1996  0182 cd0000        	call	_NHALgpio_Write
1998  0185 ae000f        	ldw	x,#15
1999  0188 9d            	nop	
2000  0189 84            	pop	a
2001                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
2006  018a               L632:
2007  018a 5a            	decw	X
2008  018b 26fd          	jrne	L632
2009                     
2011  018d cc00c5        	jp	LC002
2012  0190               L5021:
2013                     ; 198 		return semilla;
2015  0190 1e04          	ldw	x,(OFST-12,sp)
2016  0192 1f0a          	ldw	(OFST-6,sp),x
2017  0194 1e02          	ldw	x,(OFST-14,sp)
2018  0196 1f08          	ldw	(OFST-8,sp),x
2022  0198 96            	ldw	x,sp
2023  0199 1c0008        	addw	x,#OFST-8
2024  019c cd0000        	call	c_ltor
2026  019f 96            	ldw	x,sp
2027  01a0 1c000c        	addw	x,#OFST-4
2028  01a3 cd0000        	call	c_lgadd
2031                     ; 337 		--repeticiones;
2033  01a6 0a10          	dec	(OFST+0,sp)
2035                     ; 333 	while( ( repeticiones > 0 ) )
2037  01a8 2703cc000c    	jrne	L7711
2038                     ; 339 	repeticiones = 4;
2040                     ; 341 	return valorMedio/repeticiones;
2042  01ad 96            	ldw	x,sp
2043  01ae 1c000c        	addw	x,#OFST-4
2044  01b1 cd0000        	call	c_ltor
2046  01b4 a602          	ld	a,#2
2047  01b6 cd0000        	call	c_lursh
2049  01b9 be02          	ldw	x,c_lreg+2
2052  01bb 5b12          	addw	sp,#18
2053  01bd 81            	ret	
2066                     	xdef	_hx711_Tarar
2067                     	xdef	_hx711_Lectura
2068                     	xdef	_HX711_Init
2069                     	xref	_NHALgpio_Write
2070                     	xref	_NHALgpio_Read
2071                     	xref	_NHALgpio_Init
2072                     	xref	_NHALgpioConfig_SetType
2073                     	xref.b	c_lreg
2074                     	xref.b	c_x
2093                     	xref	c_lursh
2094                     	xref	c_lgadd
2095                     	xref	c_ludv
2096                     	xref	c_rtol
2097                     	xref	c_uitolx
2098                     	xref	c_ltor
2099                     	xref	c_lgor
2100                     	end

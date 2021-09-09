   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     .const:	section	.text
  19  0000               L11_LONGITUDTRAMA:
  20  0000 18            	dc.b	24
 668                     ; 144 void HX711_Init( HX711_t_ptr hx711, HX711_fPtr Lectura, HX711_fPtr Tarar )
 668                     ; 145 {
 670                     .text:	section	.text,new
 671  0000               _HX711_Init:
 673  0000 89            	pushw	x
 674  0001 89            	pushw	x
 675       00000002      OFST:	set	2
 678                     ; 146 	initPtrFunciones( hx711, Lectura, Tarar );
 682                     ; 7 	hx711->Lectura = Lectura;
 684  0002 1607          	ldw	y,(OFST+5,sp)
 685  0004 ef14          	ldw	(20,x),y
 686                     ; 8 	hx711->Tarar = Tarar;
 688  0006 1609          	ldw	y,(OFST+7,sp)
 689  0008 ef16          	ldw	(22,x),y
 690                     ; 148 	initVariables( hx711 );
 694                     ; 13 	hx711->Datos.UltimaLectura = 0;
 696  000a 4f            	clr	a
 697  000b e712          	ld	(18,x),a
 698  000d e711          	ld	(17,x),a
 699  000f e710          	ld	(16,x),a
 700  0011 e70f          	ld	(15,x),a
 701                     ; 14 	hx711->Config.ValorTara = 0;
 703  0013 905f          	clrw	y
 704  0015 ef0d          	ldw	(13,x),y
 705                     ; 15 	hx711->Config.ValorConversion = 1;
 707  0017 905c          	incw	y
 708  0019 ef09          	ldw	(9,x),y
 709                     ; 16 	hx711->Config.Ganancia = CHANNELA_128;
 711  001b 6f08          	clr	(8,x)
 712                     ; 150 	initDOUT( &hx711->Config.DOUT );
 715  001d 1f01          	ldw	(OFST-1,sp),x
 717                     ; 21 	NHALgpioConfig_SetType( dout,GPIO_MODE_IN_PU_NO_IT );
 719  001f 4b40          	push	#64
 720  0021 1e02          	ldw	x,(OFST+0,sp)
 721  0023 cd0000        	call	_NHALgpioConfig_SetType
 723  0026 84            	pop	a
 724                     ; 22 	NHALgpio_Init( dout );
 726  0027 1e01          	ldw	x,(OFST-1,sp)
 727  0029 cd0000        	call	_NHALgpio_Init
 729                     ; 151 	initPDSCK( &hx711->Config.PD_SCK );
 732  002c 1e03          	ldw	x,(OFST+1,sp)
 733  002e 1c0004        	addw	x,#4
 734  0031 1f01          	ldw	(OFST-1,sp),x
 736                     ; 27 	NHALgpioConfig_SetType( pdsck, GPIO_MODE_OUT_PP_LOW_FAST );
 738  0033 4be0          	push	#224
 739  0035 1e02          	ldw	x,(OFST+0,sp)
 740  0037 cd0000        	call	_NHALgpioConfig_SetType
 742  003a 84            	pop	a
 743                     ; 28 	NHALgpio_Init( pdsck );
 745  003b 1e01          	ldw	x,(OFST-1,sp)
 746  003d cd0000        	call	_NHALgpio_Init
 748                     ; 153 	chequearValorConversion( hx711 );
 751  0040 1e03          	ldw	x,(OFST+1,sp)
 752  0042 1f01          	ldw	(OFST-1,sp),x
 754                     ; 33 	if( ( hx711->Config.ValorConversion ) == 0 )
 756  0044 e60a          	ld	a,(10,x)
 757  0046 ea09          	or	a,(9,x)
 758  0048 260b          	jrne	L754
 759                     ; 35 		hx711->Config.ValorConversion = 1;
 761  004a 90ae0001      	ldw	y,#1
 762  004e ef09          	ldw	(9,x),y
 763                     ; 36 		hx711->Datos.Estado = SINVALORCONVERSION;
 765  0050 4c            	inc	a
 766  0051 e713          	ld	(19,x),a
 768  0053 2002          	jra	L37
 769  0055               L754:
 770                     ; 40 		hx711->Datos.Estado = INICIALIZADO;
 772  0055 6f13          	clr	(19,x)
 773  0057               L37:
 774                     ; 155 	aDormir( hx711 );
 777  0057 1f01          	ldw	(OFST-1,sp),x
 779                     ; 46 	NHALgpio_Write( &hx711->Config.PD_SCK, true );
 781  0059 4b01          	push	#1
 782  005b 1e02          	ldw	x,(OFST+0,sp)
 783  005d 1c0004        	addw	x,#4
 784  0060 cd0000        	call	_NHALgpio_Write
 786  0063 ae0174        	ldw	x,#372
 787  0066 9d            	nop	
 788  0067 84            	pop	a
 789                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 794  0068               L02:
 795  0068 5a            	decw	X
 796  0069 26fd          	jrne	L02
 797  006b 9d            	nop	
 798                     
 800                     ; 49 	if( hx711->Datos.Estado != SINVALORCONVERSION )
 802  006c 1e01          	ldw	x,(OFST-1,sp)
 803  006e e613          	ld	a,(19,x)
 804  0070 4a            	dec	a
 805  0071 2704          	jreq	L101
 806                     ; 51 		hx711->Datos.Estado = SLEEP;
 808  0073 a602          	ld	a,#2
 809  0075 e713          	ld	(19,x),a
 811  0077               L101:
 812                     ; 156 }
 815  0077 5b04          	addw	sp,#4
 816  0079 81            	ret	
 931                     ; 158 uint16_t hx711_Lectura( HX711_t_ptr hx711 )
 931                     ; 159 {
 932                     .text:	section	.text,new
 933  0000               _hx711_Lectura:
 935  0000 89            	pushw	x
 936  0001 520b          	subw	sp,#11
 937       0000000b      OFST:	set	11
 940                     ; 160 	uint32_t semilla = 0;
 942                     ; 162 	semilla = leer( hx711 );
 945  0003 1f06          	ldw	(OFST-5,sp),x
 947                     ; 107 	uint32_t semilla = 0;
 949  0005 5f            	clrw	x
 950  0006 1f0a          	ldw	(OFST-1,sp),x
 951  0008 1f08          	ldw	(OFST-3,sp),x
 953                     ; 108 	uint8_t contadorBucle = 0;
 955  000a 0f05          	clr	(OFST-6,sp)
 957                     ; 110 	if( hx711->Datos.Estado != SINVALORCONVERSION )
 959  000c 1e06          	ldw	x,(OFST-5,sp)
 960  000e e613          	ld	a,(19,x)
 961  0010 4a            	dec	a
 962  0011 2603cc0185    	jreq	L127
 963                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
 966  0016 4b00          	push	#0
 967  0018 1e07          	ldw	x,(OFST-4,sp)
 968  001a 1c0004        	addw	x,#4
 969  001d cd0000        	call	_NHALgpio_Write
 971  0020 ae000f        	ldw	x,#15
 972  0023 9d            	nop	
 973  0024 84            	pop	a
 974                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 979  0025               L62:
 980  0025 5a            	decw	X
 981  0026 26fd          	jrne	L62
 982  0028 9d            	nop	
 983                     
 985  0029               L527:
 986                     ; 99 	while( NHALgpio_Read( &hx711->Config.DOUT ) == true )
 988  0029 1e06          	ldw	x,(OFST-5,sp)
 989  002b cd0000        	call	_NHALgpio_Read
 991  002e 4d            	tnz	a
 992  002f 26f8          	jrne	L527
 993                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 997  0031 ae000f        	ldw	x,#15
 999  0034 9d            	nop	
1000  0035               L23:
1001  0035 5a            	decw	X
1002  0036 26fd          	jrne	L23
1003                     
1005  0038 2043          	jra	L337
1006  003a               L137:
1007                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1010  003a 4b01          	push	#1
1011  003c 1e07          	ldw	x,(OFST-4,sp)
1012  003e 1c0004        	addw	x,#4
1013  0041 cd0000        	call	_NHALgpio_Write
1015  0044 ae000f        	ldw	x,#15
1016  0047 9d            	nop	
1017  0048 84            	pop	a
1018                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1023  0049               L63:
1024  0049 5a            	decw	X
1025  004a 26fd          	jrne	L63
1026  004c 9d            	nop	
1027                     
1029                     ; 125 			semilla |= NHALgpio_Read( &hx711->Config.DOUT );
1031  004d 1e06          	ldw	x,(OFST-5,sp)
1032  004f cd0000        	call	_NHALgpio_Read
1034  0052 b703          	ld	c_lreg+3,a
1035  0054 3f02          	clr	c_lreg+2
1036  0056 3f01          	clr	c_lreg+1
1037  0058 3f00          	clr	c_lreg
1038  005a 96            	ldw	x,sp
1039  005b 1c0008        	addw	x,#OFST-3
1040  005e cd0000        	call	c_lgor
1043                     ; 126 			semilla <<= 1;
1045  0061 080b          	sll	(OFST+0,sp)
1046  0063 090a          	rlc	(OFST-1,sp)
1047  0065 0909          	rlc	(OFST-2,sp)
1048  0067 0908          	rlc	(OFST-3,sp)
1050                     ; 128 			contadorBucle++;
1052  0069 0c05          	inc	(OFST-6,sp)
1054                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1057  006b 4b00          	push	#0
1058  006d 1e07          	ldw	x,(OFST-4,sp)
1059  006f 1c0004        	addw	x,#4
1060  0072 cd0000        	call	_NHALgpio_Write
1062  0075 ae000f        	ldw	x,#15
1063  0078 9d            	nop	
1064  0079 84            	pop	a
1065                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1070  007a               L44:
1071  007a 5a            	decw	X
1072  007b 26fd          	jrne	L44
1073                     
1075  007d               L337:
1076  007d 9d            	nop	
1077                     ; 119 		while( contadorBucle < LONGITUDTRAMA ) 
1079  007e 7b05          	ld	a,(OFST-6,sp)
1080  0080 a118          	cp	a,#24
1081  0082 25b6          	jrult	L137
1082                     ; 66 	switch( hx711->Config.Ganancia )
1085  0084 1e06          	ldw	x,(OFST-5,sp)
1086  0086 e608          	ld	a,(8,x)
1088                     ; 91 		default:
1088                     ; 92 		
1088                     ; 93 		;
1089  0088 270b          	jreq	L715
1090  008a 4a            	dec	a
1091  008b 2737          	jreq	L535
1092  008d 4a            	dec	a
1093  008e 2603cc0137    	jreq	L306
1094  0093 2028          	jra	L736
1095  0095               L715:
1096                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1099  0095 4b01          	push	#1
1100  0097 1e07          	ldw	x,(OFST-4,sp)
1101  0099 1c0004        	addw	x,#4
1102  009c cd0000        	call	_NHALgpio_Write
1104  009f ae000f        	ldw	x,#15
1105  00a2 9d            	nop	
1106  00a3 84            	pop	a
1107                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1112  00a4               L05:
1113  00a4 5a            	decw	X
1114  00a5 26fd          	jrne	L05
1115  00a7 9d            	nop	
1116                     
1118                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1121  00a8 4b00          	push	#0
1122  00aa 1e07          	ldw	x,(OFST-4,sp)
1123  00ac 1c0004        	addw	x,#4
1124  00af cd0000        	call	_NHALgpio_Write
1126  00b2 ae000f        	ldw	x,#15
1127  00b5 9d            	nop	
1128  00b6 84            	pop	a
1129                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1134  00b7               L45:
1135  00b7 5a            	decw	X
1136  00b8 26fd          	jrne	L45
1137  00ba               LC001:
1138  00ba 9d            	nop	
1139                     
1141  00bb 1e06          	ldw	x,(OFST-5,sp)
1142  00bd               L736:
1143                     ; 136 		hx711->Datos.Estado = NUEVA_LECTURA;
1145  00bd a603          	ld	a,#3
1146  00bf e713          	ld	(19,x),a
1147  00c1 cc0185        	jra	L127
1148  00c4               L535:
1149                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1152  00c4 4b01          	push	#1
1153  00c6 1e07          	ldw	x,(OFST-4,sp)
1154  00c8 1c0004        	addw	x,#4
1155  00cb cd0000        	call	_NHALgpio_Write
1157  00ce ae000f        	ldw	x,#15
1158  00d1 9d            	nop	
1159  00d2 84            	pop	a
1160                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1165  00d3               L06:
1166  00d3 5a            	decw	X
1167  00d4 26fd          	jrne	L06
1168  00d6 9d            	nop	
1169                     
1171                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1174  00d7 4b00          	push	#0
1175  00d9 1e07          	ldw	x,(OFST-4,sp)
1176  00db 1c0004        	addw	x,#4
1177  00de cd0000        	call	_NHALgpio_Write
1179  00e1 ae000f        	ldw	x,#15
1180  00e4 9d            	nop	
1181  00e5 84            	pop	a
1182                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1187  00e6               L46:
1188  00e6 5a            	decw	X
1189  00e7 26fd          	jrne	L46
1190  00e9 9d            	nop	
1191                     
1193                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1196  00ea 4b01          	push	#1
1197  00ec 1e07          	ldw	x,(OFST-4,sp)
1198  00ee 1c0004        	addw	x,#4
1199  00f1 cd0000        	call	_NHALgpio_Write
1201  00f4 ae000f        	ldw	x,#15
1202  00f7 9d            	nop	
1203  00f8 84            	pop	a
1204                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1209  00f9               L07:
1210  00f9 5a            	decw	X
1211  00fa 26fd          	jrne	L07
1212  00fc 9d            	nop	
1213                     
1215                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1218  00fd 4b00          	push	#0
1219  00ff 1e07          	ldw	x,(OFST-4,sp)
1220  0101 1c0004        	addw	x,#4
1221  0104 cd0000        	call	_NHALgpio_Write
1223  0107 ae000f        	ldw	x,#15
1224  010a 9d            	nop	
1225  010b 84            	pop	a
1226                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1231  010c               L47:
1232  010c 5a            	decw	X
1233  010d 26fd          	jrne	L47
1234  010f 9d            	nop	
1235                     
1237                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1240  0110 4b01          	push	#1
1241  0112 1e07          	ldw	x,(OFST-4,sp)
1242  0114 1c0004        	addw	x,#4
1243  0117 cd0000        	call	_NHALgpio_Write
1245  011a ae000f        	ldw	x,#15
1246  011d 9d            	nop	
1247  011e 84            	pop	a
1248                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1253  011f               L001:
1254  011f 5a            	decw	X
1255  0120 26fd          	jrne	L001
1256  0122 9d            	nop	
1257                     
1259                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1262  0123 4b00          	push	#0
1263  0125 1e07          	ldw	x,(OFST-4,sp)
1264  0127 1c0004        	addw	x,#4
1265  012a cd0000        	call	_NHALgpio_Write
1267  012d ae000f        	ldw	x,#15
1268  0130 9d            	nop	
1269  0131 84            	pop	a
1270                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1275  0132               L401:
1276  0132 5a            	decw	X
1277  0133 26fd          	jrne	L401
1278                     
1280  0135 2083          	jp	LC001
1281  0137               L306:
1282                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1285  0137 4b01          	push	#1
1286  0139 1e07          	ldw	x,(OFST-4,sp)
1287  013b 1c0004        	addw	x,#4
1288  013e cd0000        	call	_NHALgpio_Write
1290  0141 ae000f        	ldw	x,#15
1291  0144 9d            	nop	
1292  0145 84            	pop	a
1293                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1298  0146               L011:
1299  0146 5a            	decw	X
1300  0147 26fd          	jrne	L011
1301  0149 9d            	nop	
1302                     
1304                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1307  014a 4b00          	push	#0
1308  014c 1e07          	ldw	x,(OFST-4,sp)
1309  014e 1c0004        	addw	x,#4
1310  0151 cd0000        	call	_NHALgpio_Write
1312  0154 ae000f        	ldw	x,#15
1313  0157 9d            	nop	
1314  0158 84            	pop	a
1315                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1320  0159               L411:
1321  0159 5a            	decw	X
1322  015a 26fd          	jrne	L411
1323  015c 9d            	nop	
1324                     
1326                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1329  015d 4b01          	push	#1
1330  015f 1e07          	ldw	x,(OFST-4,sp)
1331  0161 1c0004        	addw	x,#4
1332  0164 cd0000        	call	_NHALgpio_Write
1334  0167 ae000f        	ldw	x,#15
1335  016a 9d            	nop	
1336  016b 84            	pop	a
1337                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1342  016c               L021:
1343  016c 5a            	decw	X
1344  016d 26fd          	jrne	L021
1345  016f 9d            	nop	
1346                     
1348                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1351  0170 4b00          	push	#0
1352  0172 1e07          	ldw	x,(OFST-4,sp)
1353  0174 1c0004        	addw	x,#4
1354  0177 cd0000        	call	_NHALgpio_Write
1356  017a ae000f        	ldw	x,#15
1357  017d 9d            	nop	
1358  017e 84            	pop	a
1359                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1364  017f               L421:
1365  017f 5a            	decw	X
1366  0180 26fd          	jrne	L421
1367                     
1369  0182 cc00ba        	jp	LC001
1370  0185               L127:
1371                     ; 138 		return semilla;
1376                     ; 163 	aDormir( hx711 );
1379  0185 1e0c          	ldw	x,(OFST+1,sp)
1380  0187 1f06          	ldw	(OFST-5,sp),x
1382                     ; 46 	NHALgpio_Write( &hx711->Config.PD_SCK, true );
1384  0189 4b01          	push	#1
1385  018b 1e07          	ldw	x,(OFST-4,sp)
1386  018d 1c0004        	addw	x,#4
1387  0190 cd0000        	call	_NHALgpio_Write
1389  0193 ae0174        	ldw	x,#372
1390  0196 9d            	nop	
1391  0197 84            	pop	a
1392                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1397  0198               L231:
1398  0198 5a            	decw	X
1399  0199 26fd          	jrne	L231
1400  019b 9d            	nop	
1401                     
1403                     ; 49 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1405  019c 1e06          	ldw	x,(OFST-5,sp)
1406  019e e613          	ld	a,(19,x)
1407  01a0 4a            	dec	a
1408  01a1 2704          	jreq	L746
1409                     ; 51 		hx711->Datos.Estado = SLEEP;
1411  01a3 a602          	ld	a,#2
1412  01a5 e713          	ld	(19,x),a
1414  01a7               L746:
1415                     ; 165 	return ( semilla / hx711->Config.ValorConversion );
1417  01a7 1e0c          	ldw	x,(OFST+1,sp)
1418  01a9 ee09          	ldw	x,(9,x)
1419  01ab cd0000        	call	c_uitolx
1421  01ae 96            	ldw	x,sp
1422  01af 5c            	incw	x
1423  01b0 cd0000        	call	c_rtol
1426  01b3 96            	ldw	x,sp
1427  01b4 1c0008        	addw	x,#OFST-3
1428  01b7 cd0000        	call	c_ltor
1430  01ba 96            	ldw	x,sp
1431  01bb 5c            	incw	x
1432  01bc cd0000        	call	c_ludv
1434  01bf be02          	ldw	x,c_lreg+2
1437  01c1 5b0d          	addw	sp,#13
1438  01c3 81            	ret	
1548                     ; 168 uint16_t hx711_Tarar( HX711_t_ptr hx711 )
1548                     ; 169 {
1549                     .text:	section	.text,new
1550  0000               _hx711_Tarar:
1552  0000 89            	pushw	x
1553  0001 5210          	subw	sp,#16
1554       00000010      OFST:	set	16
1557                     ; 170 	uint32_t valorMedio = 0;
1559  0003 5f            	clrw	x
1560  0004 1f0e          	ldw	(OFST-2,sp),x
1561  0006 1f0c          	ldw	(OFST-4,sp),x
1563                     ; 171 	uint8_t repeticiones = 4;
1565  0008 a604          	ld	a,#4
1566  000a 6b10          	ld	(OFST+0,sp),a
1568  000c               L1711:
1569                     ; 175 		valorMedio = valorMedio + leer( hx711 );
1572  000c 1e11          	ldw	x,(OFST+1,sp)
1573  000e 1f06          	ldw	(OFST-10,sp),x
1575                     ; 107 	uint32_t semilla = 0;
1577  0010 5f            	clrw	x
1578  0011 1f04          	ldw	(OFST-12,sp),x
1579  0013 1f02          	ldw	(OFST-14,sp),x
1581                     ; 108 	uint8_t contadorBucle = 0;
1583  0015 0f01          	clr	(OFST-15,sp)
1585                     ; 110 	if( hx711->Datos.Estado != SINVALORCONVERSION )
1587  0017 1e06          	ldw	x,(OFST-10,sp)
1588  0019 e613          	ld	a,(19,x)
1589  001b 4a            	dec	a
1590  001c 2603cc0190    	jreq	L7711
1591                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1594  0021 4b00          	push	#0
1595  0023 1e07          	ldw	x,(OFST-9,sp)
1596  0025 1c0004        	addw	x,#4
1597  0028 cd0000        	call	_NHALgpio_Write
1599  002b ae000f        	ldw	x,#15
1600  002e 9d            	nop	
1601  002f 84            	pop	a
1602                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1607  0030               L041:
1608  0030 5a            	decw	X
1609  0031 26fd          	jrne	L041
1610  0033 9d            	nop	
1611                     
1613  0034               L3021:
1614                     ; 99 	while( NHALgpio_Read( &hx711->Config.DOUT ) == true )
1616  0034 1e06          	ldw	x,(OFST-10,sp)
1617  0036 cd0000        	call	_NHALgpio_Read
1619  0039 4d            	tnz	a
1620  003a 26f8          	jrne	L3021
1621                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1625  003c ae000f        	ldw	x,#15
1627  003f 9d            	nop	
1628  0040               L441:
1629  0040 5a            	decw	X
1630  0041 26fd          	jrne	L441
1631                     
1633  0043 2043          	jra	L1121
1634  0045               L7021:
1635                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1638  0045 4b01          	push	#1
1639  0047 1e07          	ldw	x,(OFST-9,sp)
1640  0049 1c0004        	addw	x,#4
1641  004c cd0000        	call	_NHALgpio_Write
1643  004f ae000f        	ldw	x,#15
1644  0052 9d            	nop	
1645  0053 84            	pop	a
1646                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1651  0054               L051:
1652  0054 5a            	decw	X
1653  0055 26fd          	jrne	L051
1654  0057 9d            	nop	
1655                     
1657                     ; 125 			semilla |= NHALgpio_Read( &hx711->Config.DOUT );
1659  0058 1e06          	ldw	x,(OFST-10,sp)
1660  005a cd0000        	call	_NHALgpio_Read
1662  005d b703          	ld	c_lreg+3,a
1663  005f 3f02          	clr	c_lreg+2
1664  0061 3f01          	clr	c_lreg+1
1665  0063 3f00          	clr	c_lreg
1666  0065 96            	ldw	x,sp
1667  0066 1c0002        	addw	x,#OFST-14
1668  0069 cd0000        	call	c_lgor
1671                     ; 126 			semilla <<= 1;
1673  006c 0805          	sll	(OFST-11,sp)
1674  006e 0904          	rlc	(OFST-12,sp)
1675  0070 0903          	rlc	(OFST-13,sp)
1676  0072 0902          	rlc	(OFST-14,sp)
1678                     ; 128 			contadorBucle++;
1680  0074 0c01          	inc	(OFST-15,sp)
1682                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1685  0076 4b00          	push	#0
1686  0078 1e07          	ldw	x,(OFST-9,sp)
1687  007a 1c0004        	addw	x,#4
1688  007d cd0000        	call	_NHALgpio_Write
1690  0080 ae000f        	ldw	x,#15
1691  0083 9d            	nop	
1692  0084 84            	pop	a
1693                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1698  0085               L651:
1699  0085 5a            	decw	X
1700  0086 26fd          	jrne	L651
1701                     
1703  0088               L1121:
1704  0088 9d            	nop	
1705                     ; 119 		while( contadorBucle < LONGITUDTRAMA ) 
1707  0089 7b01          	ld	a,(OFST-15,sp)
1708  008b a118          	cp	a,#24
1709  008d 25b6          	jrult	L7021
1710                     ; 66 	switch( hx711->Config.Ganancia )
1713  008f 1e06          	ldw	x,(OFST-10,sp)
1714  0091 e608          	ld	a,(8,x)
1716                     ; 91 		default:
1716                     ; 92 		
1716                     ; 93 		;
1717  0093 270b          	jreq	L777
1718  0095 4a            	dec	a
1719  0096 2737          	jreq	L5101
1720  0098 4a            	dec	a
1721  0099 2603cc0142    	jreq	L3601
1722  009e 2028          	jra	L7111
1723  00a0               L777:
1724                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1727  00a0 4b01          	push	#1
1728  00a2 1e07          	ldw	x,(OFST-9,sp)
1729  00a4 1c0004        	addw	x,#4
1730  00a7 cd0000        	call	_NHALgpio_Write
1732  00aa ae000f        	ldw	x,#15
1733  00ad 9d            	nop	
1734  00ae 84            	pop	a
1735                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1740  00af               L261:
1741  00af 5a            	decw	X
1742  00b0 26fd          	jrne	L261
1743  00b2 9d            	nop	
1744                     
1746                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1749  00b3 4b00          	push	#0
1750  00b5 1e07          	ldw	x,(OFST-9,sp)
1751  00b7 1c0004        	addw	x,#4
1752  00ba cd0000        	call	_NHALgpio_Write
1754  00bd ae000f        	ldw	x,#15
1755  00c0 9d            	nop	
1756  00c1 84            	pop	a
1757                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1762  00c2               L661:
1763  00c2 5a            	decw	X
1764  00c3 26fd          	jrne	L661
1765  00c5               LC002:
1766  00c5 9d            	nop	
1767                     
1769  00c6 1e06          	ldw	x,(OFST-10,sp)
1770  00c8               L7111:
1771                     ; 136 		hx711->Datos.Estado = NUEVA_LECTURA;
1773  00c8 a603          	ld	a,#3
1774  00ca e713          	ld	(19,x),a
1775  00cc cc0190        	jra	L7711
1776  00cf               L5101:
1777                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1780  00cf 4b01          	push	#1
1781  00d1 1e07          	ldw	x,(OFST-9,sp)
1782  00d3 1c0004        	addw	x,#4
1783  00d6 cd0000        	call	_NHALgpio_Write
1785  00d9 ae000f        	ldw	x,#15
1786  00dc 9d            	nop	
1787  00dd 84            	pop	a
1788                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1793  00de               L271:
1794  00de 5a            	decw	X
1795  00df 26fd          	jrne	L271
1796  00e1 9d            	nop	
1797                     
1799                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1802  00e2 4b00          	push	#0
1803  00e4 1e07          	ldw	x,(OFST-9,sp)
1804  00e6 1c0004        	addw	x,#4
1805  00e9 cd0000        	call	_NHALgpio_Write
1807  00ec ae000f        	ldw	x,#15
1808  00ef 9d            	nop	
1809  00f0 84            	pop	a
1810                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1815  00f1               L671:
1816  00f1 5a            	decw	X
1817  00f2 26fd          	jrne	L671
1818  00f4 9d            	nop	
1819                     
1821                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1824  00f5 4b01          	push	#1
1825  00f7 1e07          	ldw	x,(OFST-9,sp)
1826  00f9 1c0004        	addw	x,#4
1827  00fc cd0000        	call	_NHALgpio_Write
1829  00ff ae000f        	ldw	x,#15
1830  0102 9d            	nop	
1831  0103 84            	pop	a
1832                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1837  0104               L202:
1838  0104 5a            	decw	X
1839  0105 26fd          	jrne	L202
1840  0107 9d            	nop	
1841                     
1843                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1846  0108 4b00          	push	#0
1847  010a 1e07          	ldw	x,(OFST-9,sp)
1848  010c 1c0004        	addw	x,#4
1849  010f cd0000        	call	_NHALgpio_Write
1851  0112 ae000f        	ldw	x,#15
1852  0115 9d            	nop	
1853  0116 84            	pop	a
1854                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1859  0117               L602:
1860  0117 5a            	decw	X
1861  0118 26fd          	jrne	L602
1862  011a 9d            	nop	
1863                     
1865                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1868  011b 4b01          	push	#1
1869  011d 1e07          	ldw	x,(OFST-9,sp)
1870  011f 1c0004        	addw	x,#4
1871  0122 cd0000        	call	_NHALgpio_Write
1873  0125 ae000f        	ldw	x,#15
1874  0128 9d            	nop	
1875  0129 84            	pop	a
1876                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1881  012a               L212:
1882  012a 5a            	decw	X
1883  012b 26fd          	jrne	L212
1884  012d 9d            	nop	
1885                     
1887                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1890  012e 4b00          	push	#0
1891  0130 1e07          	ldw	x,(OFST-9,sp)
1892  0132 1c0004        	addw	x,#4
1893  0135 cd0000        	call	_NHALgpio_Write
1895  0138 ae000f        	ldw	x,#15
1896  013b 9d            	nop	
1897  013c 84            	pop	a
1898                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1903  013d               L612:
1904  013d 5a            	decw	X
1905  013e 26fd          	jrne	L612
1906                     
1908  0140 2083          	jp	LC002
1909  0142               L3601:
1910                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1913  0142 4b01          	push	#1
1914  0144 1e07          	ldw	x,(OFST-9,sp)
1915  0146 1c0004        	addw	x,#4
1916  0149 cd0000        	call	_NHALgpio_Write
1918  014c ae000f        	ldw	x,#15
1919  014f 9d            	nop	
1920  0150 84            	pop	a
1921                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1926  0151               L222:
1927  0151 5a            	decw	X
1928  0152 26fd          	jrne	L222
1929  0154 9d            	nop	
1930                     
1932                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1935  0155 4b00          	push	#0
1936  0157 1e07          	ldw	x,(OFST-9,sp)
1937  0159 1c0004        	addw	x,#4
1938  015c cd0000        	call	_NHALgpio_Write
1940  015f ae000f        	ldw	x,#15
1941  0162 9d            	nop	
1942  0163 84            	pop	a
1943                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1948  0164               L622:
1949  0164 5a            	decw	X
1950  0165 26fd          	jrne	L622
1951  0167 9d            	nop	
1952                     
1954                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1957  0168 4b01          	push	#1
1958  016a 1e07          	ldw	x,(OFST-9,sp)
1959  016c 1c0004        	addw	x,#4
1960  016f cd0000        	call	_NHALgpio_Write
1962  0172 ae000f        	ldw	x,#15
1963  0175 9d            	nop	
1964  0176 84            	pop	a
1965                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1970  0177               L232:
1971  0177 5a            	decw	X
1972  0178 26fd          	jrne	L232
1973  017a 9d            	nop	
1974                     
1976                     ; 60 	NHALgpio_Write( &hx711->Config.PD_SCK, estado );
1979  017b 4b00          	push	#0
1980  017d 1e07          	ldw	x,(OFST-9,sp)
1981  017f 1c0004        	addw	x,#4
1982  0182 cd0000        	call	_NHALgpio_Write
1984  0185 ae000f        	ldw	x,#15
1985  0188 9d            	nop	
1986  0189 84            	pop	a
1987                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1992  018a               L632:
1993  018a 5a            	decw	X
1994  018b 26fd          	jrne	L632
1995                     
1997  018d cc00c5        	jp	LC002
1998  0190               L7711:
1999                     ; 138 		return semilla;
2001  0190 1e04          	ldw	x,(OFST-12,sp)
2002  0192 1f0a          	ldw	(OFST-6,sp),x
2003  0194 1e02          	ldw	x,(OFST-14,sp)
2004  0196 1f08          	ldw	(OFST-8,sp),x
2008  0198 96            	ldw	x,sp
2009  0199 1c0008        	addw	x,#OFST-8
2010  019c cd0000        	call	c_ltor
2012  019f 96            	ldw	x,sp
2013  01a0 1c000c        	addw	x,#OFST-4
2014  01a3 cd0000        	call	c_lgadd
2017                     ; 177 		--repeticiones;
2019  01a6 0a10          	dec	(OFST+0,sp)
2021                     ; 173 	while( ( repeticiones > 0 ) )
2023  01a8 2703cc000c    	jrne	L1711
2024                     ; 179 	repeticiones = 4;
2026                     ; 181 	return valorMedio/repeticiones;
2028  01ad 96            	ldw	x,sp
2029  01ae 1c000c        	addw	x,#OFST-4
2030  01b1 cd0000        	call	c_ltor
2032  01b4 a602          	ld	a,#2
2033  01b6 cd0000        	call	c_lursh
2035  01b9 be02          	ldw	x,c_lreg+2
2038  01bb 5b12          	addw	sp,#18
2039  01bd 81            	ret	
2052                     	xdef	_hx711_Tarar
2053                     	xdef	_hx711_Lectura
2054                     	xdef	_HX711_Init
2055                     	xref	_NHALgpio_Write
2056                     	xref	_NHALgpio_Read
2057                     	xref	_NHALgpio_Init
2058                     	xref	_NHALgpioConfig_SetType
2059                     	xref.b	c_lreg
2060                     	xref.b	c_x
2079                     	xref	c_lursh
2080                     	xref	c_lgadd
2081                     	xref	c_ludv
2082                     	xref	c_rtol
2083                     	xref	c_uitolx
2084                     	xref	c_ltor
2085                     	xref	c_lgor
2086                     	end

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
1189                     ; 160 int main()
1189                     ; 161 {
1191                     .text:	section	.text,new
1192  0000               _main:
1194  0000 5207          	subw	sp,#7
1195       00000007      OFST:	set	7
1198                     ; 57 	GPIO_DeInit(GPIOA);
1202  0002 ae5000        	ldw	x,#20480
1203  0005 cd0000        	call	_GPIO_DeInit
1205                     ; 58 	GPIO_DeInit(GPIOB);
1207  0008 ae5005        	ldw	x,#20485
1208  000b cd0000        	call	_GPIO_DeInit
1210                     ; 59 	GPIO_DeInit(GPIOC);
1212  000e ae500a        	ldw	x,#20490
1213  0011 cd0000        	call	_GPIO_DeInit
1215                     ; 60 	GPIO_DeInit(GPIOD);
1217  0014 ae500f        	ldw	x,#20495
1218  0017 cd0000        	call	_GPIO_DeInit
1220                     ; 107 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
1223  001a ae0080        	ldw	x,#128
1224  001d cd0000        	call	_Clock_HSI_Init
1226                     ; 74 	SensorTempHum.Config.HW.Puerto = GPIOA;
1230  0020 ae5000        	ldw	x,#20480
1231  0023 bf2b          	ldw	_SensorTempHum,x
1232                     ; 75 	SensorTempHum.Config.HW.Pin = GPIO_PIN_3;
1234  0025 3508002d      	mov	_SensorTempHum+2,#8
1235                     ; 78 	SensorPesaje.Config.DOUT.Puerto = GPIOD;
1237  0029 ae500f        	ldw	x,#20495
1238  002c bf0f          	ldw	_SensorPesaje,x
1239                     ; 79 	SensorPesaje.Config.DOUT.Pin = GPIO_PIN_2;
1241  002e 35040011      	mov	_SensorPesaje+2,#4
1242                     ; 81 	SensorPesaje.Config.PD_SCK.Puerto = GPIOD;
1244  0032 bf13          	ldw	_SensorPesaje+4,x
1245                     ; 82 	SensorPesaje.Config.PD_SCK.Pin = GPIO_PIN_3;
1247  0034 35080015      	mov	_SensorPesaje+6,#8
1248                     ; 118 	Timer_Config_Init( &timer_Timeout.Config, TIMER1, CANAL1, COUNTERUP, SI, 1 );
1251  0038 ae0001        	ldw	x,#1
1252  003b 89            	pushw	x
1253  003c 4b00          	push	#0
1254  003e 4b00          	push	#0
1255  0040 4b00          	push	#0
1256  0042 4b00          	push	#0
1257  0044 ae0009        	ldw	x,#_timer_Timeout
1258  0047 cd0000        	call	_Timer_Config_Init
1260  004a 5b06          	addw	sp,#6
1261                     ; 119 	Timeout_Init( &Timeout, &timer_Timeout, &getFlagTimer1, &setFlagTimer1 );
1263  004c ae0000        	ldw	x,#_setFlagTimer1
1264  004f 89            	pushw	x
1265  0050 ae0000        	ldw	x,#_getFlagTimer1
1266  0053 89            	pushw	x
1267  0054 ae0009        	ldw	x,#_timer_Timeout
1268  0057 89            	pushw	x
1269  0058 ae0000        	ldw	x,#_Timeout
1270  005b cd0000        	call	_Timeout_Init
1272  005e 5b06          	addw	sp,#6
1273                     ; 121 	DHT11_Init( &SensorTempHum, &dht11_Lectura, &Timeout );
1275  0060 ae0000        	ldw	x,#_Timeout
1276  0063 89            	pushw	x
1277  0064 ae0000        	ldw	x,#_dht11_Lectura
1278  0067 89            	pushw	x
1279  0068 ae002b        	ldw	x,#_SensorTempHum
1280  006b cd0000        	call	_DHT11_Init
1282  006e 5b04          	addw	sp,#4
1283                     ; 122 	HX711_Init( &SensorPesaje, &hx711_Lectura, &hx711_Tarar, &Timeout );
1285  0070 ae0000        	ldw	x,#_Timeout
1286  0073 89            	pushw	x
1287  0074 ae0000        	ldw	x,#_hx711_Tarar
1288  0077 89            	pushw	x
1289  0078 ae0000        	ldw	x,#_hx711_Lectura
1290  007b 89            	pushw	x
1291  007c ae000f        	ldw	x,#_SensorPesaje
1292  007f cd0000        	call	_HX711_Init
1294  0082 5b06          	addw	sp,#6
1295                     ; 164 	SensorPesaje.Config.ValorZero = SensorPesaje.Tarar( &SensorPesaje );
1297  0084 ae000f        	ldw	x,#_SensorPesaje
1298  0087 92cd29        	call	[_SensorPesaje+26.w]
1300  008a cd0000        	call	c_uitolx
1302  008d ae001a        	ldw	x,#_SensorPesaje+11
1303  0090 cd0000        	call	c_rtol
1305  0093               L357:
1306                     ; 148 	SensorPesaje.Datos.UltimaLectura = SensorPesaje.Lectura( &SensorPesaje );
1309  0093 ae000f        	ldw	x,#_SensorPesaje
1310  0096 92cd27        	call	[_SensorPesaje+24.w]
1312  0099 cd0000        	call	c_uitolx
1314  009c ae0020        	ldw	x,#_SensorPesaje+17
1315  009f cd0000        	call	c_rtol
1317                     ; 149 	SensorTempHum.Datos.UltimaLectura = SensorTempHum.Lectura( &SensorTempHum );
1319  00a2 ae002b        	ldw	x,#_SensorTempHum
1320  00a5 89            	pushw	x
1321  00a6 ae002f        	ldw	x,#_SensorTempHum+4
1322  00a9 89            	pushw	x
1323  00aa 92cd37        	call	[_SensorTempHum+12.w]
1325  00ad 5b04          	addw	sp,#4
1326                     ; 168 * <table align="left" style="width:800px">
1329  00af ae03e8        	ldw	x,#1000
1332  00b2 200a          	jra	L367
1333  00b4               L757:
1334                     ; 101 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1338  00b4 ae14d4        	ldw	x,#5332
1340  00b7 9d            	nop	
1341  00b8               L63:
1342  00b8 5a            	decw	X
1343  00b9 26fd          	jrne	L63
1344  00bb 9d            	nop	
1345                     
1347  00bc 1e06          	ldw	x,(OFST-1,sp)
1348  00be               L367:
1349                     ; 177 	while ( __ms-- )
1351  00be 5a            	decw	x
1352  00bf 1f06          	ldw	(OFST-1,sp),x
1353  00c1 5c            	incw	x
1355  00c2 26f0          	jrne	L757
1356  00c4 20cd          	jra	L357
1369                     	xdef	_main
1370                     	switch	.ubsct
1371  0000               _Timeout:
1372  0000 000000000000  	ds.b	9
1373                     	xdef	_Timeout
1374  0009               _timer_Timeout:
1375  0009 000000000000  	ds.b	6
1376                     	xdef	_timer_Timeout
1377  000f               _SensorPesaje:
1378  000f 000000000000  	ds.b	28
1379                     	xdef	_SensorPesaje
1380  002b               _SensorTempHum:
1381  002b 000000000000  	ds.b	14
1382                     	xdef	_SensorTempHum
1383                     	xref	_hx711_Tarar
1384                     	xref	_hx711_Lectura
1385                     	xref	_HX711_Init
1386                     	xref	_dht11_Lectura
1387                     	xref	_DHT11_Init
1388                     	xref	_Timeout_Init
1389                     	xref	_Timer_Config_Init
1390                     	xref	_Clock_HSI_Init
1391                     	xref	_setFlagTimer1
1392                     	xref	_getFlagTimer1
1393                     	xref	_GPIO_DeInit
1413                     	xref	c_rtol
1414                     	xref	c_uitolx
1415                     	end

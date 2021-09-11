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
1171                     ; 156 int main()
1171                     ; 157 {
1173                     .text:	section	.text,new
1174  0000               _main:
1178                     ; 57 	GPIO_DeInit(GPIOA);
1182  0000 ae5000        	ldw	x,#20480
1183  0003 cd0000        	call	_GPIO_DeInit
1185                     ; 58 	GPIO_DeInit(GPIOB);
1187  0006 ae5005        	ldw	x,#20485
1188  0009 cd0000        	call	_GPIO_DeInit
1190                     ; 59 	GPIO_DeInit(GPIOC);
1192  000c ae500a        	ldw	x,#20490
1193  000f cd0000        	call	_GPIO_DeInit
1195                     ; 60 	GPIO_DeInit(GPIOD);
1197  0012 ae500f        	ldw	x,#20495
1198  0015 cd0000        	call	_GPIO_DeInit
1200                     ; 112 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
1203  0018 ae0080        	ldw	x,#128
1204  001b cd0000        	call	_Clock_HSI_Init
1206                     ; 74 	SensorTempHum.Config.HW.Puerto = GPIOA;
1210  001e ae5000        	ldw	x,#20480
1211  0021 bf2d          	ldw	_SensorTempHum,x
1212                     ; 75 	SensorTempHum.Config.HW.Pin = GPIO_PIN_3;
1214  0023 3508002f      	mov	_SensorTempHum+2,#8
1215                     ; 78 	SensorPesaje.Config.DOUT.Puerto = GPIOD;
1217  0027 ae500f        	ldw	x,#20495
1218  002a bf13          	ldw	_SensorPesaje,x
1219                     ; 79 	SensorPesaje.Config.DOUT.Pin = GPIO_PIN_2;
1221  002c 35040015      	mov	_SensorPesaje+2,#4
1222                     ; 81 	SensorPesaje.Config.PD_SCK.Puerto = GPIOD;
1224  0030 bf17          	ldw	_SensorPesaje+4,x
1225                     ; 82 	SensorPesaje.Config.PD_SCK.Pin = GPIO_PIN_3;
1227  0032 35080019      	mov	_SensorPesaje+6,#8
1228                     ; 84 	Timeout_test.Puerto = GPIOC;
1230  0036 ae500a        	ldw	x,#20490
1231  0039 bf00          	ldw	_Timeout_test,x
1232                     ; 85 	Timeout_test.Pin = GPIO_PIN_4;
1234  003b 35100002      	mov	_Timeout_test+2,#16
1235                     ; 86 	NHALgpioConfig_SetType( &Timeout_test, GPIO_MODE_OUT_PP_HIGH_SLOW/*GPIO_MODE_OUT_PP_HIGH_FAST*/ );
1237  003f 4bd0          	push	#208
1238  0041 ae0000        	ldw	x,#_Timeout_test
1239  0044 cd0000        	call	_NHALgpioConfig_SetType
1241  0047 ae0000        	ldw	x,#_Timeout_test
1242  004a 84            	pop	a
1243                     ; 87 	NHALgpio_Init( &Timeout_test );
1245  004b cd0000        	call	_NHALgpio_Init
1247                     ; 123 	timer_Timeout.Config.Timer = TIMER1;
1250  004e 3f0d          	clr	_timer_Timeout
1251                     ; 124 	timer_Timeout.Config.Canal = CANAL1;
1253  0050 3f0e          	clr	_timer_Timeout+1
1254                     ; 125 	timer_Timeout.Config.Modo = COUNTERUP;
1256  0052 3f0f          	clr	_timer_Timeout+2
1257                     ; 126 	timer_Timeout.Config.IT = SI;
1259  0054 3f10          	clr	_timer_Timeout+3
1260                     ; 127 	timer_Timeout.Config.Tiempo = 1;
1262  0056 ae0001        	ldw	x,#1
1263  0059 bf11          	ldw	_timer_Timeout+4,x
1264                     ; 129 	Timeout_Init( &Timeout, &timer_Timeout, &getFlagTimer1, &setFlagTimer1 );
1266  005b ae0000        	ldw	x,#_setFlagTimer1
1267  005e 89            	pushw	x
1268  005f ae0000        	ldw	x,#_getFlagTimer1
1269  0062 89            	pushw	x
1270  0063 ae000d        	ldw	x,#_timer_Timeout
1271  0066 89            	pushw	x
1272  0067 ae0004        	ldw	x,#_Timeout
1273  006a cd0000        	call	_Timeout_Init
1275  006d 5b06          	addw	sp,#6
1276                     ; 130 	DHT11_Init( &SensorTempHum, &dht11_Lectura );
1278  006f ae0000        	ldw	x,#_dht11_Lectura
1279  0072 89            	pushw	x
1280  0073 ae002d        	ldw	x,#_SensorTempHum
1281  0076 cd0000        	call	_DHT11_Init
1283  0079 85            	popw	x
1284                     ; 131 	HX711_Init( &SensorPesaje, &hx711_Lectura, &hx711_Tarar, &Timeout );
1286  007a ae0004        	ldw	x,#_Timeout
1287  007d 89            	pushw	x
1288  007e ae0000        	ldw	x,#_hx711_Tarar
1289  0081 89            	pushw	x
1290  0082 ae0000        	ldw	x,#_hx711_Lectura
1291  0085 89            	pushw	x
1292  0086 ae0013        	ldw	x,#_SensorPesaje
1293  0089 cd0000        	call	_HX711_Init
1295  008c 5b06          	addw	sp,#6
1296                     ; 160 	SensorPesaje.Config.ValorZero = SensorPesaje.Tarar( &SensorPesaje );
1298  008e ae0013        	ldw	x,#_SensorPesaje
1299  0091 92cd2b        	call	[_SensorPesaje+24.w]
1301  0094 bf1e          	ldw	_SensorPesaje+11,x
1302  0096               L727:
1303                     ; 163 		Timeout_Start( &Timeout, 1500 );
1305  0096 ae05dc        	ldw	x,#1500
1306  0099 89            	pushw	x
1307  009a ae0004        	ldw	x,#_Timeout
1308  009d cd0000        	call	_Timeout_Start
1310  00a0 85            	popw	x
1311                     ; 165 		if( Timeout.Config.Notificacion() )
1313  00a1 92cd06        	call	[_Timeout+2.w]
1315  00a4 4d            	tnz	a
1316  00a5 27ef          	jreq	L727
1317                     ; 167 			Timeout_Stop( &Timeout );
1319  00a7 ae0004        	ldw	x,#_Timeout
1320  00aa cd0000        	call	_Timeout_Stop
1322                     ; 168 			NHALgpio_Write( &Timeout_test, true );
1324  00ad 4b01          	push	#1
1325  00af ae0000        	ldw	x,#_Timeout_test
1326  00b2 cd0000        	call	_NHALgpio_Write
1328  00b5 84            	pop	a
1329                     ; 169 			NHALgpio_Write( &Timeout_test, false );
1331  00b6 4b00          	push	#0
1332  00b8 ae0000        	ldw	x,#_Timeout_test
1333  00bb cd0000        	call	_NHALgpio_Write
1335  00be 84            	pop	a
1336  00bf 20d5          	jra	L727
1349                     	xdef	_main
1350                     	switch	.ubsct
1351  0000               _Timeout_test:
1352  0000 00000000      	ds.b	4
1353                     	xdef	_Timeout_test
1354  0004               _Timeout:
1355  0004 000000000000  	ds.b	9
1356                     	xdef	_Timeout
1357  000d               _timer_Timeout:
1358  000d 000000000000  	ds.b	6
1359                     	xdef	_timer_Timeout
1360  0013               _SensorPesaje:
1361  0013 000000000000  	ds.b	26
1362                     	xdef	_SensorPesaje
1363  002d               _SensorTempHum:
1364  002d 000000000000  	ds.b	12
1365                     	xdef	_SensorTempHum
1366                     	xref	_hx711_Tarar
1367                     	xref	_hx711_Lectura
1368                     	xref	_HX711_Init
1369                     	xref	_Timeout_Stop
1370                     	xref	_Timeout_Start
1371                     	xref	_Timeout_Init
1372                     	xref	_dht11_Lectura
1373                     	xref	_DHT11_Init
1374                     	xref	_Clock_HSI_Init
1375                     	xref	_NHALgpio_Write
1376                     	xref	_NHALgpio_Init
1377                     	xref	_NHALgpioConfig_SetType
1378                     	xref	_setFlagTimer1
1379                     	xref	_getFlagTimer1
1380                     	xref	_GPIO_DeInit
1400                     	end

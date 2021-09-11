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
1155                     ; 151 int main()
1155                     ; 152 {
1157                     .text:	section	.text,new
1158  0000               _main:
1162                     ; 57 	GPIO_DeInit(GPIOA);
1166  0000 ae5000        	ldw	x,#20480
1167  0003 cd0000        	call	_GPIO_DeInit
1169                     ; 58 	GPIO_DeInit(GPIOB);
1171  0006 ae5005        	ldw	x,#20485
1172  0009 cd0000        	call	_GPIO_DeInit
1174                     ; 59 	GPIO_DeInit(GPIOC);
1176  000c ae500a        	ldw	x,#20490
1177  000f cd0000        	call	_GPIO_DeInit
1179                     ; 60 	GPIO_DeInit(GPIOD);
1181  0012 ae500f        	ldw	x,#20495
1182  0015 cd0000        	call	_GPIO_DeInit
1184                     ; 107 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
1187  0018 ae0080        	ldw	x,#128
1188  001b cd0000        	call	_Clock_HSI_Init
1190                     ; 74 	SensorTempHum.Config.HW.Puerto = GPIOA;
1194  001e ae5000        	ldw	x,#20480
1195  0021 bf29          	ldw	_SensorTempHum,x
1196                     ; 75 	SensorTempHum.Config.HW.Pin = GPIO_PIN_3;
1198  0023 3508002b      	mov	_SensorTempHum+2,#8
1199                     ; 78 	SensorPesaje.Config.DOUT.Puerto = GPIOD;
1201  0027 ae500f        	ldw	x,#20495
1202  002a bf0f          	ldw	_SensorPesaje,x
1203                     ; 79 	SensorPesaje.Config.DOUT.Pin = GPIO_PIN_2;
1205  002c 35040011      	mov	_SensorPesaje+2,#4
1206                     ; 81 	SensorPesaje.Config.PD_SCK.Puerto = GPIOD;
1208  0030 bf13          	ldw	_SensorPesaje+4,x
1209                     ; 82 	SensorPesaje.Config.PD_SCK.Pin = GPIO_PIN_3;
1211  0032 35080015      	mov	_SensorPesaje+6,#8
1212                     ; 118 	timer_Timeout.Config.Timer = TIMER1;
1215  0036 3f09          	clr	_timer_Timeout
1216                     ; 119 	timer_Timeout.Config.Canal = CANAL1;
1218  0038 3f0a          	clr	_timer_Timeout+1
1219                     ; 120 	timer_Timeout.Config.Modo = COUNTERUP;
1221  003a 3f0b          	clr	_timer_Timeout+2
1222                     ; 121 	timer_Timeout.Config.IT = SI;
1224  003c 3f0c          	clr	_timer_Timeout+3
1225                     ; 122 	timer_Timeout.Config.Tiempo = 1;
1227  003e ae0001        	ldw	x,#1
1228  0041 bf0d          	ldw	_timer_Timeout+4,x
1229                     ; 124 	Timeout_Init( &Timeout, &timer_Timeout, &getFlagTimer1, &setFlagTimer1 );
1231  0043 ae0000        	ldw	x,#_setFlagTimer1
1232  0046 89            	pushw	x
1233  0047 ae0000        	ldw	x,#_getFlagTimer1
1234  004a 89            	pushw	x
1235  004b ae0009        	ldw	x,#_timer_Timeout
1236  004e 89            	pushw	x
1237  004f ae0000        	ldw	x,#_Timeout
1238  0052 cd0000        	call	_Timeout_Init
1240  0055 5b06          	addw	sp,#6
1241                     ; 125 	DHT11_Init( &SensorTempHum, &dht11_Lectura );
1243  0057 ae0000        	ldw	x,#_dht11_Lectura
1244  005a 89            	pushw	x
1245  005b ae0029        	ldw	x,#_SensorTempHum
1246  005e cd0000        	call	_DHT11_Init
1248  0061 85            	popw	x
1249                     ; 126 	HX711_Init( &SensorPesaje, &hx711_Lectura, &hx711_Tarar, &Timeout );
1251  0062 ae0000        	ldw	x,#_Timeout
1252  0065 89            	pushw	x
1253  0066 ae0000        	ldw	x,#_hx711_Tarar
1254  0069 89            	pushw	x
1255  006a ae0000        	ldw	x,#_hx711_Lectura
1256  006d 89            	pushw	x
1257  006e ae000f        	ldw	x,#_SensorPesaje
1258  0071 cd0000        	call	_HX711_Init
1260  0074 5b06          	addw	sp,#6
1261                     ; 155 	SensorPesaje.Config.ValorZero = SensorPesaje.Tarar( &SensorPesaje );
1263  0076 ae000f        	ldw	x,#_SensorPesaje
1264  0079 92cd27        	call	[_SensorPesaje+24.w]
1266  007c bf1a          	ldw	_SensorPesaje+11,x
1267  007e               L327:
1268                     ; 160 		SensorPesaje.Datos.UltimaLectura = SensorPesaje.Lectura( &SensorPesaje );
1270  007e ae000f        	ldw	x,#_SensorPesaje
1271  0081 92cd25        	call	[_SensorPesaje+22.w]
1273  0084 cd0000        	call	c_uitolx
1275  0087 ae001e        	ldw	x,#_SensorPesaje+15
1276  008a cd0000        	call	c_rtol
1279  008d 20ef          	jra	L327
1292                     	xdef	_main
1293                     	switch	.ubsct
1294  0000               _Timeout:
1295  0000 000000000000  	ds.b	9
1296                     	xdef	_Timeout
1297  0009               _timer_Timeout:
1298  0009 000000000000  	ds.b	6
1299                     	xdef	_timer_Timeout
1300  000f               _SensorPesaje:
1301  000f 000000000000  	ds.b	26
1302                     	xdef	_SensorPesaje
1303  0029               _SensorTempHum:
1304  0029 000000000000  	ds.b	12
1305                     	xdef	_SensorTempHum
1306                     	xref	_hx711_Tarar
1307                     	xref	_hx711_Lectura
1308                     	xref	_HX711_Init
1309                     	xref	_Timeout_Init
1310                     	xref	_dht11_Lectura
1311                     	xref	_DHT11_Init
1312                     	xref	_Clock_HSI_Init
1313                     	xref	_setFlagTimer1
1314                     	xref	_getFlagTimer1
1315                     	xref	_GPIO_DeInit
1335                     	xref	c_rtol
1336                     	xref	c_uitolx
1337                     	end

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
1096                     ; 150 int main()
1096                     ; 151 {
1098                     .text:	section	.text,new
1099  0000               _main:
1103                     ; 57 	GPIO_DeInit(GPIOA);
1107  0000 ae5000        	ldw	x,#20480
1108  0003 cd0000        	call	_GPIO_DeInit
1110                     ; 58 	GPIO_DeInit(GPIOB);
1112  0006 ae5005        	ldw	x,#20485
1113  0009 cd0000        	call	_GPIO_DeInit
1115                     ; 59 	GPIO_DeInit(GPIOC);
1117  000c ae500a        	ldw	x,#20490
1118  000f cd0000        	call	_GPIO_DeInit
1120                     ; 60 	GPIO_DeInit(GPIOD);
1122  0012 ae500f        	ldw	x,#20495
1123  0015 cd0000        	call	_GPIO_DeInit
1125                     ; 112 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
1128  0018 ae0080        	ldw	x,#128
1129  001b cd0000        	call	_Clock_HSI_Init
1131                     ; 74 	SensorTempHum.Config.HW.Puerto = GPIOA;
1135  001e ae5000        	ldw	x,#20480
1136  0021 bf27          	ldw	_SensorTempHum,x
1137                     ; 75 	SensorTempHum.Config.HW.Pin = GPIO_PIN_3;
1139  0023 35080029      	mov	_SensorTempHum+2,#8
1140                     ; 78 	SensorPesaje.Config.DOUT.Puerto = GPIOD;
1142  0027 ae500f        	ldw	x,#20495
1143  002a bf0d          	ldw	_SensorPesaje,x
1144                     ; 79 	SensorPesaje.Config.DOUT.Pin = GPIO_PIN_2;
1146  002c 3504000f      	mov	_SensorPesaje+2,#4
1147                     ; 81 	SensorPesaje.Config.PD_SCK.Puerto = GPIOD;
1149  0030 bf11          	ldw	_SensorPesaje+4,x
1150                     ; 82 	SensorPesaje.Config.PD_SCK.Pin = GPIO_PIN_3;
1152  0032 35080013      	mov	_SensorPesaje+6,#8
1153                     ; 84 	Timeout_test.Puerto = GPIOC;
1155  0036 ae500a        	ldw	x,#20490
1156  0039 bf00          	ldw	_Timeout_test,x
1157                     ; 85 	Timeout_test.Pin = GPIO_PIN_4;
1159  003b 35100002      	mov	_Timeout_test+2,#16
1160                     ; 86 	NHALgpioConfig_SetType( &Timeout_test, GPIO_MODE_OUT_PP_HIGH_SLOW/*GPIO_MODE_OUT_PP_HIGH_FAST*/ );
1162  003f 4bd0          	push	#208
1163  0041 ae0000        	ldw	x,#_Timeout_test
1164  0044 cd0000        	call	_NHALgpioConfig_SetType
1166  0047 ae0000        	ldw	x,#_Timeout_test
1167  004a 84            	pop	a
1168                     ; 87 	NHALgpio_Init( &Timeout_test );
1170  004b cd0000        	call	_NHALgpio_Init
1172                     ; 123 	Timeout_Init( &Timeout, &getFlagTimer1, &setFlagTimer1 );
1175  004e ae0000        	ldw	x,#_setFlagTimer1
1176  0051 89            	pushw	x
1177  0052 ae0000        	ldw	x,#_getFlagTimer1
1178  0055 89            	pushw	x
1179  0056 ae0004        	ldw	x,#_Timeout
1180  0059 cd0000        	call	_Timeout_Init
1182  005c 5b04          	addw	sp,#4
1183                     ; 124 	DHT11_Init( &SensorTempHum, &dht11_Lectura );
1185  005e ae0000        	ldw	x,#_dht11_Lectura
1186  0061 89            	pushw	x
1187  0062 ae0027        	ldw	x,#_SensorTempHum
1188  0065 cd0000        	call	_DHT11_Init
1190  0068 85            	popw	x
1191                     ; 125 	HX711_Init( &SensorPesaje, &hx711_Lectura, &hx711_Tarar, &Timeout );
1193  0069 ae0004        	ldw	x,#_Timeout
1194  006c 89            	pushw	x
1195  006d ae0000        	ldw	x,#_hx711_Tarar
1196  0070 89            	pushw	x
1197  0071 ae0000        	ldw	x,#_hx711_Lectura
1198  0074 89            	pushw	x
1199  0075 ae000d        	ldw	x,#_SensorPesaje
1200  0078 cd0000        	call	_HX711_Init
1202  007b 5b06          	addw	sp,#6
1203                     ; 154 	SensorPesaje.Config.ValorZero = SensorPesaje.Tarar( &SensorPesaje );
1205  007d ae000d        	ldw	x,#_SensorPesaje
1206  0080 92cd25        	call	[_SensorPesaje+24.w]
1208  0083 bf18          	ldw	_SensorPesaje+11,x
1209  0085               L566:
1210                     ; 157 		Timeout_Start( &Timeout, 1500 );
1212  0085 ae05dc        	ldw	x,#1500
1213  0088 89            	pushw	x
1214  0089 ae0004        	ldw	x,#_Timeout
1215  008c cd0000        	call	_Timeout_Start
1217  008f 85            	popw	x
1218                     ; 159 		if( Timeout.Config.Notificacion() )
1220  0090 92cd06        	call	[_Timeout+2.w]
1222  0093 4d            	tnz	a
1223  0094 27ef          	jreq	L566
1224                     ; 161 			Timeout_Stop( &Timeout );
1226  0096 ae0004        	ldw	x,#_Timeout
1227  0099 cd0000        	call	_Timeout_Stop
1229                     ; 162 			NHALgpio_Write( &Timeout_test, true );
1231  009c 4b01          	push	#1
1232  009e ae0000        	ldw	x,#_Timeout_test
1233  00a1 cd0000        	call	_NHALgpio_Write
1235  00a4 84            	pop	a
1236                     ; 163 			NHALgpio_Write( &Timeout_test, false );
1238  00a5 4b00          	push	#0
1239  00a7 ae0000        	ldw	x,#_Timeout_test
1240  00aa cd0000        	call	_NHALgpio_Write
1242  00ad 84            	pop	a
1243  00ae 20d5          	jra	L566
1256                     	xdef	_main
1257                     	switch	.ubsct
1258  0000               _Timeout_test:
1259  0000 00000000      	ds.b	4
1260                     	xdef	_Timeout_test
1261  0004               _Timeout:
1262  0004 000000000000  	ds.b	9
1263                     	xdef	_Timeout
1264  000d               _SensorPesaje:
1265  000d 000000000000  	ds.b	26
1266                     	xdef	_SensorPesaje
1267  0027               _SensorTempHum:
1268  0027 000000000000  	ds.b	12
1269                     	xdef	_SensorTempHum
1270                     	xref	_hx711_Tarar
1271                     	xref	_hx711_Lectura
1272                     	xref	_HX711_Init
1273                     	xref	_Timeout_Stop
1274                     	xref	_Timeout_Start
1275                     	xref	_Timeout_Init
1276                     	xref	_dht11_Lectura
1277                     	xref	_DHT11_Init
1278                     	xref	_Clock_HSI_Init
1279                     	xref	_NHALgpio_Write
1280                     	xref	_NHALgpio_Init
1281                     	xref	_NHALgpioConfig_SetType
1282                     	xref	_setFlagTimer1
1283                     	xref	_getFlagTimer1
1284                     	xref	_GPIO_DeInit
1304                     	end

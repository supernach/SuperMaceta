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
1083                     ; 150 int main()
1083                     ; 151 {
1085                     .text:	section	.text,new
1086  0000               _main:
1090                     ; 57 	GPIO_DeInit(GPIOA);
1094  0000 ae5000        	ldw	x,#20480
1095  0003 cd0000        	call	_GPIO_DeInit
1097                     ; 58 	GPIO_DeInit(GPIOB);
1099  0006 ae5005        	ldw	x,#20485
1100  0009 cd0000        	call	_GPIO_DeInit
1102                     ; 59 	GPIO_DeInit(GPIOC);
1104  000c ae500a        	ldw	x,#20490
1105  000f cd0000        	call	_GPIO_DeInit
1107                     ; 60 	GPIO_DeInit(GPIOD);
1109  0012 ae500f        	ldw	x,#20495
1110  0015 cd0000        	call	_GPIO_DeInit
1112                     ; 112 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
1115  0018 ae0080        	ldw	x,#128
1116  001b cd0000        	call	_Clock_HSI_Init
1118                     ; 74 	SensorTempHum.Config.HW.Puerto = GPIOA;
1122  001e ae5000        	ldw	x,#20480
1123  0021 bf25          	ldw	_SensorTempHum,x
1124                     ; 75 	SensorTempHum.Config.HW.Pin = GPIO_PIN_3;
1126  0023 35080027      	mov	_SensorTempHum+2,#8
1127                     ; 78 	SensorPesaje.Config.DOUT.Puerto = GPIOD;
1129  0027 ae500f        	ldw	x,#20495
1130  002a bf0b          	ldw	_SensorPesaje,x
1131                     ; 79 	SensorPesaje.Config.DOUT.Pin = GPIO_PIN_2;
1133  002c 3504000d      	mov	_SensorPesaje+2,#4
1134                     ; 81 	SensorPesaje.Config.PD_SCK.Puerto = GPIOD;
1136  0030 bf0f          	ldw	_SensorPesaje+4,x
1137                     ; 82 	SensorPesaje.Config.PD_SCK.Pin = GPIO_PIN_3;
1139  0032 35080011      	mov	_SensorPesaje+6,#8
1140                     ; 84 	Timeout_test.Puerto = GPIOC;
1142  0036 ae500a        	ldw	x,#20490
1143  0039 bf00          	ldw	_Timeout_test,x
1144                     ; 85 	Timeout_test.Pin = GPIO_PIN_4;
1146  003b 35100002      	mov	_Timeout_test+2,#16
1147                     ; 86 	NHALgpioConfig_SetType( &Timeout_test, GPIO_MODE_OUT_PP_HIGH_SLOW/*GPIO_MODE_OUT_PP_HIGH_FAST*/ );
1149  003f 4bd0          	push	#208
1150  0041 ae0000        	ldw	x,#_Timeout_test
1151  0044 cd0000        	call	_NHALgpioConfig_SetType
1153  0047 ae0000        	ldw	x,#_Timeout_test
1154  004a 84            	pop	a
1155                     ; 87 	NHALgpio_Init( &Timeout_test );
1157  004b cd0000        	call	_NHALgpio_Init
1159                     ; 123 	Timeout_Init( &Timeout, &getFlagTimer1 );
1162  004e ae0000        	ldw	x,#_getFlagTimer1
1163  0051 89            	pushw	x
1164  0052 ae0004        	ldw	x,#_Timeout
1165  0055 cd0000        	call	_Timeout_Init
1167  0058 85            	popw	x
1168                     ; 124 	DHT11_Init( &SensorTempHum, &dht11_Lectura );
1170  0059 ae0000        	ldw	x,#_dht11_Lectura
1171  005c 89            	pushw	x
1172  005d ae0025        	ldw	x,#_SensorTempHum
1173  0060 cd0000        	call	_DHT11_Init
1175  0063 85            	popw	x
1176                     ; 125 	HX711_Init( &SensorPesaje, &hx711_Lectura, &hx711_Tarar, &Timeout );
1178  0064 ae0004        	ldw	x,#_Timeout
1179  0067 89            	pushw	x
1180  0068 ae0000        	ldw	x,#_hx711_Tarar
1181  006b 89            	pushw	x
1182  006c ae0000        	ldw	x,#_hx711_Lectura
1183  006f 89            	pushw	x
1184  0070 ae000b        	ldw	x,#_SensorPesaje
1185  0073 cd0000        	call	_HX711_Init
1187  0076 5b06          	addw	sp,#6
1188                     ; 154 	SensorPesaje.Config.ValorZero = SensorPesaje.Tarar( &SensorPesaje );
1190  0078 ae000b        	ldw	x,#_SensorPesaje
1191  007b 92cd23        	call	[_SensorPesaje+24.w]
1193  007e bf16          	ldw	_SensorPesaje+11,x
1194  0080               L166:
1195                     ; 157 		Timeout_Start( &Timeout, 1500 );
1197  0080 ae05dc        	ldw	x,#1500
1198  0083 89            	pushw	x
1199  0084 ae0004        	ldw	x,#_Timeout
1200  0087 cd0000        	call	_Timeout_Start
1202  008a 85            	popw	x
1203                     ; 159 		if( Timeout.Config.Notificacion() )
1205  008b 92cd06        	call	[_Timeout+2.w]
1207  008e 4d            	tnz	a
1208  008f 27ef          	jreq	L166
1209                     ; 161 			Timeout_Stop( &Timeout );
1211  0091 ae0004        	ldw	x,#_Timeout
1212  0094 cd0000        	call	_Timeout_Stop
1214                     ; 162 			NHALgpio_Write( &Timeout_test, true );
1216  0097 4b01          	push	#1
1217  0099 ae0000        	ldw	x,#_Timeout_test
1218  009c cd0000        	call	_NHALgpio_Write
1220  009f 84            	pop	a
1221                     ; 163 			NHALgpio_Write( &Timeout_test, false );
1223  00a0 4b00          	push	#0
1224  00a2 ae0000        	ldw	x,#_Timeout_test
1225  00a5 cd0000        	call	_NHALgpio_Write
1227  00a8 84            	pop	a
1228  00a9 20d5          	jra	L166
1241                     	xdef	_main
1242                     	switch	.ubsct
1243  0000               _Timeout_test:
1244  0000 00000000      	ds.b	4
1245                     	xdef	_Timeout_test
1246  0004               _Timeout:
1247  0004 000000000000  	ds.b	7
1248                     	xdef	_Timeout
1249  000b               _SensorPesaje:
1250  000b 000000000000  	ds.b	26
1251                     	xdef	_SensorPesaje
1252  0025               _SensorTempHum:
1253  0025 000000000000  	ds.b	12
1254                     	xdef	_SensorTempHum
1255                     	xref	_hx711_Tarar
1256                     	xref	_hx711_Lectura
1257                     	xref	_HX711_Init
1258                     	xref	_Timeout_Stop
1259                     	xref	_Timeout_Start
1260                     	xref	_Timeout_Init
1261                     	xref	_dht11_Lectura
1262                     	xref	_DHT11_Init
1263                     	xref	_Clock_HSI_Init
1264                     	xref	_NHALgpio_Write
1265                     	xref	_NHALgpio_Init
1266                     	xref	_NHALgpioConfig_SetType
1267                     	xref	_getFlagTimer1
1268                     	xref	_GPIO_DeInit
1288                     	end

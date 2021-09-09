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
1032                     ; 149 int main()
1032                     ; 150 {
1034                     .text:	section	.text,new
1035  0000               _main:
1039                     ; 56 	GPIO_DeInit(GPIOA);
1043  0000 ae5000        	ldw	x,#20480
1044  0003 cd0000        	call	_GPIO_DeInit
1046                     ; 57 	GPIO_DeInit(GPIOB);
1048  0006 ae5005        	ldw	x,#20485
1049  0009 cd0000        	call	_GPIO_DeInit
1051                     ; 58 	GPIO_DeInit(GPIOC);
1053  000c ae500a        	ldw	x,#20490
1054  000f cd0000        	call	_GPIO_DeInit
1056                     ; 59 	GPIO_DeInit(GPIOD);
1058  0012 ae500f        	ldw	x,#20495
1059  0015 cd0000        	call	_GPIO_DeInit
1061                     ; 111 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
1064  0018 ae0080        	ldw	x,#128
1065  001b cd0000        	call	_Clock_HSI_Init
1067                     ; 73 	SensorTempHum.Config.HW.Puerto = GPIOA;
1071  001e ae5000        	ldw	x,#20480
1072  0021 bf23          	ldw	_SensorTempHum,x
1073                     ; 74 	SensorTempHum.Config.HW.Pin = GPIO_PIN_3;
1075  0023 35080025      	mov	_SensorTempHum+2,#8
1076                     ; 77 	SensorPesaje.Config.DOUT.Puerto = GPIOD;
1078  0027 ae500f        	ldw	x,#20495
1079  002a bf09          	ldw	_SensorPesaje,x
1080                     ; 78 	SensorPesaje.Config.DOUT.Pin = GPIO_PIN_2;
1082  002c 3504000b      	mov	_SensorPesaje+2,#4
1083                     ; 80 	SensorPesaje.Config.PD_SCK.Puerto = GPIOD;
1085  0030 bf0d          	ldw	_SensorPesaje+4,x
1086                     ; 81 	SensorPesaje.Config.PD_SCK.Pin = GPIO_PIN_3;
1088  0032 3508000f      	mov	_SensorPesaje+6,#8
1089                     ; 83 	Timeout_test.Puerto = GPIOC;
1091  0036 ae500a        	ldw	x,#20490
1092  0039 bf00          	ldw	_Timeout_test,x
1093                     ; 84 	Timeout_test.Pin = GPIO_PIN_4;
1095  003b 35100002      	mov	_Timeout_test+2,#16
1096                     ; 85 	NHALgpioConfig_SetType( &Timeout_test, GPIO_MODE_OUT_PP_HIGH_FAST );
1098  003f 4bf0          	push	#240
1099  0041 ae0000        	ldw	x,#_Timeout_test
1100  0044 cd0000        	call	_NHALgpioConfig_SetType
1102  0047 ae0000        	ldw	x,#_Timeout_test
1103  004a 84            	pop	a
1104                     ; 86 	NHALgpio_Init( &Timeout_test );
1106  004b cd0000        	call	_NHALgpio_Init
1108                     ; 122 	Timeout_Init( &Timeout );
1111  004e ae0004        	ldw	x,#_Timeout
1112  0051 cd0000        	call	_Timeout_Init
1114                     ; 123 	DHT11_Init( &SensorTempHum, &dht11_Lectura );
1116  0054 ae0000        	ldw	x,#_dht11_Lectura
1117  0057 89            	pushw	x
1118  0058 ae0023        	ldw	x,#_SensorTempHum
1119  005b cd0000        	call	_DHT11_Init
1121  005e 85            	popw	x
1122                     ; 124 	HX711_Init( &SensorPesaje, &hx711_Lectura, &hx711_Tarar, &Timeout );
1124  005f ae0004        	ldw	x,#_Timeout
1125  0062 89            	pushw	x
1126  0063 ae0000        	ldw	x,#_hx711_Tarar
1127  0066 89            	pushw	x
1128  0067 ae0000        	ldw	x,#_hx711_Lectura
1129  006a 89            	pushw	x
1130  006b ae0009        	ldw	x,#_SensorPesaje
1131  006e cd0000        	call	_HX711_Init
1133  0071 5b06          	addw	sp,#6
1134  0073               L536:
1135                     ; 162 		if( Timeout.Estado == INACTIVO )
1137  0073 b606          	ld	a,_Timeout+2
1138  0075 2614          	jrne	L146
1139                     ; 164 			NHALgpio_Write( &Timeout_test, false );
1141  0077 4b00          	push	#0
1142  0079 ae0000        	ldw	x,#_Timeout_test
1143  007c cd0000        	call	_NHALgpio_Write
1145  007f ae0050        	ldw	x,#80
1146  0082 84            	pop	a
1147                     ; 165 			Timeout_Start( &Timeout, 80 );
1149  0083 89            	pushw	x
1150  0084 ae0004        	ldw	x,#_Timeout
1151  0087 cd0000        	call	_Timeout_Start
1153  008a 85            	popw	x
1154  008b               L146:
1155                     ; 168 		Timeout_Check( &Timeout );
1157  008b ae0004        	ldw	x,#_Timeout
1158  008e cd0000        	call	_Timeout_Check
1160                     ; 169 		if( Timeout.Estado == DISPARADO )
1162  0091 b606          	ld	a,_Timeout+2
1163  0093 a102          	cp	a,#2
1164  0095 2611          	jrne	L346
1165                     ; 171 			NHALgpio_Write( &Timeout_test, true );
1167  0097 4b01          	push	#1
1168  0099 ae0000        	ldw	x,#_Timeout_test
1169  009c cd0000        	call	_NHALgpio_Write
1171  009f ae0004        	ldw	x,#_Timeout
1172  00a2 84            	pop	a
1173                     ; 172 			Timeout_Stop( &Timeout );
1175  00a3 cd0000        	call	_Timeout_Stop
1178  00a6 20cb          	jra	L536
1179  00a8               L346:
1180                     ; 176 				NHALgpio_Write( &Timeout_test, false );
1182  00a8 4b00          	push	#0
1183  00aa ae0000        	ldw	x,#_Timeout_test
1184  00ad cd0000        	call	_NHALgpio_Write
1186  00b0 84            	pop	a
1187  00b1 20c0          	jra	L536
1200                     	xdef	_main
1201                     	switch	.ubsct
1202  0000               _Timeout_test:
1203  0000 00000000      	ds.b	4
1204                     	xdef	_Timeout_test
1205  0004               _Timeout:
1206  0004 0000000000    	ds.b	5
1207                     	xdef	_Timeout
1208  0009               _SensorPesaje:
1209  0009 000000000000  	ds.b	26
1210                     	xdef	_SensorPesaje
1211  0023               _SensorTempHum:
1212  0023 000000000000  	ds.b	12
1213                     	xdef	_SensorTempHum
1214                     	xref	_hx711_Tarar
1215                     	xref	_hx711_Lectura
1216                     	xref	_HX711_Init
1217                     	xref	_Timeout_Check
1218                     	xref	_Timeout_Stop
1219                     	xref	_Timeout_Start
1220                     	xref	_Timeout_Init
1221                     	xref	_dht11_Lectura
1222                     	xref	_DHT11_Init
1223                     	xref	_Clock_HSI_Init
1224                     	xref	_NHALgpio_Write
1225                     	xref	_NHALgpio_Init
1226                     	xref	_NHALgpioConfig_SetType
1227                     	xref	_GPIO_DeInit
1247                     	end

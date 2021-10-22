   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  21  0002               L5_flagTimer2:
  22  0002 0000          	dc.w	0
  23  0004               L7_flagUartRXNE:
  24  0004 00            	dc.b	0
  25  0005               L31_flagUartTXE:
  26  0005 00            	dc.b	0
  83                     .const:	section	.text
  84  0000               L75_HX711_LONGITUDTRAMA:
  85  0000 18            	dc.b	24
  86  0001               L16_HX711_TIEMPOCLOCK:
  87  0001 03            	dc.b	3
  88  0002               L36_HX711_TIEMPOCLOCKSLEEP:
  89  0002 46            	dc.b	70
3889                     ; 422 int main()
3889                     ; 423 {
3891                     .text:	section	.text,new
3892  0000               _main:
3894  0000 5206          	subw	sp,#6
3895       00000006      OFST:	set	6
3898                     ; 85 	GPIO_DeInit(GPIOA);
3902  0002 ae5000        	ldw	x,#20480
3903  0005 cd0000        	call	_GPIO_DeInit
3905                     ; 86 	GPIO_DeInit(GPIOB);
3907  0008 ae5005        	ldw	x,#20485
3908  000b cd0000        	call	_GPIO_DeInit
3910                     ; 87 	GPIO_DeInit(GPIOC);
3912  000e ae500a        	ldw	x,#20490
3913  0011 cd0000        	call	_GPIO_DeInit
3915                     ; 88 	GPIO_DeInit(GPIOD);
3917  0014 ae500f        	ldw	x,#20495
3918  0017 cd0000        	call	_GPIO_DeInit
3920                     ; 220 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
3923  001a ae0080        	ldw	x,#128
3924  001d cd0000        	call	_Clock_HSI_Init
3926                     ; 128 	Led_Check.HW.Puerto = GPIOB;
3930  0020 ae5005        	ldw	x,#20485
3931  0023 bf8a          	ldw	_Led_Check+1,x
3932                     ; 129 	Led_Check.HW.Pin = GPIO_PIN_5;
3934  0025 3520008c      	mov	_Led_Check+3,#32
3935                     ; 132 	SensorTempHum.Config.HW.Puerto = GPIOA;
3937  0029 ae5000        	ldw	x,#20480
3938  002c bf7b          	ldw	_SensorTempHum,x
3939                     ; 133 	SensorTempHum.Config.HW.Pin = GPIO_PIN_3;
3941  002e 3508007d      	mov	_SensorTempHum+2,#8
3942                     ; 136 	SensorPesaje.Config.DOUT.Puerto = GPIOD;
3944  0032 ae500f        	ldw	x,#20495
3945  0035 bf5f          	ldw	_SensorPesaje,x
3946                     ; 137 	SensorPesaje.Config.DOUT.Pin = GPIO_PIN_2;
3948  0037 35040061      	mov	_SensorPesaje+2,#4
3949                     ; 139 	SensorPesaje.Config.PD_SCK.Puerto = GPIOD;
3951  003b bf63          	ldw	_SensorPesaje+4,x
3952                     ; 140 	SensorPesaje.Config.PD_SCK.Pin = GPIO_PIN_3;
3954  003d 35080065      	mov	_SensorPesaje+6,#8
3955                     ; 356 	Timer_Config_Init( &timer_Timeout.Config, TIMER1, CANAL1, COUNTERUP, SI, 1 );
3958  0041 ae0001        	ldw	x,#1
3959  0044 89            	pushw	x
3960  0045 4b00          	push	#0
3961  0047 4b00          	push	#0
3962  0049 4b01          	push	#1
3963  004b 4b00          	push	#0
3964  004d ae0059        	ldw	x,#_timer_Timeout
3965  0050 cd0000        	call	_Timer_Config_Init
3967  0053 5b06          	addw	sp,#6
3968                     ; 357 	Timeout_Init( &Timeout, &timer_Timeout, &getFlagTimer1, &setFlagTimer1 );
3970  0055 ae0000        	ldw	x,#_setFlagTimer1
3971  0058 89            	pushw	x
3972  0059 ae0000        	ldw	x,#_getFlagTimer1
3973  005c 89            	pushw	x
3974  005d ae0059        	ldw	x,#_timer_Timeout
3975  0060 89            	pushw	x
3976  0061 ae0050        	ldw	x,#_Timeout
3977  0064 cd0000        	call	_Timeout_Init
3979  0067 5b06          	addw	sp,#6
3980                     ; 359 	DHT11_Init( &SensorTempHum, &dht11_Lectura, &Timeout );
3982  0069 ae0050        	ldw	x,#_Timeout
3983  006c 89            	pushw	x
3984  006d ae0000        	ldw	x,#_dht11_Lectura
3985  0070 89            	pushw	x
3986  0071 ae007b        	ldw	x,#_SensorTempHum
3987  0074 cd0000        	call	_DHT11_Init
3989  0077 5b04          	addw	sp,#4
3990                     ; 360 	HX711_Init( &SensorPesaje, &hx711_Lectura, &hx711_Tarar, &Timeout );
3992  0079 ae0050        	ldw	x,#_Timeout
3993  007c 89            	pushw	x
3994  007d ae0000        	ldw	x,#_hx711_Tarar
3995  0080 89            	pushw	x
3996  0081 ae0000        	ldw	x,#_hx711_Lectura
3997  0084 89            	pushw	x
3998  0085 ae005f        	ldw	x,#_SensorPesaje
3999  0088 cd0000        	call	_HX711_Init
4001  008b 5b06          	addw	sp,#6
4002                     ; 361 	Led_Init( &Led_Check );
4004  008d ae0089        	ldw	x,#_Led_Check
4005  0090 cd0000        	call	_Led_Init
4007                     ; 363 	RS485_Init( &Comunicacion );
4009  0093 ae0021        	ldw	x,#_Comunicacion
4010  0096 cd0000        	call	_RS485_Init
4012                     ; 313 	dispositivos.Dht11 = &SensorTempHum;
4015  0099 ae007b        	ldw	x,#_SensorTempHum
4016  009c 1f01          	ldw	(OFST-5,sp),x
4018                     ; 314 	dispositivos.Hx711 = &SensorPesaje;
4020  009e ae005f        	ldw	x,#_SensorPesaje
4021  00a1 1f03          	ldw	(OFST-3,sp),x
4023                     ; 315 	dispositivos.LedCheck = &Led_Check;
4025  00a3 ae0089        	ldw	x,#_Led_Check
4026  00a6 1f05          	ldw	(OFST-1,sp),x
4028                     ; 316 	GO_Init( &GestorRS485, dispositivos , &Comunicacion );
4030  00a8 ae0021        	ldw	x,#_Comunicacion
4031  00ab 89            	pushw	x
4032  00ac 96            	ldw	x,sp
4033  00ad 1c0003        	addw	x,#OFST-3
4034  00b0 bf00          	ldw	c_x,x
4035  00b2 ae0006        	ldw	x,#6
4036  00b5               L63:
4037  00b5 5a            	decw	x
4038  00b6 92d600        	ld	a,([c_x.w],x)
4039  00b9 88            	push	a
4040  00ba 5d            	tnzw	x
4041  00bb 26f8          	jrne	L63
4042  00bd ae0090        	ldw	x,#_GestorRS485
4043  00c0 cd0000        	call	_GO_Init
4045  00c3 5b08          	addw	sp,#8
4046                     ; 262 	Tareas_Init( &GestorTareas );
4049  00c5 ae0000        	ldw	x,#_GestorTareas
4050  00c8 cd0000        	call	_Tareas_Init
4052                     ; 264 	dispositivoAuxiliar.Dispositivo = &SensorPesaje;
4054  00cb ae005f        	ldw	x,#_SensorPesaje
4055  00ce 1f05          	ldw	(OFST-1,sp),x
4057                     ; 265 	Tareas_Registrar( &GestorTareas, dispositivoAuxiliar, 200, TAREA_LECTURA, HX711 );
4059  00d0 4b01          	push	#1
4060  00d2 4b01          	push	#1
4061  00d4 ae00c8        	ldw	x,#200
4062  00d7 89            	pushw	x
4063  00d8 7b0a          	ld	a,(OFST+4,sp)
4064  00da 88            	push	a
4065  00db 7b0a          	ld	a,(OFST+4,sp)
4066  00dd 88            	push	a
4067  00de ae0000        	ldw	x,#_GestorTareas
4068  00e1 cd0000        	call	_Tareas_Registrar
4070  00e4 5b06          	addw	sp,#6
4071                     ; 267 	dispositivoAuxiliar.Dispositivo = &SensorTempHum;
4073  00e6 ae007b        	ldw	x,#_SensorTempHum
4074  00e9 1f05          	ldw	(OFST-1,sp),x
4076                     ; 268 	Tareas_Registrar( &GestorTareas, dispositivoAuxiliar, 1000, TAREA_LECTURA, DHT11 );
4078  00eb 4b02          	push	#2
4079  00ed 4b01          	push	#1
4080  00ef ae03e8        	ldw	x,#1000
4081  00f2 89            	pushw	x
4082  00f3 7b0a          	ld	a,(OFST+4,sp)
4083  00f5 88            	push	a
4084  00f6 7b0a          	ld	a,(OFST+4,sp)
4085  00f8 88            	push	a
4086  00f9 ae0000        	ldw	x,#_GestorTareas
4087  00fc cd0000        	call	_Tareas_Registrar
4089  00ff 5b06          	addw	sp,#6
4090                     ; 270 	dispositivoAuxiliar.Dispositivo = &Led_Check;
4092  0101 ae0089        	ldw	x,#_Led_Check
4093  0104 1f05          	ldw	(OFST-1,sp),x
4095                     ; 271 	Tareas_Registrar( &GestorTareas, dispositivoAuxiliar, 650, TAREA_LED_TOGGLE, LED );
4097  0106 4b03          	push	#3
4098  0108 4b02          	push	#2
4099  010a ae028a        	ldw	x,#650
4100  010d 89            	pushw	x
4101  010e 7b0a          	ld	a,(OFST+4,sp)
4102  0110 88            	push	a
4103  0111 7b0a          	ld	a,(OFST+4,sp)
4104  0113 88            	push	a
4105  0114 ae0000        	ldw	x,#_GestorTareas
4106  0117 cd0000        	call	_Tareas_Registrar
4108  011a 5b06          	addw	sp,#6
4109                     ; 426 	SensorPesaje.Config.ValorZero = SensorPesaje.Tarar( &SensorPesaje );
4111  011c ae005f        	ldw	x,#_SensorPesaje
4112  011f 92cd79        	call	[_SensorPesaje+26.w]
4114  0122 cd0000        	call	c_uitolx
4116  0125 ae006a        	ldw	x,#_SensorPesaje+11
4117  0128 cd0000        	call	c_rtol
4119  012b               L3503:
4120                     ; 429 		Comunicacion.Run( &Comunicacion );
4122  012b ae0021        	ldw	x,#_Comunicacion
4123  012e 92cd48        	call	[_Comunicacion+39.w]
4125                     ; 431 		Tareas_Run( &GestorTareas );
4127  0131 ae0000        	ldw	x,#_GestorTareas
4128  0134 cd0000        	call	_Tareas_Run
4130                     ; 433 		if( Comunicacion.Flags.bit.Standby == true )
4132  0137 72050042ef    	btjf	_Comunicacion+33,#2,L3503
4133  013c 20ed          	jra	L3503
4146                     	xdef	_main
4147                     	switch	.ubsct
4148  0000               _GestorTareas:
4149  0000 000000000000  	ds.b	33
4150                     	xdef	_GestorTareas
4151  0021               _Comunicacion:
4152  0021 000000000000  	ds.b	47
4153                     	xdef	_Comunicacion
4154  0050               _Timeout:
4155  0050 000000000000  	ds.b	9
4156                     	xdef	_Timeout
4157  0059               _timer_Timeout:
4158  0059 000000000000  	ds.b	6
4159                     	xdef	_timer_Timeout
4160  005f               _SensorPesaje:
4161  005f 000000000000  	ds.b	28
4162                     	xdef	_SensorPesaje
4163  007b               _SensorTempHum:
4164  007b 000000000000  	ds.b	14
4165                     	xdef	_SensorTempHum
4166  0089               _Led_Check:
4167  0089 000000000000  	ds.b	7
4168                     	xdef	_Led_Check
4169                     	xref	_Tareas_Run
4170                     	xref	_Tareas_Registrar
4171                     	xref	_Tareas_Init
4172                     	xref	_GO_Init
4173  0090               _GestorRS485:
4174  0090 000000000000  	ds.b	26
4175                     	xdef	_GestorRS485
4176                     	xref	_RS485_Init
4177                     	xref	_Led_Init
4178                     	xref	_hx711_Tarar
4179                     	xref	_hx711_Lectura
4180                     	xref	_HX711_Init
4181                     	xref	_dht11_Lectura
4182                     	xref	_DHT11_Init
4183                     	xref	_Timeout_Init
4184                     	xref	_Timer_Config_Init
4185                     	xref	_Clock_HSI_Init
4186                     	xref	_setFlagTimer1
4187                     	xref	_getFlagTimer1
4188                     	xref	_GPIO_DeInit
4189                     	xref.b	c_x
4209                     	xref	c_rtol
4210                     	xref	c_uitolx
4211                     	end

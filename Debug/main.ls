   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  21  0002               L5_flagUartRXNE:
  22  0002 00            	dc.b	0
  23  0003               L11_flagUartTXE:
  24  0003 00            	dc.b	0
  72                     .const:	section	.text
  73  0000               L15_HX711_LONGITUDTRAMA:
  74  0000 18            	dc.b	24
  75  0001               L35_HX711_TIEMPOCLOCK:
  76  0001 03            	dc.b	3
  77  0002               L55_HX711_TIEMPOCLOCKSLEEP:
  78  0002 46            	dc.b	70
3220                     ; 156 int main()
3220                     ; 157 {
3222                     .text:	section	.text,new
3223  0000               _main:
3225  0000 5209          	subw	sp,#9
3226       00000009      OFST:	set	9
3229                     ; 57 	GPIO_DeInit(GPIOA);
3233  0002 ae5000        	ldw	x,#20480
3234  0005 cd0000        	call	_GPIO_DeInit
3236                     ; 58 	GPIO_DeInit(GPIOB);
3238  0008 ae5005        	ldw	x,#20485
3239  000b cd0000        	call	_GPIO_DeInit
3241                     ; 59 	GPIO_DeInit(GPIOC);
3243  000e ae500a        	ldw	x,#20490
3244  0011 cd0000        	call	_GPIO_DeInit
3246                     ; 60 	GPIO_DeInit(GPIOD);
3248  0014 ae500f        	ldw	x,#20495
3249  0017 cd0000        	call	_GPIO_DeInit
3251                     ; 107 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
3254  001a ae0080        	ldw	x,#128
3255  001d cd0000        	call	_Clock_HSI_Init
3257                     ; 74 	SensorTempHum.Config.HW.Puerto = GPIOA;
3261  0020 ae5000        	ldw	x,#20480
3262  0023 bf5a          	ldw	_SensorTempHum,x
3263                     ; 75 	SensorTempHum.Config.HW.Pin = GPIO_PIN_3;
3265  0025 3508005c      	mov	_SensorTempHum+2,#8
3266                     ; 78 	SensorPesaje.Config.DOUT.Puerto = GPIOD;
3268  0029 ae500f        	ldw	x,#20495
3269  002c bf3e          	ldw	_SensorPesaje,x
3270                     ; 79 	SensorPesaje.Config.DOUT.Pin = GPIO_PIN_2;
3272  002e 35040040      	mov	_SensorPesaje+2,#4
3273                     ; 81 	SensorPesaje.Config.PD_SCK.Puerto = GPIOD;
3275  0032 bf42          	ldw	_SensorPesaje+4,x
3276                     ; 82 	SensorPesaje.Config.PD_SCK.Pin = GPIO_PIN_3;
3278  0034 35080044      	mov	_SensorPesaje+6,#8
3279                     ; 119 	Timer_Config_Init( &timer_Timeout.Config, TIMER1, CANAL1, COUNTERUP, SI, 1 );
3282  0038 ae0001        	ldw	x,#1
3283  003b 89            	pushw	x
3284  003c 4b00          	push	#0
3285  003e 4b00          	push	#0
3286  0040 4b00          	push	#0
3287  0042 4b00          	push	#0
3288  0044 ae0038        	ldw	x,#_timer_Timeout
3289  0047 cd0000        	call	_Timer_Config_Init
3291  004a 5b06          	addw	sp,#6
3292                     ; 120 	Timeout_Init( &Timeout, &timer_Timeout, &getFlagTimer1, &setFlagTimer1 );
3294  004c ae0000        	ldw	x,#_setFlagTimer1
3295  004f 89            	pushw	x
3296  0050 ae0000        	ldw	x,#_getFlagTimer1
3297  0053 89            	pushw	x
3298  0054 ae0038        	ldw	x,#_timer_Timeout
3299  0057 89            	pushw	x
3300  0058 ae002f        	ldw	x,#_Timeout
3301  005b cd0000        	call	_Timeout_Init
3303  005e 5b06          	addw	sp,#6
3304                     ; 122 	DHT11_Init( &SensorTempHum, &dht11_Lectura, &Timeout );
3306  0060 ae002f        	ldw	x,#_Timeout
3307  0063 89            	pushw	x
3308  0064 ae0000        	ldw	x,#_dht11_Lectura
3309  0067 89            	pushw	x
3310  0068 ae005a        	ldw	x,#_SensorTempHum
3311  006b cd0000        	call	_DHT11_Init
3313  006e 5b04          	addw	sp,#4
3314                     ; 123 	HX711_Init( &SensorPesaje, &hx711_Lectura, &hx711_Tarar, &Timeout );
3316  0070 ae002f        	ldw	x,#_Timeout
3317  0073 89            	pushw	x
3318  0074 ae0000        	ldw	x,#_hx711_Tarar
3319  0077 89            	pushw	x
3320  0078 ae0000        	ldw	x,#_hx711_Lectura
3321  007b 89            	pushw	x
3322  007c ae003e        	ldw	x,#_SensorPesaje
3323  007f cd0000        	call	_HX711_Init
3325  0082 5b06          	addw	sp,#6
3326                     ; 125 	RS485_Init( &Comunicacion );
3328  0084 ae0000        	ldw	x,#_Comunicacion
3329  0087 cd0000        	call	_RS485_Init
3331                     ; 127 	dispositivos.Dht11 = &SensorTempHum;
3333  008a ae005a        	ldw	x,#_SensorTempHum
3334  008d 1f06          	ldw	(OFST-3,sp),x
3336                     ; 128 	dispositivos.Hx711 = &SensorPesaje;
3338  008f ae003e        	ldw	x,#_SensorPesaje
3339  0092 1f08          	ldw	(OFST-1,sp),x
3341                     ; 129 	GO_Init( &GestorRS485, dispositivos , &Comunicacion );
3343  0094 ae0000        	ldw	x,#_Comunicacion
3344  0097 89            	pushw	x
3345  0098 7b0b          	ld	a,(OFST+2,sp)
3346  009a 88            	push	a
3347  009b 7b0b          	ld	a,(OFST+2,sp)
3348  009d 88            	push	a
3349  009e 7b0b          	ld	a,(OFST+2,sp)
3350  00a0 88            	push	a
3351  00a1 7b0b          	ld	a,(OFST+2,sp)
3352  00a3 88            	push	a
3353  00a4 ae0068        	ldw	x,#_GestorRS485
3354  00a7 cd0000        	call	_GO_Init
3356  00aa 5b06          	addw	sp,#6
3357                     ; 160 	SensorPesaje.Config.ValorZero = SensorPesaje.Tarar( &SensorPesaje );
3359  00ac ae003e        	ldw	x,#_SensorPesaje
3360  00af 92cd58        	call	[_SensorPesaje+26.w]
3362  00b2 cd0000        	call	c_uitolx
3364  00b5 ae0049        	ldw	x,#_SensorPesaje+11
3365  00b8 cd0000        	call	c_rtol
3367  00bb               L5142:
3368                     ; 163 		Comunicacion.Run( &Comunicacion );
3370  00bb ae0000        	ldw	x,#_Comunicacion
3371  00be 92cd27        	call	[_Comunicacion+39.w]
3373                     ; 166 		if( Comunicacion.Flags.bit.Standby == true )
3375  00c1 72050021f5    	btjf	_Comunicacion+33,#2,L5142
3376                     ; 168 			SensorPesaje.Datos.UltimaLectura = SensorPesaje.Lectura( &SensorPesaje );
3378  00c6 ae003e        	ldw	x,#_SensorPesaje
3379  00c9 92cd56        	call	[_SensorPesaje+24.w]
3381  00cc cd0000        	call	c_uitolx
3383  00cf ae004f        	ldw	x,#_SensorPesaje+17
3384  00d2 cd0000        	call	c_rtol
3386                     ; 169 			SensorTempHum.Datos.UltimaLectura = SensorTempHum.Lectura( &SensorTempHum );
3388  00d5 ae005a        	ldw	x,#_SensorTempHum
3389  00d8 89            	pushw	x
3390  00d9 ae005e        	ldw	x,#_SensorTempHum+4
3391  00dc 89            	pushw	x
3392  00dd 92cd66        	call	[_SensorTempHum+12.w]
3394  00e0 5b04          	addw	sp,#4
3395                     ; 170 *		_delay_ms( 10 );
3398  00e2 ae03e8        	ldw	x,#1000
3401  00e5 200a          	jra	L7242
3402  00e7               L3242:
3403                     ; 110 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
3407  00e7 ae14d4        	ldw	x,#5332
3409  00ea 9d            	nop	
3410  00eb               L44:
3411  00eb 5a            	decw	X
3412  00ec 26fd          	jrne	L44
3413  00ee 9d            	nop	
3414                     
3416  00ef 1e08          	ldw	x,(OFST-1,sp)
3417  00f1               L7242:
3418                     ; 186 	while ( __ms-- )
3420  00f1 5a            	decw	x
3421  00f2 1f08          	ldw	(OFST-1,sp),x
3422  00f4 5c            	incw	x
3424  00f5 26f0          	jrne	L3242
3425  00f7 20c2          	jra	L5142
3438                     	xdef	_main
3439                     	switch	.ubsct
3440  0000               _Comunicacion:
3441  0000 000000000000  	ds.b	47
3442                     	xdef	_Comunicacion
3443  002f               _Timeout:
3444  002f 000000000000  	ds.b	9
3445                     	xdef	_Timeout
3446  0038               _timer_Timeout:
3447  0038 000000000000  	ds.b	6
3448                     	xdef	_timer_Timeout
3449  003e               _SensorPesaje:
3450  003e 000000000000  	ds.b	28
3451                     	xdef	_SensorPesaje
3452  005a               _SensorTempHum:
3453  005a 000000000000  	ds.b	14
3454                     	xdef	_SensorTempHum
3455                     	xref	_GO_Init
3456  0068               _GestorRS485:
3457  0068 000000000000  	ds.b	24
3458                     	xdef	_GestorRS485
3459                     	xref	_RS485_Init
3460                     	xref	_hx711_Tarar
3461                     	xref	_hx711_Lectura
3462                     	xref	_HX711_Init
3463                     	xref	_dht11_Lectura
3464                     	xref	_DHT11_Init
3465                     	xref	_Timeout_Init
3466                     	xref	_Timer_Config_Init
3467                     	xref	_Clock_HSI_Init
3468                     	xref	_setFlagTimer1
3469                     	xref	_getFlagTimer1
3470                     	xref	_GPIO_DeInit
3490                     	xref	c_rtol
3491                     	xref	c_uitolx
3492                     	end

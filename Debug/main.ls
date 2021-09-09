   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     .const:	section	.text
  19  0000               L11_LONGITUDTRAMA:
  20  0000 18            	dc.b	24
 834                     ; 99 main()
 834                     ; 100 {
 836                     .text:	section	.text,new
 837  0000               _main:
 839  0000 5207          	subw	sp,#7
 840       00000007      OFST:	set	7
 843                     ; 18 	GPIO_DeInit(GPIOA);
 847  0002 ae5000        	ldw	x,#20480
 848  0005 cd0000        	call	_GPIO_DeInit
 850                     ; 19 	GPIO_DeInit(GPIOB);
 852  0008 ae5005        	ldw	x,#20485
 853  000b cd0000        	call	_GPIO_DeInit
 855                     ; 20 	GPIO_DeInit(GPIOC);
 857  000e ae500a        	ldw	x,#20490
 858  0011 cd0000        	call	_GPIO_DeInit
 860                     ; 21 	GPIO_DeInit(GPIOD);
 862  0014 ae500f        	ldw	x,#20495
 863  0017 cd0000        	call	_GPIO_DeInit
 865                     ; 68 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
 868  001a ae0080        	ldw	x,#128
 869  001d cd0000        	call	_Clock_HSI_Init
 871                     ; 35 	SensorTempHum.Config.HW.Puerto = GPIOA;
 875  0020 ae5000        	ldw	x,#20480
 876  0023 bf18          	ldw	_SensorTempHum,x
 877                     ; 36 	SensorTempHum.Config.HW.Pin = GPIO_PIN_3;
 879  0025 3508001a      	mov	_SensorTempHum+2,#8
 880                     ; 39 	SensorPesaje.Config.DOUT.Puerto = GPIOD;
 882  0029 ae500f        	ldw	x,#20495
 883  002c bf00          	ldw	_SensorPesaje,x
 884                     ; 40 	SensorPesaje.Config.DOUT.Pin = GPIO_PIN_2;
 886  002e 35040002      	mov	_SensorPesaje+2,#4
 887                     ; 42 	SensorPesaje.Config.PD_SCK.Puerto = GPIOD;
 889  0032 bf04          	ldw	_SensorPesaje+4,x
 890                     ; 43 	SensorPesaje.Config.PD_SCK.Pin = GPIO_PIN_3;
 892  0034 35080006      	mov	_SensorPesaje+6,#8
 893                     ; 73 	DHT11_Init( &SensorTempHum, &dht11_Lectura );
 896  0038 ae0000        	ldw	x,#_dht11_Lectura
 897  003b 89            	pushw	x
 898  003c ae0018        	ldw	x,#_SensorTempHum
 899  003f cd0000        	call	_DHT11_Init
 901  0042 85            	popw	x
 902                     ; 74 	HX711_Init( &SensorPesaje, &hx711_Lectura, &hx711_Tarar );
 904  0043 ae0000        	ldw	x,#_hx711_Tarar
 905  0046 89            	pushw	x
 906  0047 ae0000        	ldw	x,#_hx711_Lectura
 907  004a 89            	pushw	x
 908  004b ae0000        	ldw	x,#_SensorPesaje
 909  004e cd0000        	call	_HX711_Init
 911  0051 5b04          	addw	sp,#4
 912                     ; 103 	SensorPesaje.Config.ValorZero = SensorPesaje.Tarar( &SensorPesaje );
 914  0053 ae0000        	ldw	x,#_SensorPesaje
 915  0056 92cd16        	call	[_SensorPesaje+22.w]
 917  0059 bf0b          	ldw	_SensorPesaje+11,x
 918  005b               L325:
 919                     ; 107 		SensorTempHum.Datos.UltimaLectura = SensorTempHum.Lectura( &SensorTempHum );
 921  005b ae0018        	ldw	x,#_SensorTempHum
 922  005e 89            	pushw	x
 923  005f ae001c        	ldw	x,#_SensorTempHum+4
 924  0062 89            	pushw	x
 925  0063 92cd22        	call	[_SensorTempHum+10.w]
 927  0066 5b04          	addw	sp,#4
 928                     ; 109 		SensorPesaje.Datos.UltimaLectura = SensorPesaje.Lectura( &SensorPesaje );
 930  0068 ae0000        	ldw	x,#_SensorPesaje
 931  006b 92cd14        	call	[_SensorPesaje+20.w]
 933  006e cd0000        	call	c_uitolx
 935  0071 ae000f        	ldw	x,#_SensorPesaje+15
 936  0074 cd0000        	call	c_rtol
 941  0077 ae03e8        	ldw	x,#1000
 944  007a 200a          	jra	L335
 945  007c               L725:
 946                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 950  007c ae14d4        	ldw	x,#5332
 952  007f 9d            	nop	
 953  0080               L23:
 954  0080 5a            	decw	X
 955  0081 26fd          	jrne	L23
 956  0083 9d            	nop	
 957                     
 959  0084 1e06          	ldw	x,(OFST-1,sp)
 960  0086               L335:
 961                     ; 39 	while ( __ms-- )
 963  0086 5a            	decw	x
 964  0087 1f06          	ldw	(OFST-1,sp),x
 965  0089 5c            	incw	x
 967  008a 26f0          	jrne	L725
 968  008c 20cd          	jra	L325
 981                     	xdef	_main
 982                     	switch	.ubsct
 983  0000               _SensorPesaje:
 984  0000 000000000000  	ds.b	24
 985                     	xdef	_SensorPesaje
 986  0018               _SensorTempHum:
 987  0018 000000000000  	ds.b	12
 988                     	xdef	_SensorTempHum
 989                     	xref	_hx711_Tarar
 990                     	xref	_hx711_Lectura
 991                     	xref	_HX711_Init
 992                     	xref	_dht11_Lectura
 993                     	xref	_DHT11_Init
 994                     	xref	_Clock_HSI_Init
 995                     	xref	_GPIO_DeInit
1015                     	xref	c_rtol
1016                     	xref	c_uitolx
1017                     	end

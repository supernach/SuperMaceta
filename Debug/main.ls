   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     .const:	section	.text
  19  0000               L11_LONGITUDTRAMA:
  20  0000 18            	dc.b	24
 832                     ; 99 main()
 832                     ; 100 {
 834                     .text:	section	.text,new
 835  0000               _main:
 837  0000 5207          	subw	sp,#7
 838       00000007      OFST:	set	7
 841                     ; 18 	GPIO_DeInit(GPIOA);
 845  0002 ae5000        	ldw	x,#20480
 846  0005 cd0000        	call	_GPIO_DeInit
 848                     ; 19 	GPIO_DeInit(GPIOB);
 850  0008 ae5005        	ldw	x,#20485
 851  000b cd0000        	call	_GPIO_DeInit
 853                     ; 20 	GPIO_DeInit(GPIOC);
 855  000e ae500a        	ldw	x,#20490
 856  0011 cd0000        	call	_GPIO_DeInit
 858                     ; 21 	GPIO_DeInit(GPIOD);
 860  0014 ae500f        	ldw	x,#20495
 861  0017 cd0000        	call	_GPIO_DeInit
 863                     ; 68 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
 866  001a ae0080        	ldw	x,#128
 867  001d cd0000        	call	_Clock_HSI_Init
 869                     ; 35 	SensorTempHum.Config.HW.Puerto = GPIOA;
 873  0020 ae5000        	ldw	x,#20480
 874  0023 bf18          	ldw	_SensorTempHum,x
 875                     ; 36 	SensorTempHum.Config.HW.Pin = GPIO_PIN_3;
 877  0025 3508001a      	mov	_SensorTempHum+2,#8
 878                     ; 39 	SensorPesaje.Config.DOUT.Puerto = GPIOD;
 880  0029 ae500f        	ldw	x,#20495
 881  002c bf00          	ldw	_SensorPesaje,x
 882                     ; 40 	SensorPesaje.Config.DOUT.Pin = GPIO_PIN_2;
 884  002e 35040002      	mov	_SensorPesaje+2,#4
 885                     ; 42 	SensorPesaje.Config.PD_SCK.Puerto = GPIOD;
 887  0032 bf04          	ldw	_SensorPesaje+4,x
 888                     ; 43 	SensorPesaje.Config.PD_SCK.Pin = GPIO_PIN_3;
 890  0034 35080006      	mov	_SensorPesaje+6,#8
 891                     ; 73 	DHT11_Init( &SensorTempHum );
 894  0038 ae0018        	ldw	x,#_SensorTempHum
 895  003b cd0000        	call	_DHT11_Init
 897                     ; 74 	HX711_Init( &SensorPesaje, &hx711_Lectura, &hx711_Tarar );
 899  003e ae0000        	ldw	x,#_hx711_Tarar
 900  0041 89            	pushw	x
 901  0042 ae0000        	ldw	x,#_hx711_Lectura
 902  0045 89            	pushw	x
 903  0046 ae0000        	ldw	x,#_SensorPesaje
 904  0049 cd0000        	call	_HX711_Init
 906  004c 5b04          	addw	sp,#4
 907                     ; 103 	SensorPesaje.Config.ValorZero = SensorPesaje.Tarar( &SensorPesaje );
 909  004e ae0000        	ldw	x,#_SensorPesaje
 910  0051 92cd16        	call	[_SensorPesaje+22.w]
 912  0054 bf0b          	ldw	_SensorPesaje+11,x
 913  0056               L325:
 914                     ; 107 		SensorTempHum.Datos.UltimaLectura = SensorTempHum.Lectura( &SensorTempHum );
 916  0056 ae0018        	ldw	x,#_SensorTempHum
 917  0059 89            	pushw	x
 918  005a ae001c        	ldw	x,#_SensorTempHum+4
 919  005d 89            	pushw	x
 920  005e 92cd22        	call	[_SensorTempHum+10.w]
 922  0061 5b04          	addw	sp,#4
 923                     ; 109 		SensorPesaje.Datos.UltimaLectura = SensorPesaje.Lectura( &SensorPesaje );
 925  0063 ae0000        	ldw	x,#_SensorPesaje
 926  0066 92cd14        	call	[_SensorPesaje+20.w]
 928  0069 cd0000        	call	c_uitolx
 930  006c ae000f        	ldw	x,#_SensorPesaje+15
 931  006f cd0000        	call	c_rtol
 936  0072 ae03e8        	ldw	x,#1000
 939  0075 200a          	jra	L335
 940  0077               L725:
 941                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 945  0077 ae14d4        	ldw	x,#5332
 947  007a 9d            	nop	
 948  007b               L23:
 949  007b 5a            	decw	X
 950  007c 26fd          	jrne	L23
 951  007e 9d            	nop	
 952                     
 954  007f 1e06          	ldw	x,(OFST-1,sp)
 955  0081               L335:
 956                     ; 39 	while ( __ms-- )
 958  0081 5a            	decw	x
 959  0082 1f06          	ldw	(OFST-1,sp),x
 960  0084 5c            	incw	x
 962  0085 26f0          	jrne	L725
 963  0087 20cd          	jra	L325
 976                     	xdef	_main
 977                     	switch	.ubsct
 978  0000               _SensorPesaje:
 979  0000 000000000000  	ds.b	24
 980                     	xdef	_SensorPesaje
 981  0018               _SensorTempHum:
 982  0018 000000000000  	ds.b	12
 983                     	xdef	_SensorTempHum
 984                     	xref	_hx711_Tarar
 985                     	xref	_hx711_Lectura
 986                     	xref	_HX711_Init
 987                     	xref	_DHT11_Init
 988                     	xref	_Clock_HSI_Init
 989                     	xref	_GPIO_DeInit
1009                     	xref	c_rtol
1010                     	xref	c_uitolx
1011                     	end

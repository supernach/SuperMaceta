   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     .const:	section	.text
  19  0000               L11_LONGITUDTRAMA:
  20  0000 18            	dc.b	24
  21  0001               L31_HX711_TIEMPOCLOCK:
  22  0001 03            	dc.b	3
 845                     ; 99 int main()
 845                     ; 100 {
 847                     .text:	section	.text,new
 848  0000               _main:
 850  0000 5207          	subw	sp,#7
 851       00000007      OFST:	set	7
 854                     ; 18 	GPIO_DeInit(GPIOA);
 858  0002 ae5000        	ldw	x,#20480
 859  0005 cd0000        	call	_GPIO_DeInit
 861                     ; 19 	GPIO_DeInit(GPIOB);
 863  0008 ae5005        	ldw	x,#20485
 864  000b cd0000        	call	_GPIO_DeInit
 866                     ; 20 	GPIO_DeInit(GPIOC);
 868  000e ae500a        	ldw	x,#20490
 869  0011 cd0000        	call	_GPIO_DeInit
 871                     ; 21 	GPIO_DeInit(GPIOD);
 873  0014 ae500f        	ldw	x,#20495
 874  0017 cd0000        	call	_GPIO_DeInit
 876                     ; 68 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
 879  001a ae0080        	ldw	x,#128
 880  001d cd0000        	call	_Clock_HSI_Init
 882                     ; 35 	SensorTempHum.Config.HW.Puerto = GPIOA;
 886  0020 ae5000        	ldw	x,#20480
 887  0023 bf18          	ldw	_SensorTempHum,x
 888                     ; 36 	SensorTempHum.Config.HW.Pin = GPIO_PIN_3;
 890  0025 3508001a      	mov	_SensorTempHum+2,#8
 891                     ; 39 	SensorPesaje.Config.DOUT.Puerto = GPIOD;
 893  0029 ae500f        	ldw	x,#20495
 894  002c bf00          	ldw	_SensorPesaje,x
 895                     ; 40 	SensorPesaje.Config.DOUT.Pin = GPIO_PIN_2;
 897  002e 35040002      	mov	_SensorPesaje+2,#4
 898                     ; 42 	SensorPesaje.Config.PD_SCK.Puerto = GPIOD;
 900  0032 bf04          	ldw	_SensorPesaje+4,x
 901                     ; 43 	SensorPesaje.Config.PD_SCK.Pin = GPIO_PIN_3;
 903  0034 35080006      	mov	_SensorPesaje+6,#8
 904                     ; 73 	DHT11_Init( &SensorTempHum, &dht11_Lectura );
 907  0038 ae0000        	ldw	x,#_dht11_Lectura
 908  003b 89            	pushw	x
 909  003c ae0018        	ldw	x,#_SensorTempHum
 910  003f cd0000        	call	_DHT11_Init
 912  0042 85            	popw	x
 913                     ; 74 	HX711_Init( &SensorPesaje, &hx711_Lectura, &hx711_Tarar );
 915  0043 ae0000        	ldw	x,#_hx711_Tarar
 916  0046 89            	pushw	x
 917  0047 ae0000        	ldw	x,#_hx711_Lectura
 918  004a 89            	pushw	x
 919  004b ae0000        	ldw	x,#_SensorPesaje
 920  004e cd0000        	call	_HX711_Init
 922  0051 5b04          	addw	sp,#4
 923                     ; 103 	SensorPesaje.Config.ValorZero = SensorPesaje.Tarar( &SensorPesaje );
 925  0053 ae0000        	ldw	x,#_SensorPesaje
 926  0056 92cd16        	call	[_SensorPesaje+22.w]
 928  0059 bf0b          	ldw	_SensorPesaje+11,x
 929  005b               L135:
 930                     ; 107 		SensorTempHum.Datos.UltimaLectura = SensorTempHum.Lectura( &SensorTempHum );
 932  005b ae0018        	ldw	x,#_SensorTempHum
 933  005e 89            	pushw	x
 934  005f ae001c        	ldw	x,#_SensorTempHum+4
 935  0062 89            	pushw	x
 936  0063 92cd22        	call	[_SensorTempHum+10.w]
 938  0066 5b04          	addw	sp,#4
 939                     ; 109 		SensorPesaje.Datos.UltimaLectura = SensorPesaje.Lectura( &SensorPesaje );
 941  0068 ae0000        	ldw	x,#_SensorPesaje
 942  006b 92cd14        	call	[_SensorPesaje+20.w]
 944  006e cd0000        	call	c_uitolx
 946  0071 ae000f        	ldw	x,#_SensorPesaje+15
 947  0074 cd0000        	call	c_rtol
 952  0077 ae03e8        	ldw	x,#1000
 955  007a 200a          	jra	L145
 956  007c               L535:
 957                     ; 28 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 961  007c ae14d4        	ldw	x,#5332
 963  007f 9d            	nop	
 964  0080               L23:
 965  0080 5a            	decw	X
 966  0081 26fd          	jrne	L23
 967  0083 9d            	nop	
 968                     
 970  0084 1e06          	ldw	x,(OFST-1,sp)
 971  0086               L145:
 972                     ; 39 	while ( __ms-- )
 974  0086 5a            	decw	x
 975  0087 1f06          	ldw	(OFST-1,sp),x
 976  0089 5c            	incw	x
 978  008a 26f0          	jrne	L535
 979  008c 20cd          	jra	L135
 992                     	xdef	_main
 993                     	switch	.ubsct
 994  0000               _SensorPesaje:
 995  0000 000000000000  	ds.b	24
 996                     	xdef	_SensorPesaje
 997  0018               _SensorTempHum:
 998  0018 000000000000  	ds.b	12
 999                     	xdef	_SensorTempHum
1000                     	xref	_hx711_Tarar
1001                     	xref	_hx711_Lectura
1002                     	xref	_HX711_Init
1003                     	xref	_dht11_Lectura
1004                     	xref	_DHT11_Init
1005                     	xref	_Clock_HSI_Init
1006                     	xref	_GPIO_DeInit
1026                     	xref	c_rtol
1027                     	xref	c_uitolx
1028                     	end

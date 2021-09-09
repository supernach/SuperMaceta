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
 858                     ; 99 int main()
 858                     ; 100 {
 860                     .text:	section	.text,new
 861  0000               _main:
 863  0000 5207          	subw	sp,#7
 864       00000007      OFST:	set	7
 867                     ; 18 	GPIO_DeInit(GPIOA);
 871  0002 ae5000        	ldw	x,#20480
 872  0005 cd0000        	call	_GPIO_DeInit
 874                     ; 19 	GPIO_DeInit(GPIOB);
 876  0008 ae5005        	ldw	x,#20485
 877  000b cd0000        	call	_GPIO_DeInit
 879                     ; 20 	GPIO_DeInit(GPIOC);
 881  000e ae500a        	ldw	x,#20490
 882  0011 cd0000        	call	_GPIO_DeInit
 884                     ; 21 	GPIO_DeInit(GPIOD);
 886  0014 ae500f        	ldw	x,#20495
 887  0017 cd0000        	call	_GPIO_DeInit
 889                     ; 68 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
 892  001a ae0080        	ldw	x,#128
 893  001d cd0000        	call	_Clock_HSI_Init
 895                     ; 35 	SensorTempHum.Config.HW.Puerto = GPIOA;
 899  0020 ae5000        	ldw	x,#20480
 900  0023 bf18          	ldw	_SensorTempHum,x
 901                     ; 36 	SensorTempHum.Config.HW.Pin = GPIO_PIN_3;
 903  0025 3508001a      	mov	_SensorTempHum+2,#8
 904                     ; 39 	SensorPesaje.Config.DOUT.Puerto = GPIOD;
 906  0029 ae500f        	ldw	x,#20495
 907  002c bf00          	ldw	_SensorPesaje,x
 908                     ; 40 	SensorPesaje.Config.DOUT.Pin = GPIO_PIN_2;
 910  002e 35040002      	mov	_SensorPesaje+2,#4
 911                     ; 42 	SensorPesaje.Config.PD_SCK.Puerto = GPIOD;
 913  0032 bf04          	ldw	_SensorPesaje+4,x
 914                     ; 43 	SensorPesaje.Config.PD_SCK.Pin = GPIO_PIN_3;
 916  0034 35080006      	mov	_SensorPesaje+6,#8
 917                     ; 73 	DHT11_Init( &SensorTempHum, &dht11_Lectura );
 920  0038 ae0000        	ldw	x,#_dht11_Lectura
 921  003b 89            	pushw	x
 922  003c ae0018        	ldw	x,#_SensorTempHum
 923  003f cd0000        	call	_DHT11_Init
 925  0042 85            	popw	x
 926                     ; 74 	HX711_Init( &SensorPesaje, &hx711_Lectura, &hx711_Tarar );
 928  0043 ae0000        	ldw	x,#_hx711_Tarar
 929  0046 89            	pushw	x
 930  0047 ae0000        	ldw	x,#_hx711_Lectura
 931  004a 89            	pushw	x
 932  004b ae0000        	ldw	x,#_SensorPesaje
 933  004e cd0000        	call	_HX711_Init
 935  0051 5b04          	addw	sp,#4
 936                     ; 103 	SensorPesaje.Config.ValorZero = SensorPesaje.Tarar( &SensorPesaje );
 938  0053 ae0000        	ldw	x,#_SensorPesaje
 939  0056 92cd16        	call	[_SensorPesaje+22.w]
 941  0059 bf0b          	ldw	_SensorPesaje+11,x
 942  005b               L735:
 943                     ; 107 		SensorTempHum.Datos.UltimaLectura = SensorTempHum.Lectura( &SensorTempHum );
 945  005b ae0018        	ldw	x,#_SensorTempHum
 946  005e 89            	pushw	x
 947  005f ae001c        	ldw	x,#_SensorTempHum+4
 948  0062 89            	pushw	x
 949  0063 92cd22        	call	[_SensorTempHum+10.w]
 951  0066 5b04          	addw	sp,#4
 952                     ; 109 		SensorPesaje.Datos.UltimaLectura = SensorPesaje.Lectura( &SensorPesaje );
 954  0068 ae0000        	ldw	x,#_SensorPesaje
 955  006b 92cd14        	call	[_SensorPesaje+20.w]
 957  006e cd0000        	call	c_uitolx
 959  0071 ae000f        	ldw	x,#_SensorPesaje+15
 960  0074 cd0000        	call	c_rtol
 965  0077 ae03e8        	ldw	x,#1000
 968  007a 200a          	jra	L745
 969  007c               L345:
 970                     ; 87 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 974  007c ae14d4        	ldw	x,#5332
 976  007f 9d            	nop	
 977  0080               L23:
 978  0080 5a            	decw	X
 979  0081 26fd          	jrne	L23
 980  0083 9d            	nop	
 981                     
 983  0084 1e06          	ldw	x,(OFST-1,sp)
 984  0086               L745:
 985                     ; 98 	while ( __ms-- )
 987  0086 5a            	decw	x
 988  0087 1f06          	ldw	(OFST-1,sp),x
 989  0089 5c            	incw	x
 991  008a 26f0          	jrne	L345
 992  008c 20cd          	jra	L735
1005                     	xdef	_main
1006                     	switch	.ubsct
1007  0000               _SensorPesaje:
1008  0000 000000000000  	ds.b	24
1009                     	xdef	_SensorPesaje
1010  0018               _SensorTempHum:
1011  0018 000000000000  	ds.b	12
1012                     	xdef	_SensorTempHum
1013                     	xref	_hx711_Tarar
1014                     	xref	_hx711_Lectura
1015                     	xref	_HX711_Init
1016                     	xref	_dht11_Lectura
1017                     	xref	_DHT11_Init
1018                     	xref	_Clock_HSI_Init
1019                     	xref	_GPIO_DeInit
1039                     	xref	c_rtol
1040                     	xref	c_uitolx
1041                     	end

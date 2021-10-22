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
 244                     ; 109 void Clock_HSI_Init(CLK_Prescaler_TypeDef fHsi, CLK_Prescaler_TypeDef fCpu)
 244                     ; 110 {
 246                     .text:	section	.text,new
 247  0000               _Clock_HSI_Init:
 249  0000 89            	pushw	x
 250       00000000      OFST:	set	0
 253                     ; 111 	CLK_DeInit();
 255  0001 cd0000        	call	_CLK_DeInit
 257                     ; 113 	CLK_HSECmd(DISABLE); //Desactivar oscilador externo
 259  0004 4f            	clr	a
 260  0005 cd0000        	call	_CLK_HSECmd
 262                     ; 114 	CLK_LSICmd(DISABLE); //Desactivar oscilador lento interno 128khz
 264  0008 4f            	clr	a
 265  0009 cd0000        	call	_CLK_LSICmd
 267                     ; 116 	CLK_HSICmd(ENABLE); // Activar oscilador interno 16mhz
 269  000c a601          	ld	a,#1
 270  000e cd0000        	call	_CLK_HSICmd
 273  0011               L331:
 274                     ; 118 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE); // Espera hasta que el oscilador este preparado
 276  0011 ae0102        	ldw	x,#258
 277  0014 cd0000        	call	_CLK_GetFlagStatus
 279  0017 4d            	tnz	a
 280  0018 27f7          	jreq	L331
 281                     ; 120 	CLK_ClockSwitchCmd(ENABLE);
 283  001a a601          	ld	a,#1
 284  001c cd0000        	call	_CLK_ClockSwitchCmd
 286                     ; 122 	CLK_HSIPrescalerConfig(fHsi); //fMaster 16mhz
 288  001f 7b01          	ld	a,(OFST+1,sp)
 289  0021 cd0000        	call	_CLK_HSIPrescalerConfig
 291                     ; 123 	CLK_SYSCLKConfig(fCpu); // fCpu 
 293  0024 7b02          	ld	a,(OFST+2,sp)
 294  0026 cd0000        	call	_CLK_SYSCLKConfig
 296                     ; 125 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 298  0029 4b01          	push	#1
 299  002b 4b00          	push	#0
 300  002d ae01e1        	ldw	x,#481
 301  0030 cd0000        	call	_CLK_ClockSwitchConfig
 303  0033 85            	popw	x
 304                     ; 127   DisableAllPeripherals();
 306  0034 cd0000        	call	_DisableAllPeripherals
 308                     ; 128 }
 311  0037 85            	popw	x
 312  0038 81            	ret	
 337                     ; 165 void DisableAllPeripherals(void)
 337                     ; 166 {
 338                     .text:	section	.text,new
 339  0000               _DisableAllPeripherals:
 343                     ; 167 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 345  0000 5f            	clrw	x
 346  0001 cd0000        	call	_CLK_PeripheralClockConfig
 348                     ; 168   CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 350  0004 ae0100        	ldw	x,#256
 351  0007 cd0000        	call	_CLK_PeripheralClockConfig
 353                     ; 169   CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 355  000a ae0300        	ldw	x,#768
 356  000d cd0000        	call	_CLK_PeripheralClockConfig
 358                     ; 170   CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 360  0010 ae1200        	ldw	x,#4608
 361  0013 cd0000        	call	_CLK_PeripheralClockConfig
 363                     ; 171   CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 365  0016 ae1300        	ldw	x,#4864
 366  0019 cd0000        	call	_CLK_PeripheralClockConfig
 368                     ; 172   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 370  001c ae0700        	ldw	x,#1792
 371  001f cd0000        	call	_CLK_PeripheralClockConfig
 373                     ; 173   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 375  0022 ae0500        	ldw	x,#1280
 376  0025 cd0000        	call	_CLK_PeripheralClockConfig
 378                     ; 174   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 380  0028 ae0400        	ldw	x,#1024
 382                     ; 175 }
 385  002b cc0000        	jp	_CLK_PeripheralClockConfig
 810                     ; 212 void EnableClockMirror(CLK_Output_TypeDef source, Gpio_Config_t* pin)
 810                     ; 213 {
 811                     .text:	section	.text,new
 812  0000               _EnableClockMirror:
 814  0000 88            	push	a
 815       00000000      OFST:	set	0
 818                     ; 214 	NHALgpioConfig_SetType( pin, GPIO_MODE_OUT_PP_HIGH_FAST );
 820  0001 4bf0          	push	#240
 821  0003 1e05          	ldw	x,(OFST+5,sp)
 822  0005 cd0000        	call	_NHALgpioConfig_SetType
 824  0008 84            	pop	a
 825                     ; 215 	NHALgpio_Init( pin ); //Tipo salida debe ser 10Mhz
 827  0009 1e04          	ldw	x,(OFST+4,sp)
 828  000b cd0000        	call	_NHALgpio_Init
 830                     ; 216 	CLK_CCOConfig(source);
 832  000e 7b01          	ld	a,(OFST+1,sp)
 833  0010 cd0000        	call	_CLK_CCOConfig
 835                     ; 217   CLK_CCOCmd(ENABLE);
 837  0013 a601          	ld	a,#1
 838  0015 cd0000        	call	_CLK_CCOCmd
 840                     ; 218 }
 843  0018 84            	pop	a
 844  0019 81            	ret	
 994                     ; 255 void HabilitarRelojPeriferico( CLK_Peripheral_TypeDef periferico )
 994                     ; 256 {
 995                     .text:	section	.text,new
 996  0000               _HabilitarRelojPeriferico:
1000                     ; 257 	CLK_PeripheralClockConfig(periferico, ENABLE);
1002  0000 ae0001        	ldw	x,#1
1003  0003 95            	ld	xh,a
1005                     ; 258 }
1008  0004 cc0000        	jp	_CLK_PeripheralClockConfig
1021                     	xdef	_HabilitarRelojPeriferico
1022                     	xdef	_EnableClockMirror
1023                     	xdef	_Clock_HSI_Init
1024                     	xdef	_DisableAllPeripherals
1025                     	xref	_NHALgpio_Init
1026                     	xref	_NHALgpioConfig_SetType
1027                     	xref	_CLK_GetFlagStatus
1028                     	xref	_CLK_SYSCLKConfig
1029                     	xref	_CLK_CCOConfig
1030                     	xref	_CLK_HSIPrescalerConfig
1031                     	xref	_CLK_ClockSwitchConfig
1032                     	xref	_CLK_PeripheralClockConfig
1033                     	xref	_CLK_ClockSwitchCmd
1034                     	xref	_CLK_CCOCmd
1035                     	xref	_CLK_LSICmd
1036                     	xref	_CLK_HSICmd
1037                     	xref	_CLK_HSECmd
1038                     	xref	_CLK_DeInit
1057                     	end

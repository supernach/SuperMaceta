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
 233                     ; 109 void Clock_HSI_Init(CLK_Prescaler_TypeDef fHsi, CLK_Prescaler_TypeDef fCpu)
 233                     ; 110 {
 235                     .text:	section	.text,new
 236  0000               _Clock_HSI_Init:
 238  0000 89            	pushw	x
 239       00000000      OFST:	set	0
 242                     ; 111 	CLK_DeInit();
 244  0001 cd0000        	call	_CLK_DeInit
 246                     ; 113 	CLK_HSECmd(DISABLE); //Desactivar oscilador externo
 248  0004 4f            	clr	a
 249  0005 cd0000        	call	_CLK_HSECmd
 251                     ; 114 	CLK_LSICmd(DISABLE); //Desactivar oscilador lento interno 128khz
 253  0008 4f            	clr	a
 254  0009 cd0000        	call	_CLK_LSICmd
 256                     ; 116 	CLK_HSICmd(ENABLE); // Activar oscilador interno 16mhz
 258  000c a601          	ld	a,#1
 259  000e cd0000        	call	_CLK_HSICmd
 262  0011               L521:
 263                     ; 118 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE); // Espera hasta que el oscilador este preparado
 265  0011 ae0102        	ldw	x,#258
 266  0014 cd0000        	call	_CLK_GetFlagStatus
 268  0017 4d            	tnz	a
 269  0018 27f7          	jreq	L521
 270                     ; 120 	CLK_ClockSwitchCmd(ENABLE);
 272  001a a601          	ld	a,#1
 273  001c cd0000        	call	_CLK_ClockSwitchCmd
 275                     ; 122 	CLK_HSIPrescalerConfig(fHsi); //fMaster 16mhz
 277  001f 7b01          	ld	a,(OFST+1,sp)
 278  0021 cd0000        	call	_CLK_HSIPrescalerConfig
 280                     ; 123 	CLK_SYSCLKConfig(fCpu); // fCpu 
 282  0024 7b02          	ld	a,(OFST+2,sp)
 283  0026 cd0000        	call	_CLK_SYSCLKConfig
 285                     ; 125 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 287  0029 4b01          	push	#1
 288  002b 4b00          	push	#0
 289  002d ae01e1        	ldw	x,#481
 290  0030 cd0000        	call	_CLK_ClockSwitchConfig
 292  0033 85            	popw	x
 293                     ; 127   DisableAllPeripherals();
 295  0034 cd0000        	call	_DisableAllPeripherals
 297                     ; 128 }
 300  0037 85            	popw	x
 301  0038 81            	ret	
 326                     ; 130 void DisableAllPeripherals(void)
 326                     ; 131 {
 327                     .text:	section	.text,new
 328  0000               _DisableAllPeripherals:
 332                     ; 132 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 334  0000 5f            	clrw	x
 335  0001 cd0000        	call	_CLK_PeripheralClockConfig
 337                     ; 133   CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 339  0004 ae0100        	ldw	x,#256
 340  0007 cd0000        	call	_CLK_PeripheralClockConfig
 342                     ; 134   CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 344  000a ae0300        	ldw	x,#768
 345  000d cd0000        	call	_CLK_PeripheralClockConfig
 347                     ; 135   CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 349  0010 ae1200        	ldw	x,#4608
 350  0013 cd0000        	call	_CLK_PeripheralClockConfig
 352                     ; 136   CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 354  0016 ae1300        	ldw	x,#4864
 355  0019 cd0000        	call	_CLK_PeripheralClockConfig
 357                     ; 137   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
 359  001c ae0701        	ldw	x,#1793
 360  001f cd0000        	call	_CLK_PeripheralClockConfig
 362                     ; 138   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 364  0022 ae0500        	ldw	x,#1280
 365  0025 cd0000        	call	_CLK_PeripheralClockConfig
 367                     ; 139   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 369  0028 ae0400        	ldw	x,#1024
 371                     ; 140 }
 374  002b cc0000        	jp	_CLK_PeripheralClockConfig
 799                     ; 177 void EnableClockMirror(CLK_Output_TypeDef source, Gpio_Config_t* pin)
 799                     ; 178 {
 800                     .text:	section	.text,new
 801  0000               _EnableClockMirror:
 803  0000 88            	push	a
 804       00000000      OFST:	set	0
 807                     ; 179 	NHALgpioConfig_SetType( pin, GPIO_MODE_OUT_PP_HIGH_FAST );
 809  0001 4bf0          	push	#240
 810  0003 1e05          	ldw	x,(OFST+5,sp)
 811  0005 cd0000        	call	_NHALgpioConfig_SetType
 813  0008 84            	pop	a
 814                     ; 180 	NHALgpio_Init( pin ); //Tipo salida debe ser 10Mhz
 816  0009 1e04          	ldw	x,(OFST+4,sp)
 817  000b cd0000        	call	_NHALgpio_Init
 819                     ; 181 	CLK_CCOConfig(source);
 821  000e 7b01          	ld	a,(OFST+1,sp)
 822  0010 cd0000        	call	_CLK_CCOConfig
 824                     ; 182   CLK_CCOCmd(ENABLE);
 826  0013 a601          	ld	a,#1
 827  0015 cd0000        	call	_CLK_CCOCmd
 829                     ; 183 }
 832  0018 84            	pop	a
 833  0019 81            	ret	
 983                     ; 185 void HabilitarRelojPeriferico( CLK_Peripheral_TypeDef periferico )
 983                     ; 186 {
 984                     .text:	section	.text,new
 985  0000               _HabilitarRelojPeriferico:
 989                     ; 187 	CLK_PeripheralClockConfig(periferico, ENABLE);
 991  0000 ae0001        	ldw	x,#1
 992  0003 95            	ld	xh,a
 994                     ; 188 }
 997  0004 cc0000        	jp	_CLK_PeripheralClockConfig
1010                     	xdef	_HabilitarRelojPeriferico
1011                     	xdef	_EnableClockMirror
1012                     	xdef	_Clock_HSI_Init
1013                     	xdef	_DisableAllPeripherals
1014                     	xref	_NHALgpio_Init
1015                     	xref	_NHALgpioConfig_SetType
1016                     	xref	_CLK_GetFlagStatus
1017                     	xref	_CLK_SYSCLKConfig
1018                     	xref	_CLK_CCOConfig
1019                     	xref	_CLK_HSIPrescalerConfig
1020                     	xref	_CLK_ClockSwitchConfig
1021                     	xref	_CLK_PeripheralClockConfig
1022                     	xref	_CLK_ClockSwitchCmd
1023                     	xref	_CLK_CCOCmd
1024                     	xref	_CLK_LSICmd
1025                     	xref	_CLK_HSICmd
1026                     	xref	_CLK_HSECmd
1027                     	xref	_CLK_DeInit
1046                     	end

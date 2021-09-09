   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
 180                     ; 99 void Clock_HSI_Init(CLK_Prescaler_TypeDef fHsi, CLK_Prescaler_TypeDef fCpu)
 180                     ; 100 {
 182                     .text:	section	.text,new
 183  0000               _Clock_HSI_Init:
 185  0000 89            	pushw	x
 186       00000000      OFST:	set	0
 189                     ; 101 	CLK_DeInit();
 191  0001 cd0000        	call	_CLK_DeInit
 193                     ; 103 	CLK_HSECmd(DISABLE); //Desactivar oscilador externo
 195  0004 4f            	clr	a
 196  0005 cd0000        	call	_CLK_HSECmd
 198                     ; 104 	CLK_LSICmd(DISABLE); //Desactivar oscilador lento interno 128khz
 200  0008 4f            	clr	a
 201  0009 cd0000        	call	_CLK_LSICmd
 203                     ; 106 	CLK_HSICmd(ENABLE); // Activar oscilador interno 16mhz
 205  000c a601          	ld	a,#1
 206  000e cd0000        	call	_CLK_HSICmd
 209  0011               L17:
 210                     ; 108 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE); // Espera hasta que el oscilador este preparado
 212  0011 ae0102        	ldw	x,#258
 213  0014 cd0000        	call	_CLK_GetFlagStatus
 215  0017 4d            	tnz	a
 216  0018 27f7          	jreq	L17
 217                     ; 110 	CLK_ClockSwitchCmd(ENABLE);
 219  001a a601          	ld	a,#1
 220  001c cd0000        	call	_CLK_ClockSwitchCmd
 222                     ; 112 	CLK_HSIPrescalerConfig(fHsi); //fMaster 16mhz
 224  001f 7b01          	ld	a,(OFST+1,sp)
 225  0021 cd0000        	call	_CLK_HSIPrescalerConfig
 227                     ; 113 	CLK_SYSCLKConfig(fCpu); // fCpu 
 229  0024 7b02          	ld	a,(OFST+2,sp)
 230  0026 cd0000        	call	_CLK_SYSCLKConfig
 232                     ; 115 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 234  0029 4b01          	push	#1
 235  002b 4b00          	push	#0
 236  002d ae01e1        	ldw	x,#481
 237  0030 cd0000        	call	_CLK_ClockSwitchConfig
 239  0033 85            	popw	x
 240                     ; 117   DisableAllPeripherals();
 242  0034 cd0000        	call	_DisableAllPeripherals
 244                     ; 118 }
 247  0037 85            	popw	x
 248  0038 81            	ret	
 273                     ; 120 void DisableAllPeripherals(void)
 273                     ; 121 {
 274                     .text:	section	.text,new
 275  0000               _DisableAllPeripherals:
 279                     ; 122 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 281  0000 5f            	clrw	x
 282  0001 cd0000        	call	_CLK_PeripheralClockConfig
 284                     ; 123   CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 286  0004 ae0100        	ldw	x,#256
 287  0007 cd0000        	call	_CLK_PeripheralClockConfig
 289                     ; 124   CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 291  000a ae0300        	ldw	x,#768
 292  000d cd0000        	call	_CLK_PeripheralClockConfig
 294                     ; 125   CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 296  0010 ae1200        	ldw	x,#4608
 297  0013 cd0000        	call	_CLK_PeripheralClockConfig
 299                     ; 126   CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 301  0016 ae1300        	ldw	x,#4864
 302  0019 cd0000        	call	_CLK_PeripheralClockConfig
 304                     ; 127   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 306  001c ae0700        	ldw	x,#1792
 307  001f cd0000        	call	_CLK_PeripheralClockConfig
 309                     ; 128   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 311  0022 ae0500        	ldw	x,#1280
 312  0025 cd0000        	call	_CLK_PeripheralClockConfig
 314                     ; 129   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 316  0028 ae0400        	ldw	x,#1024
 318                     ; 130 }
 321  002b cc0000        	jp	_CLK_PeripheralClockConfig
 746                     ; 167 void EnableClockMirror(CLK_Output_TypeDef source, Gpio_Config_t* pin)
 746                     ; 168 {
 747                     .text:	section	.text,new
 748  0000               _EnableClockMirror:
 750  0000 88            	push	a
 751       00000000      OFST:	set	0
 754                     ; 169 	NHALgpioConfig_SetType( pin, GPIO_MODE_OUT_PP_HIGH_FAST );
 756  0001 4bf0          	push	#240
 757  0003 1e05          	ldw	x,(OFST+5,sp)
 758  0005 cd0000        	call	_NHALgpioConfig_SetType
 760  0008 84            	pop	a
 761                     ; 170 	NHALgpio_Init( pin ); //Tipo salida debe ser 10Mhz
 763  0009 1e04          	ldw	x,(OFST+4,sp)
 764  000b cd0000        	call	_NHALgpio_Init
 766                     ; 171 	CLK_CCOConfig(source);
 768  000e 7b01          	ld	a,(OFST+1,sp)
 769  0010 cd0000        	call	_CLK_CCOConfig
 771                     ; 172   CLK_CCOCmd(ENABLE);
 773  0013 a601          	ld	a,#1
 774  0015 cd0000        	call	_CLK_CCOCmd
 776                     ; 173 }
 779  0018 84            	pop	a
 780  0019 81            	ret	
 793                     	xdef	_EnableClockMirror
 794                     	xdef	_Clock_HSI_Init
 795                     	xdef	_DisableAllPeripherals
 796                     	xref	_NHALgpio_Init
 797                     	xref	_NHALgpioConfig_SetType
 798                     	xref	_CLK_GetFlagStatus
 799                     	xref	_CLK_SYSCLKConfig
 800                     	xref	_CLK_CCOConfig
 801                     	xref	_CLK_HSIPrescalerConfig
 802                     	xref	_CLK_ClockSwitchConfig
 803                     	xref	_CLK_PeripheralClockConfig
 804                     	xref	_CLK_ClockSwitchCmd
 805                     	xref	_CLK_CCOCmd
 806                     	xref	_CLK_LSICmd
 807                     	xref	_CLK_HSICmd
 808                     	xref	_CLK_HSECmd
 809                     	xref	_CLK_DeInit
 828                     	end

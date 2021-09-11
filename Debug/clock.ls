   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 00            	dc.b	0
 211                     ; 99 void Clock_HSI_Init(CLK_Prescaler_TypeDef fHsi, CLK_Prescaler_TypeDef fCpu)
 211                     ; 100 {
 213                     .text:	section	.text,new
 214  0000               _Clock_HSI_Init:
 216  0000 89            	pushw	x
 217       00000000      OFST:	set	0
 220                     ; 101 	CLK_DeInit();
 222  0001 cd0000        	call	_CLK_DeInit
 224                     ; 103 	CLK_HSECmd(DISABLE); //Desactivar oscilador externo
 226  0004 4f            	clr	a
 227  0005 cd0000        	call	_CLK_HSECmd
 229                     ; 104 	CLK_LSICmd(DISABLE); //Desactivar oscilador lento interno 128khz
 231  0008 4f            	clr	a
 232  0009 cd0000        	call	_CLK_LSICmd
 234                     ; 106 	CLK_HSICmd(ENABLE); // Activar oscilador interno 16mhz
 236  000c a601          	ld	a,#1
 237  000e cd0000        	call	_CLK_HSICmd
 240  0011               L701:
 241                     ; 108 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE); // Espera hasta que el oscilador este preparado
 243  0011 ae0102        	ldw	x,#258
 244  0014 cd0000        	call	_CLK_GetFlagStatus
 246  0017 4d            	tnz	a
 247  0018 27f7          	jreq	L701
 248                     ; 110 	CLK_ClockSwitchCmd(ENABLE);
 250  001a a601          	ld	a,#1
 251  001c cd0000        	call	_CLK_ClockSwitchCmd
 253                     ; 112 	CLK_HSIPrescalerConfig(fHsi); //fMaster 16mhz
 255  001f 7b01          	ld	a,(OFST+1,sp)
 256  0021 cd0000        	call	_CLK_HSIPrescalerConfig
 258                     ; 113 	CLK_SYSCLKConfig(fCpu); // fCpu 
 260  0024 7b02          	ld	a,(OFST+2,sp)
 261  0026 cd0000        	call	_CLK_SYSCLKConfig
 263                     ; 115 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 265  0029 4b01          	push	#1
 266  002b 4b00          	push	#0
 267  002d ae01e1        	ldw	x,#481
 268  0030 cd0000        	call	_CLK_ClockSwitchConfig
 270  0033 85            	popw	x
 271                     ; 117   DisableAllPeripherals();
 273  0034 cd0000        	call	_DisableAllPeripherals
 275                     ; 118 }
 278  0037 85            	popw	x
 279  0038 81            	ret	
 304                     ; 120 void DisableAllPeripherals(void)
 304                     ; 121 {
 305                     .text:	section	.text,new
 306  0000               _DisableAllPeripherals:
 310                     ; 122 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 312  0000 5f            	clrw	x
 313  0001 cd0000        	call	_CLK_PeripheralClockConfig
 315                     ; 123   CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 317  0004 ae0100        	ldw	x,#256
 318  0007 cd0000        	call	_CLK_PeripheralClockConfig
 320                     ; 124   CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 322  000a ae0300        	ldw	x,#768
 323  000d cd0000        	call	_CLK_PeripheralClockConfig
 325                     ; 125   CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 327  0010 ae1200        	ldw	x,#4608
 328  0013 cd0000        	call	_CLK_PeripheralClockConfig
 330                     ; 126   CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 332  0016 ae1300        	ldw	x,#4864
 333  0019 cd0000        	call	_CLK_PeripheralClockConfig
 335                     ; 127   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
 337  001c ae0701        	ldw	x,#1793
 338  001f cd0000        	call	_CLK_PeripheralClockConfig
 340                     ; 128   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 342  0022 ae0500        	ldw	x,#1280
 343  0025 cd0000        	call	_CLK_PeripheralClockConfig
 345                     ; 129   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 347  0028 ae0400        	ldw	x,#1024
 349                     ; 130 }
 352  002b cc0000        	jp	_CLK_PeripheralClockConfig
 777                     ; 167 void EnableClockMirror(CLK_Output_TypeDef source, Gpio_Config_t* pin)
 777                     ; 168 {
 778                     .text:	section	.text,new
 779  0000               _EnableClockMirror:
 781  0000 88            	push	a
 782       00000000      OFST:	set	0
 785                     ; 169 	NHALgpioConfig_SetType( pin, GPIO_MODE_OUT_PP_HIGH_FAST );
 787  0001 4bf0          	push	#240
 788  0003 1e05          	ldw	x,(OFST+5,sp)
 789  0005 cd0000        	call	_NHALgpioConfig_SetType
 791  0008 84            	pop	a
 792                     ; 170 	NHALgpio_Init( pin ); //Tipo salida debe ser 10Mhz
 794  0009 1e04          	ldw	x,(OFST+4,sp)
 795  000b cd0000        	call	_NHALgpio_Init
 797                     ; 171 	CLK_CCOConfig(source);
 799  000e 7b01          	ld	a,(OFST+1,sp)
 800  0010 cd0000        	call	_CLK_CCOConfig
 802                     ; 172   CLK_CCOCmd(ENABLE);
 804  0013 a601          	ld	a,#1
 805  0015 cd0000        	call	_CLK_CCOCmd
 807                     ; 173 }
 810  0018 84            	pop	a
 811  0019 81            	ret	
 824                     	xdef	_EnableClockMirror
 825                     	xdef	_Clock_HSI_Init
 826                     	xdef	_DisableAllPeripherals
 827                     	xref	_NHALgpio_Init
 828                     	xref	_NHALgpioConfig_SetType
 829                     	xref	_CLK_GetFlagStatus
 830                     	xref	_CLK_SYSCLKConfig
 831                     	xref	_CLK_CCOConfig
 832                     	xref	_CLK_HSIPrescalerConfig
 833                     	xref	_CLK_ClockSwitchConfig
 834                     	xref	_CLK_PeripheralClockConfig
 835                     	xref	_CLK_ClockSwitchCmd
 836                     	xref	_CLK_CCOCmd
 837                     	xref	_CLK_LSICmd
 838                     	xref	_CLK_HSICmd
 839                     	xref	_CLK_HSECmd
 840                     	xref	_CLK_DeInit
 859                     	end

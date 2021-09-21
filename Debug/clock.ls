   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  21  0002               L5_flagUartRXNE:
  22  0002 00            	dc.b	0
 222                     ; 109 void Clock_HSI_Init(CLK_Prescaler_TypeDef fHsi, CLK_Prescaler_TypeDef fCpu)
 222                     ; 110 {
 224                     .text:	section	.text,new
 225  0000               _Clock_HSI_Init:
 227  0000 89            	pushw	x
 228       00000000      OFST:	set	0
 231                     ; 111 	CLK_DeInit();
 233  0001 cd0000        	call	_CLK_DeInit
 235                     ; 113 	CLK_HSECmd(DISABLE); //Desactivar oscilador externo
 237  0004 4f            	clr	a
 238  0005 cd0000        	call	_CLK_HSECmd
 240                     ; 114 	CLK_LSICmd(DISABLE); //Desactivar oscilador lento interno 128khz
 242  0008 4f            	clr	a
 243  0009 cd0000        	call	_CLK_LSICmd
 245                     ; 116 	CLK_HSICmd(ENABLE); // Activar oscilador interno 16mhz
 247  000c a601          	ld	a,#1
 248  000e cd0000        	call	_CLK_HSICmd
 251  0011               L511:
 252                     ; 118 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE); // Espera hasta que el oscilador este preparado
 254  0011 ae0102        	ldw	x,#258
 255  0014 cd0000        	call	_CLK_GetFlagStatus
 257  0017 4d            	tnz	a
 258  0018 27f7          	jreq	L511
 259                     ; 120 	CLK_ClockSwitchCmd(ENABLE);
 261  001a a601          	ld	a,#1
 262  001c cd0000        	call	_CLK_ClockSwitchCmd
 264                     ; 122 	CLK_HSIPrescalerConfig(fHsi); //fMaster 16mhz
 266  001f 7b01          	ld	a,(OFST+1,sp)
 267  0021 cd0000        	call	_CLK_HSIPrescalerConfig
 269                     ; 123 	CLK_SYSCLKConfig(fCpu); // fCpu 
 271  0024 7b02          	ld	a,(OFST+2,sp)
 272  0026 cd0000        	call	_CLK_SYSCLKConfig
 274                     ; 125 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 276  0029 4b01          	push	#1
 277  002b 4b00          	push	#0
 278  002d ae01e1        	ldw	x,#481
 279  0030 cd0000        	call	_CLK_ClockSwitchConfig
 281  0033 85            	popw	x
 282                     ; 127   DisableAllPeripherals();
 284  0034 cd0000        	call	_DisableAllPeripherals
 286                     ; 128 }
 289  0037 85            	popw	x
 290  0038 81            	ret	
 315                     ; 130 void DisableAllPeripherals(void)
 315                     ; 131 {
 316                     .text:	section	.text,new
 317  0000               _DisableAllPeripherals:
 321                     ; 132 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 323  0000 5f            	clrw	x
 324  0001 cd0000        	call	_CLK_PeripheralClockConfig
 326                     ; 133   CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 328  0004 ae0100        	ldw	x,#256
 329  0007 cd0000        	call	_CLK_PeripheralClockConfig
 331                     ; 134   CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 333  000a ae0300        	ldw	x,#768
 334  000d cd0000        	call	_CLK_PeripheralClockConfig
 336                     ; 135   CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 338  0010 ae1200        	ldw	x,#4608
 339  0013 cd0000        	call	_CLK_PeripheralClockConfig
 341                     ; 136   CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 343  0016 ae1300        	ldw	x,#4864
 344  0019 cd0000        	call	_CLK_PeripheralClockConfig
 346                     ; 137   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
 348  001c ae0701        	ldw	x,#1793
 349  001f cd0000        	call	_CLK_PeripheralClockConfig
 351                     ; 138   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 353  0022 ae0500        	ldw	x,#1280
 354  0025 cd0000        	call	_CLK_PeripheralClockConfig
 356                     ; 139   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 358  0028 ae0400        	ldw	x,#1024
 360                     ; 140 }
 363  002b cc0000        	jp	_CLK_PeripheralClockConfig
 788                     ; 177 void EnableClockMirror(CLK_Output_TypeDef source, Gpio_Config_t* pin)
 788                     ; 178 {
 789                     .text:	section	.text,new
 790  0000               _EnableClockMirror:
 792  0000 88            	push	a
 793       00000000      OFST:	set	0
 796                     ; 179 	NHALgpioConfig_SetType( pin, GPIO_MODE_OUT_PP_HIGH_FAST );
 798  0001 4bf0          	push	#240
 799  0003 1e05          	ldw	x,(OFST+5,sp)
 800  0005 cd0000        	call	_NHALgpioConfig_SetType
 802  0008 84            	pop	a
 803                     ; 180 	NHALgpio_Init( pin ); //Tipo salida debe ser 10Mhz
 805  0009 1e04          	ldw	x,(OFST+4,sp)
 806  000b cd0000        	call	_NHALgpio_Init
 808                     ; 181 	CLK_CCOConfig(source);
 810  000e 7b01          	ld	a,(OFST+1,sp)
 811  0010 cd0000        	call	_CLK_CCOConfig
 813                     ; 182   CLK_CCOCmd(ENABLE);
 815  0013 a601          	ld	a,#1
 816  0015 cd0000        	call	_CLK_CCOCmd
 818                     ; 183 }
 821  0018 84            	pop	a
 822  0019 81            	ret	
 835                     	xdef	_EnableClockMirror
 836                     	xdef	_Clock_HSI_Init
 837                     	xdef	_DisableAllPeripherals
 838                     	xref	_NHALgpio_Init
 839                     	xref	_NHALgpioConfig_SetType
 840                     	xref	_CLK_GetFlagStatus
 841                     	xref	_CLK_SYSCLKConfig
 842                     	xref	_CLK_CCOConfig
 843                     	xref	_CLK_HSIPrescalerConfig
 844                     	xref	_CLK_ClockSwitchConfig
 845                     	xref	_CLK_PeripheralClockConfig
 846                     	xref	_CLK_ClockSwitchCmd
 847                     	xref	_CLK_CCOCmd
 848                     	xref	_CLK_LSICmd
 849                     	xref	_CLK_HSICmd
 850                     	xref	_CLK_HSECmd
 851                     	xref	_CLK_DeInit
 870                     	end

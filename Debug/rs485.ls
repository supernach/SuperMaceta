   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
 679                     ; 106 void RS485_Init( RS485_t_ptr rs485 )
 679                     ; 107 {
 681                     .text:	section	.text,new
 682  0000               _RS485_Init:
 684  0000 89            	pushw	x
 685       00000000      OFST:	set	0
 688                     ; 109 	rs485->Config.UART.StopBit = UART1_STOPBITS_1;
 690  0001 7f            	clr	(x)
 691                     ; 110 	rs485->Config.UART.Paridad = UART1_PARITY_NO;
 693  0002 6f01          	clr	(1,x)
 694                     ; 111 	rs485->Config.UART.Bits = UART1_WORDLENGTH_8D;
 696  0004 6f02          	clr	(2,x)
 697                     ; 112 	rs485->Config.UART.Baudios = 9600;
 699  0006 a680          	ld	a,#128
 700  0008 e706          	ld	(6,x),a
 701  000a a625          	ld	a,#37
 702  000c e705          	ld	(5,x),a
 703  000e 4f            	clr	a
 704  000f e704          	ld	(4,x),a
 705  0011 e703          	ld	(3,x),a
 706                     ; 113 	rs485->Config.UART.Modo = UART1_MODE_TXRX_ENABLE;
 708  0013 a60c          	ld	a,#12
 709  0015 e707          	ld	(7,x),a
 710                     ; 114 	rs485->Config.UART.TipoInterrupcion = UART1_FLAG_RXNE;
 712  0017 90ae0020      	ldw	y,#32
 713  001b ef08          	ldw	(8,x),y
 714                     ; 117 	rs485->Config.UART.P_RX.Puerto = GPIOD;
 716  001d 90ae500f      	ldw	y,#20495
 717  0021 ef0a          	ldw	(10,x),y
 718                     ; 118 	rs485->Config.UART.P_RX.Pin = GPIO_PIN_6;
 720  0023 a640          	ld	a,#64
 721  0025 e70c          	ld	(12,x),a
 722                     ; 119 	rs485->Config.UART.P_RX.Tipo = GPIO_MODE_IN_PU_NO_IT; /**< No IT quizas hay que cambiar */
 724  0027 e70d          	ld	(13,x),a
 725                     ; 120 	NHALgpio_Init( &rs485->Config.UART.P_RX ); 
 727  0029 1c000a        	addw	x,#10
 728  002c cd0000        	call	_NHALgpio_Init
 730                     ; 123 	rs485->Config.UART.P_TX.Puerto = GPIOD;
 732  002f 1e01          	ldw	x,(OFST+1,sp)
 733  0031 90ae500f      	ldw	y,#20495
 734  0035 ef0e          	ldw	(14,x),y
 735                     ; 124 	rs485->Config.UART.P_TX.Pin = GPIO_PIN_5;
 737  0037 a620          	ld	a,#32
 738  0039 e710          	ld	(16,x),a
 739                     ; 125 	rs485->Config.UART.P_TX.Tipo = GPIO_MODE_OUT_PP_HIGH_FAST;
 741  003b a6f0          	ld	a,#240
 742  003d e711          	ld	(17,x),a
 743                     ; 126 	NHALgpio_Init( &rs485->Config.UART.P_TX ); 
 745  003f 1c000e        	addw	x,#14
 746  0042 cd0000        	call	_NHALgpio_Init
 748                     ; 128 	UART1_DeInit();
 750  0045 cd0000        	call	_UART1_DeInit
 752                     ; 131 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);
 754  0048 ae0301        	ldw	x,#769
 755  004b cd0000        	call	_CLK_PeripheralClockConfig
 757                     ; 132 	UART1_Init( rs485->Config.UART.Baudios, rs485->Config.UART.Bits, rs485->Config.UART.StopBit, rs485->Config.UART.Paridad, UART1_SYNCMODE_CLOCK_DISABLE, rs485->Config.UART.Modo );
 759  004e 1e01          	ldw	x,(OFST+1,sp)
 760  0050 e607          	ld	a,(7,x)
 761  0052 88            	push	a
 762  0053 4b80          	push	#128
 763  0055 1e03          	ldw	x,(OFST+3,sp)
 764  0057 e601          	ld	a,(1,x)
 765  0059 88            	push	a
 766  005a 1e04          	ldw	x,(OFST+4,sp)
 767  005c f6            	ld	a,(x)
 768  005d 88            	push	a
 769  005e 1e05          	ldw	x,(OFST+5,sp)
 770  0060 e602          	ld	a,(2,x)
 771  0062 88            	push	a
 772  0063 1e06          	ldw	x,(OFST+6,sp)
 773  0065 9093          	ldw	y,x
 774  0067 ee05          	ldw	x,(5,x)
 775  0069 89            	pushw	x
 776  006a 93            	ldw	x,y
 777  006b ee03          	ldw	x,(3,x)
 778  006d 89            	pushw	x
 779  006e cd0000        	call	_UART1_Init
 781  0071 5b09          	addw	sp,#9
 782                     ; 133 	UART1_Cmd(ENABLE);
 784  0073 a601          	ld	a,#1
 785  0075 cd0000        	call	_UART1_Cmd
 787                     ; 135 }
 790  0078 85            	popw	x
 791  0079 81            	ret	
 804                     	xdef	_RS485_Init
 805                     	xref	_NHALgpio_Init
 806                     	xref	_UART1_Cmd
 807                     	xref	_UART1_Init
 808                     	xref	_UART1_DeInit
 809                     	xref	_CLK_PeripheralClockConfig
 828                     	end

   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  21  0002               L5_flagUartRXNE:
  22  0002 00            	dc.b	0
  91                     ; 32 void TIM1_OV_IRQHandler( void )
  91                     ; 33 {
  92                     .text:	section	.text,new
  93  0000               f_TIM1_OV_IRQHandler:
  95  0000 8a            	push	cc
  96  0001 84            	pop	a
  97  0002 a4bf          	and	a,#191
  98  0004 88            	push	a
  99  0005 86            	pop	cc
 100  0006 3b0002        	push	c_x+2
 101  0009 be00          	ldw	x,c_x
 102  000b 89            	pushw	x
 103  000c 3b0002        	push	c_y+2
 104  000f be00          	ldw	x,c_y
 105  0011 89            	pushw	x
 108                     ; 34 	++flagTimer1;
 110  0012 be00          	ldw	x,L3_flagTimer1
 111  0014 5c            	incw	x
 112  0015 bf00          	ldw	L3_flagTimer1,x
 113                     ; 35 	TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
 115  0017 a601          	ld	a,#1
 116  0019 cd0000        	call	_TIM1_ClearITPendingBit
 118                     ; 36 	TIM1_ClearFlag(TIM1_FLAG_UPDATE);
 120  001c ae0001        	ldw	x,#1
 121  001f cd0000        	call	_TIM1_ClearFlag
 123                     ; 37 }
 126  0022 85            	popw	x
 127  0023 bf00          	ldw	c_y,x
 128  0025 320002        	pop	c_y+2
 129  0028 85            	popw	x
 130  0029 bf00          	ldw	c_x,x
 131  002b 320002        	pop	c_x+2
 132  002e 80            	iret	
 155                     ; 39 uint16_t getFlagTimer1( void )
 155                     ; 40 {
 157                     .text:	section	.text,new
 158  0000               _getFlagTimer1:
 162                     ; 41 	return flagTimer1;
 164  0000 be00          	ldw	x,L3_flagTimer1
 167  0002 81            	ret	
 202                     ; 44 void setFlagTimer1( uint16_t valor )
 202                     ; 45 {
 203                     .text:	section	.text,new
 204  0000               _setFlagTimer1:
 208                     ; 46 	flagTimer1 = valor;
 210  0000 bf00          	ldw	L3_flagTimer1,x
 211                     ; 47 }
 214  0002 81            	ret	
 241                     ; 50 void UART_RXNE_IRQHandler( void )
 241                     ; 51 {
 243                     .text:	section	.text,new
 244  0000               f_UART_RXNE_IRQHandler:
 246  0000 8a            	push	cc
 247  0001 84            	pop	a
 248  0002 a4bf          	and	a,#191
 249  0004 88            	push	a
 250  0005 86            	pop	cc
 251  0006 3b0002        	push	c_x+2
 252  0009 be00          	ldw	x,c_x
 253  000b 89            	pushw	x
 254  000c 3b0002        	push	c_y+2
 255  000f be00          	ldw	x,c_y
 256  0011 89            	pushw	x
 259                     ; 52 	++flagUartRXNE;
 261  0012 3c02          	inc	L5_flagUartRXNE
 262                     ; 53 	UART1_ClearITPendingBit( UART1_FLAG_RXNE );
 264  0014 ae0020        	ldw	x,#32
 265  0017 cd0000        	call	_UART1_ClearITPendingBit
 267                     ; 54 	UART1_ClearFlag( UART1_FLAG_RXNE );
 269  001a ae0020        	ldw	x,#32
 270  001d cd0000        	call	_UART1_ClearFlag
 272                     ; 55 }
 275  0020 85            	popw	x
 276  0021 bf00          	ldw	c_y,x
 277  0023 320002        	pop	c_y+2
 278  0026 85            	popw	x
 279  0027 bf00          	ldw	c_x,x
 280  0029 320002        	pop	c_x+2
 281  002c 80            	iret	
 304                     ; 57 uint8_t getFlagUartRXNE( void )
 304                     ; 58 {
 306                     .text:	section	.text,new
 307  0000               _getFlagUartRXNE:
 311                     ; 59 	return flagUartRXNE;
 313  0000 b602          	ld	a,L5_flagUartRXNE
 316  0002 81            	ret	
 351                     ; 62 void setFlagUartRXNE( uint8_t valor )
 351                     ; 63 {
 352                     .text:	section	.text,new
 353  0000               _setFlagUartRXNE:
 357                     ; 64 	flagUartRXNE = valor;
 359  0000 b702          	ld	L5_flagUartRXNE,a
 360                     ; 65 }
 363  0002 81            	ret	
 386                     ; 86 uint8_t ITC_GetCPUCC(void)
 386                     ; 87 {
 387                     .text:	section	.text,new
 388  0000               _ITC_GetCPUCC:
 392                     ; 89   _asm("push cc");
 395  0000 8a            	push	cc
 397                     ; 90   _asm("pop a");
 400  0001 84            	pop	a
 402                     ; 91   return; /* Ignore compiler warning, the returned value is in A register */
 405  0002 81            	ret	
 428                     ; 116 void ITC_DeInit(void)
 428                     ; 117 {
 429                     .text:	section	.text,new
 430  0000               _ITC_DeInit:
 434                     ; 118   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
 436  0000 35ff7f70      	mov	32624,#255
 437                     ; 119   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
 439  0004 35ff7f71      	mov	32625,#255
 440                     ; 120   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 442  0008 35ff7f72      	mov	32626,#255
 443                     ; 121   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 445  000c 35ff7f73      	mov	32627,#255
 446                     ; 122   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 448  0010 35ff7f74      	mov	32628,#255
 449                     ; 123   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 451  0014 35ff7f75      	mov	32629,#255
 452                     ; 124   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 454  0018 35ff7f76      	mov	32630,#255
 455                     ; 125   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 457  001c 35ff7f77      	mov	32631,#255
 458                     ; 126 }
 461  0020 81            	ret	
 486                     ; 133 uint8_t ITC_GetSoftIntStatus(void)
 486                     ; 134 {
 487                     .text:	section	.text,new
 488  0000               _ITC_GetSoftIntStatus:
 492                     ; 135   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 494  0000 cd0000        	call	_ITC_GetCPUCC
 496  0003 a428          	and	a,#40
 499  0005 81            	ret	
 748                     .const:	section	.text
 749  0000               L05:
 750  0000 0021          	dc.w	L161
 751  0002 0021          	dc.w	L161
 752  0004 0021          	dc.w	L161
 753  0006 0021          	dc.w	L161
 754  0008 0026          	dc.w	L361
 755  000a 0026          	dc.w	L361
 756  000c 0026          	dc.w	L361
 757  000e 0026          	dc.w	L361
 758  0010 0046          	dc.w	L323
 759  0012 0046          	dc.w	L323
 760  0014 002b          	dc.w	L561
 761  0016 002b          	dc.w	L561
 762  0018 0030          	dc.w	L761
 763  001a 0030          	dc.w	L761
 764  001c 0030          	dc.w	L761
 765  001e 0030          	dc.w	L761
 766  0020 0035          	dc.w	L171
 767  0022 0035          	dc.w	L171
 768  0024 0035          	dc.w	L171
 769  0026 0035          	dc.w	L171
 770  0028 0046          	dc.w	L323
 771  002a 0046          	dc.w	L323
 772  002c 003a          	dc.w	L371
 773  002e 003a          	dc.w	L371
 774  0030 003f          	dc.w	L571
 775                     ; 143 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 775                     ; 144 {
 776                     .text:	section	.text,new
 777  0000               _ITC_GetSoftwarePriority:
 779  0000 88            	push	a
 780  0001 89            	pushw	x
 781       00000002      OFST:	set	2
 784                     ; 145   uint8_t Value = 0;
 786  0002 0f02          	clr	(OFST+0,sp)
 788                     ; 146   uint8_t Mask = 0;
 790                     ; 149   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 792                     ; 152   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 794  0004 a403          	and	a,#3
 795  0006 48            	sll	a
 796  0007 5f            	clrw	x
 797  0008 97            	ld	xl,a
 798  0009 a603          	ld	a,#3
 799  000b 5d            	tnzw	x
 800  000c 2704          	jreq	L24
 801  000e               L44:
 802  000e 48            	sll	a
 803  000f 5a            	decw	x
 804  0010 26fc          	jrne	L44
 805  0012               L24:
 806  0012 6b01          	ld	(OFST-1,sp),a
 808                     ; 154   switch (IrqNum)
 810  0014 7b03          	ld	a,(OFST+1,sp)
 812                     ; 234   default:
 812                     ; 235     break;
 813  0016 a119          	cp	a,#25
 814  0018 242c          	jruge	L323
 815  001a 5f            	clrw	x
 816  001b 97            	ld	xl,a
 817  001c 58            	sllw	x
 818  001d de0000        	ldw	x,(L05,x)
 819  0020 fc            	jp	(x)
 820  0021               L161:
 821                     ; 156   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 821                     ; 157   case ITC_IRQ_AWU:
 821                     ; 158   case ITC_IRQ_CLK:
 821                     ; 159   case ITC_IRQ_PORTA:
 821                     ; 160     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 823  0021 c67f70        	ld	a,32624
 824                     ; 161     break;
 826  0024 201c          	jp	LC001
 827  0026               L361:
 828                     ; 163   case ITC_IRQ_PORTB:
 828                     ; 164   case ITC_IRQ_PORTC:
 828                     ; 165   case ITC_IRQ_PORTD:
 828                     ; 166   case ITC_IRQ_PORTE:
 828                     ; 167     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 830  0026 c67f71        	ld	a,32625
 831                     ; 168     break;
 833  0029 2017          	jp	LC001
 834  002b               L561:
 835                     ; 177   case ITC_IRQ_SPI:
 835                     ; 178   case ITC_IRQ_TIM1_OVF:
 835                     ; 179     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 837  002b c67f72        	ld	a,32626
 838                     ; 180     break;
 840  002e 2012          	jp	LC001
 841  0030               L761:
 842                     ; 182   case ITC_IRQ_TIM1_CAPCOM:
 842                     ; 183 #if defined (STM8S903) || defined (STM8AF622x)
 842                     ; 184   case ITC_IRQ_TIM5_OVFTRI:
 842                     ; 185   case ITC_IRQ_TIM5_CAPCOM:
 842                     ; 186 #else
 842                     ; 187   case ITC_IRQ_TIM2_OVF:
 842                     ; 188   case ITC_IRQ_TIM2_CAPCOM:
 842                     ; 189 #endif /* STM8S903 or STM8AF622x*/
 842                     ; 190   case ITC_IRQ_TIM3_OVF:
 842                     ; 191     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 844  0030 c67f73        	ld	a,32627
 845                     ; 192     break;
 847  0033 200d          	jp	LC001
 848  0035               L171:
 849                     ; 194   case ITC_IRQ_TIM3_CAPCOM:
 849                     ; 195 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 849                     ; 196     defined(STM8S003) ||defined(STM8S001) || defined (STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 849                     ; 197   case ITC_IRQ_UART1_TX:
 849                     ; 198   case ITC_IRQ_UART1_RX:
 849                     ; 199 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 849                     ; 200 #if defined(STM8AF622x)
 849                     ; 201   case ITC_IRQ_UART4_TX:
 849                     ; 202   case ITC_IRQ_UART4_RX:
 849                     ; 203 #endif /*STM8AF622x */
 849                     ; 204   case ITC_IRQ_I2C:
 849                     ; 205     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 851  0035 c67f74        	ld	a,32628
 852                     ; 206     break;
 854  0038 2008          	jp	LC001
 855  003a               L371:
 856                     ; 220   case ITC_IRQ_ADC1:
 856                     ; 221 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 856                     ; 222 #if defined (STM8S903) || defined (STM8AF622x)
 856                     ; 223   case ITC_IRQ_TIM6_OVFTRI:
 856                     ; 224 #else
 856                     ; 225   case ITC_IRQ_TIM4_OVF:
 856                     ; 226 #endif /*STM8S903 or STM8AF622x */
 856                     ; 227     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 858  003a c67f75        	ld	a,32629
 859                     ; 228     break;
 861  003d 2003          	jp	LC001
 862  003f               L571:
 863                     ; 230   case ITC_IRQ_EEPROM_EEC:
 863                     ; 231     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 865  003f c67f76        	ld	a,32630
 866  0042               LC001:
 867  0042 1401          	and	a,(OFST-1,sp)
 868  0044 6b02          	ld	(OFST+0,sp),a
 870                     ; 232     break;
 872                     ; 234   default:
 872                     ; 235     break;
 874  0046               L323:
 875                     ; 238   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 877  0046 7b03          	ld	a,(OFST+1,sp)
 878  0048 a403          	and	a,#3
 879  004a 48            	sll	a
 880  004b 5f            	clrw	x
 881  004c 97            	ld	xl,a
 882  004d 7b02          	ld	a,(OFST+0,sp)
 883  004f 5d            	tnzw	x
 884  0050 2704          	jreq	L25
 885  0052               L45:
 886  0052 44            	srl	a
 887  0053 5a            	decw	x
 888  0054 26fc          	jrne	L45
 889  0056               L25:
 891                     ; 240   return((ITC_PriorityLevel_TypeDef)Value);
 895  0056 5b03          	addw	sp,#3
 896  0058 81            	ret	
 960                     	switch	.const
 961  0032               L27:
 962  0032 0036          	dc.w	L523
 963  0034 0036          	dc.w	L523
 964  0036 0036          	dc.w	L523
 965  0038 0036          	dc.w	L523
 966  003a 0048          	dc.w	L723
 967  003c 0048          	dc.w	L723
 968  003e 0048          	dc.w	L723
 969  0040 0048          	dc.w	L723
 970  0042 00b2          	dc.w	L104
 971  0044 00b2          	dc.w	L104
 972  0046 005a          	dc.w	L133
 973  0048 005a          	dc.w	L133
 974  004a 006c          	dc.w	L333
 975  004c 006c          	dc.w	L333
 976  004e 006c          	dc.w	L333
 977  0050 006c          	dc.w	L333
 978  0052 007e          	dc.w	L533
 979  0054 007e          	dc.w	L533
 980  0056 007e          	dc.w	L533
 981  0058 007e          	dc.w	L533
 982  005a 00b2          	dc.w	L104
 983  005c 00b2          	dc.w	L104
 984  005e 0090          	dc.w	L733
 985  0060 0090          	dc.w	L733
 986  0062 00a2          	dc.w	L143
 987                     ; 256 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 987                     ; 257 {
 988                     .text:	section	.text,new
 989  0000               _ITC_SetSoftwarePriority:
 991  0000 89            	pushw	x
 992  0001 89            	pushw	x
 993       00000002      OFST:	set	2
 996                     ; 258   uint8_t Mask = 0;
 998                     ; 259   uint8_t NewPriority = 0;
1000                     ; 262   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
1002                     ; 263   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
1004                     ; 266   assert_param(IS_ITC_INTERRUPTS_DISABLED);
1006                     ; 270   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
1008  0002 9e            	ld	a,xh
1009  0003 a403          	and	a,#3
1010  0005 48            	sll	a
1011  0006 5f            	clrw	x
1012  0007 97            	ld	xl,a
1013  0008 a603          	ld	a,#3
1014  000a 5d            	tnzw	x
1015  000b 2704          	jreq	L06
1016  000d               L26:
1017  000d 48            	sll	a
1018  000e 5a            	decw	x
1019  000f 26fc          	jrne	L26
1020  0011               L06:
1021  0011 43            	cpl	a
1022  0012 6b01          	ld	(OFST-1,sp),a
1024                     ; 273   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
1026  0014 7b03          	ld	a,(OFST+1,sp)
1027  0016 a403          	and	a,#3
1028  0018 48            	sll	a
1029  0019 5f            	clrw	x
1030  001a 97            	ld	xl,a
1031  001b 7b04          	ld	a,(OFST+2,sp)
1032  001d 5d            	tnzw	x
1033  001e 2704          	jreq	L46
1034  0020               L66:
1035  0020 48            	sll	a
1036  0021 5a            	decw	x
1037  0022 26fc          	jrne	L66
1038  0024               L46:
1039  0024 6b02          	ld	(OFST+0,sp),a
1041                     ; 275   switch (IrqNum)
1043  0026 7b03          	ld	a,(OFST+1,sp)
1045                     ; 365   default:
1045                     ; 366     break;
1046  0028 a119          	cp	a,#25
1047  002a 2503cc00b2    	jruge	L104
1048  002f 5f            	clrw	x
1049  0030 97            	ld	xl,a
1050  0031 58            	sllw	x
1051  0032 de0032        	ldw	x,(L27,x)
1052  0035 fc            	jp	(x)
1053  0036               L523:
1054                     ; 277   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
1054                     ; 278   case ITC_IRQ_AWU:
1054                     ; 279   case ITC_IRQ_CLK:
1054                     ; 280   case ITC_IRQ_PORTA:
1054                     ; 281     ITC->ISPR1 &= Mask;
1056  0036 c67f70        	ld	a,32624
1057  0039 1401          	and	a,(OFST-1,sp)
1058  003b c77f70        	ld	32624,a
1059                     ; 282     ITC->ISPR1 |= NewPriority;
1061  003e c67f70        	ld	a,32624
1062  0041 1a02          	or	a,(OFST+0,sp)
1063  0043 c77f70        	ld	32624,a
1064                     ; 283     break;
1066  0046 206a          	jra	L104
1067  0048               L723:
1068                     ; 285   case ITC_IRQ_PORTB:
1068                     ; 286   case ITC_IRQ_PORTC:
1068                     ; 287   case ITC_IRQ_PORTD:
1068                     ; 288   case ITC_IRQ_PORTE:
1068                     ; 289     ITC->ISPR2 &= Mask;
1070  0048 c67f71        	ld	a,32625
1071  004b 1401          	and	a,(OFST-1,sp)
1072  004d c77f71        	ld	32625,a
1073                     ; 290     ITC->ISPR2 |= NewPriority;
1075  0050 c67f71        	ld	a,32625
1076  0053 1a02          	or	a,(OFST+0,sp)
1077  0055 c77f71        	ld	32625,a
1078                     ; 291     break;
1080  0058 2058          	jra	L104
1081  005a               L133:
1082                     ; 300   case ITC_IRQ_SPI:
1082                     ; 301   case ITC_IRQ_TIM1_OVF:
1082                     ; 302     ITC->ISPR3 &= Mask;
1084  005a c67f72        	ld	a,32626
1085  005d 1401          	and	a,(OFST-1,sp)
1086  005f c77f72        	ld	32626,a
1087                     ; 303     ITC->ISPR3 |= NewPriority;
1089  0062 c67f72        	ld	a,32626
1090  0065 1a02          	or	a,(OFST+0,sp)
1091  0067 c77f72        	ld	32626,a
1092                     ; 304     break;
1094  006a 2046          	jra	L104
1095  006c               L333:
1096                     ; 306   case ITC_IRQ_TIM1_CAPCOM:
1096                     ; 307 #if defined(STM8S903) || defined(STM8AF622x) 
1096                     ; 308   case ITC_IRQ_TIM5_OVFTRI:
1096                     ; 309   case ITC_IRQ_TIM5_CAPCOM:
1096                     ; 310 #else
1096                     ; 311   case ITC_IRQ_TIM2_OVF:
1096                     ; 312   case ITC_IRQ_TIM2_CAPCOM:
1096                     ; 313 #endif /*STM8S903 or STM8AF622x */
1096                     ; 314   case ITC_IRQ_TIM3_OVF:
1096                     ; 315     ITC->ISPR4 &= Mask;
1098  006c c67f73        	ld	a,32627
1099  006f 1401          	and	a,(OFST-1,sp)
1100  0071 c77f73        	ld	32627,a
1101                     ; 316     ITC->ISPR4 |= NewPriority;
1103  0074 c67f73        	ld	a,32627
1104  0077 1a02          	or	a,(OFST+0,sp)
1105  0079 c77f73        	ld	32627,a
1106                     ; 317     break;
1108  007c 2034          	jra	L104
1109  007e               L533:
1110                     ; 319   case ITC_IRQ_TIM3_CAPCOM:
1110                     ; 320 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
1110                     ; 321     defined(STM8S001) ||defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
1110                     ; 322   case ITC_IRQ_UART1_TX:
1110                     ; 323   case ITC_IRQ_UART1_RX:
1110                     ; 324 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
1110                     ; 325 #if defined(STM8AF622x)
1110                     ; 326   case ITC_IRQ_UART4_TX:
1110                     ; 327   case ITC_IRQ_UART4_RX:
1110                     ; 328 #endif /*STM8AF622x */
1110                     ; 329   case ITC_IRQ_I2C:
1110                     ; 330     ITC->ISPR5 &= Mask;
1112  007e c67f74        	ld	a,32628
1113  0081 1401          	and	a,(OFST-1,sp)
1114  0083 c77f74        	ld	32628,a
1115                     ; 331     ITC->ISPR5 |= NewPriority;
1117  0086 c67f74        	ld	a,32628
1118  0089 1a02          	or	a,(OFST+0,sp)
1119  008b c77f74        	ld	32628,a
1120                     ; 332     break;
1122  008e 2022          	jra	L104
1123  0090               L733:
1124                     ; 348   case ITC_IRQ_ADC1:
1124                     ; 349 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
1124                     ; 350     
1124                     ; 351 #if defined (STM8S903) || defined (STM8AF622x)
1124                     ; 352   case ITC_IRQ_TIM6_OVFTRI:
1124                     ; 353 #else
1124                     ; 354   case ITC_IRQ_TIM4_OVF:
1124                     ; 355 #endif /* STM8S903 or STM8AF622x */
1124                     ; 356     ITC->ISPR6 &= Mask;
1126  0090 c67f75        	ld	a,32629
1127  0093 1401          	and	a,(OFST-1,sp)
1128  0095 c77f75        	ld	32629,a
1129                     ; 357     ITC->ISPR6 |= NewPriority;
1131  0098 c67f75        	ld	a,32629
1132  009b 1a02          	or	a,(OFST+0,sp)
1133  009d c77f75        	ld	32629,a
1134                     ; 358     break;
1136  00a0 2010          	jra	L104
1137  00a2               L143:
1138                     ; 360   case ITC_IRQ_EEPROM_EEC:
1138                     ; 361     ITC->ISPR7 &= Mask;
1140  00a2 c67f76        	ld	a,32630
1141  00a5 1401          	and	a,(OFST-1,sp)
1142  00a7 c77f76        	ld	32630,a
1143                     ; 362     ITC->ISPR7 |= NewPriority;
1145  00aa c67f76        	ld	a,32630
1146  00ad 1a02          	or	a,(OFST+0,sp)
1147  00af c77f76        	ld	32630,a
1148                     ; 363     break;
1150                     ; 365   default:
1150                     ; 366     break;
1152  00b2               L104:
1153                     ; 368 }
1156  00b2 5b04          	addw	sp,#4
1157  00b4 81            	ret	
1170                     	xdef	_ITC_GetSoftwarePriority
1171                     	xdef	_ITC_SetSoftwarePriority
1172                     	xdef	_ITC_GetSoftIntStatus
1173                     	xdef	_ITC_DeInit
1174                     	xdef	_ITC_GetCPUCC
1175                     	xdef	_setFlagUartRXNE
1176                     	xdef	_getFlagUartRXNE
1177                     	xdef	f_UART_RXNE_IRQHandler
1178                     	xdef	_setFlagTimer1
1179                     	xdef	_getFlagTimer1
1180                     	xdef	f_TIM1_OV_IRQHandler
1181                     	xref	_UART1_ClearITPendingBit
1182                     	xref	_UART1_ClearFlag
1183                     	xref	_TIM1_ClearITPendingBit
1184                     	xref	_TIM1_ClearFlag
1185                     	xref.b	c_x
1186                     	xref.b	c_y
1205                     	end

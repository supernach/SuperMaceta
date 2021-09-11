   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 00            	dc.b	0
  80                     ; 32 void TIM1_OV_IRQHandler( void )
  80                     ; 33 {
  81                     .text:	section	.text,new
  82  0000               f_TIM1_OV_IRQHandler:
  84  0000 8a            	push	cc
  85  0001 84            	pop	a
  86  0002 a4bf          	and	a,#191
  87  0004 88            	push	a
  88  0005 86            	pop	cc
  89  0006 3b0002        	push	c_x+2
  90  0009 be00          	ldw	x,c_x
  91  000b 89            	pushw	x
  92  000c 3b0002        	push	c_y+2
  93  000f be00          	ldw	x,c_y
  94  0011 89            	pushw	x
  97                     ; 34 	++flagTimer1;
  99  0012 3c00          	inc	L3_flagTimer1
 100                     ; 35 	TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
 102  0014 a601          	ld	a,#1
 103  0016 cd0000        	call	_TIM1_ClearITPendingBit
 105                     ; 36 	TIM1_ClearFlag(TIM1_FLAG_UPDATE);
 107  0019 ae0001        	ldw	x,#1
 108  001c cd0000        	call	_TIM1_ClearFlag
 110                     ; 37 }
 113  001f 85            	popw	x
 114  0020 bf00          	ldw	c_y,x
 115  0022 320002        	pop	c_y+2
 116  0025 85            	popw	x
 117  0026 bf00          	ldw	c_x,x
 118  0028 320002        	pop	c_x+2
 119  002b 80            	iret	
 142                     ; 39 uint8_t getFlagTimer1( void )
 142                     ; 40 {
 144                     .text:	section	.text,new
 145  0000               _getFlagTimer1:
 149                     ; 41 	return flagTimer1;
 151  0000 b600          	ld	a,L3_flagTimer1
 154  0002 81            	ret	
 189                     ; 44 void setFlagTimer1( uint8_t valor )
 189                     ; 45 {
 190                     .text:	section	.text,new
 191  0000               _setFlagTimer1:
 195                     ; 46 	flagTimer1 = valor;
 197  0000 b700          	ld	L3_flagTimer1,a
 198                     ; 47 }
 201  0002 81            	ret	
 224                     ; 67 uint8_t ITC_GetCPUCC(void)
 224                     ; 68 {
 225                     .text:	section	.text,new
 226  0000               _ITC_GetCPUCC:
 230                     ; 70   _asm("push cc");
 233  0000 8a            	push	cc
 235                     ; 71   _asm("pop a");
 238  0001 84            	pop	a
 240                     ; 72   return; /* Ignore compiler warning, the returned value is in A register */
 243  0002 81            	ret	
 266                     ; 97 void ITC_DeInit(void)
 266                     ; 98 {
 267                     .text:	section	.text,new
 268  0000               _ITC_DeInit:
 272                     ; 99   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
 274  0000 35ff7f70      	mov	32624,#255
 275                     ; 100   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
 277  0004 35ff7f71      	mov	32625,#255
 278                     ; 101   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 280  0008 35ff7f72      	mov	32626,#255
 281                     ; 102   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 283  000c 35ff7f73      	mov	32627,#255
 284                     ; 103   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 286  0010 35ff7f74      	mov	32628,#255
 287                     ; 104   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 289  0014 35ff7f75      	mov	32629,#255
 290                     ; 105   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 292  0018 35ff7f76      	mov	32630,#255
 293                     ; 106   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 295  001c 35ff7f77      	mov	32631,#255
 296                     ; 107 }
 299  0020 81            	ret	
 324                     ; 114 uint8_t ITC_GetSoftIntStatus(void)
 324                     ; 115 {
 325                     .text:	section	.text,new
 326  0000               _ITC_GetSoftIntStatus:
 330                     ; 116   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 332  0000 cd0000        	call	_ITC_GetCPUCC
 334  0003 a428          	and	a,#40
 337  0005 81            	ret	
 586                     .const:	section	.text
 587  0000               L63:
 588  0000 0021          	dc.w	L511
 589  0002 0021          	dc.w	L511
 590  0004 0021          	dc.w	L511
 591  0006 0021          	dc.w	L511
 592  0008 0026          	dc.w	L711
 593  000a 0026          	dc.w	L711
 594  000c 0026          	dc.w	L711
 595  000e 0026          	dc.w	L711
 596  0010 0046          	dc.w	L752
 597  0012 0046          	dc.w	L752
 598  0014 002b          	dc.w	L121
 599  0016 002b          	dc.w	L121
 600  0018 0030          	dc.w	L321
 601  001a 0030          	dc.w	L321
 602  001c 0030          	dc.w	L321
 603  001e 0030          	dc.w	L321
 604  0020 0035          	dc.w	L521
 605  0022 0035          	dc.w	L521
 606  0024 0035          	dc.w	L521
 607  0026 0035          	dc.w	L521
 608  0028 0046          	dc.w	L752
 609  002a 0046          	dc.w	L752
 610  002c 003a          	dc.w	L721
 611  002e 003a          	dc.w	L721
 612  0030 003f          	dc.w	L131
 613                     ; 124 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 613                     ; 125 {
 614                     .text:	section	.text,new
 615  0000               _ITC_GetSoftwarePriority:
 617  0000 88            	push	a
 618  0001 89            	pushw	x
 619       00000002      OFST:	set	2
 622                     ; 126   uint8_t Value = 0;
 624  0002 0f02          	clr	(OFST+0,sp)
 626                     ; 127   uint8_t Mask = 0;
 628                     ; 130   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 630                     ; 133   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 632  0004 a403          	and	a,#3
 633  0006 48            	sll	a
 634  0007 5f            	clrw	x
 635  0008 97            	ld	xl,a
 636  0009 a603          	ld	a,#3
 637  000b 5d            	tnzw	x
 638  000c 2704          	jreq	L03
 639  000e               L23:
 640  000e 48            	sll	a
 641  000f 5a            	decw	x
 642  0010 26fc          	jrne	L23
 643  0012               L03:
 644  0012 6b01          	ld	(OFST-1,sp),a
 646                     ; 135   switch (IrqNum)
 648  0014 7b03          	ld	a,(OFST+1,sp)
 650                     ; 215   default:
 650                     ; 216     break;
 651  0016 a119          	cp	a,#25
 652  0018 242c          	jruge	L752
 653  001a 5f            	clrw	x
 654  001b 97            	ld	xl,a
 655  001c 58            	sllw	x
 656  001d de0000        	ldw	x,(L63,x)
 657  0020 fc            	jp	(x)
 658  0021               L511:
 659                     ; 137   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 659                     ; 138   case ITC_IRQ_AWU:
 659                     ; 139   case ITC_IRQ_CLK:
 659                     ; 140   case ITC_IRQ_PORTA:
 659                     ; 141     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 661  0021 c67f70        	ld	a,32624
 662                     ; 142     break;
 664  0024 201c          	jp	LC001
 665  0026               L711:
 666                     ; 144   case ITC_IRQ_PORTB:
 666                     ; 145   case ITC_IRQ_PORTC:
 666                     ; 146   case ITC_IRQ_PORTD:
 666                     ; 147   case ITC_IRQ_PORTE:
 666                     ; 148     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 668  0026 c67f71        	ld	a,32625
 669                     ; 149     break;
 671  0029 2017          	jp	LC001
 672  002b               L121:
 673                     ; 158   case ITC_IRQ_SPI:
 673                     ; 159   case ITC_IRQ_TIM1_OVF:
 673                     ; 160     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 675  002b c67f72        	ld	a,32626
 676                     ; 161     break;
 678  002e 2012          	jp	LC001
 679  0030               L321:
 680                     ; 163   case ITC_IRQ_TIM1_CAPCOM:
 680                     ; 164 #if defined (STM8S903) || defined (STM8AF622x)
 680                     ; 165   case ITC_IRQ_TIM5_OVFTRI:
 680                     ; 166   case ITC_IRQ_TIM5_CAPCOM:
 680                     ; 167 #else
 680                     ; 168   case ITC_IRQ_TIM2_OVF:
 680                     ; 169   case ITC_IRQ_TIM2_CAPCOM:
 680                     ; 170 #endif /* STM8S903 or STM8AF622x*/
 680                     ; 171   case ITC_IRQ_TIM3_OVF:
 680                     ; 172     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 682  0030 c67f73        	ld	a,32627
 683                     ; 173     break;
 685  0033 200d          	jp	LC001
 686  0035               L521:
 687                     ; 175   case ITC_IRQ_TIM3_CAPCOM:
 687                     ; 176 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 687                     ; 177     defined(STM8S003) ||defined(STM8S001) || defined (STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 687                     ; 178   case ITC_IRQ_UART1_TX:
 687                     ; 179   case ITC_IRQ_UART1_RX:
 687                     ; 180 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 687                     ; 181 #if defined(STM8AF622x)
 687                     ; 182   case ITC_IRQ_UART4_TX:
 687                     ; 183   case ITC_IRQ_UART4_RX:
 687                     ; 184 #endif /*STM8AF622x */
 687                     ; 185   case ITC_IRQ_I2C:
 687                     ; 186     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 689  0035 c67f74        	ld	a,32628
 690                     ; 187     break;
 692  0038 2008          	jp	LC001
 693  003a               L721:
 694                     ; 201   case ITC_IRQ_ADC1:
 694                     ; 202 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 694                     ; 203 #if defined (STM8S903) || defined (STM8AF622x)
 694                     ; 204   case ITC_IRQ_TIM6_OVFTRI:
 694                     ; 205 #else
 694                     ; 206   case ITC_IRQ_TIM4_OVF:
 694                     ; 207 #endif /*STM8S903 or STM8AF622x */
 694                     ; 208     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 696  003a c67f75        	ld	a,32629
 697                     ; 209     break;
 699  003d 2003          	jp	LC001
 700  003f               L131:
 701                     ; 211   case ITC_IRQ_EEPROM_EEC:
 701                     ; 212     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 703  003f c67f76        	ld	a,32630
 704  0042               LC001:
 705  0042 1401          	and	a,(OFST-1,sp)
 706  0044 6b02          	ld	(OFST+0,sp),a
 708                     ; 213     break;
 710                     ; 215   default:
 710                     ; 216     break;
 712  0046               L752:
 713                     ; 219   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 715  0046 7b03          	ld	a,(OFST+1,sp)
 716  0048 a403          	and	a,#3
 717  004a 48            	sll	a
 718  004b 5f            	clrw	x
 719  004c 97            	ld	xl,a
 720  004d 7b02          	ld	a,(OFST+0,sp)
 721  004f 5d            	tnzw	x
 722  0050 2704          	jreq	L04
 723  0052               L24:
 724  0052 44            	srl	a
 725  0053 5a            	decw	x
 726  0054 26fc          	jrne	L24
 727  0056               L04:
 729                     ; 221   return((ITC_PriorityLevel_TypeDef)Value);
 733  0056 5b03          	addw	sp,#3
 734  0058 81            	ret	
 798                     	switch	.const
 799  0032               L06:
 800  0032 0036          	dc.w	L162
 801  0034 0036          	dc.w	L162
 802  0036 0036          	dc.w	L162
 803  0038 0036          	dc.w	L162
 804  003a 0048          	dc.w	L362
 805  003c 0048          	dc.w	L362
 806  003e 0048          	dc.w	L362
 807  0040 0048          	dc.w	L362
 808  0042 00b2          	dc.w	L533
 809  0044 00b2          	dc.w	L533
 810  0046 005a          	dc.w	L562
 811  0048 005a          	dc.w	L562
 812  004a 006c          	dc.w	L762
 813  004c 006c          	dc.w	L762
 814  004e 006c          	dc.w	L762
 815  0050 006c          	dc.w	L762
 816  0052 007e          	dc.w	L172
 817  0054 007e          	dc.w	L172
 818  0056 007e          	dc.w	L172
 819  0058 007e          	dc.w	L172
 820  005a 00b2          	dc.w	L533
 821  005c 00b2          	dc.w	L533
 822  005e 0090          	dc.w	L372
 823  0060 0090          	dc.w	L372
 824  0062 00a2          	dc.w	L572
 825                     ; 237 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 825                     ; 238 {
 826                     .text:	section	.text,new
 827  0000               _ITC_SetSoftwarePriority:
 829  0000 89            	pushw	x
 830  0001 89            	pushw	x
 831       00000002      OFST:	set	2
 834                     ; 239   uint8_t Mask = 0;
 836                     ; 240   uint8_t NewPriority = 0;
 838                     ; 243   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 840                     ; 244   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 842                     ; 247   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 844                     ; 251   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 846  0002 9e            	ld	a,xh
 847  0003 a403          	and	a,#3
 848  0005 48            	sll	a
 849  0006 5f            	clrw	x
 850  0007 97            	ld	xl,a
 851  0008 a603          	ld	a,#3
 852  000a 5d            	tnzw	x
 853  000b 2704          	jreq	L64
 854  000d               L05:
 855  000d 48            	sll	a
 856  000e 5a            	decw	x
 857  000f 26fc          	jrne	L05
 858  0011               L64:
 859  0011 43            	cpl	a
 860  0012 6b01          	ld	(OFST-1,sp),a
 862                     ; 254   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 864  0014 7b03          	ld	a,(OFST+1,sp)
 865  0016 a403          	and	a,#3
 866  0018 48            	sll	a
 867  0019 5f            	clrw	x
 868  001a 97            	ld	xl,a
 869  001b 7b04          	ld	a,(OFST+2,sp)
 870  001d 5d            	tnzw	x
 871  001e 2704          	jreq	L25
 872  0020               L45:
 873  0020 48            	sll	a
 874  0021 5a            	decw	x
 875  0022 26fc          	jrne	L45
 876  0024               L25:
 877  0024 6b02          	ld	(OFST+0,sp),a
 879                     ; 256   switch (IrqNum)
 881  0026 7b03          	ld	a,(OFST+1,sp)
 883                     ; 346   default:
 883                     ; 347     break;
 884  0028 a119          	cp	a,#25
 885  002a 2503cc00b2    	jruge	L533
 886  002f 5f            	clrw	x
 887  0030 97            	ld	xl,a
 888  0031 58            	sllw	x
 889  0032 de0032        	ldw	x,(L06,x)
 890  0035 fc            	jp	(x)
 891  0036               L162:
 892                     ; 258   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 892                     ; 259   case ITC_IRQ_AWU:
 892                     ; 260   case ITC_IRQ_CLK:
 892                     ; 261   case ITC_IRQ_PORTA:
 892                     ; 262     ITC->ISPR1 &= Mask;
 894  0036 c67f70        	ld	a,32624
 895  0039 1401          	and	a,(OFST-1,sp)
 896  003b c77f70        	ld	32624,a
 897                     ; 263     ITC->ISPR1 |= NewPriority;
 899  003e c67f70        	ld	a,32624
 900  0041 1a02          	or	a,(OFST+0,sp)
 901  0043 c77f70        	ld	32624,a
 902                     ; 264     break;
 904  0046 206a          	jra	L533
 905  0048               L362:
 906                     ; 266   case ITC_IRQ_PORTB:
 906                     ; 267   case ITC_IRQ_PORTC:
 906                     ; 268   case ITC_IRQ_PORTD:
 906                     ; 269   case ITC_IRQ_PORTE:
 906                     ; 270     ITC->ISPR2 &= Mask;
 908  0048 c67f71        	ld	a,32625
 909  004b 1401          	and	a,(OFST-1,sp)
 910  004d c77f71        	ld	32625,a
 911                     ; 271     ITC->ISPR2 |= NewPriority;
 913  0050 c67f71        	ld	a,32625
 914  0053 1a02          	or	a,(OFST+0,sp)
 915  0055 c77f71        	ld	32625,a
 916                     ; 272     break;
 918  0058 2058          	jra	L533
 919  005a               L562:
 920                     ; 281   case ITC_IRQ_SPI:
 920                     ; 282   case ITC_IRQ_TIM1_OVF:
 920                     ; 283     ITC->ISPR3 &= Mask;
 922  005a c67f72        	ld	a,32626
 923  005d 1401          	and	a,(OFST-1,sp)
 924  005f c77f72        	ld	32626,a
 925                     ; 284     ITC->ISPR3 |= NewPriority;
 927  0062 c67f72        	ld	a,32626
 928  0065 1a02          	or	a,(OFST+0,sp)
 929  0067 c77f72        	ld	32626,a
 930                     ; 285     break;
 932  006a 2046          	jra	L533
 933  006c               L762:
 934                     ; 287   case ITC_IRQ_TIM1_CAPCOM:
 934                     ; 288 #if defined(STM8S903) || defined(STM8AF622x) 
 934                     ; 289   case ITC_IRQ_TIM5_OVFTRI:
 934                     ; 290   case ITC_IRQ_TIM5_CAPCOM:
 934                     ; 291 #else
 934                     ; 292   case ITC_IRQ_TIM2_OVF:
 934                     ; 293   case ITC_IRQ_TIM2_CAPCOM:
 934                     ; 294 #endif /*STM8S903 or STM8AF622x */
 934                     ; 295   case ITC_IRQ_TIM3_OVF:
 934                     ; 296     ITC->ISPR4 &= Mask;
 936  006c c67f73        	ld	a,32627
 937  006f 1401          	and	a,(OFST-1,sp)
 938  0071 c77f73        	ld	32627,a
 939                     ; 297     ITC->ISPR4 |= NewPriority;
 941  0074 c67f73        	ld	a,32627
 942  0077 1a02          	or	a,(OFST+0,sp)
 943  0079 c77f73        	ld	32627,a
 944                     ; 298     break;
 946  007c 2034          	jra	L533
 947  007e               L172:
 948                     ; 300   case ITC_IRQ_TIM3_CAPCOM:
 948                     ; 301 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 948                     ; 302     defined(STM8S001) ||defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 948                     ; 303   case ITC_IRQ_UART1_TX:
 948                     ; 304   case ITC_IRQ_UART1_RX:
 948                     ; 305 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 948                     ; 306 #if defined(STM8AF622x)
 948                     ; 307   case ITC_IRQ_UART4_TX:
 948                     ; 308   case ITC_IRQ_UART4_RX:
 948                     ; 309 #endif /*STM8AF622x */
 948                     ; 310   case ITC_IRQ_I2C:
 948                     ; 311     ITC->ISPR5 &= Mask;
 950  007e c67f74        	ld	a,32628
 951  0081 1401          	and	a,(OFST-1,sp)
 952  0083 c77f74        	ld	32628,a
 953                     ; 312     ITC->ISPR5 |= NewPriority;
 955  0086 c67f74        	ld	a,32628
 956  0089 1a02          	or	a,(OFST+0,sp)
 957  008b c77f74        	ld	32628,a
 958                     ; 313     break;
 960  008e 2022          	jra	L533
 961  0090               L372:
 962                     ; 329   case ITC_IRQ_ADC1:
 962                     ; 330 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 962                     ; 331     
 962                     ; 332 #if defined (STM8S903) || defined (STM8AF622x)
 962                     ; 333   case ITC_IRQ_TIM6_OVFTRI:
 962                     ; 334 #else
 962                     ; 335   case ITC_IRQ_TIM4_OVF:
 962                     ; 336 #endif /* STM8S903 or STM8AF622x */
 962                     ; 337     ITC->ISPR6 &= Mask;
 964  0090 c67f75        	ld	a,32629
 965  0093 1401          	and	a,(OFST-1,sp)
 966  0095 c77f75        	ld	32629,a
 967                     ; 338     ITC->ISPR6 |= NewPriority;
 969  0098 c67f75        	ld	a,32629
 970  009b 1a02          	or	a,(OFST+0,sp)
 971  009d c77f75        	ld	32629,a
 972                     ; 339     break;
 974  00a0 2010          	jra	L533
 975  00a2               L572:
 976                     ; 341   case ITC_IRQ_EEPROM_EEC:
 976                     ; 342     ITC->ISPR7 &= Mask;
 978  00a2 c67f76        	ld	a,32630
 979  00a5 1401          	and	a,(OFST-1,sp)
 980  00a7 c77f76        	ld	32630,a
 981                     ; 343     ITC->ISPR7 |= NewPriority;
 983  00aa c67f76        	ld	a,32630
 984  00ad 1a02          	or	a,(OFST+0,sp)
 985  00af c77f76        	ld	32630,a
 986                     ; 344     break;
 988                     ; 346   default:
 988                     ; 347     break;
 990  00b2               L533:
 991                     ; 349 }
 994  00b2 5b04          	addw	sp,#4
 995  00b4 81            	ret	
1008                     	xdef	_ITC_GetSoftwarePriority
1009                     	xdef	_ITC_SetSoftwarePriority
1010                     	xdef	_ITC_GetSoftIntStatus
1011                     	xdef	_ITC_DeInit
1012                     	xdef	_ITC_GetCPUCC
1013                     	xdef	_setFlagTimer1
1014                     	xdef	_getFlagTimer1
1015                     	xdef	f_TIM1_OV_IRQHandler
1016                     	xref	_TIM1_ClearITPendingBit
1017                     	xref	_TIM1_ClearFlag
1018                     	xref.b	c_x
1019                     	xref.b	c_y
1038                     	end

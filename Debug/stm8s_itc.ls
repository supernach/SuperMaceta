   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  46                     ; 50 uint8_t ITC_GetCPUCC(void)
  46                     ; 51 {
  48                     .text:	section	.text,new
  49  0000               _ITC_GetCPUCC:
  53                     ; 53   _asm("push cc");
  56  0000 8a            	push	cc
  58                     ; 54   _asm("pop a");
  61  0001 84            	pop	a
  63                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  66  0002 81            	ret	
  89                     ; 80 void ITC_DeInit(void)
  89                     ; 81 {
  90                     .text:	section	.text,new
  91  0000               _ITC_DeInit:
  95                     ; 82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  97  0000 35ff7f70      	mov	32624,#255
  98                     ; 83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
 100  0004 35ff7f71      	mov	32625,#255
 101                     ; 84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 103  0008 35ff7f72      	mov	32626,#255
 104                     ; 85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 106  000c 35ff7f73      	mov	32627,#255
 107                     ; 86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 109  0010 35ff7f74      	mov	32628,#255
 110                     ; 87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 112  0014 35ff7f75      	mov	32629,#255
 113                     ; 88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 115  0018 35ff7f76      	mov	32630,#255
 116                     ; 89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 118  001c 35ff7f77      	mov	32631,#255
 119                     ; 90 }
 122  0020 81            	ret	
 147                     ; 97 uint8_t ITC_GetSoftIntStatus(void)
 147                     ; 98 {
 148                     .text:	section	.text,new
 149  0000               _ITC_GetSoftIntStatus:
 153                     ; 99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 155  0000 cd0000        	call	_ITC_GetCPUCC
 157  0003 a428          	and	a,#40
 160  0005 81            	ret	
 409                     .const:	section	.text
 410  0000               L42:
 411  0000 0021          	dc.w	L14
 412  0002 0021          	dc.w	L14
 413  0004 0021          	dc.w	L14
 414  0006 0021          	dc.w	L14
 415  0008 0026          	dc.w	L34
 416  000a 0026          	dc.w	L34
 417  000c 0026          	dc.w	L34
 418  000e 0026          	dc.w	L34
 419  0010 0046          	dc.w	L302
 420  0012 0046          	dc.w	L302
 421  0014 002b          	dc.w	L54
 422  0016 002b          	dc.w	L54
 423  0018 0030          	dc.w	L74
 424  001a 0030          	dc.w	L74
 425  001c 0030          	dc.w	L74
 426  001e 0030          	dc.w	L74
 427  0020 0035          	dc.w	L15
 428  0022 0035          	dc.w	L15
 429  0024 0035          	dc.w	L15
 430  0026 0035          	dc.w	L15
 431  0028 0046          	dc.w	L302
 432  002a 0046          	dc.w	L302
 433  002c 003a          	dc.w	L35
 434  002e 003a          	dc.w	L35
 435  0030 003f          	dc.w	L55
 436                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 436                     ; 108 {
 437                     .text:	section	.text,new
 438  0000               _ITC_GetSoftwarePriority:
 440  0000 88            	push	a
 441  0001 89            	pushw	x
 442       00000002      OFST:	set	2
 445                     ; 109   uint8_t Value = 0;
 447  0002 0f02          	clr	(OFST+0,sp)
 449                     ; 110   uint8_t Mask = 0;
 451                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 453                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 455  0004 a403          	and	a,#3
 456  0006 48            	sll	a
 457  0007 5f            	clrw	x
 458  0008 97            	ld	xl,a
 459  0009 a603          	ld	a,#3
 460  000b 5d            	tnzw	x
 461  000c 2704          	jreq	L61
 462  000e               L02:
 463  000e 48            	sll	a
 464  000f 5a            	decw	x
 465  0010 26fc          	jrne	L02
 466  0012               L61:
 467  0012 6b01          	ld	(OFST-1,sp),a
 469                     ; 118   switch (IrqNum)
 471  0014 7b03          	ld	a,(OFST+1,sp)
 473                     ; 198   default:
 473                     ; 199     break;
 474  0016 a119          	cp	a,#25
 475  0018 242c          	jruge	L302
 476  001a 5f            	clrw	x
 477  001b 97            	ld	xl,a
 478  001c 58            	sllw	x
 479  001d de0000        	ldw	x,(L42,x)
 480  0020 fc            	jp	(x)
 481  0021               L14:
 482                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 482                     ; 121   case ITC_IRQ_AWU:
 482                     ; 122   case ITC_IRQ_CLK:
 482                     ; 123   case ITC_IRQ_PORTA:
 482                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 484  0021 c67f70        	ld	a,32624
 485                     ; 125     break;
 487  0024 201c          	jp	LC001
 488  0026               L34:
 489                     ; 127   case ITC_IRQ_PORTB:
 489                     ; 128   case ITC_IRQ_PORTC:
 489                     ; 129   case ITC_IRQ_PORTD:
 489                     ; 130   case ITC_IRQ_PORTE:
 489                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 491  0026 c67f71        	ld	a,32625
 492                     ; 132     break;
 494  0029 2017          	jp	LC001
 495  002b               L54:
 496                     ; 141   case ITC_IRQ_SPI:
 496                     ; 142   case ITC_IRQ_TIM1_OVF:
 496                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 498  002b c67f72        	ld	a,32626
 499                     ; 144     break;
 501  002e 2012          	jp	LC001
 502  0030               L74:
 503                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 503                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 503                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 503                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 503                     ; 150 #else
 503                     ; 151   case ITC_IRQ_TIM2_OVF:
 503                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 503                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 503                     ; 154   case ITC_IRQ_TIM3_OVF:
 503                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 505  0030 c67f73        	ld	a,32627
 506                     ; 156     break;
 508  0033 200d          	jp	LC001
 509  0035               L15:
 510                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 510                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 510                     ; 160     defined(STM8S003) ||defined(STM8S001) || defined (STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 510                     ; 161   case ITC_IRQ_UART1_TX:
 510                     ; 162   case ITC_IRQ_UART1_RX:
 510                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 510                     ; 164 #if defined(STM8AF622x)
 510                     ; 165   case ITC_IRQ_UART4_TX:
 510                     ; 166   case ITC_IRQ_UART4_RX:
 510                     ; 167 #endif /*STM8AF622x */
 510                     ; 168   case ITC_IRQ_I2C:
 510                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 512  0035 c67f74        	ld	a,32628
 513                     ; 170     break;
 515  0038 2008          	jp	LC001
 516  003a               L35:
 517                     ; 184   case ITC_IRQ_ADC1:
 517                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 517                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 517                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 517                     ; 188 #else
 517                     ; 189   case ITC_IRQ_TIM4_OVF:
 517                     ; 190 #endif /*STM8S903 or STM8AF622x */
 517                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 519  003a c67f75        	ld	a,32629
 520                     ; 192     break;
 522  003d 2003          	jp	LC001
 523  003f               L55:
 524                     ; 194   case ITC_IRQ_EEPROM_EEC:
 524                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 526  003f c67f76        	ld	a,32630
 527  0042               LC001:
 528  0042 1401          	and	a,(OFST-1,sp)
 529  0044 6b02          	ld	(OFST+0,sp),a
 531                     ; 196     break;
 533                     ; 198   default:
 533                     ; 199     break;
 535  0046               L302:
 536                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 538  0046 7b03          	ld	a,(OFST+1,sp)
 539  0048 a403          	and	a,#3
 540  004a 48            	sll	a
 541  004b 5f            	clrw	x
 542  004c 97            	ld	xl,a
 543  004d 7b02          	ld	a,(OFST+0,sp)
 544  004f 5d            	tnzw	x
 545  0050 2704          	jreq	L62
 546  0052               L03:
 547  0052 44            	srl	a
 548  0053 5a            	decw	x
 549  0054 26fc          	jrne	L03
 550  0056               L62:
 552                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 556  0056 5b03          	addw	sp,#3
 557  0058 81            	ret	
 621                     	switch	.const
 622  0032               L64:
 623  0032 0036          	dc.w	L502
 624  0034 0036          	dc.w	L502
 625  0036 0036          	dc.w	L502
 626  0038 0036          	dc.w	L502
 627  003a 0048          	dc.w	L702
 628  003c 0048          	dc.w	L702
 629  003e 0048          	dc.w	L702
 630  0040 0048          	dc.w	L702
 631  0042 00b2          	dc.w	L162
 632  0044 00b2          	dc.w	L162
 633  0046 005a          	dc.w	L112
 634  0048 005a          	dc.w	L112
 635  004a 006c          	dc.w	L312
 636  004c 006c          	dc.w	L312
 637  004e 006c          	dc.w	L312
 638  0050 006c          	dc.w	L312
 639  0052 007e          	dc.w	L512
 640  0054 007e          	dc.w	L512
 641  0056 007e          	dc.w	L512
 642  0058 007e          	dc.w	L512
 643  005a 00b2          	dc.w	L162
 644  005c 00b2          	dc.w	L162
 645  005e 0090          	dc.w	L712
 646  0060 0090          	dc.w	L712
 647  0062 00a2          	dc.w	L122
 648                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 648                     ; 221 {
 649                     .text:	section	.text,new
 650  0000               _ITC_SetSoftwarePriority:
 652  0000 89            	pushw	x
 653  0001 89            	pushw	x
 654       00000002      OFST:	set	2
 657                     ; 222   uint8_t Mask = 0;
 659                     ; 223   uint8_t NewPriority = 0;
 661                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 663                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 665                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 667                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 669  0002 9e            	ld	a,xh
 670  0003 a403          	and	a,#3
 671  0005 48            	sll	a
 672  0006 5f            	clrw	x
 673  0007 97            	ld	xl,a
 674  0008 a603          	ld	a,#3
 675  000a 5d            	tnzw	x
 676  000b 2704          	jreq	L43
 677  000d               L63:
 678  000d 48            	sll	a
 679  000e 5a            	decw	x
 680  000f 26fc          	jrne	L63
 681  0011               L43:
 682  0011 43            	cpl	a
 683  0012 6b01          	ld	(OFST-1,sp),a
 685                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 687  0014 7b03          	ld	a,(OFST+1,sp)
 688  0016 a403          	and	a,#3
 689  0018 48            	sll	a
 690  0019 5f            	clrw	x
 691  001a 97            	ld	xl,a
 692  001b 7b04          	ld	a,(OFST+2,sp)
 693  001d 5d            	tnzw	x
 694  001e 2704          	jreq	L04
 695  0020               L24:
 696  0020 48            	sll	a
 697  0021 5a            	decw	x
 698  0022 26fc          	jrne	L24
 699  0024               L04:
 700  0024 6b02          	ld	(OFST+0,sp),a
 702                     ; 239   switch (IrqNum)
 704  0026 7b03          	ld	a,(OFST+1,sp)
 706                     ; 329   default:
 706                     ; 330     break;
 707  0028 a119          	cp	a,#25
 708  002a 2503cc00b2    	jruge	L162
 709  002f 5f            	clrw	x
 710  0030 97            	ld	xl,a
 711  0031 58            	sllw	x
 712  0032 de0032        	ldw	x,(L64,x)
 713  0035 fc            	jp	(x)
 714  0036               L502:
 715                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 715                     ; 242   case ITC_IRQ_AWU:
 715                     ; 243   case ITC_IRQ_CLK:
 715                     ; 244   case ITC_IRQ_PORTA:
 715                     ; 245     ITC->ISPR1 &= Mask;
 717  0036 c67f70        	ld	a,32624
 718  0039 1401          	and	a,(OFST-1,sp)
 719  003b c77f70        	ld	32624,a
 720                     ; 246     ITC->ISPR1 |= NewPriority;
 722  003e c67f70        	ld	a,32624
 723  0041 1a02          	or	a,(OFST+0,sp)
 724  0043 c77f70        	ld	32624,a
 725                     ; 247     break;
 727  0046 206a          	jra	L162
 728  0048               L702:
 729                     ; 249   case ITC_IRQ_PORTB:
 729                     ; 250   case ITC_IRQ_PORTC:
 729                     ; 251   case ITC_IRQ_PORTD:
 729                     ; 252   case ITC_IRQ_PORTE:
 729                     ; 253     ITC->ISPR2 &= Mask;
 731  0048 c67f71        	ld	a,32625
 732  004b 1401          	and	a,(OFST-1,sp)
 733  004d c77f71        	ld	32625,a
 734                     ; 254     ITC->ISPR2 |= NewPriority;
 736  0050 c67f71        	ld	a,32625
 737  0053 1a02          	or	a,(OFST+0,sp)
 738  0055 c77f71        	ld	32625,a
 739                     ; 255     break;
 741  0058 2058          	jra	L162
 742  005a               L112:
 743                     ; 264   case ITC_IRQ_SPI:
 743                     ; 265   case ITC_IRQ_TIM1_OVF:
 743                     ; 266     ITC->ISPR3 &= Mask;
 745  005a c67f72        	ld	a,32626
 746  005d 1401          	and	a,(OFST-1,sp)
 747  005f c77f72        	ld	32626,a
 748                     ; 267     ITC->ISPR3 |= NewPriority;
 750  0062 c67f72        	ld	a,32626
 751  0065 1a02          	or	a,(OFST+0,sp)
 752  0067 c77f72        	ld	32626,a
 753                     ; 268     break;
 755  006a 2046          	jra	L162
 756  006c               L312:
 757                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 757                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 757                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 757                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 757                     ; 274 #else
 757                     ; 275   case ITC_IRQ_TIM2_OVF:
 757                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 757                     ; 277 #endif /*STM8S903 or STM8AF622x */
 757                     ; 278   case ITC_IRQ_TIM3_OVF:
 757                     ; 279     ITC->ISPR4 &= Mask;
 759  006c c67f73        	ld	a,32627
 760  006f 1401          	and	a,(OFST-1,sp)
 761  0071 c77f73        	ld	32627,a
 762                     ; 280     ITC->ISPR4 |= NewPriority;
 764  0074 c67f73        	ld	a,32627
 765  0077 1a02          	or	a,(OFST+0,sp)
 766  0079 c77f73        	ld	32627,a
 767                     ; 281     break;
 769  007c 2034          	jra	L162
 770  007e               L512:
 771                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 771                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 771                     ; 285     defined(STM8S001) ||defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 771                     ; 286   case ITC_IRQ_UART1_TX:
 771                     ; 287   case ITC_IRQ_UART1_RX:
 771                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 771                     ; 289 #if defined(STM8AF622x)
 771                     ; 290   case ITC_IRQ_UART4_TX:
 771                     ; 291   case ITC_IRQ_UART4_RX:
 771                     ; 292 #endif /*STM8AF622x */
 771                     ; 293   case ITC_IRQ_I2C:
 771                     ; 294     ITC->ISPR5 &= Mask;
 773  007e c67f74        	ld	a,32628
 774  0081 1401          	and	a,(OFST-1,sp)
 775  0083 c77f74        	ld	32628,a
 776                     ; 295     ITC->ISPR5 |= NewPriority;
 778  0086 c67f74        	ld	a,32628
 779  0089 1a02          	or	a,(OFST+0,sp)
 780  008b c77f74        	ld	32628,a
 781                     ; 296     break;
 783  008e 2022          	jra	L162
 784  0090               L712:
 785                     ; 312   case ITC_IRQ_ADC1:
 785                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 785                     ; 314     
 785                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 785                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 785                     ; 317 #else
 785                     ; 318   case ITC_IRQ_TIM4_OVF:
 785                     ; 319 #endif /* STM8S903 or STM8AF622x */
 785                     ; 320     ITC->ISPR6 &= Mask;
 787  0090 c67f75        	ld	a,32629
 788  0093 1401          	and	a,(OFST-1,sp)
 789  0095 c77f75        	ld	32629,a
 790                     ; 321     ITC->ISPR6 |= NewPriority;
 792  0098 c67f75        	ld	a,32629
 793  009b 1a02          	or	a,(OFST+0,sp)
 794  009d c77f75        	ld	32629,a
 795                     ; 322     break;
 797  00a0 2010          	jra	L162
 798  00a2               L122:
 799                     ; 324   case ITC_IRQ_EEPROM_EEC:
 799                     ; 325     ITC->ISPR7 &= Mask;
 801  00a2 c67f76        	ld	a,32630
 802  00a5 1401          	and	a,(OFST-1,sp)
 803  00a7 c77f76        	ld	32630,a
 804                     ; 326     ITC->ISPR7 |= NewPriority;
 806  00aa c67f76        	ld	a,32630
 807  00ad 1a02          	or	a,(OFST+0,sp)
 808  00af c77f76        	ld	32630,a
 809                     ; 327     break;
 811                     ; 329   default:
 811                     ; 330     break;
 813  00b2               L162:
 814                     ; 332 }
 817  00b2 5b04          	addw	sp,#4
 818  00b4 81            	ret	
 831                     	xdef	_ITC_GetSoftwarePriority
 832                     	xdef	_ITC_SetSoftwarePriority
 833                     	xdef	_ITC_GetSoftIntStatus
 834                     	xdef	_ITC_DeInit
 835                     	xdef	_ITC_GetCPUCC
 854                     	end

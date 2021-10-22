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
 110                     ; 53 void UART1_DeInit(void)
 110                     ; 54 {
 112                     .text:	section	.text,new
 113  0000               _UART1_DeInit:
 117                     ; 57   (void)UART1->SR;
 119  0000 c65230        	ld	a,21040
 120                     ; 58   (void)UART1->DR;
 122  0003 c65231        	ld	a,21041
 123                     ; 60   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
 125  0006 725f5233      	clr	21043
 126                     ; 61   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
 128  000a 725f5232      	clr	21042
 129                     ; 63   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
 131  000e 725f5234      	clr	21044
 132                     ; 64   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
 134  0012 725f5235      	clr	21045
 135                     ; 65   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
 137  0016 725f5236      	clr	21046
 138                     ; 66   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
 140  001a 725f5237      	clr	21047
 141                     ; 67   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
 143  001e 725f5238      	clr	21048
 144                     ; 69   UART1->GTR = UART1_GTR_RESET_VALUE;
 146  0022 725f5239      	clr	21049
 147                     ; 70   UART1->PSCR = UART1_PSCR_RESET_VALUE;
 149  0026 725f523a      	clr	21050
 150                     ; 71 }
 153  002a 81            	ret	
 456                     .const:	section	.text
 457  0000               L41:
 458  0000 00000064      	dc.l	100
 459                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 459                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 459                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 459                     ; 93 {
 460                     .text:	section	.text,new
 461  0000               _UART1_Init:
 463  0000 520c          	subw	sp,#12
 464       0000000c      OFST:	set	12
 467                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 471                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 473                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 475                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 477                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
 479                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 481                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 483                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 485  0002 72195234      	bres	21044,#4
 486                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 488  0006 c65234        	ld	a,21044
 489  0009 1a13          	or	a,(OFST+7,sp)
 490  000b c75234        	ld	21044,a
 491                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 493  000e c65236        	ld	a,21046
 494  0011 a4cf          	and	a,#207
 495  0013 c75236        	ld	21046,a
 496                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 498  0016 c65236        	ld	a,21046
 499  0019 1a14          	or	a,(OFST+8,sp)
 500  001b c75236        	ld	21046,a
 501                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 503  001e c65234        	ld	a,21044
 504  0021 a4f9          	and	a,#249
 505  0023 c75234        	ld	21044,a
 506                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 508  0026 c65234        	ld	a,21044
 509  0029 1a15          	or	a,(OFST+9,sp)
 510  002b c75234        	ld	21044,a
 511                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 513  002e 725f5232      	clr	21042
 514                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 516  0032 c65233        	ld	a,21043
 517  0035 a40f          	and	a,#15
 518  0037 c75233        	ld	21043,a
 519                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 521  003a c65233        	ld	a,21043
 522  003d a4f0          	and	a,#240
 523  003f c75233        	ld	21043,a
 524                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 526  0042 96            	ldw	x,sp
 527  0043 1c000f        	addw	x,#OFST+3
 528  0046 cd0000        	call	c_ltor
 530  0049 a604          	ld	a,#4
 531  004b cd0000        	call	c_llsh
 533  004e 96            	ldw	x,sp
 534  004f 5c            	incw	x
 535  0050 cd0000        	call	c_rtol
 538  0053 cd0000        	call	_CLK_GetClockFreq
 540  0056 96            	ldw	x,sp
 541  0057 5c            	incw	x
 542  0058 cd0000        	call	c_ludv
 544  005b 96            	ldw	x,sp
 545  005c 1c0009        	addw	x,#OFST-3
 546  005f cd0000        	call	c_rtol
 549                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 551  0062 96            	ldw	x,sp
 552  0063 1c000f        	addw	x,#OFST+3
 553  0066 cd0000        	call	c_ltor
 555  0069 a604          	ld	a,#4
 556  006b cd0000        	call	c_llsh
 558  006e 96            	ldw	x,sp
 559  006f 5c            	incw	x
 560  0070 cd0000        	call	c_rtol
 563  0073 cd0000        	call	_CLK_GetClockFreq
 565  0076 a664          	ld	a,#100
 566  0078 cd0000        	call	c_smul
 568  007b 96            	ldw	x,sp
 569  007c 5c            	incw	x
 570  007d cd0000        	call	c_ludv
 572  0080 96            	ldw	x,sp
 573  0081 1c0005        	addw	x,#OFST-7
 574  0084 cd0000        	call	c_rtol
 577                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 579  0087 96            	ldw	x,sp
 580  0088 1c0009        	addw	x,#OFST-3
 581  008b cd0000        	call	c_ltor
 583  008e a664          	ld	a,#100
 584  0090 cd0000        	call	c_smul
 586  0093 96            	ldw	x,sp
 587  0094 5c            	incw	x
 588  0095 cd0000        	call	c_rtol
 591  0098 96            	ldw	x,sp
 592  0099 1c0005        	addw	x,#OFST-7
 593  009c cd0000        	call	c_ltor
 595  009f 96            	ldw	x,sp
 596  00a0 5c            	incw	x
 597  00a1 cd0000        	call	c_lsub
 599  00a4 a604          	ld	a,#4
 600  00a6 cd0000        	call	c_llsh
 602  00a9 ae0000        	ldw	x,#L41
 603  00ac cd0000        	call	c_ludv
 605  00af b603          	ld	a,c_lreg+3
 606  00b1 a40f          	and	a,#15
 607  00b3 ca5233        	or	a,21043
 608  00b6 c75233        	ld	21043,a
 609                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 611  00b9 1e0b          	ldw	x,(OFST-1,sp)
 612  00bb 54            	srlw	x
 613  00bc 54            	srlw	x
 614  00bd 54            	srlw	x
 615  00be 54            	srlw	x
 616  00bf 01            	rrwa	x,a
 617  00c0 a4f0          	and	a,#240
 618  00c2 ca5233        	or	a,21043
 619  00c5 c75233        	ld	21043,a
 620                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 622  00c8 c65232        	ld	a,21042
 623  00cb 1a0c          	or	a,(OFST+0,sp)
 624  00cd c75232        	ld	21042,a
 625                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 627  00d0 c65235        	ld	a,21045
 628  00d3 a4f3          	and	a,#243
 629  00d5 c75235        	ld	21045,a
 630                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 632  00d8 c65236        	ld	a,21046
 633  00db a4f8          	and	a,#248
 634  00dd c75236        	ld	21046,a
 635                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 635                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 637  00e0 7b16          	ld	a,(OFST+10,sp)
 638  00e2 a407          	and	a,#7
 639  00e4 ca5236        	or	a,21046
 640  00e7 c75236        	ld	21046,a
 641                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 643  00ea 7b17          	ld	a,(OFST+11,sp)
 644  00ec a504          	bcp	a,#4
 645  00ee 2706          	jreq	L532
 646                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 648  00f0 72165235      	bset	21045,#3
 650  00f4 2004          	jra	L732
 651  00f6               L532:
 652                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 654  00f6 72175235      	bres	21045,#3
 655  00fa               L732:
 656                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 658  00fa a508          	bcp	a,#8
 659  00fc 2706          	jreq	L142
 660                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 662  00fe 72145235      	bset	21045,#2
 664  0102 2004          	jra	L342
 665  0104               L142:
 666                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 668  0104 72155235      	bres	21045,#2
 669  0108               L342:
 670                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 672  0108 7b16          	ld	a,(OFST+10,sp)
 673  010a 2a06          	jrpl	L542
 674                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 676  010c 72175236      	bres	21046,#3
 678  0110 2008          	jra	L742
 679  0112               L542:
 680                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 682  0112 a408          	and	a,#8
 683  0114 ca5236        	or	a,21046
 684  0117 c75236        	ld	21046,a
 685  011a               L742:
 686                     ; 176 }
 689  011a 5b0c          	addw	sp,#12
 690  011c 81            	ret	
 745                     ; 184 void UART1_Cmd(FunctionalState NewState)
 745                     ; 185 {
 746                     .text:	section	.text,new
 747  0000               _UART1_Cmd:
 751                     ; 186   if (NewState != DISABLE)
 753  0000 4d            	tnz	a
 754  0001 2705          	jreq	L772
 755                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 757  0003 721b5234      	bres	21044,#5
 760  0007 81            	ret	
 761  0008               L772:
 762                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 764  0008 721a5234      	bset	21044,#5
 765                     ; 196 }
 768  000c 81            	ret	
 893                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 893                     ; 212 {
 894                     .text:	section	.text,new
 895  0000               _UART1_ITConfig:
 897  0000 89            	pushw	x
 898  0001 89            	pushw	x
 899       00000002      OFST:	set	2
 902                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 906                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 908                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 910                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
 912  0002 9e            	ld	a,xh
 913  0003 6b01          	ld	(OFST-1,sp),a
 915                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
 917  0005 9f            	ld	a,xl
 918  0006 a40f          	and	a,#15
 919  0008 5f            	clrw	x
 920  0009 97            	ld	xl,a
 921  000a a601          	ld	a,#1
 922  000c 5d            	tnzw	x
 923  000d 2704          	jreq	L22
 924  000f               L42:
 925  000f 48            	sll	a
 926  0010 5a            	decw	x
 927  0011 26fc          	jrne	L42
 928  0013               L22:
 929  0013 6b02          	ld	(OFST+0,sp),a
 931                     ; 224   if (NewState != DISABLE)
 933  0015 7b07          	ld	a,(OFST+5,sp)
 934  0017 271f          	jreq	L163
 935                     ; 227     if (uartreg == 0x01)
 937  0019 7b01          	ld	a,(OFST-1,sp)
 938  001b a101          	cp	a,#1
 939  001d 2607          	jrne	L363
 940                     ; 229       UART1->CR1 |= itpos;
 942  001f c65234        	ld	a,21044
 943  0022 1a02          	or	a,(OFST+0,sp)
 945  0024 201e          	jp	LC002
 946  0026               L363:
 947                     ; 231     else if (uartreg == 0x02)
 949  0026 a102          	cp	a,#2
 950  0028 2607          	jrne	L763
 951                     ; 233       UART1->CR2 |= itpos;
 953  002a c65235        	ld	a,21045
 954  002d 1a02          	or	a,(OFST+0,sp)
 956  002f 2022          	jp	LC003
 957  0031               L763:
 958                     ; 237       UART1->CR4 |= itpos;
 960  0031 c65237        	ld	a,21047
 961  0034 1a02          	or	a,(OFST+0,sp)
 962  0036 2026          	jp	LC001
 963  0038               L163:
 964                     ; 243     if (uartreg == 0x01)
 966  0038 7b01          	ld	a,(OFST-1,sp)
 967  003a a101          	cp	a,#1
 968  003c 260b          	jrne	L573
 969                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
 971  003e 7b02          	ld	a,(OFST+0,sp)
 972  0040 43            	cpl	a
 973  0041 c45234        	and	a,21044
 974  0044               LC002:
 975  0044 c75234        	ld	21044,a
 977  0047 2018          	jra	L373
 978  0049               L573:
 979                     ; 247     else if (uartreg == 0x02)
 981  0049 a102          	cp	a,#2
 982  004b 260b          	jrne	L104
 983                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
 985  004d 7b02          	ld	a,(OFST+0,sp)
 986  004f 43            	cpl	a
 987  0050 c45235        	and	a,21045
 988  0053               LC003:
 989  0053 c75235        	ld	21045,a
 991  0056 2009          	jra	L373
 992  0058               L104:
 993                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
 995  0058 7b02          	ld	a,(OFST+0,sp)
 996  005a 43            	cpl	a
 997  005b c45237        	and	a,21047
 998  005e               LC001:
 999  005e c75237        	ld	21047,a
1000  0061               L373:
1001                     ; 257 }
1004  0061 5b04          	addw	sp,#4
1005  0063 81            	ret	
1041                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
1041                     ; 266 {
1042                     .text:	section	.text,new
1043  0000               _UART1_HalfDuplexCmd:
1047                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1049                     ; 269   if (NewState != DISABLE)
1051  0000 4d            	tnz	a
1052  0001 2705          	jreq	L324
1053                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
1055  0003 72165238      	bset	21048,#3
1058  0007 81            	ret	
1059  0008               L324:
1060                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1062  0008 72175238      	bres	21048,#3
1063                     ; 277 }
1066  000c 81            	ret	
1123                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1123                     ; 286 {
1124                     .text:	section	.text,new
1125  0000               _UART1_IrDAConfig:
1129                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1131                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1133  0000 4d            	tnz	a
1134  0001 2705          	jreq	L554
1135                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1137  0003 72145238      	bset	21048,#2
1140  0007 81            	ret	
1141  0008               L554:
1142                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1144  0008 72155238      	bres	21048,#2
1145                     ; 297 }
1148  000c 81            	ret	
1183                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1183                     ; 306 {
1184                     .text:	section	.text,new
1185  0000               _UART1_IrDACmd:
1189                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1191                     ; 310   if (NewState != DISABLE)
1193  0000 4d            	tnz	a
1194  0001 2705          	jreq	L774
1195                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1197  0003 72125238      	bset	21048,#1
1200  0007 81            	ret	
1201  0008               L774:
1202                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1204  0008 72135238      	bres	21048,#1
1205                     ; 320 }
1208  000c 81            	ret	
1267                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1267                     ; 330 {
1268                     .text:	section	.text,new
1269  0000               _UART1_LINBreakDetectionConfig:
1273                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1275                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1277  0000 4d            	tnz	a
1278  0001 2705          	jreq	L135
1279                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1281  0003 721a5237      	bset	21047,#5
1284  0007 81            	ret	
1285  0008               L135:
1286                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1288  0008 721b5237      	bres	21047,#5
1289                     ; 341 }
1292  000c 81            	ret	
1327                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1327                     ; 350 {
1328                     .text:	section	.text,new
1329  0000               _UART1_LINCmd:
1333                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1335                     ; 353   if (NewState != DISABLE)
1337  0000 4d            	tnz	a
1338  0001 2705          	jreq	L355
1339                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1341  0003 721c5236      	bset	21046,#6
1344  0007 81            	ret	
1345  0008               L355:
1346                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1348  0008 721d5236      	bres	21046,#6
1349                     ; 363 }
1352  000c 81            	ret	
1387                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1387                     ; 372 {
1388                     .text:	section	.text,new
1389  0000               _UART1_SmartCardCmd:
1393                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1395                     ; 375   if (NewState != DISABLE)
1397  0000 4d            	tnz	a
1398  0001 2705          	jreq	L575
1399                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1401  0003 721a5238      	bset	21048,#5
1404  0007 81            	ret	
1405  0008               L575:
1406                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1408  0008 721b5238      	bres	21048,#5
1409                     ; 385 }
1412  000c 81            	ret	
1448                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1448                     ; 395 {
1449                     .text:	section	.text,new
1450  0000               _UART1_SmartCardNACKCmd:
1454                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1456                     ; 398   if (NewState != DISABLE)
1458  0000 4d            	tnz	a
1459  0001 2705          	jreq	L716
1460                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1462  0003 72185238      	bset	21048,#4
1465  0007 81            	ret	
1466  0008               L716:
1467                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1469  0008 72195238      	bres	21048,#4
1470                     ; 408 }
1473  000c 81            	ret	
1530                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1530                     ; 417 {
1531                     .text:	section	.text,new
1532  0000               _UART1_WakeUpConfig:
1536                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1538                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1540  0000 72175234      	bres	21044,#3
1541                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1543  0004 ca5234        	or	a,21044
1544  0007 c75234        	ld	21044,a
1545                     ; 422 }
1548  000a 81            	ret	
1584                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1584                     ; 431 {
1585                     .text:	section	.text,new
1586  0000               _UART1_ReceiverWakeUpCmd:
1590                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1592                     ; 434   if (NewState != DISABLE)
1594  0000 4d            	tnz	a
1595  0001 2705          	jreq	L766
1596                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1598  0003 72125235      	bset	21045,#1
1601  0007 81            	ret	
1602  0008               L766:
1603                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1605  0008 72135235      	bres	21045,#1
1606                     ; 444 }
1609  000c 81            	ret	
1632                     ; 451 uint8_t UART1_ReceiveData8(void)
1632                     ; 452 {
1633                     .text:	section	.text,new
1634  0000               _UART1_ReceiveData8:
1638                     ; 453   return ((uint8_t)UART1->DR);
1640  0000 c65231        	ld	a,21041
1643  0003 81            	ret	
1677                     ; 461 uint16_t UART1_ReceiveData9(void)
1677                     ; 462 {
1678                     .text:	section	.text,new
1679  0000               _UART1_ReceiveData9:
1681  0000 89            	pushw	x
1682       00000002      OFST:	set	2
1685                     ; 463   uint16_t temp = 0;
1687                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
1689  0001 c65234        	ld	a,21044
1690  0004 a480          	and	a,#128
1691  0006 5f            	clrw	x
1692  0007 02            	rlwa	x,a
1693  0008 58            	sllw	x
1694  0009 1f01          	ldw	(OFST-1,sp),x
1696                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
1698  000b c65231        	ld	a,21041
1699  000e 5f            	clrw	x
1700  000f 97            	ld	xl,a
1701  0010 01            	rrwa	x,a
1702  0011 1a02          	or	a,(OFST+0,sp)
1703  0013 01            	rrwa	x,a
1704  0014 1a01          	or	a,(OFST-1,sp)
1705  0016 a401          	and	a,#1
1706  0018 01            	rrwa	x,a
1709  0019 5b02          	addw	sp,#2
1710  001b 81            	ret	
1744                     ; 474 void UART1_SendData8(uint8_t Data)
1744                     ; 475 {
1745                     .text:	section	.text,new
1746  0000               _UART1_SendData8:
1750                     ; 477   UART1->DR = Data;
1752  0000 c75231        	ld	21041,a
1753                     ; 478 }
1756  0003 81            	ret	
1790                     ; 486 void UART1_SendData9(uint16_t Data)
1790                     ; 487 {
1791                     .text:	section	.text,new
1792  0000               _UART1_SendData9:
1794  0000 89            	pushw	x
1795       00000000      OFST:	set	0
1798                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
1800  0001 721d5234      	bres	21044,#6
1801                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
1803  0005 54            	srlw	x
1804  0006 54            	srlw	x
1805  0007 9f            	ld	a,xl
1806  0008 a440          	and	a,#64
1807  000a ca5234        	or	a,21044
1808  000d c75234        	ld	21044,a
1809                     ; 493   UART1->DR   = (uint8_t)(Data);
1811  0010 7b02          	ld	a,(OFST+2,sp)
1812  0012 c75231        	ld	21041,a
1813                     ; 494 }
1816  0015 85            	popw	x
1817  0016 81            	ret	
1840                     ; 501 void UART1_SendBreak(void)
1840                     ; 502 {
1841                     .text:	section	.text,new
1842  0000               _UART1_SendBreak:
1846                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
1848  0000 72105235      	bset	21045,#0
1849                     ; 504 }
1852  0004 81            	ret	
1886                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
1886                     ; 512 {
1887                     .text:	section	.text,new
1888  0000               _UART1_SetAddress:
1890  0000 88            	push	a
1891       00000000      OFST:	set	0
1894                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
1896                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
1898  0001 c65237        	ld	a,21047
1899  0004 a4f0          	and	a,#240
1900  0006 c75237        	ld	21047,a
1901                     ; 519   UART1->CR4 |= UART1_Address;
1903  0009 c65237        	ld	a,21047
1904  000c 1a01          	or	a,(OFST+1,sp)
1905  000e c75237        	ld	21047,a
1906                     ; 520 }
1909  0011 84            	pop	a
1910  0012 81            	ret	
1944                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
1944                     ; 529 {
1945                     .text:	section	.text,new
1946  0000               _UART1_SetGuardTime:
1950                     ; 531   UART1->GTR = UART1_GuardTime;
1952  0000 c75239        	ld	21049,a
1953                     ; 532 }
1956  0003 81            	ret	
1990                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
1990                     ; 557 {
1991                     .text:	section	.text,new
1992  0000               _UART1_SetPrescaler:
1996                     ; 559   UART1->PSCR = UART1_Prescaler;
1998  0000 c7523a        	ld	21050,a
1999                     ; 560 }
2002  0003 81            	ret	
2145                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2145                     ; 569 {
2146                     .text:	section	.text,new
2147  0000               _UART1_GetFlagStatus:
2149  0000 89            	pushw	x
2150  0001 88            	push	a
2151       00000001      OFST:	set	1
2154                     ; 570   FlagStatus status = RESET;
2156                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2158                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2160  0002 a30210        	cpw	x,#528
2161  0005 2608          	jrne	L1211
2162                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2164  0007 9f            	ld	a,xl
2165  0008 c45237        	and	a,21047
2166  000b 271c          	jreq	L7211
2167                     ; 582       status = SET;
2169  000d 2015          	jp	LC006
2170                     ; 587       status = RESET;
2171  000f               L1211:
2172                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2174  000f a30101        	cpw	x,#257
2175  0012 2609          	jrne	L1311
2176                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2178  0014 c65235        	ld	a,21045
2179  0017 1503          	bcp	a,(OFST+2,sp)
2180  0019 270d          	jreq	L1411
2181                     ; 595       status = SET;
2183  001b 2007          	jp	LC006
2184                     ; 600       status = RESET;
2185  001d               L1311:
2186                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2188  001d c65230        	ld	a,21040
2189  0020 1503          	bcp	a,(OFST+2,sp)
2190  0022 2704          	jreq	L1411
2191                     ; 608       status = SET;
2193  0024               LC006:
2196  0024 a601          	ld	a,#1
2200  0026 2001          	jra	L7211
2201  0028               L1411:
2202                     ; 613       status = RESET;
2205  0028 4f            	clr	a
2207  0029               L7211:
2208                     ; 617   return status;
2212  0029 5b03          	addw	sp,#3
2213  002b 81            	ret	
2248                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2248                     ; 647 {
2249                     .text:	section	.text,new
2250  0000               _UART1_ClearFlag:
2254                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2256                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2258  0000 a30020        	cpw	x,#32
2259  0003 2605          	jrne	L3611
2260                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2262  0005 35df5230      	mov	21040,#223
2265  0009 81            	ret	
2266  000a               L3611:
2267                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2269  000a 72195237      	bres	21047,#4
2270                     ; 660 }
2273  000e 81            	ret	
2355                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2355                     ; 676 {
2356                     .text:	section	.text,new
2357  0000               _UART1_GetITStatus:
2359  0000 89            	pushw	x
2360  0001 89            	pushw	x
2361       00000002      OFST:	set	2
2364                     ; 677   ITStatus pendingbitstatus = RESET;
2366                     ; 678   uint8_t itpos = 0;
2368                     ; 679   uint8_t itmask1 = 0;
2370                     ; 680   uint8_t itmask2 = 0;
2372                     ; 681   uint8_t enablestatus = 0;
2374                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2376                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2378  0002 9f            	ld	a,xl
2379  0003 a40f          	and	a,#15
2380  0005 5f            	clrw	x
2381  0006 97            	ld	xl,a
2382  0007 a601          	ld	a,#1
2383  0009 5d            	tnzw	x
2384  000a 2704          	jreq	L67
2385  000c               L001:
2386  000c 48            	sll	a
2387  000d 5a            	decw	x
2388  000e 26fc          	jrne	L001
2389  0010               L67:
2390  0010 6b01          	ld	(OFST-1,sp),a
2392                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2394  0012 7b04          	ld	a,(OFST+2,sp)
2395  0014 4e            	swap	a
2396  0015 a40f          	and	a,#15
2397  0017 6b02          	ld	(OFST+0,sp),a
2399                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2401  0019 5f            	clrw	x
2402  001a 97            	ld	xl,a
2403  001b a601          	ld	a,#1
2404  001d 5d            	tnzw	x
2405  001e 2704          	jreq	L201
2406  0020               L401:
2407  0020 48            	sll	a
2408  0021 5a            	decw	x
2409  0022 26fc          	jrne	L401
2410  0024               L201:
2411  0024 6b02          	ld	(OFST+0,sp),a
2413                     ; 695   if (UART1_IT == UART1_IT_PE)
2415  0026 1e03          	ldw	x,(OFST+1,sp)
2416  0028 a30100        	cpw	x,#256
2417  002b 260c          	jrne	L1321
2418                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2420  002d c65234        	ld	a,21044
2421  0030 1402          	and	a,(OFST+0,sp)
2422  0032 6b02          	ld	(OFST+0,sp),a
2424                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2426  0034 c65230        	ld	a,21040
2428                     ; 704       pendingbitstatus = SET;
2430  0037 200f          	jp	LC009
2431                     ; 709       pendingbitstatus = RESET;
2432  0039               L1321:
2433                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2435  0039 a30346        	cpw	x,#838
2436  003c 2616          	jrne	L1421
2437                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2439  003e c65237        	ld	a,21047
2440  0041 1402          	and	a,(OFST+0,sp)
2441  0043 6b02          	ld	(OFST+0,sp),a
2443                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2445  0045 c65237        	ld	a,21047
2447  0048               LC009:
2448  0048 1501          	bcp	a,(OFST-1,sp)
2449  004a 271a          	jreq	L1521
2450  004c 7b02          	ld	a,(OFST+0,sp)
2451  004e 2716          	jreq	L1521
2452                     ; 721       pendingbitstatus = SET;
2454  0050               LC008:
2457  0050 a601          	ld	a,#1
2460  0052 2013          	jra	L7321
2461                     ; 726       pendingbitstatus = RESET;
2462  0054               L1421:
2463                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2465  0054 c65235        	ld	a,21045
2466  0057 1402          	and	a,(OFST+0,sp)
2467  0059 6b02          	ld	(OFST+0,sp),a
2469                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2471  005b c65230        	ld	a,21040
2472  005e 1501          	bcp	a,(OFST-1,sp)
2473  0060 2704          	jreq	L1521
2475  0062 7b02          	ld	a,(OFST+0,sp)
2476                     ; 737       pendingbitstatus = SET;
2478  0064 26ea          	jrne	LC008
2479  0066               L1521:
2480                     ; 742       pendingbitstatus = RESET;
2484  0066 4f            	clr	a
2486  0067               L7321:
2487                     ; 747   return  pendingbitstatus;
2491  0067 5b04          	addw	sp,#4
2492  0069 81            	ret	
2528                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2528                     ; 776 {
2529                     .text:	section	.text,new
2530  0000               _UART1_ClearITPendingBit:
2534                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2536                     ; 780   if (UART1_IT == UART1_IT_RXNE)
2538  0000 a30255        	cpw	x,#597
2539  0003 2605          	jrne	L3721
2540                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2542  0005 35df5230      	mov	21040,#223
2545  0009 81            	ret	
2546  000a               L3721:
2547                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2549  000a 72195237      	bres	21047,#4
2550                     ; 789 }
2553  000e 81            	ret	
2566                     	xdef	_UART1_ClearITPendingBit
2567                     	xdef	_UART1_GetITStatus
2568                     	xdef	_UART1_ClearFlag
2569                     	xdef	_UART1_GetFlagStatus
2570                     	xdef	_UART1_SetPrescaler
2571                     	xdef	_UART1_SetGuardTime
2572                     	xdef	_UART1_SetAddress
2573                     	xdef	_UART1_SendBreak
2574                     	xdef	_UART1_SendData9
2575                     	xdef	_UART1_SendData8
2576                     	xdef	_UART1_ReceiveData9
2577                     	xdef	_UART1_ReceiveData8
2578                     	xdef	_UART1_ReceiverWakeUpCmd
2579                     	xdef	_UART1_WakeUpConfig
2580                     	xdef	_UART1_SmartCardNACKCmd
2581                     	xdef	_UART1_SmartCardCmd
2582                     	xdef	_UART1_LINCmd
2583                     	xdef	_UART1_LINBreakDetectionConfig
2584                     	xdef	_UART1_IrDACmd
2585                     	xdef	_UART1_IrDAConfig
2586                     	xdef	_UART1_HalfDuplexCmd
2587                     	xdef	_UART1_ITConfig
2588                     	xdef	_UART1_Cmd
2589                     	xdef	_UART1_Init
2590                     	xdef	_UART1_DeInit
2591                     	xref	_CLK_GetClockFreq
2592                     	xref.b	c_lreg
2593                     	xref.b	c_x
2612                     	xref	c_lsub
2613                     	xref	c_smul
2614                     	xref	c_ludv
2615                     	xref	c_rtol
2616                     	xref	c_llsh
2617                     	xref	c_ltor
2618                     	end

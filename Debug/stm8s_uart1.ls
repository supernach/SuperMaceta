   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  46                     ; 53 void UART1_DeInit(void)
  46                     ; 54 {
  48                     .text:	section	.text,new
  49  0000               _UART1_DeInit:
  53                     ; 57   (void)UART1->SR;
  55  0000 c65230        	ld	a,21040
  56                     ; 58   (void)UART1->DR;
  58  0003 c65231        	ld	a,21041
  59                     ; 60   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  61  0006 725f5233      	clr	21043
  62                     ; 61   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  64  000a 725f5232      	clr	21042
  65                     ; 63   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  67  000e 725f5234      	clr	21044
  68                     ; 64   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  70  0012 725f5235      	clr	21045
  71                     ; 65   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  73  0016 725f5236      	clr	21046
  74                     ; 66   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  76  001a 725f5237      	clr	21047
  77                     ; 67   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  79  001e 725f5238      	clr	21048
  80                     ; 69   UART1->GTR = UART1_GTR_RESET_VALUE;
  82  0022 725f5239      	clr	21049
  83                     ; 70   UART1->PSCR = UART1_PSCR_RESET_VALUE;
  85  0026 725f523a      	clr	21050
  86                     ; 71 }
  89  002a 81            	ret	
 392                     .const:	section	.text
 393  0000               L41:
 394  0000 00000064      	dc.l	100
 395                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 395                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 395                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 395                     ; 93 {
 396                     .text:	section	.text,new
 397  0000               _UART1_Init:
 399  0000 520c          	subw	sp,#12
 400       0000000c      OFST:	set	12
 403                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 407                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 409                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 411                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 413                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
 415                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 417                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 419                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 421  0002 72195234      	bres	21044,#4
 422                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 424  0006 c65234        	ld	a,21044
 425  0009 1a13          	or	a,(OFST+7,sp)
 426  000b c75234        	ld	21044,a
 427                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 429  000e c65236        	ld	a,21046
 430  0011 a4cf          	and	a,#207
 431  0013 c75236        	ld	21046,a
 432                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 434  0016 c65236        	ld	a,21046
 435  0019 1a14          	or	a,(OFST+8,sp)
 436  001b c75236        	ld	21046,a
 437                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 439  001e c65234        	ld	a,21044
 440  0021 a4f9          	and	a,#249
 441  0023 c75234        	ld	21044,a
 442                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 444  0026 c65234        	ld	a,21044
 445  0029 1a15          	or	a,(OFST+9,sp)
 446  002b c75234        	ld	21044,a
 447                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 449  002e 725f5232      	clr	21042
 450                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 452  0032 c65233        	ld	a,21043
 453  0035 a40f          	and	a,#15
 454  0037 c75233        	ld	21043,a
 455                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 457  003a c65233        	ld	a,21043
 458  003d a4f0          	and	a,#240
 459  003f c75233        	ld	21043,a
 460                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 462  0042 96            	ldw	x,sp
 463  0043 1c000f        	addw	x,#OFST+3
 464  0046 cd0000        	call	c_ltor
 466  0049 a604          	ld	a,#4
 467  004b cd0000        	call	c_llsh
 469  004e 96            	ldw	x,sp
 470  004f 5c            	incw	x
 471  0050 cd0000        	call	c_rtol
 474  0053 cd0000        	call	_CLK_GetClockFreq
 476  0056 96            	ldw	x,sp
 477  0057 5c            	incw	x
 478  0058 cd0000        	call	c_ludv
 480  005b 96            	ldw	x,sp
 481  005c 1c0009        	addw	x,#OFST-3
 482  005f cd0000        	call	c_rtol
 485                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 487  0062 96            	ldw	x,sp
 488  0063 1c000f        	addw	x,#OFST+3
 489  0066 cd0000        	call	c_ltor
 491  0069 a604          	ld	a,#4
 492  006b cd0000        	call	c_llsh
 494  006e 96            	ldw	x,sp
 495  006f 5c            	incw	x
 496  0070 cd0000        	call	c_rtol
 499  0073 cd0000        	call	_CLK_GetClockFreq
 501  0076 a664          	ld	a,#100
 502  0078 cd0000        	call	c_smul
 504  007b 96            	ldw	x,sp
 505  007c 5c            	incw	x
 506  007d cd0000        	call	c_ludv
 508  0080 96            	ldw	x,sp
 509  0081 1c0005        	addw	x,#OFST-7
 510  0084 cd0000        	call	c_rtol
 513                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 515  0087 96            	ldw	x,sp
 516  0088 1c0009        	addw	x,#OFST-3
 517  008b cd0000        	call	c_ltor
 519  008e a664          	ld	a,#100
 520  0090 cd0000        	call	c_smul
 522  0093 96            	ldw	x,sp
 523  0094 5c            	incw	x
 524  0095 cd0000        	call	c_rtol
 527  0098 96            	ldw	x,sp
 528  0099 1c0005        	addw	x,#OFST-7
 529  009c cd0000        	call	c_ltor
 531  009f 96            	ldw	x,sp
 532  00a0 5c            	incw	x
 533  00a1 cd0000        	call	c_lsub
 535  00a4 a604          	ld	a,#4
 536  00a6 cd0000        	call	c_llsh
 538  00a9 ae0000        	ldw	x,#L41
 539  00ac cd0000        	call	c_ludv
 541  00af b603          	ld	a,c_lreg+3
 542  00b1 a40f          	and	a,#15
 543  00b3 ca5233        	or	a,21043
 544  00b6 c75233        	ld	21043,a
 545                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 547  00b9 1e0b          	ldw	x,(OFST-1,sp)
 548  00bb 54            	srlw	x
 549  00bc 54            	srlw	x
 550  00bd 54            	srlw	x
 551  00be 54            	srlw	x
 552  00bf 01            	rrwa	x,a
 553  00c0 a4f0          	and	a,#240
 554  00c2 ca5233        	or	a,21043
 555  00c5 c75233        	ld	21043,a
 556                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 558  00c8 c65232        	ld	a,21042
 559  00cb 1a0c          	or	a,(OFST+0,sp)
 560  00cd c75232        	ld	21042,a
 561                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 563  00d0 c65235        	ld	a,21045
 564  00d3 a4f3          	and	a,#243
 565  00d5 c75235        	ld	21045,a
 566                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 568  00d8 c65236        	ld	a,21046
 569  00db a4f8          	and	a,#248
 570  00dd c75236        	ld	21046,a
 571                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 571                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 573  00e0 7b16          	ld	a,(OFST+10,sp)
 574  00e2 a407          	and	a,#7
 575  00e4 ca5236        	or	a,21046
 576  00e7 c75236        	ld	21046,a
 577                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 579  00ea 7b17          	ld	a,(OFST+11,sp)
 580  00ec a504          	bcp	a,#4
 581  00ee 2706          	jreq	L371
 582                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 584  00f0 72165235      	bset	21045,#3
 586  00f4 2004          	jra	L571
 587  00f6               L371:
 588                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 590  00f6 72175235      	bres	21045,#3
 591  00fa               L571:
 592                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 594  00fa a508          	bcp	a,#8
 595  00fc 2706          	jreq	L771
 596                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 598  00fe 72145235      	bset	21045,#2
 600  0102 2004          	jra	L102
 601  0104               L771:
 602                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 604  0104 72155235      	bres	21045,#2
 605  0108               L102:
 606                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 608  0108 7b16          	ld	a,(OFST+10,sp)
 609  010a 2a06          	jrpl	L302
 610                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 612  010c 72175236      	bres	21046,#3
 614  0110 2008          	jra	L502
 615  0112               L302:
 616                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 618  0112 a408          	and	a,#8
 619  0114 ca5236        	or	a,21046
 620  0117 c75236        	ld	21046,a
 621  011a               L502:
 622                     ; 176 }
 625  011a 5b0c          	addw	sp,#12
 626  011c 81            	ret	
 681                     ; 184 void UART1_Cmd(FunctionalState NewState)
 681                     ; 185 {
 682                     .text:	section	.text,new
 683  0000               _UART1_Cmd:
 687                     ; 186   if (NewState != DISABLE)
 689  0000 4d            	tnz	a
 690  0001 2705          	jreq	L532
 691                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 693  0003 721b5234      	bres	21044,#5
 696  0007 81            	ret	
 697  0008               L532:
 698                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 700  0008 721a5234      	bset	21044,#5
 701                     ; 196 }
 704  000c 81            	ret	
 829                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 829                     ; 212 {
 830                     .text:	section	.text,new
 831  0000               _UART1_ITConfig:
 833  0000 89            	pushw	x
 834  0001 89            	pushw	x
 835       00000002      OFST:	set	2
 838                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 842                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 844                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 846                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
 848  0002 9e            	ld	a,xh
 849  0003 6b01          	ld	(OFST-1,sp),a
 851                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
 853  0005 9f            	ld	a,xl
 854  0006 a40f          	and	a,#15
 855  0008 5f            	clrw	x
 856  0009 97            	ld	xl,a
 857  000a a601          	ld	a,#1
 858  000c 5d            	tnzw	x
 859  000d 2704          	jreq	L22
 860  000f               L42:
 861  000f 48            	sll	a
 862  0010 5a            	decw	x
 863  0011 26fc          	jrne	L42
 864  0013               L22:
 865  0013 6b02          	ld	(OFST+0,sp),a
 867                     ; 224   if (NewState != DISABLE)
 869  0015 7b07          	ld	a,(OFST+5,sp)
 870  0017 271f          	jreq	L713
 871                     ; 227     if (uartreg == 0x01)
 873  0019 7b01          	ld	a,(OFST-1,sp)
 874  001b a101          	cp	a,#1
 875  001d 2607          	jrne	L123
 876                     ; 229       UART1->CR1 |= itpos;
 878  001f c65234        	ld	a,21044
 879  0022 1a02          	or	a,(OFST+0,sp)
 881  0024 201e          	jp	LC002
 882  0026               L123:
 883                     ; 231     else if (uartreg == 0x02)
 885  0026 a102          	cp	a,#2
 886  0028 2607          	jrne	L523
 887                     ; 233       UART1->CR2 |= itpos;
 889  002a c65235        	ld	a,21045
 890  002d 1a02          	or	a,(OFST+0,sp)
 892  002f 2022          	jp	LC003
 893  0031               L523:
 894                     ; 237       UART1->CR4 |= itpos;
 896  0031 c65237        	ld	a,21047
 897  0034 1a02          	or	a,(OFST+0,sp)
 898  0036 2026          	jp	LC001
 899  0038               L713:
 900                     ; 243     if (uartreg == 0x01)
 902  0038 7b01          	ld	a,(OFST-1,sp)
 903  003a a101          	cp	a,#1
 904  003c 260b          	jrne	L333
 905                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
 907  003e 7b02          	ld	a,(OFST+0,sp)
 908  0040 43            	cpl	a
 909  0041 c45234        	and	a,21044
 910  0044               LC002:
 911  0044 c75234        	ld	21044,a
 913  0047 2018          	jra	L133
 914  0049               L333:
 915                     ; 247     else if (uartreg == 0x02)
 917  0049 a102          	cp	a,#2
 918  004b 260b          	jrne	L733
 919                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
 921  004d 7b02          	ld	a,(OFST+0,sp)
 922  004f 43            	cpl	a
 923  0050 c45235        	and	a,21045
 924  0053               LC003:
 925  0053 c75235        	ld	21045,a
 927  0056 2009          	jra	L133
 928  0058               L733:
 929                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
 931  0058 7b02          	ld	a,(OFST+0,sp)
 932  005a 43            	cpl	a
 933  005b c45237        	and	a,21047
 934  005e               LC001:
 935  005e c75237        	ld	21047,a
 936  0061               L133:
 937                     ; 257 }
 940  0061 5b04          	addw	sp,#4
 941  0063 81            	ret	
 977                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
 977                     ; 266 {
 978                     .text:	section	.text,new
 979  0000               _UART1_HalfDuplexCmd:
 983                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 985                     ; 269   if (NewState != DISABLE)
 987  0000 4d            	tnz	a
 988  0001 2705          	jreq	L163
 989                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
 991  0003 72165238      	bset	21048,#3
 994  0007 81            	ret	
 995  0008               L163:
 996                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
 998  0008 72175238      	bres	21048,#3
 999                     ; 277 }
1002  000c 81            	ret	
1059                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1059                     ; 286 {
1060                     .text:	section	.text,new
1061  0000               _UART1_IrDAConfig:
1065                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1067                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1069  0000 4d            	tnz	a
1070  0001 2705          	jreq	L314
1071                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1073  0003 72145238      	bset	21048,#2
1076  0007 81            	ret	
1077  0008               L314:
1078                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1080  0008 72155238      	bres	21048,#2
1081                     ; 297 }
1084  000c 81            	ret	
1119                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1119                     ; 306 {
1120                     .text:	section	.text,new
1121  0000               _UART1_IrDACmd:
1125                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1127                     ; 310   if (NewState != DISABLE)
1129  0000 4d            	tnz	a
1130  0001 2705          	jreq	L534
1131                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1133  0003 72125238      	bset	21048,#1
1136  0007 81            	ret	
1137  0008               L534:
1138                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1140  0008 72135238      	bres	21048,#1
1141                     ; 320 }
1144  000c 81            	ret	
1203                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1203                     ; 330 {
1204                     .text:	section	.text,new
1205  0000               _UART1_LINBreakDetectionConfig:
1209                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1211                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1213  0000 4d            	tnz	a
1214  0001 2705          	jreq	L764
1215                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1217  0003 721a5237      	bset	21047,#5
1220  0007 81            	ret	
1221  0008               L764:
1222                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1224  0008 721b5237      	bres	21047,#5
1225                     ; 341 }
1228  000c 81            	ret	
1263                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1263                     ; 350 {
1264                     .text:	section	.text,new
1265  0000               _UART1_LINCmd:
1269                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1271                     ; 353   if (NewState != DISABLE)
1273  0000 4d            	tnz	a
1274  0001 2705          	jreq	L115
1275                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1277  0003 721c5236      	bset	21046,#6
1280  0007 81            	ret	
1281  0008               L115:
1282                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1284  0008 721d5236      	bres	21046,#6
1285                     ; 363 }
1288  000c 81            	ret	
1323                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1323                     ; 372 {
1324                     .text:	section	.text,new
1325  0000               _UART1_SmartCardCmd:
1329                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1331                     ; 375   if (NewState != DISABLE)
1333  0000 4d            	tnz	a
1334  0001 2705          	jreq	L335
1335                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1337  0003 721a5238      	bset	21048,#5
1340  0007 81            	ret	
1341  0008               L335:
1342                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1344  0008 721b5238      	bres	21048,#5
1345                     ; 385 }
1348  000c 81            	ret	
1384                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1384                     ; 395 {
1385                     .text:	section	.text,new
1386  0000               _UART1_SmartCardNACKCmd:
1390                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1392                     ; 398   if (NewState != DISABLE)
1394  0000 4d            	tnz	a
1395  0001 2705          	jreq	L555
1396                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1398  0003 72185238      	bset	21048,#4
1401  0007 81            	ret	
1402  0008               L555:
1403                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1405  0008 72195238      	bres	21048,#4
1406                     ; 408 }
1409  000c 81            	ret	
1466                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1466                     ; 417 {
1467                     .text:	section	.text,new
1468  0000               _UART1_WakeUpConfig:
1472                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1474                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1476  0000 72175234      	bres	21044,#3
1477                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1479  0004 ca5234        	or	a,21044
1480  0007 c75234        	ld	21044,a
1481                     ; 422 }
1484  000a 81            	ret	
1520                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1520                     ; 431 {
1521                     .text:	section	.text,new
1522  0000               _UART1_ReceiverWakeUpCmd:
1526                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1528                     ; 434   if (NewState != DISABLE)
1530  0000 4d            	tnz	a
1531  0001 2705          	jreq	L526
1532                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1534  0003 72125235      	bset	21045,#1
1537  0007 81            	ret	
1538  0008               L526:
1539                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1541  0008 72135235      	bres	21045,#1
1542                     ; 444 }
1545  000c 81            	ret	
1568                     ; 451 uint8_t UART1_ReceiveData8(void)
1568                     ; 452 {
1569                     .text:	section	.text,new
1570  0000               _UART1_ReceiveData8:
1574                     ; 453   return ((uint8_t)UART1->DR);
1576  0000 c65231        	ld	a,21041
1579  0003 81            	ret	
1613                     ; 461 uint16_t UART1_ReceiveData9(void)
1613                     ; 462 {
1614                     .text:	section	.text,new
1615  0000               _UART1_ReceiveData9:
1617  0000 89            	pushw	x
1618       00000002      OFST:	set	2
1621                     ; 463   uint16_t temp = 0;
1623                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
1625  0001 c65234        	ld	a,21044
1626  0004 a480          	and	a,#128
1627  0006 5f            	clrw	x
1628  0007 02            	rlwa	x,a
1629  0008 58            	sllw	x
1630  0009 1f01          	ldw	(OFST-1,sp),x
1632                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
1634  000b c65231        	ld	a,21041
1635  000e 5f            	clrw	x
1636  000f 97            	ld	xl,a
1637  0010 01            	rrwa	x,a
1638  0011 1a02          	or	a,(OFST+0,sp)
1639  0013 01            	rrwa	x,a
1640  0014 1a01          	or	a,(OFST-1,sp)
1641  0016 a401          	and	a,#1
1642  0018 01            	rrwa	x,a
1645  0019 5b02          	addw	sp,#2
1646  001b 81            	ret	
1680                     ; 474 void UART1_SendData8(uint8_t Data)
1680                     ; 475 {
1681                     .text:	section	.text,new
1682  0000               _UART1_SendData8:
1686                     ; 477   UART1->DR = Data;
1688  0000 c75231        	ld	21041,a
1689                     ; 478 }
1692  0003 81            	ret	
1726                     ; 486 void UART1_SendData9(uint16_t Data)
1726                     ; 487 {
1727                     .text:	section	.text,new
1728  0000               _UART1_SendData9:
1730  0000 89            	pushw	x
1731       00000000      OFST:	set	0
1734                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
1736  0001 721d5234      	bres	21044,#6
1737                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
1739  0005 54            	srlw	x
1740  0006 54            	srlw	x
1741  0007 9f            	ld	a,xl
1742  0008 a440          	and	a,#64
1743  000a ca5234        	or	a,21044
1744  000d c75234        	ld	21044,a
1745                     ; 493   UART1->DR   = (uint8_t)(Data);
1747  0010 7b02          	ld	a,(OFST+2,sp)
1748  0012 c75231        	ld	21041,a
1749                     ; 494 }
1752  0015 85            	popw	x
1753  0016 81            	ret	
1776                     ; 501 void UART1_SendBreak(void)
1776                     ; 502 {
1777                     .text:	section	.text,new
1778  0000               _UART1_SendBreak:
1782                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
1784  0000 72105235      	bset	21045,#0
1785                     ; 504 }
1788  0004 81            	ret	
1822                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
1822                     ; 512 {
1823                     .text:	section	.text,new
1824  0000               _UART1_SetAddress:
1826  0000 88            	push	a
1827       00000000      OFST:	set	0
1830                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
1832                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
1834  0001 c65237        	ld	a,21047
1835  0004 a4f0          	and	a,#240
1836  0006 c75237        	ld	21047,a
1837                     ; 519   UART1->CR4 |= UART1_Address;
1839  0009 c65237        	ld	a,21047
1840  000c 1a01          	or	a,(OFST+1,sp)
1841  000e c75237        	ld	21047,a
1842                     ; 520 }
1845  0011 84            	pop	a
1846  0012 81            	ret	
1880                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
1880                     ; 529 {
1881                     .text:	section	.text,new
1882  0000               _UART1_SetGuardTime:
1886                     ; 531   UART1->GTR = UART1_GuardTime;
1888  0000 c75239        	ld	21049,a
1889                     ; 532 }
1892  0003 81            	ret	
1926                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
1926                     ; 557 {
1927                     .text:	section	.text,new
1928  0000               _UART1_SetPrescaler:
1932                     ; 559   UART1->PSCR = UART1_Prescaler;
1934  0000 c7523a        	ld	21050,a
1935                     ; 560 }
1938  0003 81            	ret	
2081                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2081                     ; 569 {
2082                     .text:	section	.text,new
2083  0000               _UART1_GetFlagStatus:
2085  0000 89            	pushw	x
2086  0001 88            	push	a
2087       00000001      OFST:	set	1
2090                     ; 570   FlagStatus status = RESET;
2092                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2094                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2096  0002 a30210        	cpw	x,#528
2097  0005 2608          	jrne	L7501
2098                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2100  0007 9f            	ld	a,xl
2101  0008 c45237        	and	a,21047
2102  000b 271c          	jreq	L5601
2103                     ; 582       status = SET;
2105  000d 2015          	jp	LC006
2106                     ; 587       status = RESET;
2107  000f               L7501:
2108                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2110  000f a30101        	cpw	x,#257
2111  0012 2609          	jrne	L7601
2112                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2114  0014 c65235        	ld	a,21045
2115  0017 1503          	bcp	a,(OFST+2,sp)
2116  0019 270d          	jreq	L7701
2117                     ; 595       status = SET;
2119  001b 2007          	jp	LC006
2120                     ; 600       status = RESET;
2121  001d               L7601:
2122                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2124  001d c65230        	ld	a,21040
2125  0020 1503          	bcp	a,(OFST+2,sp)
2126  0022 2704          	jreq	L7701
2127                     ; 608       status = SET;
2129  0024               LC006:
2132  0024 a601          	ld	a,#1
2136  0026 2001          	jra	L5601
2137  0028               L7701:
2138                     ; 613       status = RESET;
2141  0028 4f            	clr	a
2143  0029               L5601:
2144                     ; 617   return status;
2148  0029 5b03          	addw	sp,#3
2149  002b 81            	ret	
2184                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2184                     ; 647 {
2185                     .text:	section	.text,new
2186  0000               _UART1_ClearFlag:
2190                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2192                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2194  0000 a30020        	cpw	x,#32
2195  0003 2605          	jrne	L1211
2196                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2198  0005 35df5230      	mov	21040,#223
2201  0009 81            	ret	
2202  000a               L1211:
2203                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2205  000a 72195237      	bres	21047,#4
2206                     ; 660 }
2209  000e 81            	ret	
2291                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2291                     ; 676 {
2292                     .text:	section	.text,new
2293  0000               _UART1_GetITStatus:
2295  0000 89            	pushw	x
2296  0001 89            	pushw	x
2297       00000002      OFST:	set	2
2300                     ; 677   ITStatus pendingbitstatus = RESET;
2302                     ; 678   uint8_t itpos = 0;
2304                     ; 679   uint8_t itmask1 = 0;
2306                     ; 680   uint8_t itmask2 = 0;
2308                     ; 681   uint8_t enablestatus = 0;
2310                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2312                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2314  0002 9f            	ld	a,xl
2315  0003 a40f          	and	a,#15
2316  0005 5f            	clrw	x
2317  0006 97            	ld	xl,a
2318  0007 a601          	ld	a,#1
2319  0009 5d            	tnzw	x
2320  000a 2704          	jreq	L67
2321  000c               L001:
2322  000c 48            	sll	a
2323  000d 5a            	decw	x
2324  000e 26fc          	jrne	L001
2325  0010               L67:
2326  0010 6b01          	ld	(OFST-1,sp),a
2328                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2330  0012 7b04          	ld	a,(OFST+2,sp)
2331  0014 4e            	swap	a
2332  0015 a40f          	and	a,#15
2333  0017 6b02          	ld	(OFST+0,sp),a
2335                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2337  0019 5f            	clrw	x
2338  001a 97            	ld	xl,a
2339  001b a601          	ld	a,#1
2340  001d 5d            	tnzw	x
2341  001e 2704          	jreq	L201
2342  0020               L401:
2343  0020 48            	sll	a
2344  0021 5a            	decw	x
2345  0022 26fc          	jrne	L401
2346  0024               L201:
2347  0024 6b02          	ld	(OFST+0,sp),a
2349                     ; 695   if (UART1_IT == UART1_IT_PE)
2351  0026 1e03          	ldw	x,(OFST+1,sp)
2352  0028 a30100        	cpw	x,#256
2353  002b 260c          	jrne	L7611
2354                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2356  002d c65234        	ld	a,21044
2357  0030 1402          	and	a,(OFST+0,sp)
2358  0032 6b02          	ld	(OFST+0,sp),a
2360                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2362  0034 c65230        	ld	a,21040
2364                     ; 704       pendingbitstatus = SET;
2366  0037 200f          	jp	LC009
2367                     ; 709       pendingbitstatus = RESET;
2368  0039               L7611:
2369                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2371  0039 a30346        	cpw	x,#838
2372  003c 2616          	jrne	L7711
2373                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2375  003e c65237        	ld	a,21047
2376  0041 1402          	and	a,(OFST+0,sp)
2377  0043 6b02          	ld	(OFST+0,sp),a
2379                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2381  0045 c65237        	ld	a,21047
2383  0048               LC009:
2384  0048 1501          	bcp	a,(OFST-1,sp)
2385  004a 271a          	jreq	L7021
2386  004c 7b02          	ld	a,(OFST+0,sp)
2387  004e 2716          	jreq	L7021
2388                     ; 721       pendingbitstatus = SET;
2390  0050               LC008:
2393  0050 a601          	ld	a,#1
2396  0052 2013          	jra	L5711
2397                     ; 726       pendingbitstatus = RESET;
2398  0054               L7711:
2399                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2401  0054 c65235        	ld	a,21045
2402  0057 1402          	and	a,(OFST+0,sp)
2403  0059 6b02          	ld	(OFST+0,sp),a
2405                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2407  005b c65230        	ld	a,21040
2408  005e 1501          	bcp	a,(OFST-1,sp)
2409  0060 2704          	jreq	L7021
2411  0062 7b02          	ld	a,(OFST+0,sp)
2412                     ; 737       pendingbitstatus = SET;
2414  0064 26ea          	jrne	LC008
2415  0066               L7021:
2416                     ; 742       pendingbitstatus = RESET;
2420  0066 4f            	clr	a
2422  0067               L5711:
2423                     ; 747   return  pendingbitstatus;
2427  0067 5b04          	addw	sp,#4
2428  0069 81            	ret	
2464                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2464                     ; 776 {
2465                     .text:	section	.text,new
2466  0000               _UART1_ClearITPendingBit:
2470                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2472                     ; 780   if (UART1_IT == UART1_IT_RXNE)
2474  0000 a30255        	cpw	x,#597
2475  0003 2605          	jrne	L1321
2476                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2478  0005 35df5230      	mov	21040,#223
2481  0009 81            	ret	
2482  000a               L1321:
2483                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2485  000a 72195237      	bres	21047,#4
2486                     ; 789 }
2489  000e 81            	ret	
2502                     	xdef	_UART1_ClearITPendingBit
2503                     	xdef	_UART1_GetITStatus
2504                     	xdef	_UART1_ClearFlag
2505                     	xdef	_UART1_GetFlagStatus
2506                     	xdef	_UART1_SetPrescaler
2507                     	xdef	_UART1_SetGuardTime
2508                     	xdef	_UART1_SetAddress
2509                     	xdef	_UART1_SendBreak
2510                     	xdef	_UART1_SendData9
2511                     	xdef	_UART1_SendData8
2512                     	xdef	_UART1_ReceiveData9
2513                     	xdef	_UART1_ReceiveData8
2514                     	xdef	_UART1_ReceiverWakeUpCmd
2515                     	xdef	_UART1_WakeUpConfig
2516                     	xdef	_UART1_SmartCardNACKCmd
2517                     	xdef	_UART1_SmartCardCmd
2518                     	xdef	_UART1_LINCmd
2519                     	xdef	_UART1_LINBreakDetectionConfig
2520                     	xdef	_UART1_IrDACmd
2521                     	xdef	_UART1_IrDAConfig
2522                     	xdef	_UART1_HalfDuplexCmd
2523                     	xdef	_UART1_ITConfig
2524                     	xdef	_UART1_Cmd
2525                     	xdef	_UART1_Init
2526                     	xdef	_UART1_DeInit
2527                     	xref	_CLK_GetClockFreq
2528                     	xref.b	c_lreg
2529                     	xref.b	c_x
2548                     	xref	c_lsub
2549                     	xref	c_smul
2550                     	xref	c_ludv
2551                     	xref	c_rtol
2552                     	xref	c_llsh
2553                     	xref	c_ltor
2554                     	end

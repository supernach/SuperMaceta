   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  21  0002               L5_flagUartRXNE:
  22  0002 00            	dc.b	0
  88                     ; 53 void UART1_DeInit(void)
  88                     ; 54 {
  90                     .text:	section	.text,new
  91  0000               _UART1_DeInit:
  95                     ; 57   (void)UART1->SR;
  97  0000 c65230        	ld	a,21040
  98                     ; 58   (void)UART1->DR;
 100  0003 c65231        	ld	a,21041
 101                     ; 60   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
 103  0006 725f5233      	clr	21043
 104                     ; 61   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
 106  000a 725f5232      	clr	21042
 107                     ; 63   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
 109  000e 725f5234      	clr	21044
 110                     ; 64   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
 112  0012 725f5235      	clr	21045
 113                     ; 65   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
 115  0016 725f5236      	clr	21046
 116                     ; 66   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
 118  001a 725f5237      	clr	21047
 119                     ; 67   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
 121  001e 725f5238      	clr	21048
 122                     ; 69   UART1->GTR = UART1_GTR_RESET_VALUE;
 124  0022 725f5239      	clr	21049
 125                     ; 70   UART1->PSCR = UART1_PSCR_RESET_VALUE;
 127  0026 725f523a      	clr	21050
 128                     ; 71 }
 131  002a 81            	ret	
 434                     .const:	section	.text
 435  0000               L41:
 436  0000 00000064      	dc.l	100
 437                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 437                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 437                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 437                     ; 93 {
 438                     .text:	section	.text,new
 439  0000               _UART1_Init:
 441  0000 520c          	subw	sp,#12
 442       0000000c      OFST:	set	12
 445                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 449                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 451                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 453                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 455                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
 457                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 459                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 461                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 463  0002 72195234      	bres	21044,#4
 464                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 466  0006 c65234        	ld	a,21044
 467  0009 1a13          	or	a,(OFST+7,sp)
 468  000b c75234        	ld	21044,a
 469                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 471  000e c65236        	ld	a,21046
 472  0011 a4cf          	and	a,#207
 473  0013 c75236        	ld	21046,a
 474                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 476  0016 c65236        	ld	a,21046
 477  0019 1a14          	or	a,(OFST+8,sp)
 478  001b c75236        	ld	21046,a
 479                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 481  001e c65234        	ld	a,21044
 482  0021 a4f9          	and	a,#249
 483  0023 c75234        	ld	21044,a
 484                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 486  0026 c65234        	ld	a,21044
 487  0029 1a15          	or	a,(OFST+9,sp)
 488  002b c75234        	ld	21044,a
 489                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 491  002e 725f5232      	clr	21042
 492                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 494  0032 c65233        	ld	a,21043
 495  0035 a40f          	and	a,#15
 496  0037 c75233        	ld	21043,a
 497                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 499  003a c65233        	ld	a,21043
 500  003d a4f0          	and	a,#240
 501  003f c75233        	ld	21043,a
 502                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 504  0042 96            	ldw	x,sp
 505  0043 1c000f        	addw	x,#OFST+3
 506  0046 cd0000        	call	c_ltor
 508  0049 a604          	ld	a,#4
 509  004b cd0000        	call	c_llsh
 511  004e 96            	ldw	x,sp
 512  004f 5c            	incw	x
 513  0050 cd0000        	call	c_rtol
 516  0053 cd0000        	call	_CLK_GetClockFreq
 518  0056 96            	ldw	x,sp
 519  0057 5c            	incw	x
 520  0058 cd0000        	call	c_ludv
 522  005b 96            	ldw	x,sp
 523  005c 1c0009        	addw	x,#OFST-3
 524  005f cd0000        	call	c_rtol
 527                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 529  0062 96            	ldw	x,sp
 530  0063 1c000f        	addw	x,#OFST+3
 531  0066 cd0000        	call	c_ltor
 533  0069 a604          	ld	a,#4
 534  006b cd0000        	call	c_llsh
 536  006e 96            	ldw	x,sp
 537  006f 5c            	incw	x
 538  0070 cd0000        	call	c_rtol
 541  0073 cd0000        	call	_CLK_GetClockFreq
 543  0076 a664          	ld	a,#100
 544  0078 cd0000        	call	c_smul
 546  007b 96            	ldw	x,sp
 547  007c 5c            	incw	x
 548  007d cd0000        	call	c_ludv
 550  0080 96            	ldw	x,sp
 551  0081 1c0005        	addw	x,#OFST-7
 552  0084 cd0000        	call	c_rtol
 555                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 557  0087 96            	ldw	x,sp
 558  0088 1c0009        	addw	x,#OFST-3
 559  008b cd0000        	call	c_ltor
 561  008e a664          	ld	a,#100
 562  0090 cd0000        	call	c_smul
 564  0093 96            	ldw	x,sp
 565  0094 5c            	incw	x
 566  0095 cd0000        	call	c_rtol
 569  0098 96            	ldw	x,sp
 570  0099 1c0005        	addw	x,#OFST-7
 571  009c cd0000        	call	c_ltor
 573  009f 96            	ldw	x,sp
 574  00a0 5c            	incw	x
 575  00a1 cd0000        	call	c_lsub
 577  00a4 a604          	ld	a,#4
 578  00a6 cd0000        	call	c_llsh
 580  00a9 ae0000        	ldw	x,#L41
 581  00ac cd0000        	call	c_ludv
 583  00af b603          	ld	a,c_lreg+3
 584  00b1 a40f          	and	a,#15
 585  00b3 ca5233        	or	a,21043
 586  00b6 c75233        	ld	21043,a
 587                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 589  00b9 1e0b          	ldw	x,(OFST-1,sp)
 590  00bb 54            	srlw	x
 591  00bc 54            	srlw	x
 592  00bd 54            	srlw	x
 593  00be 54            	srlw	x
 594  00bf 01            	rrwa	x,a
 595  00c0 a4f0          	and	a,#240
 596  00c2 ca5233        	or	a,21043
 597  00c5 c75233        	ld	21043,a
 598                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 600  00c8 c65232        	ld	a,21042
 601  00cb 1a0c          	or	a,(OFST+0,sp)
 602  00cd c75232        	ld	21042,a
 603                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 605  00d0 c65235        	ld	a,21045
 606  00d3 a4f3          	and	a,#243
 607  00d5 c75235        	ld	21045,a
 608                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 610  00d8 c65236        	ld	a,21046
 611  00db a4f8          	and	a,#248
 612  00dd c75236        	ld	21046,a
 613                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 613                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 615  00e0 7b16          	ld	a,(OFST+10,sp)
 616  00e2 a407          	and	a,#7
 617  00e4 ca5236        	or	a,21046
 618  00e7 c75236        	ld	21046,a
 619                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 621  00ea 7b17          	ld	a,(OFST+11,sp)
 622  00ec a504          	bcp	a,#4
 623  00ee 2706          	jreq	L712
 624                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 626  00f0 72165235      	bset	21045,#3
 628  00f4 2004          	jra	L122
 629  00f6               L712:
 630                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 632  00f6 72175235      	bres	21045,#3
 633  00fa               L122:
 634                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 636  00fa a508          	bcp	a,#8
 637  00fc 2706          	jreq	L322
 638                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 640  00fe 72145235      	bset	21045,#2
 642  0102 2004          	jra	L522
 643  0104               L322:
 644                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 646  0104 72155235      	bres	21045,#2
 647  0108               L522:
 648                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 650  0108 7b16          	ld	a,(OFST+10,sp)
 651  010a 2a06          	jrpl	L722
 652                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 654  010c 72175236      	bres	21046,#3
 656  0110 2008          	jra	L132
 657  0112               L722:
 658                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 660  0112 a408          	and	a,#8
 661  0114 ca5236        	or	a,21046
 662  0117 c75236        	ld	21046,a
 663  011a               L132:
 664                     ; 176 }
 667  011a 5b0c          	addw	sp,#12
 668  011c 81            	ret	
 723                     ; 184 void UART1_Cmd(FunctionalState NewState)
 723                     ; 185 {
 724                     .text:	section	.text,new
 725  0000               _UART1_Cmd:
 729                     ; 186   if (NewState != DISABLE)
 731  0000 4d            	tnz	a
 732  0001 2705          	jreq	L162
 733                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 735  0003 721b5234      	bres	21044,#5
 738  0007 81            	ret	
 739  0008               L162:
 740                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 742  0008 721a5234      	bset	21044,#5
 743                     ; 196 }
 746  000c 81            	ret	
 871                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 871                     ; 212 {
 872                     .text:	section	.text,new
 873  0000               _UART1_ITConfig:
 875  0000 89            	pushw	x
 876  0001 89            	pushw	x
 877       00000002      OFST:	set	2
 880                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 884                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 886                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 888                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
 890  0002 9e            	ld	a,xh
 891  0003 6b01          	ld	(OFST-1,sp),a
 893                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
 895  0005 9f            	ld	a,xl
 896  0006 a40f          	and	a,#15
 897  0008 5f            	clrw	x
 898  0009 97            	ld	xl,a
 899  000a a601          	ld	a,#1
 900  000c 5d            	tnzw	x
 901  000d 2704          	jreq	L22
 902  000f               L42:
 903  000f 48            	sll	a
 904  0010 5a            	decw	x
 905  0011 26fc          	jrne	L42
 906  0013               L22:
 907  0013 6b02          	ld	(OFST+0,sp),a
 909                     ; 224   if (NewState != DISABLE)
 911  0015 7b07          	ld	a,(OFST+5,sp)
 912  0017 271f          	jreq	L343
 913                     ; 227     if (uartreg == 0x01)
 915  0019 7b01          	ld	a,(OFST-1,sp)
 916  001b a101          	cp	a,#1
 917  001d 2607          	jrne	L543
 918                     ; 229       UART1->CR1 |= itpos;
 920  001f c65234        	ld	a,21044
 921  0022 1a02          	or	a,(OFST+0,sp)
 923  0024 201e          	jp	LC002
 924  0026               L543:
 925                     ; 231     else if (uartreg == 0x02)
 927  0026 a102          	cp	a,#2
 928  0028 2607          	jrne	L153
 929                     ; 233       UART1->CR2 |= itpos;
 931  002a c65235        	ld	a,21045
 932  002d 1a02          	or	a,(OFST+0,sp)
 934  002f 2022          	jp	LC003
 935  0031               L153:
 936                     ; 237       UART1->CR4 |= itpos;
 938  0031 c65237        	ld	a,21047
 939  0034 1a02          	or	a,(OFST+0,sp)
 940  0036 2026          	jp	LC001
 941  0038               L343:
 942                     ; 243     if (uartreg == 0x01)
 944  0038 7b01          	ld	a,(OFST-1,sp)
 945  003a a101          	cp	a,#1
 946  003c 260b          	jrne	L753
 947                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
 949  003e 7b02          	ld	a,(OFST+0,sp)
 950  0040 43            	cpl	a
 951  0041 c45234        	and	a,21044
 952  0044               LC002:
 953  0044 c75234        	ld	21044,a
 955  0047 2018          	jra	L553
 956  0049               L753:
 957                     ; 247     else if (uartreg == 0x02)
 959  0049 a102          	cp	a,#2
 960  004b 260b          	jrne	L363
 961                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
 963  004d 7b02          	ld	a,(OFST+0,sp)
 964  004f 43            	cpl	a
 965  0050 c45235        	and	a,21045
 966  0053               LC003:
 967  0053 c75235        	ld	21045,a
 969  0056 2009          	jra	L553
 970  0058               L363:
 971                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
 973  0058 7b02          	ld	a,(OFST+0,sp)
 974  005a 43            	cpl	a
 975  005b c45237        	and	a,21047
 976  005e               LC001:
 977  005e c75237        	ld	21047,a
 978  0061               L553:
 979                     ; 257 }
 982  0061 5b04          	addw	sp,#4
 983  0063 81            	ret	
1019                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
1019                     ; 266 {
1020                     .text:	section	.text,new
1021  0000               _UART1_HalfDuplexCmd:
1025                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1027                     ; 269   if (NewState != DISABLE)
1029  0000 4d            	tnz	a
1030  0001 2705          	jreq	L504
1031                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
1033  0003 72165238      	bset	21048,#3
1036  0007 81            	ret	
1037  0008               L504:
1038                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1040  0008 72175238      	bres	21048,#3
1041                     ; 277 }
1044  000c 81            	ret	
1101                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1101                     ; 286 {
1102                     .text:	section	.text,new
1103  0000               _UART1_IrDAConfig:
1107                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1109                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1111  0000 4d            	tnz	a
1112  0001 2705          	jreq	L734
1113                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1115  0003 72145238      	bset	21048,#2
1118  0007 81            	ret	
1119  0008               L734:
1120                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1122  0008 72155238      	bres	21048,#2
1123                     ; 297 }
1126  000c 81            	ret	
1161                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1161                     ; 306 {
1162                     .text:	section	.text,new
1163  0000               _UART1_IrDACmd:
1167                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1169                     ; 310   if (NewState != DISABLE)
1171  0000 4d            	tnz	a
1172  0001 2705          	jreq	L164
1173                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1175  0003 72125238      	bset	21048,#1
1178  0007 81            	ret	
1179  0008               L164:
1180                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1182  0008 72135238      	bres	21048,#1
1183                     ; 320 }
1186  000c 81            	ret	
1245                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1245                     ; 330 {
1246                     .text:	section	.text,new
1247  0000               _UART1_LINBreakDetectionConfig:
1251                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1253                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1255  0000 4d            	tnz	a
1256  0001 2705          	jreq	L315
1257                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1259  0003 721a5237      	bset	21047,#5
1262  0007 81            	ret	
1263  0008               L315:
1264                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1266  0008 721b5237      	bres	21047,#5
1267                     ; 341 }
1270  000c 81            	ret	
1305                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1305                     ; 350 {
1306                     .text:	section	.text,new
1307  0000               _UART1_LINCmd:
1311                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1313                     ; 353   if (NewState != DISABLE)
1315  0000 4d            	tnz	a
1316  0001 2705          	jreq	L535
1317                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1319  0003 721c5236      	bset	21046,#6
1322  0007 81            	ret	
1323  0008               L535:
1324                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1326  0008 721d5236      	bres	21046,#6
1327                     ; 363 }
1330  000c 81            	ret	
1365                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1365                     ; 372 {
1366                     .text:	section	.text,new
1367  0000               _UART1_SmartCardCmd:
1371                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1373                     ; 375   if (NewState != DISABLE)
1375  0000 4d            	tnz	a
1376  0001 2705          	jreq	L755
1377                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1379  0003 721a5238      	bset	21048,#5
1382  0007 81            	ret	
1383  0008               L755:
1384                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1386  0008 721b5238      	bres	21048,#5
1387                     ; 385 }
1390  000c 81            	ret	
1426                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1426                     ; 395 {
1427                     .text:	section	.text,new
1428  0000               _UART1_SmartCardNACKCmd:
1432                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1434                     ; 398   if (NewState != DISABLE)
1436  0000 4d            	tnz	a
1437  0001 2705          	jreq	L106
1438                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1440  0003 72185238      	bset	21048,#4
1443  0007 81            	ret	
1444  0008               L106:
1445                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1447  0008 72195238      	bres	21048,#4
1448                     ; 408 }
1451  000c 81            	ret	
1508                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1508                     ; 417 {
1509                     .text:	section	.text,new
1510  0000               _UART1_WakeUpConfig:
1514                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1516                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1518  0000 72175234      	bres	21044,#3
1519                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1521  0004 ca5234        	or	a,21044
1522  0007 c75234        	ld	21044,a
1523                     ; 422 }
1526  000a 81            	ret	
1562                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1562                     ; 431 {
1563                     .text:	section	.text,new
1564  0000               _UART1_ReceiverWakeUpCmd:
1568                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1570                     ; 434   if (NewState != DISABLE)
1572  0000 4d            	tnz	a
1573  0001 2705          	jreq	L156
1574                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1576  0003 72125235      	bset	21045,#1
1579  0007 81            	ret	
1580  0008               L156:
1581                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1583  0008 72135235      	bres	21045,#1
1584                     ; 444 }
1587  000c 81            	ret	
1610                     ; 451 uint8_t UART1_ReceiveData8(void)
1610                     ; 452 {
1611                     .text:	section	.text,new
1612  0000               _UART1_ReceiveData8:
1616                     ; 453   return ((uint8_t)UART1->DR);
1618  0000 c65231        	ld	a,21041
1621  0003 81            	ret	
1655                     ; 461 uint16_t UART1_ReceiveData9(void)
1655                     ; 462 {
1656                     .text:	section	.text,new
1657  0000               _UART1_ReceiveData9:
1659  0000 89            	pushw	x
1660       00000002      OFST:	set	2
1663                     ; 463   uint16_t temp = 0;
1665                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
1667  0001 c65234        	ld	a,21044
1668  0004 a480          	and	a,#128
1669  0006 5f            	clrw	x
1670  0007 02            	rlwa	x,a
1671  0008 58            	sllw	x
1672  0009 1f01          	ldw	(OFST-1,sp),x
1674                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
1676  000b c65231        	ld	a,21041
1677  000e 5f            	clrw	x
1678  000f 97            	ld	xl,a
1679  0010 01            	rrwa	x,a
1680  0011 1a02          	or	a,(OFST+0,sp)
1681  0013 01            	rrwa	x,a
1682  0014 1a01          	or	a,(OFST-1,sp)
1683  0016 a401          	and	a,#1
1684  0018 01            	rrwa	x,a
1687  0019 5b02          	addw	sp,#2
1688  001b 81            	ret	
1722                     ; 474 void UART1_SendData8(uint8_t Data)
1722                     ; 475 {
1723                     .text:	section	.text,new
1724  0000               _UART1_SendData8:
1728                     ; 477   UART1->DR = Data;
1730  0000 c75231        	ld	21041,a
1731                     ; 478 }
1734  0003 81            	ret	
1768                     ; 486 void UART1_SendData9(uint16_t Data)
1768                     ; 487 {
1769                     .text:	section	.text,new
1770  0000               _UART1_SendData9:
1772  0000 89            	pushw	x
1773       00000000      OFST:	set	0
1776                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
1778  0001 721d5234      	bres	21044,#6
1779                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
1781  0005 54            	srlw	x
1782  0006 54            	srlw	x
1783  0007 9f            	ld	a,xl
1784  0008 a440          	and	a,#64
1785  000a ca5234        	or	a,21044
1786  000d c75234        	ld	21044,a
1787                     ; 493   UART1->DR   = (uint8_t)(Data);
1789  0010 7b02          	ld	a,(OFST+2,sp)
1790  0012 c75231        	ld	21041,a
1791                     ; 494 }
1794  0015 85            	popw	x
1795  0016 81            	ret	
1818                     ; 501 void UART1_SendBreak(void)
1818                     ; 502 {
1819                     .text:	section	.text,new
1820  0000               _UART1_SendBreak:
1824                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
1826  0000 72105235      	bset	21045,#0
1827                     ; 504 }
1830  0004 81            	ret	
1864                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
1864                     ; 512 {
1865                     .text:	section	.text,new
1866  0000               _UART1_SetAddress:
1868  0000 88            	push	a
1869       00000000      OFST:	set	0
1872                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
1874                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
1876  0001 c65237        	ld	a,21047
1877  0004 a4f0          	and	a,#240
1878  0006 c75237        	ld	21047,a
1879                     ; 519   UART1->CR4 |= UART1_Address;
1881  0009 c65237        	ld	a,21047
1882  000c 1a01          	or	a,(OFST+1,sp)
1883  000e c75237        	ld	21047,a
1884                     ; 520 }
1887  0011 84            	pop	a
1888  0012 81            	ret	
1922                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
1922                     ; 529 {
1923                     .text:	section	.text,new
1924  0000               _UART1_SetGuardTime:
1928                     ; 531   UART1->GTR = UART1_GuardTime;
1930  0000 c75239        	ld	21049,a
1931                     ; 532 }
1934  0003 81            	ret	
1968                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
1968                     ; 557 {
1969                     .text:	section	.text,new
1970  0000               _UART1_SetPrescaler:
1974                     ; 559   UART1->PSCR = UART1_Prescaler;
1976  0000 c7523a        	ld	21050,a
1977                     ; 560 }
1980  0003 81            	ret	
2123                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2123                     ; 569 {
2124                     .text:	section	.text,new
2125  0000               _UART1_GetFlagStatus:
2127  0000 89            	pushw	x
2128  0001 88            	push	a
2129       00000001      OFST:	set	1
2132                     ; 570   FlagStatus status = RESET;
2134                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2136                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2138  0002 a30210        	cpw	x,#528
2139  0005 2608          	jrne	L3011
2140                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2142  0007 9f            	ld	a,xl
2143  0008 c45237        	and	a,21047
2144  000b 271c          	jreq	L1111
2145                     ; 582       status = SET;
2147  000d 2015          	jp	LC006
2148                     ; 587       status = RESET;
2149  000f               L3011:
2150                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2152  000f a30101        	cpw	x,#257
2153  0012 2609          	jrne	L3111
2154                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2156  0014 c65235        	ld	a,21045
2157  0017 1503          	bcp	a,(OFST+2,sp)
2158  0019 270d          	jreq	L3211
2159                     ; 595       status = SET;
2161  001b 2007          	jp	LC006
2162                     ; 600       status = RESET;
2163  001d               L3111:
2164                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2166  001d c65230        	ld	a,21040
2167  0020 1503          	bcp	a,(OFST+2,sp)
2168  0022 2704          	jreq	L3211
2169                     ; 608       status = SET;
2171  0024               LC006:
2174  0024 a601          	ld	a,#1
2178  0026 2001          	jra	L1111
2179  0028               L3211:
2180                     ; 613       status = RESET;
2183  0028 4f            	clr	a
2185  0029               L1111:
2186                     ; 617   return status;
2190  0029 5b03          	addw	sp,#3
2191  002b 81            	ret	
2226                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2226                     ; 647 {
2227                     .text:	section	.text,new
2228  0000               _UART1_ClearFlag:
2232                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2234                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2236  0000 a30020        	cpw	x,#32
2237  0003 2605          	jrne	L5411
2238                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2240  0005 35df5230      	mov	21040,#223
2243  0009 81            	ret	
2244  000a               L5411:
2245                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2247  000a 72195237      	bres	21047,#4
2248                     ; 660 }
2251  000e 81            	ret	
2333                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2333                     ; 676 {
2334                     .text:	section	.text,new
2335  0000               _UART1_GetITStatus:
2337  0000 89            	pushw	x
2338  0001 89            	pushw	x
2339       00000002      OFST:	set	2
2342                     ; 677   ITStatus pendingbitstatus = RESET;
2344                     ; 678   uint8_t itpos = 0;
2346                     ; 679   uint8_t itmask1 = 0;
2348                     ; 680   uint8_t itmask2 = 0;
2350                     ; 681   uint8_t enablestatus = 0;
2352                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2354                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2356  0002 9f            	ld	a,xl
2357  0003 a40f          	and	a,#15
2358  0005 5f            	clrw	x
2359  0006 97            	ld	xl,a
2360  0007 a601          	ld	a,#1
2361  0009 5d            	tnzw	x
2362  000a 2704          	jreq	L67
2363  000c               L001:
2364  000c 48            	sll	a
2365  000d 5a            	decw	x
2366  000e 26fc          	jrne	L001
2367  0010               L67:
2368  0010 6b01          	ld	(OFST-1,sp),a
2370                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2372  0012 7b04          	ld	a,(OFST+2,sp)
2373  0014 4e            	swap	a
2374  0015 a40f          	and	a,#15
2375  0017 6b02          	ld	(OFST+0,sp),a
2377                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2379  0019 5f            	clrw	x
2380  001a 97            	ld	xl,a
2381  001b a601          	ld	a,#1
2382  001d 5d            	tnzw	x
2383  001e 2704          	jreq	L201
2384  0020               L401:
2385  0020 48            	sll	a
2386  0021 5a            	decw	x
2387  0022 26fc          	jrne	L401
2388  0024               L201:
2389  0024 6b02          	ld	(OFST+0,sp),a
2391                     ; 695   if (UART1_IT == UART1_IT_PE)
2393  0026 1e03          	ldw	x,(OFST+1,sp)
2394  0028 a30100        	cpw	x,#256
2395  002b 260c          	jrne	L3121
2396                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2398  002d c65234        	ld	a,21044
2399  0030 1402          	and	a,(OFST+0,sp)
2400  0032 6b02          	ld	(OFST+0,sp),a
2402                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2404  0034 c65230        	ld	a,21040
2406                     ; 704       pendingbitstatus = SET;
2408  0037 200f          	jp	LC009
2409                     ; 709       pendingbitstatus = RESET;
2410  0039               L3121:
2411                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2413  0039 a30346        	cpw	x,#838
2414  003c 2616          	jrne	L3221
2415                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2417  003e c65237        	ld	a,21047
2418  0041 1402          	and	a,(OFST+0,sp)
2419  0043 6b02          	ld	(OFST+0,sp),a
2421                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2423  0045 c65237        	ld	a,21047
2425  0048               LC009:
2426  0048 1501          	bcp	a,(OFST-1,sp)
2427  004a 271a          	jreq	L3321
2428  004c 7b02          	ld	a,(OFST+0,sp)
2429  004e 2716          	jreq	L3321
2430                     ; 721       pendingbitstatus = SET;
2432  0050               LC008:
2435  0050 a601          	ld	a,#1
2438  0052 2013          	jra	L1221
2439                     ; 726       pendingbitstatus = RESET;
2440  0054               L3221:
2441                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2443  0054 c65235        	ld	a,21045
2444  0057 1402          	and	a,(OFST+0,sp)
2445  0059 6b02          	ld	(OFST+0,sp),a
2447                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2449  005b c65230        	ld	a,21040
2450  005e 1501          	bcp	a,(OFST-1,sp)
2451  0060 2704          	jreq	L3321
2453  0062 7b02          	ld	a,(OFST+0,sp)
2454                     ; 737       pendingbitstatus = SET;
2456  0064 26ea          	jrne	LC008
2457  0066               L3321:
2458                     ; 742       pendingbitstatus = RESET;
2462  0066 4f            	clr	a
2464  0067               L1221:
2465                     ; 747   return  pendingbitstatus;
2469  0067 5b04          	addw	sp,#4
2470  0069 81            	ret	
2506                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2506                     ; 776 {
2507                     .text:	section	.text,new
2508  0000               _UART1_ClearITPendingBit:
2512                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2514                     ; 780   if (UART1_IT == UART1_IT_RXNE)
2516  0000 a30255        	cpw	x,#597
2517  0003 2605          	jrne	L5521
2518                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2520  0005 35df5230      	mov	21040,#223
2523  0009 81            	ret	
2524  000a               L5521:
2525                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2527  000a 72195237      	bres	21047,#4
2528                     ; 789 }
2531  000e 81            	ret	
2544                     	xdef	_UART1_ClearITPendingBit
2545                     	xdef	_UART1_GetITStatus
2546                     	xdef	_UART1_ClearFlag
2547                     	xdef	_UART1_GetFlagStatus
2548                     	xdef	_UART1_SetPrescaler
2549                     	xdef	_UART1_SetGuardTime
2550                     	xdef	_UART1_SetAddress
2551                     	xdef	_UART1_SendBreak
2552                     	xdef	_UART1_SendData9
2553                     	xdef	_UART1_SendData8
2554                     	xdef	_UART1_ReceiveData9
2555                     	xdef	_UART1_ReceiveData8
2556                     	xdef	_UART1_ReceiverWakeUpCmd
2557                     	xdef	_UART1_WakeUpConfig
2558                     	xdef	_UART1_SmartCardNACKCmd
2559                     	xdef	_UART1_SmartCardCmd
2560                     	xdef	_UART1_LINCmd
2561                     	xdef	_UART1_LINBreakDetectionConfig
2562                     	xdef	_UART1_IrDACmd
2563                     	xdef	_UART1_IrDAConfig
2564                     	xdef	_UART1_HalfDuplexCmd
2565                     	xdef	_UART1_ITConfig
2566                     	xdef	_UART1_Cmd
2567                     	xdef	_UART1_Init
2568                     	xdef	_UART1_DeInit
2569                     	xref	_CLK_GetClockFreq
2570                     	xref.b	c_lreg
2571                     	xref.b	c_x
2590                     	xref	c_lsub
2591                     	xref	c_smul
2592                     	xref	c_ludv
2593                     	xref	c_rtol
2594                     	xref	c_llsh
2595                     	xref	c_ltor
2596                     	end

   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  21  0002               L5_flagUartRXNE:
  22  0002 00            	dc.b	0
  23  0003               L11_flagUartTXE:
  24  0003 00            	dc.b	0
  99                     ; 53 void UART1_DeInit(void)
  99                     ; 54 {
 101                     .text:	section	.text,new
 102  0000               _UART1_DeInit:
 106                     ; 57   (void)UART1->SR;
 108  0000 c65230        	ld	a,21040
 109                     ; 58   (void)UART1->DR;
 111  0003 c65231        	ld	a,21041
 112                     ; 60   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
 114  0006 725f5233      	clr	21043
 115                     ; 61   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
 117  000a 725f5232      	clr	21042
 118                     ; 63   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
 120  000e 725f5234      	clr	21044
 121                     ; 64   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
 123  0012 725f5235      	clr	21045
 124                     ; 65   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
 126  0016 725f5236      	clr	21046
 127                     ; 66   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
 129  001a 725f5237      	clr	21047
 130                     ; 67   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
 132  001e 725f5238      	clr	21048
 133                     ; 69   UART1->GTR = UART1_GTR_RESET_VALUE;
 135  0022 725f5239      	clr	21049
 136                     ; 70   UART1->PSCR = UART1_PSCR_RESET_VALUE;
 138  0026 725f523a      	clr	21050
 139                     ; 71 }
 142  002a 81            	ret	
 445                     .const:	section	.text
 446  0000               L41:
 447  0000 00000064      	dc.l	100
 448                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 448                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 448                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 448                     ; 93 {
 449                     .text:	section	.text,new
 450  0000               _UART1_Init:
 452  0000 520c          	subw	sp,#12
 453       0000000c      OFST:	set	12
 456                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 460                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 462                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 464                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 466                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
 468                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 470                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 472                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 474  0002 72195234      	bres	21044,#4
 475                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 477  0006 c65234        	ld	a,21044
 478  0009 1a13          	or	a,(OFST+7,sp)
 479  000b c75234        	ld	21044,a
 480                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 482  000e c65236        	ld	a,21046
 483  0011 a4cf          	and	a,#207
 484  0013 c75236        	ld	21046,a
 485                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 487  0016 c65236        	ld	a,21046
 488  0019 1a14          	or	a,(OFST+8,sp)
 489  001b c75236        	ld	21046,a
 490                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 492  001e c65234        	ld	a,21044
 493  0021 a4f9          	and	a,#249
 494  0023 c75234        	ld	21044,a
 495                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 497  0026 c65234        	ld	a,21044
 498  0029 1a15          	or	a,(OFST+9,sp)
 499  002b c75234        	ld	21044,a
 500                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 502  002e 725f5232      	clr	21042
 503                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 505  0032 c65233        	ld	a,21043
 506  0035 a40f          	and	a,#15
 507  0037 c75233        	ld	21043,a
 508                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 510  003a c65233        	ld	a,21043
 511  003d a4f0          	and	a,#240
 512  003f c75233        	ld	21043,a
 513                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 515  0042 96            	ldw	x,sp
 516  0043 1c000f        	addw	x,#OFST+3
 517  0046 cd0000        	call	c_ltor
 519  0049 a604          	ld	a,#4
 520  004b cd0000        	call	c_llsh
 522  004e 96            	ldw	x,sp
 523  004f 5c            	incw	x
 524  0050 cd0000        	call	c_rtol
 527  0053 cd0000        	call	_CLK_GetClockFreq
 529  0056 96            	ldw	x,sp
 530  0057 5c            	incw	x
 531  0058 cd0000        	call	c_ludv
 533  005b 96            	ldw	x,sp
 534  005c 1c0009        	addw	x,#OFST-3
 535  005f cd0000        	call	c_rtol
 538                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 540  0062 96            	ldw	x,sp
 541  0063 1c000f        	addw	x,#OFST+3
 542  0066 cd0000        	call	c_ltor
 544  0069 a604          	ld	a,#4
 545  006b cd0000        	call	c_llsh
 547  006e 96            	ldw	x,sp
 548  006f 5c            	incw	x
 549  0070 cd0000        	call	c_rtol
 552  0073 cd0000        	call	_CLK_GetClockFreq
 554  0076 a664          	ld	a,#100
 555  0078 cd0000        	call	c_smul
 557  007b 96            	ldw	x,sp
 558  007c 5c            	incw	x
 559  007d cd0000        	call	c_ludv
 561  0080 96            	ldw	x,sp
 562  0081 1c0005        	addw	x,#OFST-7
 563  0084 cd0000        	call	c_rtol
 566                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 568  0087 96            	ldw	x,sp
 569  0088 1c0009        	addw	x,#OFST-3
 570  008b cd0000        	call	c_ltor
 572  008e a664          	ld	a,#100
 573  0090 cd0000        	call	c_smul
 575  0093 96            	ldw	x,sp
 576  0094 5c            	incw	x
 577  0095 cd0000        	call	c_rtol
 580  0098 96            	ldw	x,sp
 581  0099 1c0005        	addw	x,#OFST-7
 582  009c cd0000        	call	c_ltor
 584  009f 96            	ldw	x,sp
 585  00a0 5c            	incw	x
 586  00a1 cd0000        	call	c_lsub
 588  00a4 a604          	ld	a,#4
 589  00a6 cd0000        	call	c_llsh
 591  00a9 ae0000        	ldw	x,#L41
 592  00ac cd0000        	call	c_ludv
 594  00af b603          	ld	a,c_lreg+3
 595  00b1 a40f          	and	a,#15
 596  00b3 ca5233        	or	a,21043
 597  00b6 c75233        	ld	21043,a
 598                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 600  00b9 1e0b          	ldw	x,(OFST-1,sp)
 601  00bb 54            	srlw	x
 602  00bc 54            	srlw	x
 603  00bd 54            	srlw	x
 604  00be 54            	srlw	x
 605  00bf 01            	rrwa	x,a
 606  00c0 a4f0          	and	a,#240
 607  00c2 ca5233        	or	a,21043
 608  00c5 c75233        	ld	21043,a
 609                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 611  00c8 c65232        	ld	a,21042
 612  00cb 1a0c          	or	a,(OFST+0,sp)
 613  00cd c75232        	ld	21042,a
 614                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 616  00d0 c65235        	ld	a,21045
 617  00d3 a4f3          	and	a,#243
 618  00d5 c75235        	ld	21045,a
 619                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 621  00d8 c65236        	ld	a,21046
 622  00db a4f8          	and	a,#248
 623  00dd c75236        	ld	21046,a
 624                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 624                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 626  00e0 7b16          	ld	a,(OFST+10,sp)
 627  00e2 a407          	and	a,#7
 628  00e4 ca5236        	or	a,21046
 629  00e7 c75236        	ld	21046,a
 630                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 632  00ea 7b17          	ld	a,(OFST+11,sp)
 633  00ec a504          	bcp	a,#4
 634  00ee 2706          	jreq	L722
 635                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 637  00f0 72165235      	bset	21045,#3
 639  00f4 2004          	jra	L132
 640  00f6               L722:
 641                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 643  00f6 72175235      	bres	21045,#3
 644  00fa               L132:
 645                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 647  00fa a508          	bcp	a,#8
 648  00fc 2706          	jreq	L332
 649                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 651  00fe 72145235      	bset	21045,#2
 653  0102 2004          	jra	L532
 654  0104               L332:
 655                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 657  0104 72155235      	bres	21045,#2
 658  0108               L532:
 659                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 661  0108 7b16          	ld	a,(OFST+10,sp)
 662  010a 2a06          	jrpl	L732
 663                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 665  010c 72175236      	bres	21046,#3
 667  0110 2008          	jra	L142
 668  0112               L732:
 669                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 671  0112 a408          	and	a,#8
 672  0114 ca5236        	or	a,21046
 673  0117 c75236        	ld	21046,a
 674  011a               L142:
 675                     ; 176 }
 678  011a 5b0c          	addw	sp,#12
 679  011c 81            	ret	
 734                     ; 184 void UART1_Cmd(FunctionalState NewState)
 734                     ; 185 {
 735                     .text:	section	.text,new
 736  0000               _UART1_Cmd:
 740                     ; 186   if (NewState != DISABLE)
 742  0000 4d            	tnz	a
 743  0001 2705          	jreq	L172
 744                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 746  0003 721b5234      	bres	21044,#5
 749  0007 81            	ret	
 750  0008               L172:
 751                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 753  0008 721a5234      	bset	21044,#5
 754                     ; 196 }
 757  000c 81            	ret	
 882                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 882                     ; 212 {
 883                     .text:	section	.text,new
 884  0000               _UART1_ITConfig:
 886  0000 89            	pushw	x
 887  0001 89            	pushw	x
 888       00000002      OFST:	set	2
 891                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 895                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 897                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 899                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
 901  0002 9e            	ld	a,xh
 902  0003 6b01          	ld	(OFST-1,sp),a
 904                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
 906  0005 9f            	ld	a,xl
 907  0006 a40f          	and	a,#15
 908  0008 5f            	clrw	x
 909  0009 97            	ld	xl,a
 910  000a a601          	ld	a,#1
 911  000c 5d            	tnzw	x
 912  000d 2704          	jreq	L22
 913  000f               L42:
 914  000f 48            	sll	a
 915  0010 5a            	decw	x
 916  0011 26fc          	jrne	L42
 917  0013               L22:
 918  0013 6b02          	ld	(OFST+0,sp),a
 920                     ; 224   if (NewState != DISABLE)
 922  0015 7b07          	ld	a,(OFST+5,sp)
 923  0017 271f          	jreq	L353
 924                     ; 227     if (uartreg == 0x01)
 926  0019 7b01          	ld	a,(OFST-1,sp)
 927  001b a101          	cp	a,#1
 928  001d 2607          	jrne	L553
 929                     ; 229       UART1->CR1 |= itpos;
 931  001f c65234        	ld	a,21044
 932  0022 1a02          	or	a,(OFST+0,sp)
 934  0024 201e          	jp	LC002
 935  0026               L553:
 936                     ; 231     else if (uartreg == 0x02)
 938  0026 a102          	cp	a,#2
 939  0028 2607          	jrne	L163
 940                     ; 233       UART1->CR2 |= itpos;
 942  002a c65235        	ld	a,21045
 943  002d 1a02          	or	a,(OFST+0,sp)
 945  002f 2022          	jp	LC003
 946  0031               L163:
 947                     ; 237       UART1->CR4 |= itpos;
 949  0031 c65237        	ld	a,21047
 950  0034 1a02          	or	a,(OFST+0,sp)
 951  0036 2026          	jp	LC001
 952  0038               L353:
 953                     ; 243     if (uartreg == 0x01)
 955  0038 7b01          	ld	a,(OFST-1,sp)
 956  003a a101          	cp	a,#1
 957  003c 260b          	jrne	L763
 958                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
 960  003e 7b02          	ld	a,(OFST+0,sp)
 961  0040 43            	cpl	a
 962  0041 c45234        	and	a,21044
 963  0044               LC002:
 964  0044 c75234        	ld	21044,a
 966  0047 2018          	jra	L563
 967  0049               L763:
 968                     ; 247     else if (uartreg == 0x02)
 970  0049 a102          	cp	a,#2
 971  004b 260b          	jrne	L373
 972                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
 974  004d 7b02          	ld	a,(OFST+0,sp)
 975  004f 43            	cpl	a
 976  0050 c45235        	and	a,21045
 977  0053               LC003:
 978  0053 c75235        	ld	21045,a
 980  0056 2009          	jra	L563
 981  0058               L373:
 982                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
 984  0058 7b02          	ld	a,(OFST+0,sp)
 985  005a 43            	cpl	a
 986  005b c45237        	and	a,21047
 987  005e               LC001:
 988  005e c75237        	ld	21047,a
 989  0061               L563:
 990                     ; 257 }
 993  0061 5b04          	addw	sp,#4
 994  0063 81            	ret	
1030                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
1030                     ; 266 {
1031                     .text:	section	.text,new
1032  0000               _UART1_HalfDuplexCmd:
1036                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1038                     ; 269   if (NewState != DISABLE)
1040  0000 4d            	tnz	a
1041  0001 2705          	jreq	L514
1042                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
1044  0003 72165238      	bset	21048,#3
1047  0007 81            	ret	
1048  0008               L514:
1049                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1051  0008 72175238      	bres	21048,#3
1052                     ; 277 }
1055  000c 81            	ret	
1112                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1112                     ; 286 {
1113                     .text:	section	.text,new
1114  0000               _UART1_IrDAConfig:
1118                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1120                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1122  0000 4d            	tnz	a
1123  0001 2705          	jreq	L744
1124                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1126  0003 72145238      	bset	21048,#2
1129  0007 81            	ret	
1130  0008               L744:
1131                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1133  0008 72155238      	bres	21048,#2
1134                     ; 297 }
1137  000c 81            	ret	
1172                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1172                     ; 306 {
1173                     .text:	section	.text,new
1174  0000               _UART1_IrDACmd:
1178                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1180                     ; 310   if (NewState != DISABLE)
1182  0000 4d            	tnz	a
1183  0001 2705          	jreq	L174
1184                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1186  0003 72125238      	bset	21048,#1
1189  0007 81            	ret	
1190  0008               L174:
1191                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1193  0008 72135238      	bres	21048,#1
1194                     ; 320 }
1197  000c 81            	ret	
1256                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1256                     ; 330 {
1257                     .text:	section	.text,new
1258  0000               _UART1_LINBreakDetectionConfig:
1262                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1264                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1266  0000 4d            	tnz	a
1267  0001 2705          	jreq	L325
1268                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1270  0003 721a5237      	bset	21047,#5
1273  0007 81            	ret	
1274  0008               L325:
1275                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1277  0008 721b5237      	bres	21047,#5
1278                     ; 341 }
1281  000c 81            	ret	
1316                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1316                     ; 350 {
1317                     .text:	section	.text,new
1318  0000               _UART1_LINCmd:
1322                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1324                     ; 353   if (NewState != DISABLE)
1326  0000 4d            	tnz	a
1327  0001 2705          	jreq	L545
1328                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1330  0003 721c5236      	bset	21046,#6
1333  0007 81            	ret	
1334  0008               L545:
1335                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1337  0008 721d5236      	bres	21046,#6
1338                     ; 363 }
1341  000c 81            	ret	
1376                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1376                     ; 372 {
1377                     .text:	section	.text,new
1378  0000               _UART1_SmartCardCmd:
1382                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1384                     ; 375   if (NewState != DISABLE)
1386  0000 4d            	tnz	a
1387  0001 2705          	jreq	L765
1388                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1390  0003 721a5238      	bset	21048,#5
1393  0007 81            	ret	
1394  0008               L765:
1395                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1397  0008 721b5238      	bres	21048,#5
1398                     ; 385 }
1401  000c 81            	ret	
1437                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1437                     ; 395 {
1438                     .text:	section	.text,new
1439  0000               _UART1_SmartCardNACKCmd:
1443                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1445                     ; 398   if (NewState != DISABLE)
1447  0000 4d            	tnz	a
1448  0001 2705          	jreq	L116
1449                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1451  0003 72185238      	bset	21048,#4
1454  0007 81            	ret	
1455  0008               L116:
1456                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1458  0008 72195238      	bres	21048,#4
1459                     ; 408 }
1462  000c 81            	ret	
1519                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1519                     ; 417 {
1520                     .text:	section	.text,new
1521  0000               _UART1_WakeUpConfig:
1525                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1527                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1529  0000 72175234      	bres	21044,#3
1530                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1532  0004 ca5234        	or	a,21044
1533  0007 c75234        	ld	21044,a
1534                     ; 422 }
1537  000a 81            	ret	
1573                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1573                     ; 431 {
1574                     .text:	section	.text,new
1575  0000               _UART1_ReceiverWakeUpCmd:
1579                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1581                     ; 434   if (NewState != DISABLE)
1583  0000 4d            	tnz	a
1584  0001 2705          	jreq	L166
1585                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1587  0003 72125235      	bset	21045,#1
1590  0007 81            	ret	
1591  0008               L166:
1592                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1594  0008 72135235      	bres	21045,#1
1595                     ; 444 }
1598  000c 81            	ret	
1621                     ; 451 uint8_t UART1_ReceiveData8(void)
1621                     ; 452 {
1622                     .text:	section	.text,new
1623  0000               _UART1_ReceiveData8:
1627                     ; 453   return ((uint8_t)UART1->DR);
1629  0000 c65231        	ld	a,21041
1632  0003 81            	ret	
1666                     ; 461 uint16_t UART1_ReceiveData9(void)
1666                     ; 462 {
1667                     .text:	section	.text,new
1668  0000               _UART1_ReceiveData9:
1670  0000 89            	pushw	x
1671       00000002      OFST:	set	2
1674                     ; 463   uint16_t temp = 0;
1676                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
1678  0001 c65234        	ld	a,21044
1679  0004 a480          	and	a,#128
1680  0006 5f            	clrw	x
1681  0007 02            	rlwa	x,a
1682  0008 58            	sllw	x
1683  0009 1f01          	ldw	(OFST-1,sp),x
1685                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
1687  000b c65231        	ld	a,21041
1688  000e 5f            	clrw	x
1689  000f 97            	ld	xl,a
1690  0010 01            	rrwa	x,a
1691  0011 1a02          	or	a,(OFST+0,sp)
1692  0013 01            	rrwa	x,a
1693  0014 1a01          	or	a,(OFST-1,sp)
1694  0016 a401          	and	a,#1
1695  0018 01            	rrwa	x,a
1698  0019 5b02          	addw	sp,#2
1699  001b 81            	ret	
1733                     ; 474 void UART1_SendData8(uint8_t Data)
1733                     ; 475 {
1734                     .text:	section	.text,new
1735  0000               _UART1_SendData8:
1739                     ; 477   UART1->DR = Data;
1741  0000 c75231        	ld	21041,a
1742                     ; 478 }
1745  0003 81            	ret	
1779                     ; 486 void UART1_SendData9(uint16_t Data)
1779                     ; 487 {
1780                     .text:	section	.text,new
1781  0000               _UART1_SendData9:
1783  0000 89            	pushw	x
1784       00000000      OFST:	set	0
1787                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
1789  0001 721d5234      	bres	21044,#6
1790                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
1792  0005 54            	srlw	x
1793  0006 54            	srlw	x
1794  0007 9f            	ld	a,xl
1795  0008 a440          	and	a,#64
1796  000a ca5234        	or	a,21044
1797  000d c75234        	ld	21044,a
1798                     ; 493   UART1->DR   = (uint8_t)(Data);
1800  0010 7b02          	ld	a,(OFST+2,sp)
1801  0012 c75231        	ld	21041,a
1802                     ; 494 }
1805  0015 85            	popw	x
1806  0016 81            	ret	
1829                     ; 501 void UART1_SendBreak(void)
1829                     ; 502 {
1830                     .text:	section	.text,new
1831  0000               _UART1_SendBreak:
1835                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
1837  0000 72105235      	bset	21045,#0
1838                     ; 504 }
1841  0004 81            	ret	
1875                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
1875                     ; 512 {
1876                     .text:	section	.text,new
1877  0000               _UART1_SetAddress:
1879  0000 88            	push	a
1880       00000000      OFST:	set	0
1883                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
1885                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
1887  0001 c65237        	ld	a,21047
1888  0004 a4f0          	and	a,#240
1889  0006 c75237        	ld	21047,a
1890                     ; 519   UART1->CR4 |= UART1_Address;
1892  0009 c65237        	ld	a,21047
1893  000c 1a01          	or	a,(OFST+1,sp)
1894  000e c75237        	ld	21047,a
1895                     ; 520 }
1898  0011 84            	pop	a
1899  0012 81            	ret	
1933                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
1933                     ; 529 {
1934                     .text:	section	.text,new
1935  0000               _UART1_SetGuardTime:
1939                     ; 531   UART1->GTR = UART1_GuardTime;
1941  0000 c75239        	ld	21049,a
1942                     ; 532 }
1945  0003 81            	ret	
1979                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
1979                     ; 557 {
1980                     .text:	section	.text,new
1981  0000               _UART1_SetPrescaler:
1985                     ; 559   UART1->PSCR = UART1_Prescaler;
1987  0000 c7523a        	ld	21050,a
1988                     ; 560 }
1991  0003 81            	ret	
2134                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2134                     ; 569 {
2135                     .text:	section	.text,new
2136  0000               _UART1_GetFlagStatus:
2138  0000 89            	pushw	x
2139  0001 88            	push	a
2140       00000001      OFST:	set	1
2143                     ; 570   FlagStatus status = RESET;
2145                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2147                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2149  0002 a30210        	cpw	x,#528
2150  0005 2608          	jrne	L3111
2151                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2153  0007 9f            	ld	a,xl
2154  0008 c45237        	and	a,21047
2155  000b 271c          	jreq	L1211
2156                     ; 582       status = SET;
2158  000d 2015          	jp	LC006
2159                     ; 587       status = RESET;
2160  000f               L3111:
2161                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2163  000f a30101        	cpw	x,#257
2164  0012 2609          	jrne	L3211
2165                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2167  0014 c65235        	ld	a,21045
2168  0017 1503          	bcp	a,(OFST+2,sp)
2169  0019 270d          	jreq	L3311
2170                     ; 595       status = SET;
2172  001b 2007          	jp	LC006
2173                     ; 600       status = RESET;
2174  001d               L3211:
2175                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2177  001d c65230        	ld	a,21040
2178  0020 1503          	bcp	a,(OFST+2,sp)
2179  0022 2704          	jreq	L3311
2180                     ; 608       status = SET;
2182  0024               LC006:
2185  0024 a601          	ld	a,#1
2189  0026 2001          	jra	L1211
2190  0028               L3311:
2191                     ; 613       status = RESET;
2194  0028 4f            	clr	a
2196  0029               L1211:
2197                     ; 617   return status;
2201  0029 5b03          	addw	sp,#3
2202  002b 81            	ret	
2237                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2237                     ; 647 {
2238                     .text:	section	.text,new
2239  0000               _UART1_ClearFlag:
2243                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2245                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2247  0000 a30020        	cpw	x,#32
2248  0003 2605          	jrne	L5511
2249                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2251  0005 35df5230      	mov	21040,#223
2254  0009 81            	ret	
2255  000a               L5511:
2256                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2258  000a 72195237      	bres	21047,#4
2259                     ; 660 }
2262  000e 81            	ret	
2344                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2344                     ; 676 {
2345                     .text:	section	.text,new
2346  0000               _UART1_GetITStatus:
2348  0000 89            	pushw	x
2349  0001 89            	pushw	x
2350       00000002      OFST:	set	2
2353                     ; 677   ITStatus pendingbitstatus = RESET;
2355                     ; 678   uint8_t itpos = 0;
2357                     ; 679   uint8_t itmask1 = 0;
2359                     ; 680   uint8_t itmask2 = 0;
2361                     ; 681   uint8_t enablestatus = 0;
2363                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2365                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2367  0002 9f            	ld	a,xl
2368  0003 a40f          	and	a,#15
2369  0005 5f            	clrw	x
2370  0006 97            	ld	xl,a
2371  0007 a601          	ld	a,#1
2372  0009 5d            	tnzw	x
2373  000a 2704          	jreq	L67
2374  000c               L001:
2375  000c 48            	sll	a
2376  000d 5a            	decw	x
2377  000e 26fc          	jrne	L001
2378  0010               L67:
2379  0010 6b01          	ld	(OFST-1,sp),a
2381                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2383  0012 7b04          	ld	a,(OFST+2,sp)
2384  0014 4e            	swap	a
2385  0015 a40f          	and	a,#15
2386  0017 6b02          	ld	(OFST+0,sp),a
2388                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2390  0019 5f            	clrw	x
2391  001a 97            	ld	xl,a
2392  001b a601          	ld	a,#1
2393  001d 5d            	tnzw	x
2394  001e 2704          	jreq	L201
2395  0020               L401:
2396  0020 48            	sll	a
2397  0021 5a            	decw	x
2398  0022 26fc          	jrne	L401
2399  0024               L201:
2400  0024 6b02          	ld	(OFST+0,sp),a
2402                     ; 695   if (UART1_IT == UART1_IT_PE)
2404  0026 1e03          	ldw	x,(OFST+1,sp)
2405  0028 a30100        	cpw	x,#256
2406  002b 260c          	jrne	L3221
2407                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2409  002d c65234        	ld	a,21044
2410  0030 1402          	and	a,(OFST+0,sp)
2411  0032 6b02          	ld	(OFST+0,sp),a
2413                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2415  0034 c65230        	ld	a,21040
2417                     ; 704       pendingbitstatus = SET;
2419  0037 200f          	jp	LC009
2420                     ; 709       pendingbitstatus = RESET;
2421  0039               L3221:
2422                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2424  0039 a30346        	cpw	x,#838
2425  003c 2616          	jrne	L3321
2426                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2428  003e c65237        	ld	a,21047
2429  0041 1402          	and	a,(OFST+0,sp)
2430  0043 6b02          	ld	(OFST+0,sp),a
2432                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2434  0045 c65237        	ld	a,21047
2436  0048               LC009:
2437  0048 1501          	bcp	a,(OFST-1,sp)
2438  004a 271a          	jreq	L3421
2439  004c 7b02          	ld	a,(OFST+0,sp)
2440  004e 2716          	jreq	L3421
2441                     ; 721       pendingbitstatus = SET;
2443  0050               LC008:
2446  0050 a601          	ld	a,#1
2449  0052 2013          	jra	L1321
2450                     ; 726       pendingbitstatus = RESET;
2451  0054               L3321:
2452                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2454  0054 c65235        	ld	a,21045
2455  0057 1402          	and	a,(OFST+0,sp)
2456  0059 6b02          	ld	(OFST+0,sp),a
2458                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2460  005b c65230        	ld	a,21040
2461  005e 1501          	bcp	a,(OFST-1,sp)
2462  0060 2704          	jreq	L3421
2464  0062 7b02          	ld	a,(OFST+0,sp)
2465                     ; 737       pendingbitstatus = SET;
2467  0064 26ea          	jrne	LC008
2468  0066               L3421:
2469                     ; 742       pendingbitstatus = RESET;
2473  0066 4f            	clr	a
2475  0067               L1321:
2476                     ; 747   return  pendingbitstatus;
2480  0067 5b04          	addw	sp,#4
2481  0069 81            	ret	
2517                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2517                     ; 776 {
2518                     .text:	section	.text,new
2519  0000               _UART1_ClearITPendingBit:
2523                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2525                     ; 780   if (UART1_IT == UART1_IT_RXNE)
2527  0000 a30255        	cpw	x,#597
2528  0003 2605          	jrne	L5621
2529                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2531  0005 35df5230      	mov	21040,#223
2534  0009 81            	ret	
2535  000a               L5621:
2536                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2538  000a 72195237      	bres	21047,#4
2539                     ; 789 }
2542  000e 81            	ret	
2555                     	xdef	_UART1_ClearITPendingBit
2556                     	xdef	_UART1_GetITStatus
2557                     	xdef	_UART1_ClearFlag
2558                     	xdef	_UART1_GetFlagStatus
2559                     	xdef	_UART1_SetPrescaler
2560                     	xdef	_UART1_SetGuardTime
2561                     	xdef	_UART1_SetAddress
2562                     	xdef	_UART1_SendBreak
2563                     	xdef	_UART1_SendData9
2564                     	xdef	_UART1_SendData8
2565                     	xdef	_UART1_ReceiveData9
2566                     	xdef	_UART1_ReceiveData8
2567                     	xdef	_UART1_ReceiverWakeUpCmd
2568                     	xdef	_UART1_WakeUpConfig
2569                     	xdef	_UART1_SmartCardNACKCmd
2570                     	xdef	_UART1_SmartCardCmd
2571                     	xdef	_UART1_LINCmd
2572                     	xdef	_UART1_LINBreakDetectionConfig
2573                     	xdef	_UART1_IrDACmd
2574                     	xdef	_UART1_IrDAConfig
2575                     	xdef	_UART1_HalfDuplexCmd
2576                     	xdef	_UART1_ITConfig
2577                     	xdef	_UART1_Cmd
2578                     	xdef	_UART1_Init
2579                     	xdef	_UART1_DeInit
2580                     	xref	_CLK_GetClockFreq
2581                     	xref.b	c_lreg
2582                     	xref.b	c_x
2601                     	xref	c_lsub
2602                     	xref	c_smul
2603                     	xref	c_ludv
2604                     	xref	c_rtol
2605                     	xref	c_llsh
2606                     	xref	c_ltor
2607                     	end

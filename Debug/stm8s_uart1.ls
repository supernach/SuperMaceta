   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 00            	dc.b	0
  77                     ; 53 void UART1_DeInit(void)
  77                     ; 54 {
  79                     .text:	section	.text,new
  80  0000               _UART1_DeInit:
  84                     ; 57   (void)UART1->SR;
  86  0000 c65230        	ld	a,21040
  87                     ; 58   (void)UART1->DR;
  89  0003 c65231        	ld	a,21041
  90                     ; 60   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  92  0006 725f5233      	clr	21043
  93                     ; 61   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  95  000a 725f5232      	clr	21042
  96                     ; 63   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  98  000e 725f5234      	clr	21044
  99                     ; 64   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
 101  0012 725f5235      	clr	21045
 102                     ; 65   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
 104  0016 725f5236      	clr	21046
 105                     ; 66   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
 107  001a 725f5237      	clr	21047
 108                     ; 67   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
 110  001e 725f5238      	clr	21048
 111                     ; 69   UART1->GTR = UART1_GTR_RESET_VALUE;
 113  0022 725f5239      	clr	21049
 114                     ; 70   UART1->PSCR = UART1_PSCR_RESET_VALUE;
 116  0026 725f523a      	clr	21050
 117                     ; 71 }
 120  002a 81            	ret	
 423                     .const:	section	.text
 424  0000               L41:
 425  0000 00000064      	dc.l	100
 426                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 426                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 426                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 426                     ; 93 {
 427                     .text:	section	.text,new
 428  0000               _UART1_Init:
 430  0000 520c          	subw	sp,#12
 431       0000000c      OFST:	set	12
 434                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 438                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 440                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 442                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 444                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
 446                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 448                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 450                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 452  0002 72195234      	bres	21044,#4
 453                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 455  0006 c65234        	ld	a,21044
 456  0009 1a13          	or	a,(OFST+7,sp)
 457  000b c75234        	ld	21044,a
 458                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 460  000e c65236        	ld	a,21046
 461  0011 a4cf          	and	a,#207
 462  0013 c75236        	ld	21046,a
 463                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 465  0016 c65236        	ld	a,21046
 466  0019 1a14          	or	a,(OFST+8,sp)
 467  001b c75236        	ld	21046,a
 468                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 470  001e c65234        	ld	a,21044
 471  0021 a4f9          	and	a,#249
 472  0023 c75234        	ld	21044,a
 473                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 475  0026 c65234        	ld	a,21044
 476  0029 1a15          	or	a,(OFST+9,sp)
 477  002b c75234        	ld	21044,a
 478                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 480  002e 725f5232      	clr	21042
 481                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 483  0032 c65233        	ld	a,21043
 484  0035 a40f          	and	a,#15
 485  0037 c75233        	ld	21043,a
 486                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 488  003a c65233        	ld	a,21043
 489  003d a4f0          	and	a,#240
 490  003f c75233        	ld	21043,a
 491                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 493  0042 96            	ldw	x,sp
 494  0043 1c000f        	addw	x,#OFST+3
 495  0046 cd0000        	call	c_ltor
 497  0049 a604          	ld	a,#4
 498  004b cd0000        	call	c_llsh
 500  004e 96            	ldw	x,sp
 501  004f 5c            	incw	x
 502  0050 cd0000        	call	c_rtol
 505  0053 cd0000        	call	_CLK_GetClockFreq
 507  0056 96            	ldw	x,sp
 508  0057 5c            	incw	x
 509  0058 cd0000        	call	c_ludv
 511  005b 96            	ldw	x,sp
 512  005c 1c0009        	addw	x,#OFST-3
 513  005f cd0000        	call	c_rtol
 516                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 518  0062 96            	ldw	x,sp
 519  0063 1c000f        	addw	x,#OFST+3
 520  0066 cd0000        	call	c_ltor
 522  0069 a604          	ld	a,#4
 523  006b cd0000        	call	c_llsh
 525  006e 96            	ldw	x,sp
 526  006f 5c            	incw	x
 527  0070 cd0000        	call	c_rtol
 530  0073 cd0000        	call	_CLK_GetClockFreq
 532  0076 a664          	ld	a,#100
 533  0078 cd0000        	call	c_smul
 535  007b 96            	ldw	x,sp
 536  007c 5c            	incw	x
 537  007d cd0000        	call	c_ludv
 539  0080 96            	ldw	x,sp
 540  0081 1c0005        	addw	x,#OFST-7
 541  0084 cd0000        	call	c_rtol
 544                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 546  0087 96            	ldw	x,sp
 547  0088 1c0009        	addw	x,#OFST-3
 548  008b cd0000        	call	c_ltor
 550  008e a664          	ld	a,#100
 551  0090 cd0000        	call	c_smul
 553  0093 96            	ldw	x,sp
 554  0094 5c            	incw	x
 555  0095 cd0000        	call	c_rtol
 558  0098 96            	ldw	x,sp
 559  0099 1c0005        	addw	x,#OFST-7
 560  009c cd0000        	call	c_ltor
 562  009f 96            	ldw	x,sp
 563  00a0 5c            	incw	x
 564  00a1 cd0000        	call	c_lsub
 566  00a4 a604          	ld	a,#4
 567  00a6 cd0000        	call	c_llsh
 569  00a9 ae0000        	ldw	x,#L41
 570  00ac cd0000        	call	c_ludv
 572  00af b603          	ld	a,c_lreg+3
 573  00b1 a40f          	and	a,#15
 574  00b3 ca5233        	or	a,21043
 575  00b6 c75233        	ld	21043,a
 576                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 578  00b9 1e0b          	ldw	x,(OFST-1,sp)
 579  00bb 54            	srlw	x
 580  00bc 54            	srlw	x
 581  00bd 54            	srlw	x
 582  00be 54            	srlw	x
 583  00bf 01            	rrwa	x,a
 584  00c0 a4f0          	and	a,#240
 585  00c2 ca5233        	or	a,21043
 586  00c5 c75233        	ld	21043,a
 587                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 589  00c8 c65232        	ld	a,21042
 590  00cb 1a0c          	or	a,(OFST+0,sp)
 591  00cd c75232        	ld	21042,a
 592                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 594  00d0 c65235        	ld	a,21045
 595  00d3 a4f3          	and	a,#243
 596  00d5 c75235        	ld	21045,a
 597                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 599  00d8 c65236        	ld	a,21046
 600  00db a4f8          	and	a,#248
 601  00dd c75236        	ld	21046,a
 602                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 602                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 604  00e0 7b16          	ld	a,(OFST+10,sp)
 605  00e2 a407          	and	a,#7
 606  00e4 ca5236        	or	a,21046
 607  00e7 c75236        	ld	21046,a
 608                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 610  00ea 7b17          	ld	a,(OFST+11,sp)
 611  00ec a504          	bcp	a,#4
 612  00ee 2706          	jreq	L112
 613                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 615  00f0 72165235      	bset	21045,#3
 617  00f4 2004          	jra	L312
 618  00f6               L112:
 619                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 621  00f6 72175235      	bres	21045,#3
 622  00fa               L312:
 623                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 625  00fa a508          	bcp	a,#8
 626  00fc 2706          	jreq	L512
 627                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 629  00fe 72145235      	bset	21045,#2
 631  0102 2004          	jra	L712
 632  0104               L512:
 633                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 635  0104 72155235      	bres	21045,#2
 636  0108               L712:
 637                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 639  0108 7b16          	ld	a,(OFST+10,sp)
 640  010a 2a06          	jrpl	L122
 641                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 643  010c 72175236      	bres	21046,#3
 645  0110 2008          	jra	L322
 646  0112               L122:
 647                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 649  0112 a408          	and	a,#8
 650  0114 ca5236        	or	a,21046
 651  0117 c75236        	ld	21046,a
 652  011a               L322:
 653                     ; 176 }
 656  011a 5b0c          	addw	sp,#12
 657  011c 81            	ret	
 712                     ; 184 void UART1_Cmd(FunctionalState NewState)
 712                     ; 185 {
 713                     .text:	section	.text,new
 714  0000               _UART1_Cmd:
 718                     ; 186   if (NewState != DISABLE)
 720  0000 4d            	tnz	a
 721  0001 2705          	jreq	L352
 722                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 724  0003 721b5234      	bres	21044,#5
 727  0007 81            	ret	
 728  0008               L352:
 729                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 731  0008 721a5234      	bset	21044,#5
 732                     ; 196 }
 735  000c 81            	ret	
 860                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 860                     ; 212 {
 861                     .text:	section	.text,new
 862  0000               _UART1_ITConfig:
 864  0000 89            	pushw	x
 865  0001 89            	pushw	x
 866       00000002      OFST:	set	2
 869                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 873                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 875                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 877                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
 879  0002 9e            	ld	a,xh
 880  0003 6b01          	ld	(OFST-1,sp),a
 882                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
 884  0005 9f            	ld	a,xl
 885  0006 a40f          	and	a,#15
 886  0008 5f            	clrw	x
 887  0009 97            	ld	xl,a
 888  000a a601          	ld	a,#1
 889  000c 5d            	tnzw	x
 890  000d 2704          	jreq	L22
 891  000f               L42:
 892  000f 48            	sll	a
 893  0010 5a            	decw	x
 894  0011 26fc          	jrne	L42
 895  0013               L22:
 896  0013 6b02          	ld	(OFST+0,sp),a
 898                     ; 224   if (NewState != DISABLE)
 900  0015 7b07          	ld	a,(OFST+5,sp)
 901  0017 271f          	jreq	L533
 902                     ; 227     if (uartreg == 0x01)
 904  0019 7b01          	ld	a,(OFST-1,sp)
 905  001b a101          	cp	a,#1
 906  001d 2607          	jrne	L733
 907                     ; 229       UART1->CR1 |= itpos;
 909  001f c65234        	ld	a,21044
 910  0022 1a02          	or	a,(OFST+0,sp)
 912  0024 201e          	jp	LC002
 913  0026               L733:
 914                     ; 231     else if (uartreg == 0x02)
 916  0026 a102          	cp	a,#2
 917  0028 2607          	jrne	L343
 918                     ; 233       UART1->CR2 |= itpos;
 920  002a c65235        	ld	a,21045
 921  002d 1a02          	or	a,(OFST+0,sp)
 923  002f 2022          	jp	LC003
 924  0031               L343:
 925                     ; 237       UART1->CR4 |= itpos;
 927  0031 c65237        	ld	a,21047
 928  0034 1a02          	or	a,(OFST+0,sp)
 929  0036 2026          	jp	LC001
 930  0038               L533:
 931                     ; 243     if (uartreg == 0x01)
 933  0038 7b01          	ld	a,(OFST-1,sp)
 934  003a a101          	cp	a,#1
 935  003c 260b          	jrne	L153
 936                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
 938  003e 7b02          	ld	a,(OFST+0,sp)
 939  0040 43            	cpl	a
 940  0041 c45234        	and	a,21044
 941  0044               LC002:
 942  0044 c75234        	ld	21044,a
 944  0047 2018          	jra	L743
 945  0049               L153:
 946                     ; 247     else if (uartreg == 0x02)
 948  0049 a102          	cp	a,#2
 949  004b 260b          	jrne	L553
 950                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
 952  004d 7b02          	ld	a,(OFST+0,sp)
 953  004f 43            	cpl	a
 954  0050 c45235        	and	a,21045
 955  0053               LC003:
 956  0053 c75235        	ld	21045,a
 958  0056 2009          	jra	L743
 959  0058               L553:
 960                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
 962  0058 7b02          	ld	a,(OFST+0,sp)
 963  005a 43            	cpl	a
 964  005b c45237        	and	a,21047
 965  005e               LC001:
 966  005e c75237        	ld	21047,a
 967  0061               L743:
 968                     ; 257 }
 971  0061 5b04          	addw	sp,#4
 972  0063 81            	ret	
1008                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
1008                     ; 266 {
1009                     .text:	section	.text,new
1010  0000               _UART1_HalfDuplexCmd:
1014                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1016                     ; 269   if (NewState != DISABLE)
1018  0000 4d            	tnz	a
1019  0001 2705          	jreq	L773
1020                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
1022  0003 72165238      	bset	21048,#3
1025  0007 81            	ret	
1026  0008               L773:
1027                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1029  0008 72175238      	bres	21048,#3
1030                     ; 277 }
1033  000c 81            	ret	
1090                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1090                     ; 286 {
1091                     .text:	section	.text,new
1092  0000               _UART1_IrDAConfig:
1096                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1098                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1100  0000 4d            	tnz	a
1101  0001 2705          	jreq	L134
1102                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1104  0003 72145238      	bset	21048,#2
1107  0007 81            	ret	
1108  0008               L134:
1109                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1111  0008 72155238      	bres	21048,#2
1112                     ; 297 }
1115  000c 81            	ret	
1150                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1150                     ; 306 {
1151                     .text:	section	.text,new
1152  0000               _UART1_IrDACmd:
1156                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1158                     ; 310   if (NewState != DISABLE)
1160  0000 4d            	tnz	a
1161  0001 2705          	jreq	L354
1162                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1164  0003 72125238      	bset	21048,#1
1167  0007 81            	ret	
1168  0008               L354:
1169                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1171  0008 72135238      	bres	21048,#1
1172                     ; 320 }
1175  000c 81            	ret	
1234                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1234                     ; 330 {
1235                     .text:	section	.text,new
1236  0000               _UART1_LINBreakDetectionConfig:
1240                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1242                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1244  0000 4d            	tnz	a
1245  0001 2705          	jreq	L505
1246                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1248  0003 721a5237      	bset	21047,#5
1251  0007 81            	ret	
1252  0008               L505:
1253                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1255  0008 721b5237      	bres	21047,#5
1256                     ; 341 }
1259  000c 81            	ret	
1294                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1294                     ; 350 {
1295                     .text:	section	.text,new
1296  0000               _UART1_LINCmd:
1300                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1302                     ; 353   if (NewState != DISABLE)
1304  0000 4d            	tnz	a
1305  0001 2705          	jreq	L725
1306                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1308  0003 721c5236      	bset	21046,#6
1311  0007 81            	ret	
1312  0008               L725:
1313                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1315  0008 721d5236      	bres	21046,#6
1316                     ; 363 }
1319  000c 81            	ret	
1354                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1354                     ; 372 {
1355                     .text:	section	.text,new
1356  0000               _UART1_SmartCardCmd:
1360                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1362                     ; 375   if (NewState != DISABLE)
1364  0000 4d            	tnz	a
1365  0001 2705          	jreq	L155
1366                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1368  0003 721a5238      	bset	21048,#5
1371  0007 81            	ret	
1372  0008               L155:
1373                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1375  0008 721b5238      	bres	21048,#5
1376                     ; 385 }
1379  000c 81            	ret	
1415                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1415                     ; 395 {
1416                     .text:	section	.text,new
1417  0000               _UART1_SmartCardNACKCmd:
1421                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1423                     ; 398   if (NewState != DISABLE)
1425  0000 4d            	tnz	a
1426  0001 2705          	jreq	L375
1427                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1429  0003 72185238      	bset	21048,#4
1432  0007 81            	ret	
1433  0008               L375:
1434                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1436  0008 72195238      	bres	21048,#4
1437                     ; 408 }
1440  000c 81            	ret	
1497                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1497                     ; 417 {
1498                     .text:	section	.text,new
1499  0000               _UART1_WakeUpConfig:
1503                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1505                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1507  0000 72175234      	bres	21044,#3
1508                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1510  0004 ca5234        	or	a,21044
1511  0007 c75234        	ld	21044,a
1512                     ; 422 }
1515  000a 81            	ret	
1551                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1551                     ; 431 {
1552                     .text:	section	.text,new
1553  0000               _UART1_ReceiverWakeUpCmd:
1557                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1559                     ; 434   if (NewState != DISABLE)
1561  0000 4d            	tnz	a
1562  0001 2705          	jreq	L346
1563                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1565  0003 72125235      	bset	21045,#1
1568  0007 81            	ret	
1569  0008               L346:
1570                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1572  0008 72135235      	bres	21045,#1
1573                     ; 444 }
1576  000c 81            	ret	
1599                     ; 451 uint8_t UART1_ReceiveData8(void)
1599                     ; 452 {
1600                     .text:	section	.text,new
1601  0000               _UART1_ReceiveData8:
1605                     ; 453   return ((uint8_t)UART1->DR);
1607  0000 c65231        	ld	a,21041
1610  0003 81            	ret	
1644                     ; 461 uint16_t UART1_ReceiveData9(void)
1644                     ; 462 {
1645                     .text:	section	.text,new
1646  0000               _UART1_ReceiveData9:
1648  0000 89            	pushw	x
1649       00000002      OFST:	set	2
1652                     ; 463   uint16_t temp = 0;
1654                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
1656  0001 c65234        	ld	a,21044
1657  0004 a480          	and	a,#128
1658  0006 5f            	clrw	x
1659  0007 02            	rlwa	x,a
1660  0008 58            	sllw	x
1661  0009 1f01          	ldw	(OFST-1,sp),x
1663                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
1665  000b c65231        	ld	a,21041
1666  000e 5f            	clrw	x
1667  000f 97            	ld	xl,a
1668  0010 01            	rrwa	x,a
1669  0011 1a02          	or	a,(OFST+0,sp)
1670  0013 01            	rrwa	x,a
1671  0014 1a01          	or	a,(OFST-1,sp)
1672  0016 a401          	and	a,#1
1673  0018 01            	rrwa	x,a
1676  0019 5b02          	addw	sp,#2
1677  001b 81            	ret	
1711                     ; 474 void UART1_SendData8(uint8_t Data)
1711                     ; 475 {
1712                     .text:	section	.text,new
1713  0000               _UART1_SendData8:
1717                     ; 477   UART1->DR = Data;
1719  0000 c75231        	ld	21041,a
1720                     ; 478 }
1723  0003 81            	ret	
1757                     ; 486 void UART1_SendData9(uint16_t Data)
1757                     ; 487 {
1758                     .text:	section	.text,new
1759  0000               _UART1_SendData9:
1761  0000 89            	pushw	x
1762       00000000      OFST:	set	0
1765                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
1767  0001 721d5234      	bres	21044,#6
1768                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
1770  0005 54            	srlw	x
1771  0006 54            	srlw	x
1772  0007 9f            	ld	a,xl
1773  0008 a440          	and	a,#64
1774  000a ca5234        	or	a,21044
1775  000d c75234        	ld	21044,a
1776                     ; 493   UART1->DR   = (uint8_t)(Data);
1778  0010 7b02          	ld	a,(OFST+2,sp)
1779  0012 c75231        	ld	21041,a
1780                     ; 494 }
1783  0015 85            	popw	x
1784  0016 81            	ret	
1807                     ; 501 void UART1_SendBreak(void)
1807                     ; 502 {
1808                     .text:	section	.text,new
1809  0000               _UART1_SendBreak:
1813                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
1815  0000 72105235      	bset	21045,#0
1816                     ; 504 }
1819  0004 81            	ret	
1853                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
1853                     ; 512 {
1854                     .text:	section	.text,new
1855  0000               _UART1_SetAddress:
1857  0000 88            	push	a
1858       00000000      OFST:	set	0
1861                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
1863                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
1865  0001 c65237        	ld	a,21047
1866  0004 a4f0          	and	a,#240
1867  0006 c75237        	ld	21047,a
1868                     ; 519   UART1->CR4 |= UART1_Address;
1870  0009 c65237        	ld	a,21047
1871  000c 1a01          	or	a,(OFST+1,sp)
1872  000e c75237        	ld	21047,a
1873                     ; 520 }
1876  0011 84            	pop	a
1877  0012 81            	ret	
1911                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
1911                     ; 529 {
1912                     .text:	section	.text,new
1913  0000               _UART1_SetGuardTime:
1917                     ; 531   UART1->GTR = UART1_GuardTime;
1919  0000 c75239        	ld	21049,a
1920                     ; 532 }
1923  0003 81            	ret	
1957                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
1957                     ; 557 {
1958                     .text:	section	.text,new
1959  0000               _UART1_SetPrescaler:
1963                     ; 559   UART1->PSCR = UART1_Prescaler;
1965  0000 c7523a        	ld	21050,a
1966                     ; 560 }
1969  0003 81            	ret	
2112                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2112                     ; 569 {
2113                     .text:	section	.text,new
2114  0000               _UART1_GetFlagStatus:
2116  0000 89            	pushw	x
2117  0001 88            	push	a
2118       00000001      OFST:	set	1
2121                     ; 570   FlagStatus status = RESET;
2123                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2125                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2127  0002 a30210        	cpw	x,#528
2128  0005 2608          	jrne	L5701
2129                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2131  0007 9f            	ld	a,xl
2132  0008 c45237        	and	a,21047
2133  000b 271c          	jreq	L3011
2134                     ; 582       status = SET;
2136  000d 2015          	jp	LC006
2137                     ; 587       status = RESET;
2138  000f               L5701:
2139                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2141  000f a30101        	cpw	x,#257
2142  0012 2609          	jrne	L5011
2143                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2145  0014 c65235        	ld	a,21045
2146  0017 1503          	bcp	a,(OFST+2,sp)
2147  0019 270d          	jreq	L5111
2148                     ; 595       status = SET;
2150  001b 2007          	jp	LC006
2151                     ; 600       status = RESET;
2152  001d               L5011:
2153                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2155  001d c65230        	ld	a,21040
2156  0020 1503          	bcp	a,(OFST+2,sp)
2157  0022 2704          	jreq	L5111
2158                     ; 608       status = SET;
2160  0024               LC006:
2163  0024 a601          	ld	a,#1
2167  0026 2001          	jra	L3011
2168  0028               L5111:
2169                     ; 613       status = RESET;
2172  0028 4f            	clr	a
2174  0029               L3011:
2175                     ; 617   return status;
2179  0029 5b03          	addw	sp,#3
2180  002b 81            	ret	
2215                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2215                     ; 647 {
2216                     .text:	section	.text,new
2217  0000               _UART1_ClearFlag:
2221                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2223                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2225  0000 a30020        	cpw	x,#32
2226  0003 2605          	jrne	L7311
2227                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2229  0005 35df5230      	mov	21040,#223
2232  0009 81            	ret	
2233  000a               L7311:
2234                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2236  000a 72195237      	bres	21047,#4
2237                     ; 660 }
2240  000e 81            	ret	
2322                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2322                     ; 676 {
2323                     .text:	section	.text,new
2324  0000               _UART1_GetITStatus:
2326  0000 89            	pushw	x
2327  0001 89            	pushw	x
2328       00000002      OFST:	set	2
2331                     ; 677   ITStatus pendingbitstatus = RESET;
2333                     ; 678   uint8_t itpos = 0;
2335                     ; 679   uint8_t itmask1 = 0;
2337                     ; 680   uint8_t itmask2 = 0;
2339                     ; 681   uint8_t enablestatus = 0;
2341                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2343                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2345  0002 9f            	ld	a,xl
2346  0003 a40f          	and	a,#15
2347  0005 5f            	clrw	x
2348  0006 97            	ld	xl,a
2349  0007 a601          	ld	a,#1
2350  0009 5d            	tnzw	x
2351  000a 2704          	jreq	L67
2352  000c               L001:
2353  000c 48            	sll	a
2354  000d 5a            	decw	x
2355  000e 26fc          	jrne	L001
2356  0010               L67:
2357  0010 6b01          	ld	(OFST-1,sp),a
2359                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2361  0012 7b04          	ld	a,(OFST+2,sp)
2362  0014 4e            	swap	a
2363  0015 a40f          	and	a,#15
2364  0017 6b02          	ld	(OFST+0,sp),a
2366                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2368  0019 5f            	clrw	x
2369  001a 97            	ld	xl,a
2370  001b a601          	ld	a,#1
2371  001d 5d            	tnzw	x
2372  001e 2704          	jreq	L201
2373  0020               L401:
2374  0020 48            	sll	a
2375  0021 5a            	decw	x
2376  0022 26fc          	jrne	L401
2377  0024               L201:
2378  0024 6b02          	ld	(OFST+0,sp),a
2380                     ; 695   if (UART1_IT == UART1_IT_PE)
2382  0026 1e03          	ldw	x,(OFST+1,sp)
2383  0028 a30100        	cpw	x,#256
2384  002b 260c          	jrne	L5021
2385                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2387  002d c65234        	ld	a,21044
2388  0030 1402          	and	a,(OFST+0,sp)
2389  0032 6b02          	ld	(OFST+0,sp),a
2391                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2393  0034 c65230        	ld	a,21040
2395                     ; 704       pendingbitstatus = SET;
2397  0037 200f          	jp	LC009
2398                     ; 709       pendingbitstatus = RESET;
2399  0039               L5021:
2400                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2402  0039 a30346        	cpw	x,#838
2403  003c 2616          	jrne	L5121
2404                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2406  003e c65237        	ld	a,21047
2407  0041 1402          	and	a,(OFST+0,sp)
2408  0043 6b02          	ld	(OFST+0,sp),a
2410                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2412  0045 c65237        	ld	a,21047
2414  0048               LC009:
2415  0048 1501          	bcp	a,(OFST-1,sp)
2416  004a 271a          	jreq	L5221
2417  004c 7b02          	ld	a,(OFST+0,sp)
2418  004e 2716          	jreq	L5221
2419                     ; 721       pendingbitstatus = SET;
2421  0050               LC008:
2424  0050 a601          	ld	a,#1
2427  0052 2013          	jra	L3121
2428                     ; 726       pendingbitstatus = RESET;
2429  0054               L5121:
2430                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2432  0054 c65235        	ld	a,21045
2433  0057 1402          	and	a,(OFST+0,sp)
2434  0059 6b02          	ld	(OFST+0,sp),a
2436                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2438  005b c65230        	ld	a,21040
2439  005e 1501          	bcp	a,(OFST-1,sp)
2440  0060 2704          	jreq	L5221
2442  0062 7b02          	ld	a,(OFST+0,sp)
2443                     ; 737       pendingbitstatus = SET;
2445  0064 26ea          	jrne	LC008
2446  0066               L5221:
2447                     ; 742       pendingbitstatus = RESET;
2451  0066 4f            	clr	a
2453  0067               L3121:
2454                     ; 747   return  pendingbitstatus;
2458  0067 5b04          	addw	sp,#4
2459  0069 81            	ret	
2495                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2495                     ; 776 {
2496                     .text:	section	.text,new
2497  0000               _UART1_ClearITPendingBit:
2501                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2503                     ; 780   if (UART1_IT == UART1_IT_RXNE)
2505  0000 a30255        	cpw	x,#597
2506  0003 2605          	jrne	L7421
2507                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2509  0005 35df5230      	mov	21040,#223
2512  0009 81            	ret	
2513  000a               L7421:
2514                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2516  000a 72195237      	bres	21047,#4
2517                     ; 789 }
2520  000e 81            	ret	
2533                     	xdef	_UART1_ClearITPendingBit
2534                     	xdef	_UART1_GetITStatus
2535                     	xdef	_UART1_ClearFlag
2536                     	xdef	_UART1_GetFlagStatus
2537                     	xdef	_UART1_SetPrescaler
2538                     	xdef	_UART1_SetGuardTime
2539                     	xdef	_UART1_SetAddress
2540                     	xdef	_UART1_SendBreak
2541                     	xdef	_UART1_SendData9
2542                     	xdef	_UART1_SendData8
2543                     	xdef	_UART1_ReceiveData9
2544                     	xdef	_UART1_ReceiveData8
2545                     	xdef	_UART1_ReceiverWakeUpCmd
2546                     	xdef	_UART1_WakeUpConfig
2547                     	xdef	_UART1_SmartCardNACKCmd
2548                     	xdef	_UART1_SmartCardCmd
2549                     	xdef	_UART1_LINCmd
2550                     	xdef	_UART1_LINBreakDetectionConfig
2551                     	xdef	_UART1_IrDACmd
2552                     	xdef	_UART1_IrDAConfig
2553                     	xdef	_UART1_HalfDuplexCmd
2554                     	xdef	_UART1_ITConfig
2555                     	xdef	_UART1_Cmd
2556                     	xdef	_UART1_Init
2557                     	xdef	_UART1_DeInit
2558                     	xref	_CLK_GetClockFreq
2559                     	xref.b	c_lreg
2560                     	xref.b	c_x
2579                     	xref	c_lsub
2580                     	xref	c_smul
2581                     	xref	c_ludv
2582                     	xref	c_rtol
2583                     	xref	c_llsh
2584                     	xref	c_ltor
2585                     	end

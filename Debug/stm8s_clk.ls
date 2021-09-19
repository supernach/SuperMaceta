   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  50                     .const:	section	.text
  51  0000               _HSIDivFactor:
  52  0000 01            	dc.b	1
  53  0001 02            	dc.b	2
  54  0002 04            	dc.b	4
  55  0003 08            	dc.b	8
  56  0004               _CLKPrescTable:
  57  0004 01            	dc.b	1
  58  0005 02            	dc.b	2
  59  0006 04            	dc.b	4
  60  0007 08            	dc.b	8
  61  0008 0a            	dc.b	10
  62  0009 10            	dc.b	16
  63  000a 14            	dc.b	20
  64  000b 28            	dc.b	40
  93                     ; 72 void CLK_DeInit(void)
  93                     ; 73 {
  95                     .text:	section	.text,new
  96  0000               _CLK_DeInit:
 100                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
 102  0000 350150c0      	mov	20672,#1
 103                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
 105  0004 725f50c1      	clr	20673
 106                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
 108  0008 35e150c4      	mov	20676,#225
 109                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
 111  000c 725f50c5      	clr	20677
 112                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
 114  0010 351850c6      	mov	20678,#24
 115                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
 117  0014 35ff50c7      	mov	20679,#255
 118                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
 120  0018 35ff50ca      	mov	20682,#255
 121                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
 123  001c 725f50c8      	clr	20680
 124                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 126  0020 725f50c9      	clr	20681
 128  0024               L34:
 129                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
 131  0024 720050c9fb    	btjt	20681,#0,L34
 132                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 134  0029 725f50c9      	clr	20681
 135                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 137  002d 725f50cc      	clr	20684
 138                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 140  0031 725f50cd      	clr	20685
 141                     ; 88 }
 144  0035 81            	ret	
 200                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 200                     ; 100 {
 201                     .text:	section	.text,new
 202  0000               _CLK_FastHaltWakeUpCmd:
 206                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 208                     ; 104   if (NewState != DISABLE)
 210  0000 4d            	tnz	a
 211  0001 2705          	jreq	L57
 212                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 214  0003 721450c0      	bset	20672,#2
 217  0007 81            	ret	
 218  0008               L57:
 219                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 221  0008 721550c0      	bres	20672,#2
 222                     ; 114 }
 225  000c 81            	ret	
 260                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 260                     ; 122 {
 261                     .text:	section	.text,new
 262  0000               _CLK_HSECmd:
 266                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 268                     ; 126   if (NewState != DISABLE)
 270  0000 4d            	tnz	a
 271  0001 2705          	jreq	L711
 272                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 274  0003 721050c1      	bset	20673,#0
 277  0007 81            	ret	
 278  0008               L711:
 279                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 281  0008 721150c1      	bres	20673,#0
 282                     ; 136 }
 285  000c 81            	ret	
 320                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 320                     ; 144 {
 321                     .text:	section	.text,new
 322  0000               _CLK_HSICmd:
 326                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 328                     ; 148   if (NewState != DISABLE)
 330  0000 4d            	tnz	a
 331  0001 2705          	jreq	L141
 332                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 334  0003 721050c0      	bset	20672,#0
 337  0007 81            	ret	
 338  0008               L141:
 339                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 341  0008 721150c0      	bres	20672,#0
 342                     ; 158 }
 345  000c 81            	ret	
 380                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 380                     ; 167 {
 381                     .text:	section	.text,new
 382  0000               _CLK_LSICmd:
 386                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 388                     ; 171   if (NewState != DISABLE)
 390  0000 4d            	tnz	a
 391  0001 2705          	jreq	L361
 392                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 394  0003 721650c0      	bset	20672,#3
 397  0007 81            	ret	
 398  0008               L361:
 399                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 401  0008 721750c0      	bres	20672,#3
 402                     ; 181 }
 405  000c 81            	ret	
 440                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 440                     ; 190 {
 441                     .text:	section	.text,new
 442  0000               _CLK_CCOCmd:
 446                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 448                     ; 194   if (NewState != DISABLE)
 450  0000 4d            	tnz	a
 451  0001 2705          	jreq	L502
 452                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 454  0003 721050c9      	bset	20681,#0
 457  0007 81            	ret	
 458  0008               L502:
 459                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 461  0008 721150c9      	bres	20681,#0
 462                     ; 204 }
 465  000c 81            	ret	
 500                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 500                     ; 214 {
 501                     .text:	section	.text,new
 502  0000               _CLK_ClockSwitchCmd:
 506                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 508                     ; 218   if (NewState != DISABLE )
 510  0000 4d            	tnz	a
 511  0001 2705          	jreq	L722
 512                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 514  0003 721250c5      	bset	20677,#1
 517  0007 81            	ret	
 518  0008               L722:
 519                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 521  0008 721350c5      	bres	20677,#1
 522                     ; 228 }
 525  000c 81            	ret	
 561                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 561                     ; 239 {
 562                     .text:	section	.text,new
 563  0000               _CLK_SlowActiveHaltWakeUpCmd:
 567                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 569                     ; 243   if (NewState != DISABLE)
 571  0000 4d            	tnz	a
 572  0001 2705          	jreq	L152
 573                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 575  0003 721a50c0      	bset	20672,#5
 578  0007 81            	ret	
 579  0008               L152:
 580                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 582  0008 721b50c0      	bres	20672,#5
 583                     ; 253 }
 586  000c 81            	ret	
 745                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 745                     ; 264 {
 746                     .text:	section	.text,new
 747  0000               _CLK_PeripheralClockConfig:
 749  0000 89            	pushw	x
 750       00000000      OFST:	set	0
 753                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 755                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 757                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 759  0001 9e            	ld	a,xh
 760  0002 a510          	bcp	a,#16
 761  0004 2630          	jrne	L733
 762                     ; 271     if (NewState != DISABLE)
 764  0006 7b02          	ld	a,(OFST+2,sp)
 765  0008 2714          	jreq	L143
 766                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 768  000a 7b01          	ld	a,(OFST+1,sp)
 769  000c a40f          	and	a,#15
 770  000e 5f            	clrw	x
 771  000f 97            	ld	xl,a
 772  0010 a601          	ld	a,#1
 773  0012 5d            	tnzw	x
 774  0013 2704          	jreq	L62
 775  0015               L03:
 776  0015 48            	sll	a
 777  0016 5a            	decw	x
 778  0017 26fc          	jrne	L03
 779  0019               L62:
 780  0019 ca50c7        	or	a,20679
 782  001c 2013          	jp	LC002
 783  001e               L143:
 784                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 786  001e 7b01          	ld	a,(OFST+1,sp)
 787  0020 a40f          	and	a,#15
 788  0022 5f            	clrw	x
 789  0023 97            	ld	xl,a
 790  0024 a601          	ld	a,#1
 791  0026 5d            	tnzw	x
 792  0027 2704          	jreq	L23
 793  0029               L43:
 794  0029 48            	sll	a
 795  002a 5a            	decw	x
 796  002b 26fc          	jrne	L43
 797  002d               L23:
 798  002d 43            	cpl	a
 799  002e c450c7        	and	a,20679
 800  0031               LC002:
 801  0031 c750c7        	ld	20679,a
 802  0034 202e          	jra	L543
 803  0036               L733:
 804                     ; 284     if (NewState != DISABLE)
 806  0036 7b02          	ld	a,(OFST+2,sp)
 807  0038 2714          	jreq	L743
 808                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 810  003a 7b01          	ld	a,(OFST+1,sp)
 811  003c a40f          	and	a,#15
 812  003e 5f            	clrw	x
 813  003f 97            	ld	xl,a
 814  0040 a601          	ld	a,#1
 815  0042 5d            	tnzw	x
 816  0043 2704          	jreq	L63
 817  0045               L04:
 818  0045 48            	sll	a
 819  0046 5a            	decw	x
 820  0047 26fc          	jrne	L04
 821  0049               L63:
 822  0049 ca50ca        	or	a,20682
 824  004c 2013          	jp	LC001
 825  004e               L743:
 826                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 828  004e 7b01          	ld	a,(OFST+1,sp)
 829  0050 a40f          	and	a,#15
 830  0052 5f            	clrw	x
 831  0053 97            	ld	xl,a
 832  0054 a601          	ld	a,#1
 833  0056 5d            	tnzw	x
 834  0057 2704          	jreq	L24
 835  0059               L44:
 836  0059 48            	sll	a
 837  005a 5a            	decw	x
 838  005b 26fc          	jrne	L44
 839  005d               L24:
 840  005d 43            	cpl	a
 841  005e c450ca        	and	a,20682
 842  0061               LC001:
 843  0061 c750ca        	ld	20682,a
 844  0064               L543:
 845                     ; 295 }
 848  0064 85            	popw	x
 849  0065 81            	ret	
1037                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1037                     ; 310 {
1038                     .text:	section	.text,new
1039  0000               _CLK_ClockSwitchConfig:
1041  0000 89            	pushw	x
1042  0001 5204          	subw	sp,#4
1043       00000004      OFST:	set	4
1046                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1048  0003 aeffff        	ldw	x,#65535
1049  0006 1f03          	ldw	(OFST-1,sp),x
1051                     ; 313   ErrorStatus Swif = ERROR;
1053                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1055                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1057                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1059                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1061                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1063  0008 c650c3        	ld	a,20675
1064  000b 6b01          	ld	(OFST-3,sp),a
1066                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1068  000d 7b05          	ld	a,(OFST+1,sp)
1069  000f 4a            	dec	a
1070  0010 263d          	jrne	L364
1071                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1073  0012 721250c5      	bset	20677,#1
1074                     ; 331     if (ITState != DISABLE)
1076  0016 7b09          	ld	a,(OFST+5,sp)
1077  0018 2706          	jreq	L564
1078                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1080  001a 721450c5      	bset	20677,#2
1082  001e 2004          	jra	L764
1083  0020               L564:
1084                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1086  0020 721550c5      	bres	20677,#2
1087  0024               L764:
1088                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1090  0024 7b06          	ld	a,(OFST+2,sp)
1091  0026 c750c4        	ld	20676,a
1093  0029 2003          	jra	L574
1094  002b               L174:
1095                     ; 346       DownCounter--;
1097  002b 5a            	decw	x
1098  002c 1f03          	ldw	(OFST-1,sp),x
1100  002e               L574:
1101                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1103  002e 720150c504    	btjf	20677,#0,L105
1105  0033 1e03          	ldw	x,(OFST-1,sp)
1106  0035 26f4          	jrne	L174
1107  0037               L105:
1108                     ; 349     if(DownCounter != 0)
1110  0037 1e03          	ldw	x,(OFST-1,sp)
1111                     ; 351       Swif = SUCCESS;
1113  0039 263d          	jrne	LC004
1114  003b               L305:
1115                     ; 355       Swif = ERROR;
1118  003b 0f02          	clr	(OFST-2,sp)
1120  003d               L705:
1121                     ; 390   if(Swif != ERROR)
1123  003d 275d          	jreq	L335
1124                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1126  003f 7b0a          	ld	a,(OFST+6,sp)
1127  0041 263b          	jrne	L535
1129  0043 7b01          	ld	a,(OFST-3,sp)
1130  0045 a1e1          	cp	a,#225
1131  0047 2635          	jrne	L535
1132                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1134  0049 721150c0      	bres	20672,#0
1136  004d 204d          	jra	L335
1137  004f               L364:
1138                     ; 361     if (ITState != DISABLE)
1140  004f 7b09          	ld	a,(OFST+5,sp)
1141  0051 2706          	jreq	L115
1142                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1144  0053 721450c5      	bset	20677,#2
1146  0057 2004          	jra	L315
1147  0059               L115:
1148                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1150  0059 721550c5      	bres	20677,#2
1151  005d               L315:
1152                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1154  005d 7b06          	ld	a,(OFST+2,sp)
1155  005f c750c4        	ld	20676,a
1157  0062 2003          	jra	L125
1158  0064               L515:
1159                     ; 376       DownCounter--;
1161  0064 5a            	decw	x
1162  0065 1f03          	ldw	(OFST-1,sp),x
1164  0067               L125:
1165                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1167  0067 720750c504    	btjf	20677,#3,L525
1169  006c 1e03          	ldw	x,(OFST-1,sp)
1170  006e 26f4          	jrne	L515
1171  0070               L525:
1172                     ; 379     if(DownCounter != 0)
1174  0070 1e03          	ldw	x,(OFST-1,sp)
1175  0072 27c7          	jreq	L305
1176                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1178  0074 721250c5      	bset	20677,#1
1179                     ; 383       Swif = SUCCESS;
1181  0078               LC004:
1183  0078 a601          	ld	a,#1
1184  007a 6b02          	ld	(OFST-2,sp),a
1187  007c 20bf          	jra	L705
1188                     ; 387       Swif = ERROR;
1189  007e               L535:
1190                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1192  007e 7b0a          	ld	a,(OFST+6,sp)
1193  0080 260c          	jrne	L145
1195  0082 7b01          	ld	a,(OFST-3,sp)
1196  0084 a1d2          	cp	a,#210
1197  0086 2606          	jrne	L145
1198                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1200  0088 721750c0      	bres	20672,#3
1202  008c 200e          	jra	L335
1203  008e               L145:
1204                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1206  008e 7b0a          	ld	a,(OFST+6,sp)
1207  0090 260a          	jrne	L335
1209  0092 7b01          	ld	a,(OFST-3,sp)
1210  0094 a1b4          	cp	a,#180
1211  0096 2604          	jrne	L335
1212                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1214  0098 721150c1      	bres	20673,#0
1215  009c               L335:
1216                     ; 406   return(Swif);
1218  009c 7b02          	ld	a,(OFST-2,sp)
1221  009e 5b06          	addw	sp,#6
1222  00a0 81            	ret	
1360                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1360                     ; 416 {
1361                     .text:	section	.text,new
1362  0000               _CLK_HSIPrescalerConfig:
1364  0000 88            	push	a
1365       00000000      OFST:	set	0
1368                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1370                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1372  0001 c650c6        	ld	a,20678
1373  0004 a4e7          	and	a,#231
1374  0006 c750c6        	ld	20678,a
1375                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1377  0009 c650c6        	ld	a,20678
1378  000c 1a01          	or	a,(OFST+1,sp)
1379  000e c750c6        	ld	20678,a
1380                     ; 425 }
1383  0011 84            	pop	a
1384  0012 81            	ret	
1519                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1519                     ; 437 {
1520                     .text:	section	.text,new
1521  0000               _CLK_CCOConfig:
1523  0000 88            	push	a
1524       00000000      OFST:	set	0
1527                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1529                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1531  0001 c650c9        	ld	a,20681
1532  0004 a4e1          	and	a,#225
1533  0006 c750c9        	ld	20681,a
1534                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1536  0009 c650c9        	ld	a,20681
1537  000c 1a01          	or	a,(OFST+1,sp)
1538  000e c750c9        	ld	20681,a
1539                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1541  0011 721050c9      	bset	20681,#0
1542                     ; 449 }
1545  0015 84            	pop	a
1546  0016 81            	ret	
1611                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1611                     ; 460 {
1612                     .text:	section	.text,new
1613  0000               _CLK_ITConfig:
1615  0000 89            	pushw	x
1616       00000000      OFST:	set	0
1619                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1621                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1623                     ; 465   if (NewState != DISABLE)
1625  0001 9f            	ld	a,xl
1626  0002 4d            	tnz	a
1627  0003 2715          	jreq	L347
1628                     ; 467     switch (CLK_IT)
1630  0005 9e            	ld	a,xh
1632                     ; 475     default:
1632                     ; 476       break;
1633  0006 a00c          	sub	a,#12
1634  0008 270a          	jreq	L776
1635  000a a010          	sub	a,#16
1636  000c 2620          	jrne	L157
1637                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1637                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1639  000e 721450c5      	bset	20677,#2
1640                     ; 471       break;
1642  0012 201a          	jra	L157
1643  0014               L776:
1644                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1644                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1646  0014 721450c8      	bset	20680,#2
1647                     ; 474       break;
1649  0018 2014          	jra	L157
1650                     ; 475     default:
1650                     ; 476       break;
1653  001a               L347:
1654                     ; 481     switch (CLK_IT)
1656  001a 7b01          	ld	a,(OFST+1,sp)
1658                     ; 489     default:
1658                     ; 490       break;
1659  001c a00c          	sub	a,#12
1660  001e 270a          	jreq	L507
1661  0020 a010          	sub	a,#16
1662  0022 260a          	jrne	L157
1663                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1663                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1665  0024 721550c5      	bres	20677,#2
1666                     ; 485       break;
1668  0028 2004          	jra	L157
1669  002a               L507:
1670                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1670                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1672  002a 721550c8      	bres	20680,#2
1673                     ; 488       break;
1674  002e               L157:
1675                     ; 493 }
1678  002e 85            	popw	x
1679  002f 81            	ret	
1680                     ; 489     default:
1680                     ; 490       break;
1716                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1716                     ; 501 {
1717                     .text:	section	.text,new
1718  0000               _CLK_SYSCLKConfig:
1720  0000 88            	push	a
1721       00000000      OFST:	set	0
1724                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1726                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1728  0001 a580          	bcp	a,#128
1729  0003 260e          	jrne	L577
1730                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1732  0005 c650c6        	ld	a,20678
1733  0008 a4e7          	and	a,#231
1734  000a c750c6        	ld	20678,a
1735                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1737  000d 7b01          	ld	a,(OFST+1,sp)
1738  000f a418          	and	a,#24
1740  0011 200c          	jra	L777
1741  0013               L577:
1742                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1744  0013 c650c6        	ld	a,20678
1745  0016 a4f8          	and	a,#248
1746  0018 c750c6        	ld	20678,a
1747                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1749  001b 7b01          	ld	a,(OFST+1,sp)
1750  001d a407          	and	a,#7
1751  001f               L777:
1752  001f ca50c6        	or	a,20678
1753  0022 c750c6        	ld	20678,a
1754                     ; 515 }
1757  0025 84            	pop	a
1758  0026 81            	ret	
1814                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1814                     ; 524 {
1815                     .text:	section	.text,new
1816  0000               _CLK_SWIMConfig:
1820                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1822                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1824  0000 4d            	tnz	a
1825  0001 2705          	jreq	L7201
1826                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1828  0003 721050cd      	bset	20685,#0
1831  0007 81            	ret	
1832  0008               L7201:
1833                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1835  0008 721150cd      	bres	20685,#0
1836                     ; 538 }
1839  000c 81            	ret	
1863                     ; 547 void CLK_ClockSecuritySystemEnable(void)
1863                     ; 548 {
1864                     .text:	section	.text,new
1865  0000               _CLK_ClockSecuritySystemEnable:
1869                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
1871  0000 721050c8      	bset	20680,#0
1872                     ; 551 }
1875  0004 81            	ret	
1900                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1900                     ; 560 {
1901                     .text:	section	.text,new
1902  0000               _CLK_GetSYSCLKSource:
1906                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
1908  0000 c650c3        	ld	a,20675
1911  0003 81            	ret	
1974                     ; 569 uint32_t CLK_GetClockFreq(void)
1974                     ; 570 {
1975                     .text:	section	.text,new
1976  0000               _CLK_GetClockFreq:
1978  0000 5209          	subw	sp,#9
1979       00000009      OFST:	set	9
1982                     ; 571   uint32_t clockfrequency = 0;
1984                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1986                     ; 573   uint8_t tmp = 0, presc = 0;
1990                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1992  0002 c650c3        	ld	a,20675
1993  0005 6b09          	ld	(OFST+0,sp),a
1995                     ; 578   if (clocksource == CLK_SOURCE_HSI)
1997  0007 a1e1          	cp	a,#225
1998  0009 2634          	jrne	L5011
1999                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
2001  000b c650c6        	ld	a,20678
2002  000e a418          	and	a,#24
2003  0010 44            	srl	a
2004  0011 44            	srl	a
2005  0012 44            	srl	a
2007                     ; 581     tmp = (uint8_t)(tmp >> 3);
2010                     ; 582     presc = HSIDivFactor[tmp];
2012  0013 5f            	clrw	x
2013  0014 97            	ld	xl,a
2014  0015 d60000        	ld	a,(_HSIDivFactor,x)
2015  0018 6b09          	ld	(OFST+0,sp),a
2017                     ; 583     clockfrequency = HSI_VALUE / presc;
2019  001a b703          	ld	c_lreg+3,a
2020  001c 3f02          	clr	c_lreg+2
2021  001e 3f01          	clr	c_lreg+1
2022  0020 3f00          	clr	c_lreg
2023  0022 96            	ldw	x,sp
2024  0023 5c            	incw	x
2025  0024 cd0000        	call	c_rtol
2028  0027 ae2400        	ldw	x,#9216
2029  002a bf02          	ldw	c_lreg+2,x
2030  002c ae00f4        	ldw	x,#244
2031  002f bf00          	ldw	c_lreg,x
2032  0031 96            	ldw	x,sp
2033  0032 5c            	incw	x
2034  0033 cd0000        	call	c_ludv
2036  0036 96            	ldw	x,sp
2037  0037 1c0005        	addw	x,#OFST-4
2038  003a cd0000        	call	c_rtol
2042  003d 2018          	jra	L7011
2043  003f               L5011:
2044                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2046  003f a1d2          	cp	a,#210
2047  0041 260a          	jrne	L1111
2048                     ; 587     clockfrequency = LSI_VALUE;
2050  0043 aef400        	ldw	x,#62464
2051  0046 1f07          	ldw	(OFST-2,sp),x
2052  0048 ae0001        	ldw	x,#1
2054  004b 2008          	jp	LC005
2055  004d               L1111:
2056                     ; 591     clockfrequency = HSE_VALUE;
2058  004d ae2400        	ldw	x,#9216
2059  0050 1f07          	ldw	(OFST-2,sp),x
2060  0052 ae00f4        	ldw	x,#244
2061  0055               LC005:
2062  0055 1f05          	ldw	(OFST-4,sp),x
2064  0057               L7011:
2065                     ; 594   return((uint32_t)clockfrequency);
2067  0057 96            	ldw	x,sp
2068  0058 1c0005        	addw	x,#OFST-4
2069  005b cd0000        	call	c_ltor
2073  005e 5b09          	addw	sp,#9
2074  0060 81            	ret	
2173                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2173                     ; 605 {
2174                     .text:	section	.text,new
2175  0000               _CLK_AdjustHSICalibrationValue:
2177  0000 88            	push	a
2178       00000000      OFST:	set	0
2181                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2183                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2185  0001 c650cc        	ld	a,20684
2186  0004 a4f8          	and	a,#248
2187  0006 1a01          	or	a,(OFST+1,sp)
2188  0008 c750cc        	ld	20684,a
2189                     ; 611 }
2192  000b 84            	pop	a
2193  000c 81            	ret	
2217                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2217                     ; 623 {
2218                     .text:	section	.text,new
2219  0000               _CLK_SYSCLKEmergencyClear:
2223                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2225  0000 721150c5      	bres	20677,#0
2226                     ; 625 }
2229  0004 81            	ret	
2382                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2382                     ; 635 {
2383                     .text:	section	.text,new
2384  0000               _CLK_GetFlagStatus:
2386  0000 89            	pushw	x
2387  0001 5203          	subw	sp,#3
2388       00000003      OFST:	set	3
2391                     ; 636   uint16_t statusreg = 0;
2393                     ; 637   uint8_t tmpreg = 0;
2395                     ; 638   FlagStatus bitstatus = RESET;
2397                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2399                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2401  0003 01            	rrwa	x,a
2402  0004 4f            	clr	a
2403  0005 02            	rlwa	x,a
2404  0006 1f01          	ldw	(OFST-2,sp),x
2406                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2408  0008 a30100        	cpw	x,#256
2409  000b 2605          	jrne	L7521
2410                     ; 649     tmpreg = CLK->ICKR;
2412  000d c650c0        	ld	a,20672
2414  0010 2021          	jra	L1621
2415  0012               L7521:
2416                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2418  0012 a30200        	cpw	x,#512
2419  0015 2605          	jrne	L3621
2420                     ; 653     tmpreg = CLK->ECKR;
2422  0017 c650c1        	ld	a,20673
2424  001a 2017          	jra	L1621
2425  001c               L3621:
2426                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2428  001c a30300        	cpw	x,#768
2429  001f 2605          	jrne	L7621
2430                     ; 657     tmpreg = CLK->SWCR;
2432  0021 c650c5        	ld	a,20677
2434  0024 200d          	jra	L1621
2435  0026               L7621:
2436                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2438  0026 a30400        	cpw	x,#1024
2439  0029 2605          	jrne	L3721
2440                     ; 661     tmpreg = CLK->CSSR;
2442  002b c650c8        	ld	a,20680
2444  002e 2003          	jra	L1621
2445  0030               L3721:
2446                     ; 665     tmpreg = CLK->CCOR;
2448  0030 c650c9        	ld	a,20681
2449  0033               L1621:
2450  0033 6b03          	ld	(OFST+0,sp),a
2452                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2454  0035 7b05          	ld	a,(OFST+2,sp)
2455  0037 1503          	bcp	a,(OFST+0,sp)
2456  0039 2704          	jreq	L7721
2457                     ; 670     bitstatus = SET;
2459  003b a601          	ld	a,#1
2462  003d 2001          	jra	L1031
2463  003f               L7721:
2464                     ; 674     bitstatus = RESET;
2466  003f 4f            	clr	a
2468  0040               L1031:
2469                     ; 678   return((FlagStatus)bitstatus);
2473  0040 5b05          	addw	sp,#5
2474  0042 81            	ret	
2520                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2520                     ; 688 {
2521                     .text:	section	.text,new
2522  0000               _CLK_GetITStatus:
2524  0000 88            	push	a
2525  0001 88            	push	a
2526       00000001      OFST:	set	1
2529                     ; 689   ITStatus bitstatus = RESET;
2531                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2533                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2535  0002 a11c          	cp	a,#28
2536  0004 2609          	jrne	L5231
2537                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2539  0006 c450c5        	and	a,20677
2540  0009 a10c          	cp	a,#12
2541  000b 260f          	jrne	L5331
2542                     ; 699       bitstatus = SET;
2544  000d 2009          	jp	LC007
2545                     ; 703       bitstatus = RESET;
2546  000f               L5231:
2547                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2549  000f c650c8        	ld	a,20680
2550  0012 1402          	and	a,(OFST+1,sp)
2551  0014 a10c          	cp	a,#12
2552  0016 2604          	jrne	L5331
2553                     ; 711       bitstatus = SET;
2555  0018               LC007:
2557  0018 a601          	ld	a,#1
2560  001a 2001          	jra	L3331
2561  001c               L5331:
2562                     ; 715       bitstatus = RESET;
2565  001c 4f            	clr	a
2567  001d               L3331:
2568                     ; 720   return bitstatus;
2572  001d 85            	popw	x
2573  001e 81            	ret	
2609                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2609                     ; 730 {
2610                     .text:	section	.text,new
2611  0000               _CLK_ClearITPendingBit:
2615                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2617                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2619  0000 a10c          	cp	a,#12
2620  0002 2605          	jrne	L7531
2621                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2623  0004 721750c8      	bres	20680,#3
2626  0008 81            	ret	
2627  0009               L7531:
2628                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2630  0009 721750c5      	bres	20677,#3
2631                     ; 745 }
2634  000d 81            	ret	
2669                     	xdef	_CLKPrescTable
2670                     	xdef	_HSIDivFactor
2671                     	xdef	_CLK_ClearITPendingBit
2672                     	xdef	_CLK_GetITStatus
2673                     	xdef	_CLK_GetFlagStatus
2674                     	xdef	_CLK_GetSYSCLKSource
2675                     	xdef	_CLK_GetClockFreq
2676                     	xdef	_CLK_AdjustHSICalibrationValue
2677                     	xdef	_CLK_SYSCLKEmergencyClear
2678                     	xdef	_CLK_ClockSecuritySystemEnable
2679                     	xdef	_CLK_SWIMConfig
2680                     	xdef	_CLK_SYSCLKConfig
2681                     	xdef	_CLK_ITConfig
2682                     	xdef	_CLK_CCOConfig
2683                     	xdef	_CLK_HSIPrescalerConfig
2684                     	xdef	_CLK_ClockSwitchConfig
2685                     	xdef	_CLK_PeripheralClockConfig
2686                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2687                     	xdef	_CLK_FastHaltWakeUpCmd
2688                     	xdef	_CLK_ClockSwitchCmd
2689                     	xdef	_CLK_CCOCmd
2690                     	xdef	_CLK_LSICmd
2691                     	xdef	_CLK_HSICmd
2692                     	xdef	_CLK_HSECmd
2693                     	xdef	_CLK_DeInit
2694                     	xref.b	c_lreg
2695                     	xref.b	c_x
2714                     	xref	c_ltor
2715                     	xref	c_ludv
2716                     	xref	c_rtol
2717                     	end

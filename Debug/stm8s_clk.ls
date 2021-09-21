   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  21  0002               L5_flagUartRXNE:
  22  0002 00            	dc.b	0
  61                     .const:	section	.text
  62  0000               _HSIDivFactor:
  63  0000 01            	dc.b	1
  64  0001 02            	dc.b	2
  65  0002 04            	dc.b	4
  66  0003 08            	dc.b	8
  67  0004               _CLKPrescTable:
  68  0004 01            	dc.b	1
  69  0005 02            	dc.b	2
  70  0006 04            	dc.b	4
  71  0007 08            	dc.b	8
  72  0008 0a            	dc.b	10
  73  0009 10            	dc.b	16
  74  000a 14            	dc.b	20
  75  000b 28            	dc.b	40
 104                     ; 72 void CLK_DeInit(void)
 104                     ; 73 {
 106                     .text:	section	.text,new
 107  0000               _CLK_DeInit:
 111                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
 113  0000 350150c0      	mov	20672,#1
 114                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
 116  0004 725f50c1      	clr	20673
 117                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
 119  0008 35e150c4      	mov	20676,#225
 120                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
 122  000c 725f50c5      	clr	20677
 123                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
 125  0010 351850c6      	mov	20678,#24
 126                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
 128  0014 35ff50c7      	mov	20679,#255
 129                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
 131  0018 35ff50ca      	mov	20682,#255
 132                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
 134  001c 725f50c8      	clr	20680
 135                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 137  0020 725f50c9      	clr	20681
 139  0024               L15:
 140                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
 142  0024 720050c9fb    	btjt	20681,#0,L15
 143                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 145  0029 725f50c9      	clr	20681
 146                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 148  002d 725f50cc      	clr	20684
 149                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 151  0031 725f50cd      	clr	20685
 152                     ; 88 }
 155  0035 81            	ret	
 211                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 211                     ; 100 {
 212                     .text:	section	.text,new
 213  0000               _CLK_FastHaltWakeUpCmd:
 217                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 219                     ; 104   if (NewState != DISABLE)
 221  0000 4d            	tnz	a
 222  0001 2705          	jreq	L301
 223                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 225  0003 721450c0      	bset	20672,#2
 228  0007 81            	ret	
 229  0008               L301:
 230                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 232  0008 721550c0      	bres	20672,#2
 233                     ; 114 }
 236  000c 81            	ret	
 271                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 271                     ; 122 {
 272                     .text:	section	.text,new
 273  0000               _CLK_HSECmd:
 277                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 279                     ; 126   if (NewState != DISABLE)
 281  0000 4d            	tnz	a
 282  0001 2705          	jreq	L521
 283                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 285  0003 721050c1      	bset	20673,#0
 288  0007 81            	ret	
 289  0008               L521:
 290                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 292  0008 721150c1      	bres	20673,#0
 293                     ; 136 }
 296  000c 81            	ret	
 331                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 331                     ; 144 {
 332                     .text:	section	.text,new
 333  0000               _CLK_HSICmd:
 337                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 339                     ; 148   if (NewState != DISABLE)
 341  0000 4d            	tnz	a
 342  0001 2705          	jreq	L741
 343                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 345  0003 721050c0      	bset	20672,#0
 348  0007 81            	ret	
 349  0008               L741:
 350                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 352  0008 721150c0      	bres	20672,#0
 353                     ; 158 }
 356  000c 81            	ret	
 391                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 391                     ; 167 {
 392                     .text:	section	.text,new
 393  0000               _CLK_LSICmd:
 397                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 399                     ; 171   if (NewState != DISABLE)
 401  0000 4d            	tnz	a
 402  0001 2705          	jreq	L171
 403                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 405  0003 721650c0      	bset	20672,#3
 408  0007 81            	ret	
 409  0008               L171:
 410                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 412  0008 721750c0      	bres	20672,#3
 413                     ; 181 }
 416  000c 81            	ret	
 451                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 451                     ; 190 {
 452                     .text:	section	.text,new
 453  0000               _CLK_CCOCmd:
 457                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 459                     ; 194   if (NewState != DISABLE)
 461  0000 4d            	tnz	a
 462  0001 2705          	jreq	L312
 463                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 465  0003 721050c9      	bset	20681,#0
 468  0007 81            	ret	
 469  0008               L312:
 470                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 472  0008 721150c9      	bres	20681,#0
 473                     ; 204 }
 476  000c 81            	ret	
 511                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 511                     ; 214 {
 512                     .text:	section	.text,new
 513  0000               _CLK_ClockSwitchCmd:
 517                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 519                     ; 218   if (NewState != DISABLE )
 521  0000 4d            	tnz	a
 522  0001 2705          	jreq	L532
 523                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 525  0003 721250c5      	bset	20677,#1
 528  0007 81            	ret	
 529  0008               L532:
 530                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 532  0008 721350c5      	bres	20677,#1
 533                     ; 228 }
 536  000c 81            	ret	
 572                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 572                     ; 239 {
 573                     .text:	section	.text,new
 574  0000               _CLK_SlowActiveHaltWakeUpCmd:
 578                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 580                     ; 243   if (NewState != DISABLE)
 582  0000 4d            	tnz	a
 583  0001 2705          	jreq	L752
 584                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 586  0003 721a50c0      	bset	20672,#5
 589  0007 81            	ret	
 590  0008               L752:
 591                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 593  0008 721b50c0      	bres	20672,#5
 594                     ; 253 }
 597  000c 81            	ret	
 756                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 756                     ; 264 {
 757                     .text:	section	.text,new
 758  0000               _CLK_PeripheralClockConfig:
 760  0000 89            	pushw	x
 761       00000000      OFST:	set	0
 764                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 766                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 768                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 770  0001 9e            	ld	a,xh
 771  0002 a510          	bcp	a,#16
 772  0004 2630          	jrne	L543
 773                     ; 271     if (NewState != DISABLE)
 775  0006 7b02          	ld	a,(OFST+2,sp)
 776  0008 2714          	jreq	L743
 777                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 779  000a 7b01          	ld	a,(OFST+1,sp)
 780  000c a40f          	and	a,#15
 781  000e 5f            	clrw	x
 782  000f 97            	ld	xl,a
 783  0010 a601          	ld	a,#1
 784  0012 5d            	tnzw	x
 785  0013 2704          	jreq	L62
 786  0015               L03:
 787  0015 48            	sll	a
 788  0016 5a            	decw	x
 789  0017 26fc          	jrne	L03
 790  0019               L62:
 791  0019 ca50c7        	or	a,20679
 793  001c 2013          	jp	LC002
 794  001e               L743:
 795                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 797  001e 7b01          	ld	a,(OFST+1,sp)
 798  0020 a40f          	and	a,#15
 799  0022 5f            	clrw	x
 800  0023 97            	ld	xl,a
 801  0024 a601          	ld	a,#1
 802  0026 5d            	tnzw	x
 803  0027 2704          	jreq	L23
 804  0029               L43:
 805  0029 48            	sll	a
 806  002a 5a            	decw	x
 807  002b 26fc          	jrne	L43
 808  002d               L23:
 809  002d 43            	cpl	a
 810  002e c450c7        	and	a,20679
 811  0031               LC002:
 812  0031 c750c7        	ld	20679,a
 813  0034 202e          	jra	L353
 814  0036               L543:
 815                     ; 284     if (NewState != DISABLE)
 817  0036 7b02          	ld	a,(OFST+2,sp)
 818  0038 2714          	jreq	L553
 819                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 821  003a 7b01          	ld	a,(OFST+1,sp)
 822  003c a40f          	and	a,#15
 823  003e 5f            	clrw	x
 824  003f 97            	ld	xl,a
 825  0040 a601          	ld	a,#1
 826  0042 5d            	tnzw	x
 827  0043 2704          	jreq	L63
 828  0045               L04:
 829  0045 48            	sll	a
 830  0046 5a            	decw	x
 831  0047 26fc          	jrne	L04
 832  0049               L63:
 833  0049 ca50ca        	or	a,20682
 835  004c 2013          	jp	LC001
 836  004e               L553:
 837                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 839  004e 7b01          	ld	a,(OFST+1,sp)
 840  0050 a40f          	and	a,#15
 841  0052 5f            	clrw	x
 842  0053 97            	ld	xl,a
 843  0054 a601          	ld	a,#1
 844  0056 5d            	tnzw	x
 845  0057 2704          	jreq	L24
 846  0059               L44:
 847  0059 48            	sll	a
 848  005a 5a            	decw	x
 849  005b 26fc          	jrne	L44
 850  005d               L24:
 851  005d 43            	cpl	a
 852  005e c450ca        	and	a,20682
 853  0061               LC001:
 854  0061 c750ca        	ld	20682,a
 855  0064               L353:
 856                     ; 295 }
 859  0064 85            	popw	x
 860  0065 81            	ret	
1048                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1048                     ; 310 {
1049                     .text:	section	.text,new
1050  0000               _CLK_ClockSwitchConfig:
1052  0000 89            	pushw	x
1053  0001 5204          	subw	sp,#4
1054       00000004      OFST:	set	4
1057                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1059  0003 aeffff        	ldw	x,#65535
1060  0006 1f03          	ldw	(OFST-1,sp),x
1062                     ; 313   ErrorStatus Swif = ERROR;
1064                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1066                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1068                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1070                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1072                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1074  0008 c650c3        	ld	a,20675
1075  000b 6b01          	ld	(OFST-3,sp),a
1077                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1079  000d 7b05          	ld	a,(OFST+1,sp)
1080  000f 4a            	dec	a
1081  0010 263d          	jrne	L174
1082                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1084  0012 721250c5      	bset	20677,#1
1085                     ; 331     if (ITState != DISABLE)
1087  0016 7b09          	ld	a,(OFST+5,sp)
1088  0018 2706          	jreq	L374
1089                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1091  001a 721450c5      	bset	20677,#2
1093  001e 2004          	jra	L574
1094  0020               L374:
1095                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1097  0020 721550c5      	bres	20677,#2
1098  0024               L574:
1099                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1101  0024 7b06          	ld	a,(OFST+2,sp)
1102  0026 c750c4        	ld	20676,a
1104  0029 2003          	jra	L305
1105  002b               L774:
1106                     ; 346       DownCounter--;
1108  002b 5a            	decw	x
1109  002c 1f03          	ldw	(OFST-1,sp),x
1111  002e               L305:
1112                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1114  002e 720150c504    	btjf	20677,#0,L705
1116  0033 1e03          	ldw	x,(OFST-1,sp)
1117  0035 26f4          	jrne	L774
1118  0037               L705:
1119                     ; 349     if(DownCounter != 0)
1121  0037 1e03          	ldw	x,(OFST-1,sp)
1122                     ; 351       Swif = SUCCESS;
1124  0039 263d          	jrne	LC004
1125  003b               L115:
1126                     ; 355       Swif = ERROR;
1129  003b 0f02          	clr	(OFST-2,sp)
1131  003d               L515:
1132                     ; 390   if(Swif != ERROR)
1134  003d 275d          	jreq	L145
1135                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1137  003f 7b0a          	ld	a,(OFST+6,sp)
1138  0041 263b          	jrne	L345
1140  0043 7b01          	ld	a,(OFST-3,sp)
1141  0045 a1e1          	cp	a,#225
1142  0047 2635          	jrne	L345
1143                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1145  0049 721150c0      	bres	20672,#0
1147  004d 204d          	jra	L145
1148  004f               L174:
1149                     ; 361     if (ITState != DISABLE)
1151  004f 7b09          	ld	a,(OFST+5,sp)
1152  0051 2706          	jreq	L715
1153                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1155  0053 721450c5      	bset	20677,#2
1157  0057 2004          	jra	L125
1158  0059               L715:
1159                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1161  0059 721550c5      	bres	20677,#2
1162  005d               L125:
1163                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1165  005d 7b06          	ld	a,(OFST+2,sp)
1166  005f c750c4        	ld	20676,a
1168  0062 2003          	jra	L725
1169  0064               L325:
1170                     ; 376       DownCounter--;
1172  0064 5a            	decw	x
1173  0065 1f03          	ldw	(OFST-1,sp),x
1175  0067               L725:
1176                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1178  0067 720750c504    	btjf	20677,#3,L335
1180  006c 1e03          	ldw	x,(OFST-1,sp)
1181  006e 26f4          	jrne	L325
1182  0070               L335:
1183                     ; 379     if(DownCounter != 0)
1185  0070 1e03          	ldw	x,(OFST-1,sp)
1186  0072 27c7          	jreq	L115
1187                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1189  0074 721250c5      	bset	20677,#1
1190                     ; 383       Swif = SUCCESS;
1192  0078               LC004:
1194  0078 a601          	ld	a,#1
1195  007a 6b02          	ld	(OFST-2,sp),a
1198  007c 20bf          	jra	L515
1199                     ; 387       Swif = ERROR;
1200  007e               L345:
1201                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1203  007e 7b0a          	ld	a,(OFST+6,sp)
1204  0080 260c          	jrne	L745
1206  0082 7b01          	ld	a,(OFST-3,sp)
1207  0084 a1d2          	cp	a,#210
1208  0086 2606          	jrne	L745
1209                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1211  0088 721750c0      	bres	20672,#3
1213  008c 200e          	jra	L145
1214  008e               L745:
1215                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1217  008e 7b0a          	ld	a,(OFST+6,sp)
1218  0090 260a          	jrne	L145
1220  0092 7b01          	ld	a,(OFST-3,sp)
1221  0094 a1b4          	cp	a,#180
1222  0096 2604          	jrne	L145
1223                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1225  0098 721150c1      	bres	20673,#0
1226  009c               L145:
1227                     ; 406   return(Swif);
1229  009c 7b02          	ld	a,(OFST-2,sp)
1232  009e 5b06          	addw	sp,#6
1233  00a0 81            	ret	
1371                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1371                     ; 416 {
1372                     .text:	section	.text,new
1373  0000               _CLK_HSIPrescalerConfig:
1375  0000 88            	push	a
1376       00000000      OFST:	set	0
1379                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1381                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1383  0001 c650c6        	ld	a,20678
1384  0004 a4e7          	and	a,#231
1385  0006 c750c6        	ld	20678,a
1386                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1388  0009 c650c6        	ld	a,20678
1389  000c 1a01          	or	a,(OFST+1,sp)
1390  000e c750c6        	ld	20678,a
1391                     ; 425 }
1394  0011 84            	pop	a
1395  0012 81            	ret	
1530                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1530                     ; 437 {
1531                     .text:	section	.text,new
1532  0000               _CLK_CCOConfig:
1534  0000 88            	push	a
1535       00000000      OFST:	set	0
1538                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1540                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1542  0001 c650c9        	ld	a,20681
1543  0004 a4e1          	and	a,#225
1544  0006 c750c9        	ld	20681,a
1545                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1547  0009 c650c9        	ld	a,20681
1548  000c 1a01          	or	a,(OFST+1,sp)
1549  000e c750c9        	ld	20681,a
1550                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1552  0011 721050c9      	bset	20681,#0
1553                     ; 449 }
1556  0015 84            	pop	a
1557  0016 81            	ret	
1622                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1622                     ; 460 {
1623                     .text:	section	.text,new
1624  0000               _CLK_ITConfig:
1626  0000 89            	pushw	x
1627       00000000      OFST:	set	0
1630                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1632                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1634                     ; 465   if (NewState != DISABLE)
1636  0001 9f            	ld	a,xl
1637  0002 4d            	tnz	a
1638  0003 2715          	jreq	L157
1639                     ; 467     switch (CLK_IT)
1641  0005 9e            	ld	a,xh
1643                     ; 475     default:
1643                     ; 476       break;
1644  0006 a00c          	sub	a,#12
1645  0008 270a          	jreq	L507
1646  000a a010          	sub	a,#16
1647  000c 2620          	jrne	L757
1648                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1648                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1650  000e 721450c5      	bset	20677,#2
1651                     ; 471       break;
1653  0012 201a          	jra	L757
1654  0014               L507:
1655                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1655                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1657  0014 721450c8      	bset	20680,#2
1658                     ; 474       break;
1660  0018 2014          	jra	L757
1661                     ; 475     default:
1661                     ; 476       break;
1664  001a               L157:
1665                     ; 481     switch (CLK_IT)
1667  001a 7b01          	ld	a,(OFST+1,sp)
1669                     ; 489     default:
1669                     ; 490       break;
1670  001c a00c          	sub	a,#12
1671  001e 270a          	jreq	L317
1672  0020 a010          	sub	a,#16
1673  0022 260a          	jrne	L757
1674                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1674                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1676  0024 721550c5      	bres	20677,#2
1677                     ; 485       break;
1679  0028 2004          	jra	L757
1680  002a               L317:
1681                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1681                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1683  002a 721550c8      	bres	20680,#2
1684                     ; 488       break;
1685  002e               L757:
1686                     ; 493 }
1689  002e 85            	popw	x
1690  002f 81            	ret	
1691                     ; 489     default:
1691                     ; 490       break;
1727                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1727                     ; 501 {
1728                     .text:	section	.text,new
1729  0000               _CLK_SYSCLKConfig:
1731  0000 88            	push	a
1732       00000000      OFST:	set	0
1735                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1737                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1739  0001 a580          	bcp	a,#128
1740  0003 260e          	jrne	L3001
1741                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1743  0005 c650c6        	ld	a,20678
1744  0008 a4e7          	and	a,#231
1745  000a c750c6        	ld	20678,a
1746                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1748  000d 7b01          	ld	a,(OFST+1,sp)
1749  000f a418          	and	a,#24
1751  0011 200c          	jra	L5001
1752  0013               L3001:
1753                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1755  0013 c650c6        	ld	a,20678
1756  0016 a4f8          	and	a,#248
1757  0018 c750c6        	ld	20678,a
1758                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1760  001b 7b01          	ld	a,(OFST+1,sp)
1761  001d a407          	and	a,#7
1762  001f               L5001:
1763  001f ca50c6        	or	a,20678
1764  0022 c750c6        	ld	20678,a
1765                     ; 515 }
1768  0025 84            	pop	a
1769  0026 81            	ret	
1825                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1825                     ; 524 {
1826                     .text:	section	.text,new
1827  0000               _CLK_SWIMConfig:
1831                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1833                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1835  0000 4d            	tnz	a
1836  0001 2705          	jreq	L5301
1837                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1839  0003 721050cd      	bset	20685,#0
1842  0007 81            	ret	
1843  0008               L5301:
1844                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1846  0008 721150cd      	bres	20685,#0
1847                     ; 538 }
1850  000c 81            	ret	
1874                     ; 547 void CLK_ClockSecuritySystemEnable(void)
1874                     ; 548 {
1875                     .text:	section	.text,new
1876  0000               _CLK_ClockSecuritySystemEnable:
1880                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
1882  0000 721050c8      	bset	20680,#0
1883                     ; 551 }
1886  0004 81            	ret	
1911                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1911                     ; 560 {
1912                     .text:	section	.text,new
1913  0000               _CLK_GetSYSCLKSource:
1917                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
1919  0000 c650c3        	ld	a,20675
1922  0003 81            	ret	
1985                     ; 569 uint32_t CLK_GetClockFreq(void)
1985                     ; 570 {
1986                     .text:	section	.text,new
1987  0000               _CLK_GetClockFreq:
1989  0000 5209          	subw	sp,#9
1990       00000009      OFST:	set	9
1993                     ; 571   uint32_t clockfrequency = 0;
1995                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1997                     ; 573   uint8_t tmp = 0, presc = 0;
2001                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
2003  0002 c650c3        	ld	a,20675
2004  0005 6b09          	ld	(OFST+0,sp),a
2006                     ; 578   if (clocksource == CLK_SOURCE_HSI)
2008  0007 a1e1          	cp	a,#225
2009  0009 2634          	jrne	L3111
2010                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
2012  000b c650c6        	ld	a,20678
2013  000e a418          	and	a,#24
2014  0010 44            	srl	a
2015  0011 44            	srl	a
2016  0012 44            	srl	a
2018                     ; 581     tmp = (uint8_t)(tmp >> 3);
2021                     ; 582     presc = HSIDivFactor[tmp];
2023  0013 5f            	clrw	x
2024  0014 97            	ld	xl,a
2025  0015 d60000        	ld	a,(_HSIDivFactor,x)
2026  0018 6b09          	ld	(OFST+0,sp),a
2028                     ; 583     clockfrequency = HSI_VALUE / presc;
2030  001a b703          	ld	c_lreg+3,a
2031  001c 3f02          	clr	c_lreg+2
2032  001e 3f01          	clr	c_lreg+1
2033  0020 3f00          	clr	c_lreg
2034  0022 96            	ldw	x,sp
2035  0023 5c            	incw	x
2036  0024 cd0000        	call	c_rtol
2039  0027 ae2400        	ldw	x,#9216
2040  002a bf02          	ldw	c_lreg+2,x
2041  002c ae00f4        	ldw	x,#244
2042  002f bf00          	ldw	c_lreg,x
2043  0031 96            	ldw	x,sp
2044  0032 5c            	incw	x
2045  0033 cd0000        	call	c_ludv
2047  0036 96            	ldw	x,sp
2048  0037 1c0005        	addw	x,#OFST-4
2049  003a cd0000        	call	c_rtol
2053  003d 2018          	jra	L5111
2054  003f               L3111:
2055                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2057  003f a1d2          	cp	a,#210
2058  0041 260a          	jrne	L7111
2059                     ; 587     clockfrequency = LSI_VALUE;
2061  0043 aef400        	ldw	x,#62464
2062  0046 1f07          	ldw	(OFST-2,sp),x
2063  0048 ae0001        	ldw	x,#1
2065  004b 2008          	jp	LC005
2066  004d               L7111:
2067                     ; 591     clockfrequency = HSE_VALUE;
2069  004d ae2400        	ldw	x,#9216
2070  0050 1f07          	ldw	(OFST-2,sp),x
2071  0052 ae00f4        	ldw	x,#244
2072  0055               LC005:
2073  0055 1f05          	ldw	(OFST-4,sp),x
2075  0057               L5111:
2076                     ; 594   return((uint32_t)clockfrequency);
2078  0057 96            	ldw	x,sp
2079  0058 1c0005        	addw	x,#OFST-4
2080  005b cd0000        	call	c_ltor
2084  005e 5b09          	addw	sp,#9
2085  0060 81            	ret	
2184                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2184                     ; 605 {
2185                     .text:	section	.text,new
2186  0000               _CLK_AdjustHSICalibrationValue:
2188  0000 88            	push	a
2189       00000000      OFST:	set	0
2192                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2194                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2196  0001 c650cc        	ld	a,20684
2197  0004 a4f8          	and	a,#248
2198  0006 1a01          	or	a,(OFST+1,sp)
2199  0008 c750cc        	ld	20684,a
2200                     ; 611 }
2203  000b 84            	pop	a
2204  000c 81            	ret	
2228                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2228                     ; 623 {
2229                     .text:	section	.text,new
2230  0000               _CLK_SYSCLKEmergencyClear:
2234                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2236  0000 721150c5      	bres	20677,#0
2237                     ; 625 }
2240  0004 81            	ret	
2393                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2393                     ; 635 {
2394                     .text:	section	.text,new
2395  0000               _CLK_GetFlagStatus:
2397  0000 89            	pushw	x
2398  0001 5203          	subw	sp,#3
2399       00000003      OFST:	set	3
2402                     ; 636   uint16_t statusreg = 0;
2404                     ; 637   uint8_t tmpreg = 0;
2406                     ; 638   FlagStatus bitstatus = RESET;
2408                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2410                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2412  0003 01            	rrwa	x,a
2413  0004 4f            	clr	a
2414  0005 02            	rlwa	x,a
2415  0006 1f01          	ldw	(OFST-2,sp),x
2417                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2419  0008 a30100        	cpw	x,#256
2420  000b 2605          	jrne	L5621
2421                     ; 649     tmpreg = CLK->ICKR;
2423  000d c650c0        	ld	a,20672
2425  0010 2021          	jra	L7621
2426  0012               L5621:
2427                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2429  0012 a30200        	cpw	x,#512
2430  0015 2605          	jrne	L1721
2431                     ; 653     tmpreg = CLK->ECKR;
2433  0017 c650c1        	ld	a,20673
2435  001a 2017          	jra	L7621
2436  001c               L1721:
2437                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2439  001c a30300        	cpw	x,#768
2440  001f 2605          	jrne	L5721
2441                     ; 657     tmpreg = CLK->SWCR;
2443  0021 c650c5        	ld	a,20677
2445  0024 200d          	jra	L7621
2446  0026               L5721:
2447                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2449  0026 a30400        	cpw	x,#1024
2450  0029 2605          	jrne	L1031
2451                     ; 661     tmpreg = CLK->CSSR;
2453  002b c650c8        	ld	a,20680
2455  002e 2003          	jra	L7621
2456  0030               L1031:
2457                     ; 665     tmpreg = CLK->CCOR;
2459  0030 c650c9        	ld	a,20681
2460  0033               L7621:
2461  0033 6b03          	ld	(OFST+0,sp),a
2463                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2465  0035 7b05          	ld	a,(OFST+2,sp)
2466  0037 1503          	bcp	a,(OFST+0,sp)
2467  0039 2704          	jreq	L5031
2468                     ; 670     bitstatus = SET;
2470  003b a601          	ld	a,#1
2473  003d 2001          	jra	L7031
2474  003f               L5031:
2475                     ; 674     bitstatus = RESET;
2477  003f 4f            	clr	a
2479  0040               L7031:
2480                     ; 678   return((FlagStatus)bitstatus);
2484  0040 5b05          	addw	sp,#5
2485  0042 81            	ret	
2531                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2531                     ; 688 {
2532                     .text:	section	.text,new
2533  0000               _CLK_GetITStatus:
2535  0000 88            	push	a
2536  0001 88            	push	a
2537       00000001      OFST:	set	1
2540                     ; 689   ITStatus bitstatus = RESET;
2542                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2544                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2546  0002 a11c          	cp	a,#28
2547  0004 2609          	jrne	L3331
2548                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2550  0006 c450c5        	and	a,20677
2551  0009 a10c          	cp	a,#12
2552  000b 260f          	jrne	L3431
2553                     ; 699       bitstatus = SET;
2555  000d 2009          	jp	LC007
2556                     ; 703       bitstatus = RESET;
2557  000f               L3331:
2558                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2560  000f c650c8        	ld	a,20680
2561  0012 1402          	and	a,(OFST+1,sp)
2562  0014 a10c          	cp	a,#12
2563  0016 2604          	jrne	L3431
2564                     ; 711       bitstatus = SET;
2566  0018               LC007:
2568  0018 a601          	ld	a,#1
2571  001a 2001          	jra	L1431
2572  001c               L3431:
2573                     ; 715       bitstatus = RESET;
2576  001c 4f            	clr	a
2578  001d               L1431:
2579                     ; 720   return bitstatus;
2583  001d 85            	popw	x
2584  001e 81            	ret	
2620                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2620                     ; 730 {
2621                     .text:	section	.text,new
2622  0000               _CLK_ClearITPendingBit:
2626                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2628                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2630  0000 a10c          	cp	a,#12
2631  0002 2605          	jrne	L5631
2632                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2634  0004 721750c8      	bres	20680,#3
2637  0008 81            	ret	
2638  0009               L5631:
2639                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2641  0009 721750c5      	bres	20677,#3
2642                     ; 745 }
2645  000d 81            	ret	
2680                     	xdef	_CLKPrescTable
2681                     	xdef	_HSIDivFactor
2682                     	xdef	_CLK_ClearITPendingBit
2683                     	xdef	_CLK_GetITStatus
2684                     	xdef	_CLK_GetFlagStatus
2685                     	xdef	_CLK_GetSYSCLKSource
2686                     	xdef	_CLK_GetClockFreq
2687                     	xdef	_CLK_AdjustHSICalibrationValue
2688                     	xdef	_CLK_SYSCLKEmergencyClear
2689                     	xdef	_CLK_ClockSecuritySystemEnable
2690                     	xdef	_CLK_SWIMConfig
2691                     	xdef	_CLK_SYSCLKConfig
2692                     	xdef	_CLK_ITConfig
2693                     	xdef	_CLK_CCOConfig
2694                     	xdef	_CLK_HSIPrescalerConfig
2695                     	xdef	_CLK_ClockSwitchConfig
2696                     	xdef	_CLK_PeripheralClockConfig
2697                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2698                     	xdef	_CLK_FastHaltWakeUpCmd
2699                     	xdef	_CLK_ClockSwitchCmd
2700                     	xdef	_CLK_CCOCmd
2701                     	xdef	_CLK_LSICmd
2702                     	xdef	_CLK_HSICmd
2703                     	xdef	_CLK_HSECmd
2704                     	xdef	_CLK_DeInit
2705                     	xref.b	c_lreg
2706                     	xref.b	c_x
2725                     	xref	c_ltor
2726                     	xref	c_ludv
2727                     	xref	c_rtol
2728                     	end

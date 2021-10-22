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
  83                     .const:	section	.text
  84  0000               _HSIDivFactor:
  85  0000 01            	dc.b	1
  86  0001 02            	dc.b	2
  87  0002 04            	dc.b	4
  88  0003 08            	dc.b	8
  89  0004               _CLKPrescTable:
  90  0004 01            	dc.b	1
  91  0005 02            	dc.b	2
  92  0006 04            	dc.b	4
  93  0007 08            	dc.b	8
  94  0008 0a            	dc.b	10
  95  0009 10            	dc.b	16
  96  000a 14            	dc.b	20
  97  000b 28            	dc.b	40
 126                     ; 72 void CLK_DeInit(void)
 126                     ; 73 {
 128                     .text:	section	.text,new
 129  0000               _CLK_DeInit:
 133                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
 135  0000 350150c0      	mov	20672,#1
 136                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
 138  0004 725f50c1      	clr	20673
 139                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
 141  0008 35e150c4      	mov	20676,#225
 142                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
 144  000c 725f50c5      	clr	20677
 145                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
 147  0010 351850c6      	mov	20678,#24
 148                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
 150  0014 35ff50c7      	mov	20679,#255
 151                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
 153  0018 35ff50ca      	mov	20682,#255
 154                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
 156  001c 725f50c8      	clr	20680
 157                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 159  0020 725f50c9      	clr	20681
 161  0024               L76:
 162                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
 164  0024 720050c9fb    	btjt	20681,#0,L76
 165                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 167  0029 725f50c9      	clr	20681
 168                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 170  002d 725f50cc      	clr	20684
 171                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 173  0031 725f50cd      	clr	20685
 174                     ; 88 }
 177  0035 81            	ret	
 233                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 233                     ; 100 {
 234                     .text:	section	.text,new
 235  0000               _CLK_FastHaltWakeUpCmd:
 239                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 241                     ; 104   if (NewState != DISABLE)
 243  0000 4d            	tnz	a
 244  0001 2705          	jreq	L121
 245                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 247  0003 721450c0      	bset	20672,#2
 250  0007 81            	ret	
 251  0008               L121:
 252                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 254  0008 721550c0      	bres	20672,#2
 255                     ; 114 }
 258  000c 81            	ret	
 293                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 293                     ; 122 {
 294                     .text:	section	.text,new
 295  0000               _CLK_HSECmd:
 299                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 301                     ; 126   if (NewState != DISABLE)
 303  0000 4d            	tnz	a
 304  0001 2705          	jreq	L341
 305                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 307  0003 721050c1      	bset	20673,#0
 310  0007 81            	ret	
 311  0008               L341:
 312                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 314  0008 721150c1      	bres	20673,#0
 315                     ; 136 }
 318  000c 81            	ret	
 353                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 353                     ; 144 {
 354                     .text:	section	.text,new
 355  0000               _CLK_HSICmd:
 359                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 361                     ; 148   if (NewState != DISABLE)
 363  0000 4d            	tnz	a
 364  0001 2705          	jreq	L561
 365                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 367  0003 721050c0      	bset	20672,#0
 370  0007 81            	ret	
 371  0008               L561:
 372                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 374  0008 721150c0      	bres	20672,#0
 375                     ; 158 }
 378  000c 81            	ret	
 413                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 413                     ; 167 {
 414                     .text:	section	.text,new
 415  0000               _CLK_LSICmd:
 419                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 421                     ; 171   if (NewState != DISABLE)
 423  0000 4d            	tnz	a
 424  0001 2705          	jreq	L702
 425                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 427  0003 721650c0      	bset	20672,#3
 430  0007 81            	ret	
 431  0008               L702:
 432                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 434  0008 721750c0      	bres	20672,#3
 435                     ; 181 }
 438  000c 81            	ret	
 473                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 473                     ; 190 {
 474                     .text:	section	.text,new
 475  0000               _CLK_CCOCmd:
 479                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 481                     ; 194   if (NewState != DISABLE)
 483  0000 4d            	tnz	a
 484  0001 2705          	jreq	L132
 485                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 487  0003 721050c9      	bset	20681,#0
 490  0007 81            	ret	
 491  0008               L132:
 492                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 494  0008 721150c9      	bres	20681,#0
 495                     ; 204 }
 498  000c 81            	ret	
 533                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 533                     ; 214 {
 534                     .text:	section	.text,new
 535  0000               _CLK_ClockSwitchCmd:
 539                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 541                     ; 218   if (NewState != DISABLE )
 543  0000 4d            	tnz	a
 544  0001 2705          	jreq	L352
 545                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 547  0003 721250c5      	bset	20677,#1
 550  0007 81            	ret	
 551  0008               L352:
 552                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 554  0008 721350c5      	bres	20677,#1
 555                     ; 228 }
 558  000c 81            	ret	
 594                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 594                     ; 239 {
 595                     .text:	section	.text,new
 596  0000               _CLK_SlowActiveHaltWakeUpCmd:
 600                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 602                     ; 243   if (NewState != DISABLE)
 604  0000 4d            	tnz	a
 605  0001 2705          	jreq	L572
 606                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 608  0003 721a50c0      	bset	20672,#5
 611  0007 81            	ret	
 612  0008               L572:
 613                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 615  0008 721b50c0      	bres	20672,#5
 616                     ; 253 }
 619  000c 81            	ret	
 778                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 778                     ; 264 {
 779                     .text:	section	.text,new
 780  0000               _CLK_PeripheralClockConfig:
 782  0000 89            	pushw	x
 783       00000000      OFST:	set	0
 786                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 788                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 790                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 792  0001 9e            	ld	a,xh
 793  0002 a510          	bcp	a,#16
 794  0004 2630          	jrne	L363
 795                     ; 271     if (NewState != DISABLE)
 797  0006 7b02          	ld	a,(OFST+2,sp)
 798  0008 2714          	jreq	L563
 799                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 801  000a 7b01          	ld	a,(OFST+1,sp)
 802  000c a40f          	and	a,#15
 803  000e 5f            	clrw	x
 804  000f 97            	ld	xl,a
 805  0010 a601          	ld	a,#1
 806  0012 5d            	tnzw	x
 807  0013 2704          	jreq	L62
 808  0015               L03:
 809  0015 48            	sll	a
 810  0016 5a            	decw	x
 811  0017 26fc          	jrne	L03
 812  0019               L62:
 813  0019 ca50c7        	or	a,20679
 815  001c 2013          	jp	LC002
 816  001e               L563:
 817                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 819  001e 7b01          	ld	a,(OFST+1,sp)
 820  0020 a40f          	and	a,#15
 821  0022 5f            	clrw	x
 822  0023 97            	ld	xl,a
 823  0024 a601          	ld	a,#1
 824  0026 5d            	tnzw	x
 825  0027 2704          	jreq	L23
 826  0029               L43:
 827  0029 48            	sll	a
 828  002a 5a            	decw	x
 829  002b 26fc          	jrne	L43
 830  002d               L23:
 831  002d 43            	cpl	a
 832  002e c450c7        	and	a,20679
 833  0031               LC002:
 834  0031 c750c7        	ld	20679,a
 835  0034 202e          	jra	L173
 836  0036               L363:
 837                     ; 284     if (NewState != DISABLE)
 839  0036 7b02          	ld	a,(OFST+2,sp)
 840  0038 2714          	jreq	L373
 841                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 843  003a 7b01          	ld	a,(OFST+1,sp)
 844  003c a40f          	and	a,#15
 845  003e 5f            	clrw	x
 846  003f 97            	ld	xl,a
 847  0040 a601          	ld	a,#1
 848  0042 5d            	tnzw	x
 849  0043 2704          	jreq	L63
 850  0045               L04:
 851  0045 48            	sll	a
 852  0046 5a            	decw	x
 853  0047 26fc          	jrne	L04
 854  0049               L63:
 855  0049 ca50ca        	or	a,20682
 857  004c 2013          	jp	LC001
 858  004e               L373:
 859                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 861  004e 7b01          	ld	a,(OFST+1,sp)
 862  0050 a40f          	and	a,#15
 863  0052 5f            	clrw	x
 864  0053 97            	ld	xl,a
 865  0054 a601          	ld	a,#1
 866  0056 5d            	tnzw	x
 867  0057 2704          	jreq	L24
 868  0059               L44:
 869  0059 48            	sll	a
 870  005a 5a            	decw	x
 871  005b 26fc          	jrne	L44
 872  005d               L24:
 873  005d 43            	cpl	a
 874  005e c450ca        	and	a,20682
 875  0061               LC001:
 876  0061 c750ca        	ld	20682,a
 877  0064               L173:
 878                     ; 295 }
 881  0064 85            	popw	x
 882  0065 81            	ret	
1070                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1070                     ; 310 {
1071                     .text:	section	.text,new
1072  0000               _CLK_ClockSwitchConfig:
1074  0000 89            	pushw	x
1075  0001 5204          	subw	sp,#4
1076       00000004      OFST:	set	4
1079                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1081  0003 aeffff        	ldw	x,#65535
1082  0006 1f03          	ldw	(OFST-1,sp),x
1084                     ; 313   ErrorStatus Swif = ERROR;
1086                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1088                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1090                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1092                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1094                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1096  0008 c650c3        	ld	a,20675
1097  000b 6b01          	ld	(OFST-3,sp),a
1099                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1101  000d 7b05          	ld	a,(OFST+1,sp)
1102  000f 4a            	dec	a
1103  0010 263d          	jrne	L705
1104                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1106  0012 721250c5      	bset	20677,#1
1107                     ; 331     if (ITState != DISABLE)
1109  0016 7b09          	ld	a,(OFST+5,sp)
1110  0018 2706          	jreq	L115
1111                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1113  001a 721450c5      	bset	20677,#2
1115  001e 2004          	jra	L315
1116  0020               L115:
1117                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1119  0020 721550c5      	bres	20677,#2
1120  0024               L315:
1121                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1123  0024 7b06          	ld	a,(OFST+2,sp)
1124  0026 c750c4        	ld	20676,a
1126  0029 2003          	jra	L125
1127  002b               L515:
1128                     ; 346       DownCounter--;
1130  002b 5a            	decw	x
1131  002c 1f03          	ldw	(OFST-1,sp),x
1133  002e               L125:
1134                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1136  002e 720150c504    	btjf	20677,#0,L525
1138  0033 1e03          	ldw	x,(OFST-1,sp)
1139  0035 26f4          	jrne	L515
1140  0037               L525:
1141                     ; 349     if(DownCounter != 0)
1143  0037 1e03          	ldw	x,(OFST-1,sp)
1144                     ; 351       Swif = SUCCESS;
1146  0039 263d          	jrne	LC004
1147  003b               L725:
1148                     ; 355       Swif = ERROR;
1151  003b 0f02          	clr	(OFST-2,sp)
1153  003d               L335:
1154                     ; 390   if(Swif != ERROR)
1156  003d 275d          	jreq	L755
1157                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1159  003f 7b0a          	ld	a,(OFST+6,sp)
1160  0041 263b          	jrne	L165
1162  0043 7b01          	ld	a,(OFST-3,sp)
1163  0045 a1e1          	cp	a,#225
1164  0047 2635          	jrne	L165
1165                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1167  0049 721150c0      	bres	20672,#0
1169  004d 204d          	jra	L755
1170  004f               L705:
1171                     ; 361     if (ITState != DISABLE)
1173  004f 7b09          	ld	a,(OFST+5,sp)
1174  0051 2706          	jreq	L535
1175                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1177  0053 721450c5      	bset	20677,#2
1179  0057 2004          	jra	L735
1180  0059               L535:
1181                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1183  0059 721550c5      	bres	20677,#2
1184  005d               L735:
1185                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1187  005d 7b06          	ld	a,(OFST+2,sp)
1188  005f c750c4        	ld	20676,a
1190  0062 2003          	jra	L545
1191  0064               L145:
1192                     ; 376       DownCounter--;
1194  0064 5a            	decw	x
1195  0065 1f03          	ldw	(OFST-1,sp),x
1197  0067               L545:
1198                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1200  0067 720750c504    	btjf	20677,#3,L155
1202  006c 1e03          	ldw	x,(OFST-1,sp)
1203  006e 26f4          	jrne	L145
1204  0070               L155:
1205                     ; 379     if(DownCounter != 0)
1207  0070 1e03          	ldw	x,(OFST-1,sp)
1208  0072 27c7          	jreq	L725
1209                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1211  0074 721250c5      	bset	20677,#1
1212                     ; 383       Swif = SUCCESS;
1214  0078               LC004:
1216  0078 a601          	ld	a,#1
1217  007a 6b02          	ld	(OFST-2,sp),a
1220  007c 20bf          	jra	L335
1221                     ; 387       Swif = ERROR;
1222  007e               L165:
1223                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1225  007e 7b0a          	ld	a,(OFST+6,sp)
1226  0080 260c          	jrne	L565
1228  0082 7b01          	ld	a,(OFST-3,sp)
1229  0084 a1d2          	cp	a,#210
1230  0086 2606          	jrne	L565
1231                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1233  0088 721750c0      	bres	20672,#3
1235  008c 200e          	jra	L755
1236  008e               L565:
1237                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1239  008e 7b0a          	ld	a,(OFST+6,sp)
1240  0090 260a          	jrne	L755
1242  0092 7b01          	ld	a,(OFST-3,sp)
1243  0094 a1b4          	cp	a,#180
1244  0096 2604          	jrne	L755
1245                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1247  0098 721150c1      	bres	20673,#0
1248  009c               L755:
1249                     ; 406   return(Swif);
1251  009c 7b02          	ld	a,(OFST-2,sp)
1254  009e 5b06          	addw	sp,#6
1255  00a0 81            	ret	
1393                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1393                     ; 416 {
1394                     .text:	section	.text,new
1395  0000               _CLK_HSIPrescalerConfig:
1397  0000 88            	push	a
1398       00000000      OFST:	set	0
1401                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1403                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1405  0001 c650c6        	ld	a,20678
1406  0004 a4e7          	and	a,#231
1407  0006 c750c6        	ld	20678,a
1408                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1410  0009 c650c6        	ld	a,20678
1411  000c 1a01          	or	a,(OFST+1,sp)
1412  000e c750c6        	ld	20678,a
1413                     ; 425 }
1416  0011 84            	pop	a
1417  0012 81            	ret	
1552                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1552                     ; 437 {
1553                     .text:	section	.text,new
1554  0000               _CLK_CCOConfig:
1556  0000 88            	push	a
1557       00000000      OFST:	set	0
1560                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1562                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1564  0001 c650c9        	ld	a,20681
1565  0004 a4e1          	and	a,#225
1566  0006 c750c9        	ld	20681,a
1567                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1569  0009 c650c9        	ld	a,20681
1570  000c 1a01          	or	a,(OFST+1,sp)
1571  000e c750c9        	ld	20681,a
1572                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1574  0011 721050c9      	bset	20681,#0
1575                     ; 449 }
1578  0015 84            	pop	a
1579  0016 81            	ret	
1644                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1644                     ; 460 {
1645                     .text:	section	.text,new
1646  0000               _CLK_ITConfig:
1648  0000 89            	pushw	x
1649       00000000      OFST:	set	0
1652                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1654                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1656                     ; 465   if (NewState != DISABLE)
1658  0001 9f            	ld	a,xl
1659  0002 4d            	tnz	a
1660  0003 2715          	jreq	L767
1661                     ; 467     switch (CLK_IT)
1663  0005 9e            	ld	a,xh
1665                     ; 475     default:
1665                     ; 476       break;
1666  0006 a00c          	sub	a,#12
1667  0008 270a          	jreq	L327
1668  000a a010          	sub	a,#16
1669  000c 2620          	jrne	L577
1670                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1670                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1672  000e 721450c5      	bset	20677,#2
1673                     ; 471       break;
1675  0012 201a          	jra	L577
1676  0014               L327:
1677                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1677                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1679  0014 721450c8      	bset	20680,#2
1680                     ; 474       break;
1682  0018 2014          	jra	L577
1683                     ; 475     default:
1683                     ; 476       break;
1686  001a               L767:
1687                     ; 481     switch (CLK_IT)
1689  001a 7b01          	ld	a,(OFST+1,sp)
1691                     ; 489     default:
1691                     ; 490       break;
1692  001c a00c          	sub	a,#12
1693  001e 270a          	jreq	L137
1694  0020 a010          	sub	a,#16
1695  0022 260a          	jrne	L577
1696                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1696                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1698  0024 721550c5      	bres	20677,#2
1699                     ; 485       break;
1701  0028 2004          	jra	L577
1702  002a               L137:
1703                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1703                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1705  002a 721550c8      	bres	20680,#2
1706                     ; 488       break;
1707  002e               L577:
1708                     ; 493 }
1711  002e 85            	popw	x
1712  002f 81            	ret	
1713                     ; 489     default:
1713                     ; 490       break;
1749                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1749                     ; 501 {
1750                     .text:	section	.text,new
1751  0000               _CLK_SYSCLKConfig:
1753  0000 88            	push	a
1754       00000000      OFST:	set	0
1757                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1759                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1761  0001 a580          	bcp	a,#128
1762  0003 260e          	jrne	L1201
1763                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1765  0005 c650c6        	ld	a,20678
1766  0008 a4e7          	and	a,#231
1767  000a c750c6        	ld	20678,a
1768                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1770  000d 7b01          	ld	a,(OFST+1,sp)
1771  000f a418          	and	a,#24
1773  0011 200c          	jra	L3201
1774  0013               L1201:
1775                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1777  0013 c650c6        	ld	a,20678
1778  0016 a4f8          	and	a,#248
1779  0018 c750c6        	ld	20678,a
1780                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1782  001b 7b01          	ld	a,(OFST+1,sp)
1783  001d a407          	and	a,#7
1784  001f               L3201:
1785  001f ca50c6        	or	a,20678
1786  0022 c750c6        	ld	20678,a
1787                     ; 515 }
1790  0025 84            	pop	a
1791  0026 81            	ret	
1847                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1847                     ; 524 {
1848                     .text:	section	.text,new
1849  0000               _CLK_SWIMConfig:
1853                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1855                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1857  0000 4d            	tnz	a
1858  0001 2705          	jreq	L3501
1859                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1861  0003 721050cd      	bset	20685,#0
1864  0007 81            	ret	
1865  0008               L3501:
1866                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1868  0008 721150cd      	bres	20685,#0
1869                     ; 538 }
1872  000c 81            	ret	
1896                     ; 547 void CLK_ClockSecuritySystemEnable(void)
1896                     ; 548 {
1897                     .text:	section	.text,new
1898  0000               _CLK_ClockSecuritySystemEnable:
1902                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
1904  0000 721050c8      	bset	20680,#0
1905                     ; 551 }
1908  0004 81            	ret	
1933                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1933                     ; 560 {
1934                     .text:	section	.text,new
1935  0000               _CLK_GetSYSCLKSource:
1939                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
1941  0000 c650c3        	ld	a,20675
1944  0003 81            	ret	
2007                     ; 569 uint32_t CLK_GetClockFreq(void)
2007                     ; 570 {
2008                     .text:	section	.text,new
2009  0000               _CLK_GetClockFreq:
2011  0000 5209          	subw	sp,#9
2012       00000009      OFST:	set	9
2015                     ; 571   uint32_t clockfrequency = 0;
2017                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
2019                     ; 573   uint8_t tmp = 0, presc = 0;
2023                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
2025  0002 c650c3        	ld	a,20675
2026  0005 6b09          	ld	(OFST+0,sp),a
2028                     ; 578   if (clocksource == CLK_SOURCE_HSI)
2030  0007 a1e1          	cp	a,#225
2031  0009 2634          	jrne	L1311
2032                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
2034  000b c650c6        	ld	a,20678
2035  000e a418          	and	a,#24
2036  0010 44            	srl	a
2037  0011 44            	srl	a
2038  0012 44            	srl	a
2040                     ; 581     tmp = (uint8_t)(tmp >> 3);
2043                     ; 582     presc = HSIDivFactor[tmp];
2045  0013 5f            	clrw	x
2046  0014 97            	ld	xl,a
2047  0015 d60000        	ld	a,(_HSIDivFactor,x)
2048  0018 6b09          	ld	(OFST+0,sp),a
2050                     ; 583     clockfrequency = HSI_VALUE / presc;
2052  001a b703          	ld	c_lreg+3,a
2053  001c 3f02          	clr	c_lreg+2
2054  001e 3f01          	clr	c_lreg+1
2055  0020 3f00          	clr	c_lreg
2056  0022 96            	ldw	x,sp
2057  0023 5c            	incw	x
2058  0024 cd0000        	call	c_rtol
2061  0027 ae2400        	ldw	x,#9216
2062  002a bf02          	ldw	c_lreg+2,x
2063  002c ae00f4        	ldw	x,#244
2064  002f bf00          	ldw	c_lreg,x
2065  0031 96            	ldw	x,sp
2066  0032 5c            	incw	x
2067  0033 cd0000        	call	c_ludv
2069  0036 96            	ldw	x,sp
2070  0037 1c0005        	addw	x,#OFST-4
2071  003a cd0000        	call	c_rtol
2075  003d 2018          	jra	L3311
2076  003f               L1311:
2077                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2079  003f a1d2          	cp	a,#210
2080  0041 260a          	jrne	L5311
2081                     ; 587     clockfrequency = LSI_VALUE;
2083  0043 aef400        	ldw	x,#62464
2084  0046 1f07          	ldw	(OFST-2,sp),x
2085  0048 ae0001        	ldw	x,#1
2087  004b 2008          	jp	LC005
2088  004d               L5311:
2089                     ; 591     clockfrequency = HSE_VALUE;
2091  004d ae2400        	ldw	x,#9216
2092  0050 1f07          	ldw	(OFST-2,sp),x
2093  0052 ae00f4        	ldw	x,#244
2094  0055               LC005:
2095  0055 1f05          	ldw	(OFST-4,sp),x
2097  0057               L3311:
2098                     ; 594   return((uint32_t)clockfrequency);
2100  0057 96            	ldw	x,sp
2101  0058 1c0005        	addw	x,#OFST-4
2102  005b cd0000        	call	c_ltor
2106  005e 5b09          	addw	sp,#9
2107  0060 81            	ret	
2206                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2206                     ; 605 {
2207                     .text:	section	.text,new
2208  0000               _CLK_AdjustHSICalibrationValue:
2210  0000 88            	push	a
2211       00000000      OFST:	set	0
2214                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2216                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2218  0001 c650cc        	ld	a,20684
2219  0004 a4f8          	and	a,#248
2220  0006 1a01          	or	a,(OFST+1,sp)
2221  0008 c750cc        	ld	20684,a
2222                     ; 611 }
2225  000b 84            	pop	a
2226  000c 81            	ret	
2250                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2250                     ; 623 {
2251                     .text:	section	.text,new
2252  0000               _CLK_SYSCLKEmergencyClear:
2256                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2258  0000 721150c5      	bres	20677,#0
2259                     ; 625 }
2262  0004 81            	ret	
2415                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2415                     ; 635 {
2416                     .text:	section	.text,new
2417  0000               _CLK_GetFlagStatus:
2419  0000 89            	pushw	x
2420  0001 5203          	subw	sp,#3
2421       00000003      OFST:	set	3
2424                     ; 636   uint16_t statusreg = 0;
2426                     ; 637   uint8_t tmpreg = 0;
2428                     ; 638   FlagStatus bitstatus = RESET;
2430                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2432                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2434  0003 01            	rrwa	x,a
2435  0004 4f            	clr	a
2436  0005 02            	rlwa	x,a
2437  0006 1f01          	ldw	(OFST-2,sp),x
2439                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2441  0008 a30100        	cpw	x,#256
2442  000b 2605          	jrne	L3031
2443                     ; 649     tmpreg = CLK->ICKR;
2445  000d c650c0        	ld	a,20672
2447  0010 2021          	jra	L5031
2448  0012               L3031:
2449                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2451  0012 a30200        	cpw	x,#512
2452  0015 2605          	jrne	L7031
2453                     ; 653     tmpreg = CLK->ECKR;
2455  0017 c650c1        	ld	a,20673
2457  001a 2017          	jra	L5031
2458  001c               L7031:
2459                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2461  001c a30300        	cpw	x,#768
2462  001f 2605          	jrne	L3131
2463                     ; 657     tmpreg = CLK->SWCR;
2465  0021 c650c5        	ld	a,20677
2467  0024 200d          	jra	L5031
2468  0026               L3131:
2469                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2471  0026 a30400        	cpw	x,#1024
2472  0029 2605          	jrne	L7131
2473                     ; 661     tmpreg = CLK->CSSR;
2475  002b c650c8        	ld	a,20680
2477  002e 2003          	jra	L5031
2478  0030               L7131:
2479                     ; 665     tmpreg = CLK->CCOR;
2481  0030 c650c9        	ld	a,20681
2482  0033               L5031:
2483  0033 6b03          	ld	(OFST+0,sp),a
2485                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2487  0035 7b05          	ld	a,(OFST+2,sp)
2488  0037 1503          	bcp	a,(OFST+0,sp)
2489  0039 2704          	jreq	L3231
2490                     ; 670     bitstatus = SET;
2492  003b a601          	ld	a,#1
2495  003d 2001          	jra	L5231
2496  003f               L3231:
2497                     ; 674     bitstatus = RESET;
2499  003f 4f            	clr	a
2501  0040               L5231:
2502                     ; 678   return((FlagStatus)bitstatus);
2506  0040 5b05          	addw	sp,#5
2507  0042 81            	ret	
2553                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2553                     ; 688 {
2554                     .text:	section	.text,new
2555  0000               _CLK_GetITStatus:
2557  0000 88            	push	a
2558  0001 88            	push	a
2559       00000001      OFST:	set	1
2562                     ; 689   ITStatus bitstatus = RESET;
2564                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2566                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2568  0002 a11c          	cp	a,#28
2569  0004 2609          	jrne	L1531
2570                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2572  0006 c450c5        	and	a,20677
2573  0009 a10c          	cp	a,#12
2574  000b 260f          	jrne	L1631
2575                     ; 699       bitstatus = SET;
2577  000d 2009          	jp	LC007
2578                     ; 703       bitstatus = RESET;
2579  000f               L1531:
2580                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2582  000f c650c8        	ld	a,20680
2583  0012 1402          	and	a,(OFST+1,sp)
2584  0014 a10c          	cp	a,#12
2585  0016 2604          	jrne	L1631
2586                     ; 711       bitstatus = SET;
2588  0018               LC007:
2590  0018 a601          	ld	a,#1
2593  001a 2001          	jra	L7531
2594  001c               L1631:
2595                     ; 715       bitstatus = RESET;
2598  001c 4f            	clr	a
2600  001d               L7531:
2601                     ; 720   return bitstatus;
2605  001d 85            	popw	x
2606  001e 81            	ret	
2642                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2642                     ; 730 {
2643                     .text:	section	.text,new
2644  0000               _CLK_ClearITPendingBit:
2648                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2650                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2652  0000 a10c          	cp	a,#12
2653  0002 2605          	jrne	L3041
2654                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2656  0004 721750c8      	bres	20680,#3
2659  0008 81            	ret	
2660  0009               L3041:
2661                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2663  0009 721750c5      	bres	20677,#3
2664                     ; 745 }
2667  000d 81            	ret	
2702                     	xdef	_CLKPrescTable
2703                     	xdef	_HSIDivFactor
2704                     	xdef	_CLK_ClearITPendingBit
2705                     	xdef	_CLK_GetITStatus
2706                     	xdef	_CLK_GetFlagStatus
2707                     	xdef	_CLK_GetSYSCLKSource
2708                     	xdef	_CLK_GetClockFreq
2709                     	xdef	_CLK_AdjustHSICalibrationValue
2710                     	xdef	_CLK_SYSCLKEmergencyClear
2711                     	xdef	_CLK_ClockSecuritySystemEnable
2712                     	xdef	_CLK_SWIMConfig
2713                     	xdef	_CLK_SYSCLKConfig
2714                     	xdef	_CLK_ITConfig
2715                     	xdef	_CLK_CCOConfig
2716                     	xdef	_CLK_HSIPrescalerConfig
2717                     	xdef	_CLK_ClockSwitchConfig
2718                     	xdef	_CLK_PeripheralClockConfig
2719                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2720                     	xdef	_CLK_FastHaltWakeUpCmd
2721                     	xdef	_CLK_ClockSwitchCmd
2722                     	xdef	_CLK_CCOCmd
2723                     	xdef	_CLK_LSICmd
2724                     	xdef	_CLK_HSICmd
2725                     	xdef	_CLK_HSECmd
2726                     	xdef	_CLK_DeInit
2727                     	xref.b	c_lreg
2728                     	xref.b	c_x
2747                     	xref	c_ltor
2748                     	xref	c_ludv
2749                     	xref	c_rtol
2750                     	end

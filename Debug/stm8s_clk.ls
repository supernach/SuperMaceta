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
  72                     .const:	section	.text
  73  0000               _HSIDivFactor:
  74  0000 01            	dc.b	1
  75  0001 02            	dc.b	2
  76  0002 04            	dc.b	4
  77  0003 08            	dc.b	8
  78  0004               _CLKPrescTable:
  79  0004 01            	dc.b	1
  80  0005 02            	dc.b	2
  81  0006 04            	dc.b	4
  82  0007 08            	dc.b	8
  83  0008 0a            	dc.b	10
  84  0009 10            	dc.b	16
  85  000a 14            	dc.b	20
  86  000b 28            	dc.b	40
 115                     ; 72 void CLK_DeInit(void)
 115                     ; 73 {
 117                     .text:	section	.text,new
 118  0000               _CLK_DeInit:
 122                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
 124  0000 350150c0      	mov	20672,#1
 125                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
 127  0004 725f50c1      	clr	20673
 128                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
 130  0008 35e150c4      	mov	20676,#225
 131                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
 133  000c 725f50c5      	clr	20677
 134                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
 136  0010 351850c6      	mov	20678,#24
 137                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
 139  0014 35ff50c7      	mov	20679,#255
 140                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
 142  0018 35ff50ca      	mov	20682,#255
 143                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
 145  001c 725f50c8      	clr	20680
 146                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 148  0020 725f50c9      	clr	20681
 150  0024               L16:
 151                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
 153  0024 720050c9fb    	btjt	20681,#0,L16
 154                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 156  0029 725f50c9      	clr	20681
 157                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 159  002d 725f50cc      	clr	20684
 160                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 162  0031 725f50cd      	clr	20685
 163                     ; 88 }
 166  0035 81            	ret	
 222                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 222                     ; 100 {
 223                     .text:	section	.text,new
 224  0000               _CLK_FastHaltWakeUpCmd:
 228                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 230                     ; 104   if (NewState != DISABLE)
 232  0000 4d            	tnz	a
 233  0001 2705          	jreq	L311
 234                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 236  0003 721450c0      	bset	20672,#2
 239  0007 81            	ret	
 240  0008               L311:
 241                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 243  0008 721550c0      	bres	20672,#2
 244                     ; 114 }
 247  000c 81            	ret	
 282                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 282                     ; 122 {
 283                     .text:	section	.text,new
 284  0000               _CLK_HSECmd:
 288                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 290                     ; 126   if (NewState != DISABLE)
 292  0000 4d            	tnz	a
 293  0001 2705          	jreq	L531
 294                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 296  0003 721050c1      	bset	20673,#0
 299  0007 81            	ret	
 300  0008               L531:
 301                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 303  0008 721150c1      	bres	20673,#0
 304                     ; 136 }
 307  000c 81            	ret	
 342                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 342                     ; 144 {
 343                     .text:	section	.text,new
 344  0000               _CLK_HSICmd:
 348                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 350                     ; 148   if (NewState != DISABLE)
 352  0000 4d            	tnz	a
 353  0001 2705          	jreq	L751
 354                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 356  0003 721050c0      	bset	20672,#0
 359  0007 81            	ret	
 360  0008               L751:
 361                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 363  0008 721150c0      	bres	20672,#0
 364                     ; 158 }
 367  000c 81            	ret	
 402                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 402                     ; 167 {
 403                     .text:	section	.text,new
 404  0000               _CLK_LSICmd:
 408                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 410                     ; 171   if (NewState != DISABLE)
 412  0000 4d            	tnz	a
 413  0001 2705          	jreq	L102
 414                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 416  0003 721650c0      	bset	20672,#3
 419  0007 81            	ret	
 420  0008               L102:
 421                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 423  0008 721750c0      	bres	20672,#3
 424                     ; 181 }
 427  000c 81            	ret	
 462                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 462                     ; 190 {
 463                     .text:	section	.text,new
 464  0000               _CLK_CCOCmd:
 468                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 470                     ; 194   if (NewState != DISABLE)
 472  0000 4d            	tnz	a
 473  0001 2705          	jreq	L322
 474                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 476  0003 721050c9      	bset	20681,#0
 479  0007 81            	ret	
 480  0008               L322:
 481                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 483  0008 721150c9      	bres	20681,#0
 484                     ; 204 }
 487  000c 81            	ret	
 522                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 522                     ; 214 {
 523                     .text:	section	.text,new
 524  0000               _CLK_ClockSwitchCmd:
 528                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 530                     ; 218   if (NewState != DISABLE )
 532  0000 4d            	tnz	a
 533  0001 2705          	jreq	L542
 534                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 536  0003 721250c5      	bset	20677,#1
 539  0007 81            	ret	
 540  0008               L542:
 541                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 543  0008 721350c5      	bres	20677,#1
 544                     ; 228 }
 547  000c 81            	ret	
 583                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 583                     ; 239 {
 584                     .text:	section	.text,new
 585  0000               _CLK_SlowActiveHaltWakeUpCmd:
 589                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 591                     ; 243   if (NewState != DISABLE)
 593  0000 4d            	tnz	a
 594  0001 2705          	jreq	L762
 595                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 597  0003 721a50c0      	bset	20672,#5
 600  0007 81            	ret	
 601  0008               L762:
 602                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 604  0008 721b50c0      	bres	20672,#5
 605                     ; 253 }
 608  000c 81            	ret	
 767                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 767                     ; 264 {
 768                     .text:	section	.text,new
 769  0000               _CLK_PeripheralClockConfig:
 771  0000 89            	pushw	x
 772       00000000      OFST:	set	0
 775                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 777                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 779                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 781  0001 9e            	ld	a,xh
 782  0002 a510          	bcp	a,#16
 783  0004 2630          	jrne	L553
 784                     ; 271     if (NewState != DISABLE)
 786  0006 7b02          	ld	a,(OFST+2,sp)
 787  0008 2714          	jreq	L753
 788                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 790  000a 7b01          	ld	a,(OFST+1,sp)
 791  000c a40f          	and	a,#15
 792  000e 5f            	clrw	x
 793  000f 97            	ld	xl,a
 794  0010 a601          	ld	a,#1
 795  0012 5d            	tnzw	x
 796  0013 2704          	jreq	L62
 797  0015               L03:
 798  0015 48            	sll	a
 799  0016 5a            	decw	x
 800  0017 26fc          	jrne	L03
 801  0019               L62:
 802  0019 ca50c7        	or	a,20679
 804  001c 2013          	jp	LC002
 805  001e               L753:
 806                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 808  001e 7b01          	ld	a,(OFST+1,sp)
 809  0020 a40f          	and	a,#15
 810  0022 5f            	clrw	x
 811  0023 97            	ld	xl,a
 812  0024 a601          	ld	a,#1
 813  0026 5d            	tnzw	x
 814  0027 2704          	jreq	L23
 815  0029               L43:
 816  0029 48            	sll	a
 817  002a 5a            	decw	x
 818  002b 26fc          	jrne	L43
 819  002d               L23:
 820  002d 43            	cpl	a
 821  002e c450c7        	and	a,20679
 822  0031               LC002:
 823  0031 c750c7        	ld	20679,a
 824  0034 202e          	jra	L363
 825  0036               L553:
 826                     ; 284     if (NewState != DISABLE)
 828  0036 7b02          	ld	a,(OFST+2,sp)
 829  0038 2714          	jreq	L563
 830                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 832  003a 7b01          	ld	a,(OFST+1,sp)
 833  003c a40f          	and	a,#15
 834  003e 5f            	clrw	x
 835  003f 97            	ld	xl,a
 836  0040 a601          	ld	a,#1
 837  0042 5d            	tnzw	x
 838  0043 2704          	jreq	L63
 839  0045               L04:
 840  0045 48            	sll	a
 841  0046 5a            	decw	x
 842  0047 26fc          	jrne	L04
 843  0049               L63:
 844  0049 ca50ca        	or	a,20682
 846  004c 2013          	jp	LC001
 847  004e               L563:
 848                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 850  004e 7b01          	ld	a,(OFST+1,sp)
 851  0050 a40f          	and	a,#15
 852  0052 5f            	clrw	x
 853  0053 97            	ld	xl,a
 854  0054 a601          	ld	a,#1
 855  0056 5d            	tnzw	x
 856  0057 2704          	jreq	L24
 857  0059               L44:
 858  0059 48            	sll	a
 859  005a 5a            	decw	x
 860  005b 26fc          	jrne	L44
 861  005d               L24:
 862  005d 43            	cpl	a
 863  005e c450ca        	and	a,20682
 864  0061               LC001:
 865  0061 c750ca        	ld	20682,a
 866  0064               L363:
 867                     ; 295 }
 870  0064 85            	popw	x
 871  0065 81            	ret	
1059                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1059                     ; 310 {
1060                     .text:	section	.text,new
1061  0000               _CLK_ClockSwitchConfig:
1063  0000 89            	pushw	x
1064  0001 5204          	subw	sp,#4
1065       00000004      OFST:	set	4
1068                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1070  0003 aeffff        	ldw	x,#65535
1071  0006 1f03          	ldw	(OFST-1,sp),x
1073                     ; 313   ErrorStatus Swif = ERROR;
1075                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1077                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1079                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1081                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1083                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1085  0008 c650c3        	ld	a,20675
1086  000b 6b01          	ld	(OFST-3,sp),a
1088                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1090  000d 7b05          	ld	a,(OFST+1,sp)
1091  000f 4a            	dec	a
1092  0010 263d          	jrne	L105
1093                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1095  0012 721250c5      	bset	20677,#1
1096                     ; 331     if (ITState != DISABLE)
1098  0016 7b09          	ld	a,(OFST+5,sp)
1099  0018 2706          	jreq	L305
1100                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1102  001a 721450c5      	bset	20677,#2
1104  001e 2004          	jra	L505
1105  0020               L305:
1106                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1108  0020 721550c5      	bres	20677,#2
1109  0024               L505:
1110                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1112  0024 7b06          	ld	a,(OFST+2,sp)
1113  0026 c750c4        	ld	20676,a
1115  0029 2003          	jra	L315
1116  002b               L705:
1117                     ; 346       DownCounter--;
1119  002b 5a            	decw	x
1120  002c 1f03          	ldw	(OFST-1,sp),x
1122  002e               L315:
1123                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1125  002e 720150c504    	btjf	20677,#0,L715
1127  0033 1e03          	ldw	x,(OFST-1,sp)
1128  0035 26f4          	jrne	L705
1129  0037               L715:
1130                     ; 349     if(DownCounter != 0)
1132  0037 1e03          	ldw	x,(OFST-1,sp)
1133                     ; 351       Swif = SUCCESS;
1135  0039 263d          	jrne	LC004
1136  003b               L125:
1137                     ; 355       Swif = ERROR;
1140  003b 0f02          	clr	(OFST-2,sp)
1142  003d               L525:
1143                     ; 390   if(Swif != ERROR)
1145  003d 275d          	jreq	L155
1146                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1148  003f 7b0a          	ld	a,(OFST+6,sp)
1149  0041 263b          	jrne	L355
1151  0043 7b01          	ld	a,(OFST-3,sp)
1152  0045 a1e1          	cp	a,#225
1153  0047 2635          	jrne	L355
1154                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1156  0049 721150c0      	bres	20672,#0
1158  004d 204d          	jra	L155
1159  004f               L105:
1160                     ; 361     if (ITState != DISABLE)
1162  004f 7b09          	ld	a,(OFST+5,sp)
1163  0051 2706          	jreq	L725
1164                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1166  0053 721450c5      	bset	20677,#2
1168  0057 2004          	jra	L135
1169  0059               L725:
1170                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1172  0059 721550c5      	bres	20677,#2
1173  005d               L135:
1174                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1176  005d 7b06          	ld	a,(OFST+2,sp)
1177  005f c750c4        	ld	20676,a
1179  0062 2003          	jra	L735
1180  0064               L335:
1181                     ; 376       DownCounter--;
1183  0064 5a            	decw	x
1184  0065 1f03          	ldw	(OFST-1,sp),x
1186  0067               L735:
1187                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1189  0067 720750c504    	btjf	20677,#3,L345
1191  006c 1e03          	ldw	x,(OFST-1,sp)
1192  006e 26f4          	jrne	L335
1193  0070               L345:
1194                     ; 379     if(DownCounter != 0)
1196  0070 1e03          	ldw	x,(OFST-1,sp)
1197  0072 27c7          	jreq	L125
1198                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1200  0074 721250c5      	bset	20677,#1
1201                     ; 383       Swif = SUCCESS;
1203  0078               LC004:
1205  0078 a601          	ld	a,#1
1206  007a 6b02          	ld	(OFST-2,sp),a
1209  007c 20bf          	jra	L525
1210                     ; 387       Swif = ERROR;
1211  007e               L355:
1212                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1214  007e 7b0a          	ld	a,(OFST+6,sp)
1215  0080 260c          	jrne	L755
1217  0082 7b01          	ld	a,(OFST-3,sp)
1218  0084 a1d2          	cp	a,#210
1219  0086 2606          	jrne	L755
1220                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1222  0088 721750c0      	bres	20672,#3
1224  008c 200e          	jra	L155
1225  008e               L755:
1226                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1228  008e 7b0a          	ld	a,(OFST+6,sp)
1229  0090 260a          	jrne	L155
1231  0092 7b01          	ld	a,(OFST-3,sp)
1232  0094 a1b4          	cp	a,#180
1233  0096 2604          	jrne	L155
1234                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1236  0098 721150c1      	bres	20673,#0
1237  009c               L155:
1238                     ; 406   return(Swif);
1240  009c 7b02          	ld	a,(OFST-2,sp)
1243  009e 5b06          	addw	sp,#6
1244  00a0 81            	ret	
1382                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1382                     ; 416 {
1383                     .text:	section	.text,new
1384  0000               _CLK_HSIPrescalerConfig:
1386  0000 88            	push	a
1387       00000000      OFST:	set	0
1390                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1392                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1394  0001 c650c6        	ld	a,20678
1395  0004 a4e7          	and	a,#231
1396  0006 c750c6        	ld	20678,a
1397                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1399  0009 c650c6        	ld	a,20678
1400  000c 1a01          	or	a,(OFST+1,sp)
1401  000e c750c6        	ld	20678,a
1402                     ; 425 }
1405  0011 84            	pop	a
1406  0012 81            	ret	
1541                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1541                     ; 437 {
1542                     .text:	section	.text,new
1543  0000               _CLK_CCOConfig:
1545  0000 88            	push	a
1546       00000000      OFST:	set	0
1549                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1551                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1553  0001 c650c9        	ld	a,20681
1554  0004 a4e1          	and	a,#225
1555  0006 c750c9        	ld	20681,a
1556                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1558  0009 c650c9        	ld	a,20681
1559  000c 1a01          	or	a,(OFST+1,sp)
1560  000e c750c9        	ld	20681,a
1561                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1563  0011 721050c9      	bset	20681,#0
1564                     ; 449 }
1567  0015 84            	pop	a
1568  0016 81            	ret	
1633                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1633                     ; 460 {
1634                     .text:	section	.text,new
1635  0000               _CLK_ITConfig:
1637  0000 89            	pushw	x
1638       00000000      OFST:	set	0
1641                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1643                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1645                     ; 465   if (NewState != DISABLE)
1647  0001 9f            	ld	a,xl
1648  0002 4d            	tnz	a
1649  0003 2715          	jreq	L167
1650                     ; 467     switch (CLK_IT)
1652  0005 9e            	ld	a,xh
1654                     ; 475     default:
1654                     ; 476       break;
1655  0006 a00c          	sub	a,#12
1656  0008 270a          	jreq	L517
1657  000a a010          	sub	a,#16
1658  000c 2620          	jrne	L767
1659                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1659                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1661  000e 721450c5      	bset	20677,#2
1662                     ; 471       break;
1664  0012 201a          	jra	L767
1665  0014               L517:
1666                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1666                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1668  0014 721450c8      	bset	20680,#2
1669                     ; 474       break;
1671  0018 2014          	jra	L767
1672                     ; 475     default:
1672                     ; 476       break;
1675  001a               L167:
1676                     ; 481     switch (CLK_IT)
1678  001a 7b01          	ld	a,(OFST+1,sp)
1680                     ; 489     default:
1680                     ; 490       break;
1681  001c a00c          	sub	a,#12
1682  001e 270a          	jreq	L327
1683  0020 a010          	sub	a,#16
1684  0022 260a          	jrne	L767
1685                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1685                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1687  0024 721550c5      	bres	20677,#2
1688                     ; 485       break;
1690  0028 2004          	jra	L767
1691  002a               L327:
1692                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1692                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1694  002a 721550c8      	bres	20680,#2
1695                     ; 488       break;
1696  002e               L767:
1697                     ; 493 }
1700  002e 85            	popw	x
1701  002f 81            	ret	
1702                     ; 489     default:
1702                     ; 490       break;
1738                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1738                     ; 501 {
1739                     .text:	section	.text,new
1740  0000               _CLK_SYSCLKConfig:
1742  0000 88            	push	a
1743       00000000      OFST:	set	0
1746                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1748                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1750  0001 a580          	bcp	a,#128
1751  0003 260e          	jrne	L3101
1752                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1754  0005 c650c6        	ld	a,20678
1755  0008 a4e7          	and	a,#231
1756  000a c750c6        	ld	20678,a
1757                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1759  000d 7b01          	ld	a,(OFST+1,sp)
1760  000f a418          	and	a,#24
1762  0011 200c          	jra	L5101
1763  0013               L3101:
1764                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1766  0013 c650c6        	ld	a,20678
1767  0016 a4f8          	and	a,#248
1768  0018 c750c6        	ld	20678,a
1769                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1771  001b 7b01          	ld	a,(OFST+1,sp)
1772  001d a407          	and	a,#7
1773  001f               L5101:
1774  001f ca50c6        	or	a,20678
1775  0022 c750c6        	ld	20678,a
1776                     ; 515 }
1779  0025 84            	pop	a
1780  0026 81            	ret	
1836                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1836                     ; 524 {
1837                     .text:	section	.text,new
1838  0000               _CLK_SWIMConfig:
1842                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1844                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1846  0000 4d            	tnz	a
1847  0001 2705          	jreq	L5401
1848                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1850  0003 721050cd      	bset	20685,#0
1853  0007 81            	ret	
1854  0008               L5401:
1855                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1857  0008 721150cd      	bres	20685,#0
1858                     ; 538 }
1861  000c 81            	ret	
1885                     ; 547 void CLK_ClockSecuritySystemEnable(void)
1885                     ; 548 {
1886                     .text:	section	.text,new
1887  0000               _CLK_ClockSecuritySystemEnable:
1891                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
1893  0000 721050c8      	bset	20680,#0
1894                     ; 551 }
1897  0004 81            	ret	
1922                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1922                     ; 560 {
1923                     .text:	section	.text,new
1924  0000               _CLK_GetSYSCLKSource:
1928                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
1930  0000 c650c3        	ld	a,20675
1933  0003 81            	ret	
1996                     ; 569 uint32_t CLK_GetClockFreq(void)
1996                     ; 570 {
1997                     .text:	section	.text,new
1998  0000               _CLK_GetClockFreq:
2000  0000 5209          	subw	sp,#9
2001       00000009      OFST:	set	9
2004                     ; 571   uint32_t clockfrequency = 0;
2006                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
2008                     ; 573   uint8_t tmp = 0, presc = 0;
2012                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
2014  0002 c650c3        	ld	a,20675
2015  0005 6b09          	ld	(OFST+0,sp),a
2017                     ; 578   if (clocksource == CLK_SOURCE_HSI)
2019  0007 a1e1          	cp	a,#225
2020  0009 2634          	jrne	L3211
2021                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
2023  000b c650c6        	ld	a,20678
2024  000e a418          	and	a,#24
2025  0010 44            	srl	a
2026  0011 44            	srl	a
2027  0012 44            	srl	a
2029                     ; 581     tmp = (uint8_t)(tmp >> 3);
2032                     ; 582     presc = HSIDivFactor[tmp];
2034  0013 5f            	clrw	x
2035  0014 97            	ld	xl,a
2036  0015 d60000        	ld	a,(_HSIDivFactor,x)
2037  0018 6b09          	ld	(OFST+0,sp),a
2039                     ; 583     clockfrequency = HSI_VALUE / presc;
2041  001a b703          	ld	c_lreg+3,a
2042  001c 3f02          	clr	c_lreg+2
2043  001e 3f01          	clr	c_lreg+1
2044  0020 3f00          	clr	c_lreg
2045  0022 96            	ldw	x,sp
2046  0023 5c            	incw	x
2047  0024 cd0000        	call	c_rtol
2050  0027 ae2400        	ldw	x,#9216
2051  002a bf02          	ldw	c_lreg+2,x
2052  002c ae00f4        	ldw	x,#244
2053  002f bf00          	ldw	c_lreg,x
2054  0031 96            	ldw	x,sp
2055  0032 5c            	incw	x
2056  0033 cd0000        	call	c_ludv
2058  0036 96            	ldw	x,sp
2059  0037 1c0005        	addw	x,#OFST-4
2060  003a cd0000        	call	c_rtol
2064  003d 2018          	jra	L5211
2065  003f               L3211:
2066                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2068  003f a1d2          	cp	a,#210
2069  0041 260a          	jrne	L7211
2070                     ; 587     clockfrequency = LSI_VALUE;
2072  0043 aef400        	ldw	x,#62464
2073  0046 1f07          	ldw	(OFST-2,sp),x
2074  0048 ae0001        	ldw	x,#1
2076  004b 2008          	jp	LC005
2077  004d               L7211:
2078                     ; 591     clockfrequency = HSE_VALUE;
2080  004d ae2400        	ldw	x,#9216
2081  0050 1f07          	ldw	(OFST-2,sp),x
2082  0052 ae00f4        	ldw	x,#244
2083  0055               LC005:
2084  0055 1f05          	ldw	(OFST-4,sp),x
2086  0057               L5211:
2087                     ; 594   return((uint32_t)clockfrequency);
2089  0057 96            	ldw	x,sp
2090  0058 1c0005        	addw	x,#OFST-4
2091  005b cd0000        	call	c_ltor
2095  005e 5b09          	addw	sp,#9
2096  0060 81            	ret	
2195                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2195                     ; 605 {
2196                     .text:	section	.text,new
2197  0000               _CLK_AdjustHSICalibrationValue:
2199  0000 88            	push	a
2200       00000000      OFST:	set	0
2203                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2205                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2207  0001 c650cc        	ld	a,20684
2208  0004 a4f8          	and	a,#248
2209  0006 1a01          	or	a,(OFST+1,sp)
2210  0008 c750cc        	ld	20684,a
2211                     ; 611 }
2214  000b 84            	pop	a
2215  000c 81            	ret	
2239                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2239                     ; 623 {
2240                     .text:	section	.text,new
2241  0000               _CLK_SYSCLKEmergencyClear:
2245                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2247  0000 721150c5      	bres	20677,#0
2248                     ; 625 }
2251  0004 81            	ret	
2404                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2404                     ; 635 {
2405                     .text:	section	.text,new
2406  0000               _CLK_GetFlagStatus:
2408  0000 89            	pushw	x
2409  0001 5203          	subw	sp,#3
2410       00000003      OFST:	set	3
2413                     ; 636   uint16_t statusreg = 0;
2415                     ; 637   uint8_t tmpreg = 0;
2417                     ; 638   FlagStatus bitstatus = RESET;
2419                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2421                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2423  0003 01            	rrwa	x,a
2424  0004 4f            	clr	a
2425  0005 02            	rlwa	x,a
2426  0006 1f01          	ldw	(OFST-2,sp),x
2428                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2430  0008 a30100        	cpw	x,#256
2431  000b 2605          	jrne	L5721
2432                     ; 649     tmpreg = CLK->ICKR;
2434  000d c650c0        	ld	a,20672
2436  0010 2021          	jra	L7721
2437  0012               L5721:
2438                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2440  0012 a30200        	cpw	x,#512
2441  0015 2605          	jrne	L1031
2442                     ; 653     tmpreg = CLK->ECKR;
2444  0017 c650c1        	ld	a,20673
2446  001a 2017          	jra	L7721
2447  001c               L1031:
2448                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2450  001c a30300        	cpw	x,#768
2451  001f 2605          	jrne	L5031
2452                     ; 657     tmpreg = CLK->SWCR;
2454  0021 c650c5        	ld	a,20677
2456  0024 200d          	jra	L7721
2457  0026               L5031:
2458                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2460  0026 a30400        	cpw	x,#1024
2461  0029 2605          	jrne	L1131
2462                     ; 661     tmpreg = CLK->CSSR;
2464  002b c650c8        	ld	a,20680
2466  002e 2003          	jra	L7721
2467  0030               L1131:
2468                     ; 665     tmpreg = CLK->CCOR;
2470  0030 c650c9        	ld	a,20681
2471  0033               L7721:
2472  0033 6b03          	ld	(OFST+0,sp),a
2474                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2476  0035 7b05          	ld	a,(OFST+2,sp)
2477  0037 1503          	bcp	a,(OFST+0,sp)
2478  0039 2704          	jreq	L5131
2479                     ; 670     bitstatus = SET;
2481  003b a601          	ld	a,#1
2484  003d 2001          	jra	L7131
2485  003f               L5131:
2486                     ; 674     bitstatus = RESET;
2488  003f 4f            	clr	a
2490  0040               L7131:
2491                     ; 678   return((FlagStatus)bitstatus);
2495  0040 5b05          	addw	sp,#5
2496  0042 81            	ret	
2542                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2542                     ; 688 {
2543                     .text:	section	.text,new
2544  0000               _CLK_GetITStatus:
2546  0000 88            	push	a
2547  0001 88            	push	a
2548       00000001      OFST:	set	1
2551                     ; 689   ITStatus bitstatus = RESET;
2553                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2555                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2557  0002 a11c          	cp	a,#28
2558  0004 2609          	jrne	L3431
2559                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2561  0006 c450c5        	and	a,20677
2562  0009 a10c          	cp	a,#12
2563  000b 260f          	jrne	L3531
2564                     ; 699       bitstatus = SET;
2566  000d 2009          	jp	LC007
2567                     ; 703       bitstatus = RESET;
2568  000f               L3431:
2569                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2571  000f c650c8        	ld	a,20680
2572  0012 1402          	and	a,(OFST+1,sp)
2573  0014 a10c          	cp	a,#12
2574  0016 2604          	jrne	L3531
2575                     ; 711       bitstatus = SET;
2577  0018               LC007:
2579  0018 a601          	ld	a,#1
2582  001a 2001          	jra	L1531
2583  001c               L3531:
2584                     ; 715       bitstatus = RESET;
2587  001c 4f            	clr	a
2589  001d               L1531:
2590                     ; 720   return bitstatus;
2594  001d 85            	popw	x
2595  001e 81            	ret	
2631                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2631                     ; 730 {
2632                     .text:	section	.text,new
2633  0000               _CLK_ClearITPendingBit:
2637                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2639                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2641  0000 a10c          	cp	a,#12
2642  0002 2605          	jrne	L5731
2643                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2645  0004 721750c8      	bres	20680,#3
2648  0008 81            	ret	
2649  0009               L5731:
2650                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2652  0009 721750c5      	bres	20677,#3
2653                     ; 745 }
2656  000d 81            	ret	
2691                     	xdef	_CLKPrescTable
2692                     	xdef	_HSIDivFactor
2693                     	xdef	_CLK_ClearITPendingBit
2694                     	xdef	_CLK_GetITStatus
2695                     	xdef	_CLK_GetFlagStatus
2696                     	xdef	_CLK_GetSYSCLKSource
2697                     	xdef	_CLK_GetClockFreq
2698                     	xdef	_CLK_AdjustHSICalibrationValue
2699                     	xdef	_CLK_SYSCLKEmergencyClear
2700                     	xdef	_CLK_ClockSecuritySystemEnable
2701                     	xdef	_CLK_SWIMConfig
2702                     	xdef	_CLK_SYSCLKConfig
2703                     	xdef	_CLK_ITConfig
2704                     	xdef	_CLK_CCOConfig
2705                     	xdef	_CLK_HSIPrescalerConfig
2706                     	xdef	_CLK_ClockSwitchConfig
2707                     	xdef	_CLK_PeripheralClockConfig
2708                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2709                     	xdef	_CLK_FastHaltWakeUpCmd
2710                     	xdef	_CLK_ClockSwitchCmd
2711                     	xdef	_CLK_CCOCmd
2712                     	xdef	_CLK_LSICmd
2713                     	xdef	_CLK_HSICmd
2714                     	xdef	_CLK_HSECmd
2715                     	xdef	_CLK_DeInit
2716                     	xref.b	c_lreg
2717                     	xref.b	c_x
2736                     	xref	c_ltor
2737                     	xref	c_ludv
2738                     	xref	c_rtol
2739                     	end

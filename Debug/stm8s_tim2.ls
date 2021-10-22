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
 110                     ; 52 void TIM2_DeInit(void)
 110                     ; 53 {
 112                     .text:	section	.text,new
 113  0000               _TIM2_DeInit:
 117                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
 119  0000 725f5300      	clr	21248
 120                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
 122  0004 725f5303      	clr	21251
 123                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
 125  0008 725f5305      	clr	21253
 126                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
 128  000c 725f530a      	clr	21258
 129                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
 131  0010 725f530b      	clr	21259
 132                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
 134  0014 725f530a      	clr	21258
 135                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
 137  0018 725f530b      	clr	21259
 138                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
 140  001c 725f5307      	clr	21255
 141                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
 143  0020 725f5308      	clr	21256
 144                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
 146  0024 725f5309      	clr	21257
 147                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
 149  0028 725f530c      	clr	21260
 150                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
 152  002c 725f530d      	clr	21261
 153                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
 155  0030 725f530e      	clr	21262
 156                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
 158  0034 35ff530f      	mov	21263,#255
 159                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
 161  0038 35ff5310      	mov	21264,#255
 162                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
 164  003c 725f5311      	clr	21265
 165                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 167  0040 725f5312      	clr	21266
 168                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 170  0044 725f5313      	clr	21267
 171                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 173  0048 725f5314      	clr	21268
 174                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 176  004c 725f5315      	clr	21269
 177                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 179  0050 725f5316      	clr	21270
 180                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 182  0054 725f5304      	clr	21252
 183                     ; 81 }
 186  0058 81            	ret	
 354                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 354                     ; 90                         uint16_t TIM2_Period)
 354                     ; 91 {
 355                     .text:	section	.text,new
 356  0000               _TIM2_TimeBaseInit:
 358       ffffffff      OFST: set -1
 361                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 363  0000 c7530e        	ld	21262,a
 364                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 366  0003 7b03          	ld	a,(OFST+4,sp)
 367  0005 c7530f        	ld	21263,a
 368                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
 370  0008 7b04          	ld	a,(OFST+5,sp)
 371  000a c75310        	ld	21264,a
 372                     ; 97 }
 375  000d 81            	ret	
 532                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 532                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
 532                     ; 110                   uint16_t TIM2_Pulse,
 532                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 532                     ; 112 {
 533                     .text:	section	.text,new
 534  0000               _TIM2_OC1Init:
 536  0000 89            	pushw	x
 537  0001 88            	push	a
 538       00000001      OFST:	set	1
 541                     ; 114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 543                     ; 115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 545                     ; 116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 547                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 549  0002 c6530a        	ld	a,21258
 550  0005 a4fc          	and	a,#252
 551  0007 c7530a        	ld	21258,a
 552                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 552                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 554  000a 7b08          	ld	a,(OFST+7,sp)
 555  000c a402          	and	a,#2
 556  000e 6b01          	ld	(OFST+0,sp),a
 558  0010 9f            	ld	a,xl
 559  0011 a401          	and	a,#1
 560  0013 1a01          	or	a,(OFST+0,sp)
 561  0015 ca530a        	or	a,21258
 562  0018 c7530a        	ld	21258,a
 563                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 563                     ; 126                           (uint8_t)TIM2_OCMode);
 565  001b c65307        	ld	a,21255
 566  001e a48f          	and	a,#143
 567  0020 1a02          	or	a,(OFST+1,sp)
 568  0022 c75307        	ld	21255,a
 569                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 571  0025 7b06          	ld	a,(OFST+5,sp)
 572  0027 c75311        	ld	21265,a
 573                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 575  002a 7b07          	ld	a,(OFST+6,sp)
 576  002c c75312        	ld	21266,a
 577                     ; 131 }
 580  002f 5b03          	addw	sp,#3
 581  0031 81            	ret	
 645                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 645                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 645                     ; 144                   uint16_t TIM2_Pulse,
 645                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 645                     ; 146 {
 646                     .text:	section	.text,new
 647  0000               _TIM2_OC2Init:
 649  0000 89            	pushw	x
 650  0001 88            	push	a
 651       00000001      OFST:	set	1
 654                     ; 148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 656                     ; 149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 658                     ; 150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 660                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 662  0002 c6530a        	ld	a,21258
 663  0005 a4cf          	and	a,#207
 664  0007 c7530a        	ld	21258,a
 665                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 665                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 667  000a 7b08          	ld	a,(OFST+7,sp)
 668  000c a420          	and	a,#32
 669  000e 6b01          	ld	(OFST+0,sp),a
 671  0010 9f            	ld	a,xl
 672  0011 a410          	and	a,#16
 673  0013 1a01          	or	a,(OFST+0,sp)
 674  0015 ca530a        	or	a,21258
 675  0018 c7530a        	ld	21258,a
 676                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 676                     ; 162                           (uint8_t)TIM2_OCMode);
 678  001b c65308        	ld	a,21256
 679  001e a48f          	and	a,#143
 680  0020 1a02          	or	a,(OFST+1,sp)
 681  0022 c75308        	ld	21256,a
 682                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 684  0025 7b06          	ld	a,(OFST+5,sp)
 685  0027 c75313        	ld	21267,a
 686                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 688  002a 7b07          	ld	a,(OFST+6,sp)
 689  002c c75314        	ld	21268,a
 690                     ; 168 }
 693  002f 5b03          	addw	sp,#3
 694  0031 81            	ret	
 758                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 758                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 758                     ; 181                   uint16_t TIM2_Pulse,
 758                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 758                     ; 183 {
 759                     .text:	section	.text,new
 760  0000               _TIM2_OC3Init:
 762  0000 89            	pushw	x
 763  0001 88            	push	a
 764       00000001      OFST:	set	1
 767                     ; 185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 769                     ; 186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 771                     ; 187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 773                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 775  0002 c6530b        	ld	a,21259
 776  0005 a4fc          	and	a,#252
 777  0007 c7530b        	ld	21259,a
 778                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 778                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 780  000a 7b08          	ld	a,(OFST+7,sp)
 781  000c a402          	and	a,#2
 782  000e 6b01          	ld	(OFST+0,sp),a
 784  0010 9f            	ld	a,xl
 785  0011 a401          	and	a,#1
 786  0013 1a01          	or	a,(OFST+0,sp)
 787  0015 ca530b        	or	a,21259
 788  0018 c7530b        	ld	21259,a
 789                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 789                     ; 196                           (uint8_t)TIM2_OCMode);
 791  001b c65309        	ld	a,21257
 792  001e a48f          	and	a,#143
 793  0020 1a02          	or	a,(OFST+1,sp)
 794  0022 c75309        	ld	21257,a
 795                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 797  0025 7b06          	ld	a,(OFST+5,sp)
 798  0027 c75315        	ld	21269,a
 799                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 801  002a 7b07          	ld	a,(OFST+6,sp)
 802  002c c75316        	ld	21270,a
 803                     ; 201 }
 806  002f 5b03          	addw	sp,#3
 807  0031 81            	ret	
1000                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
1000                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1000                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
1000                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1000                     ; 216                  uint8_t TIM2_ICFilter)
1000                     ; 217 {
1001                     .text:	section	.text,new
1002  0000               _TIM2_ICInit:
1004  0000 89            	pushw	x
1005       00000000      OFST:	set	0
1008                     ; 219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
1010                     ; 220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1012                     ; 221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1014                     ; 222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1016                     ; 223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
1018                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
1020  0001 9e            	ld	a,xh
1021  0002 4d            	tnz	a
1022  0003 2614          	jrne	L344
1023                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
1023                     ; 229                (uint8_t)TIM2_ICSelection,
1023                     ; 230                (uint8_t)TIM2_ICFilter);
1025  0005 7b07          	ld	a,(OFST+7,sp)
1026  0007 88            	push	a
1027  0008 7b06          	ld	a,(OFST+6,sp)
1028  000a 97            	ld	xl,a
1029  000b 7b03          	ld	a,(OFST+3,sp)
1030  000d 95            	ld	xh,a
1031  000e cd0000        	call	L54_TI1_Config
1033  0011 84            	pop	a
1034                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1036  0012 7b06          	ld	a,(OFST+6,sp)
1037  0014 cd0000        	call	_TIM2_SetIC1Prescaler
1040  0017 202b          	jra	L544
1041  0019               L344:
1042                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
1044  0019 7b01          	ld	a,(OFST+1,sp)
1045  001b 4a            	dec	a
1046  001c 2614          	jrne	L744
1047                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
1047                     ; 239                (uint8_t)TIM2_ICSelection,
1047                     ; 240                (uint8_t)TIM2_ICFilter);
1049  001e 7b07          	ld	a,(OFST+7,sp)
1050  0020 88            	push	a
1051  0021 7b06          	ld	a,(OFST+6,sp)
1052  0023 97            	ld	xl,a
1053  0024 7b03          	ld	a,(OFST+3,sp)
1054  0026 95            	ld	xh,a
1055  0027 cd0000        	call	L74_TI2_Config
1057  002a 84            	pop	a
1058                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1060  002b 7b06          	ld	a,(OFST+6,sp)
1061  002d cd0000        	call	_TIM2_SetIC2Prescaler
1064  0030 2012          	jra	L544
1065  0032               L744:
1066                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
1066                     ; 249                (uint8_t)TIM2_ICSelection,
1066                     ; 250                (uint8_t)TIM2_ICFilter);
1068  0032 7b07          	ld	a,(OFST+7,sp)
1069  0034 88            	push	a
1070  0035 7b06          	ld	a,(OFST+6,sp)
1071  0037 97            	ld	xl,a
1072  0038 7b03          	ld	a,(OFST+3,sp)
1073  003a 95            	ld	xh,a
1074  003b cd0000        	call	L15_TI3_Config
1076  003e 84            	pop	a
1077                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1079  003f 7b06          	ld	a,(OFST+6,sp)
1080  0041 cd0000        	call	_TIM2_SetIC3Prescaler
1082  0044               L544:
1083                     ; 255 }
1086  0044 85            	popw	x
1087  0045 81            	ret	
1183                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1183                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1183                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1183                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1183                     ; 270                      uint8_t TIM2_ICFilter)
1183                     ; 271 {
1184                     .text:	section	.text,new
1185  0000               _TIM2_PWMIConfig:
1187  0000 89            	pushw	x
1188  0001 89            	pushw	x
1189       00000002      OFST:	set	2
1192                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1194                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1196                     ; 276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1198                     ; 277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1200                     ; 278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1202                     ; 279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1204                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1206  0002 9f            	ld	a,xl
1207  0003 a144          	cp	a,#68
1208  0005 2706          	jreq	L125
1209                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1211  0007 a644          	ld	a,#68
1212  0009 6b01          	ld	(OFST-1,sp),a
1215  000b 2002          	jra	L325
1216  000d               L125:
1217                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1219  000d 0f01          	clr	(OFST-1,sp)
1221  000f               L325:
1222                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1224  000f 7b07          	ld	a,(OFST+5,sp)
1225  0011 4a            	dec	a
1226  0012 2604          	jrne	L525
1227                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1229  0014 a602          	ld	a,#2
1231  0016 2002          	jra	L725
1232  0018               L525:
1233                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1235  0018 a601          	ld	a,#1
1236  001a               L725:
1237  001a 6b02          	ld	(OFST+0,sp),a
1239                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
1241  001c 7b03          	ld	a,(OFST+1,sp)
1242  001e 2626          	jrne	L135
1243                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1243                     ; 305                (uint8_t)TIM2_ICFilter);
1245  0020 7b09          	ld	a,(OFST+7,sp)
1246  0022 88            	push	a
1247  0023 7b08          	ld	a,(OFST+6,sp)
1248  0025 97            	ld	xl,a
1249  0026 7b05          	ld	a,(OFST+3,sp)
1250  0028 95            	ld	xh,a
1251  0029 cd0000        	call	L54_TI1_Config
1253  002c 84            	pop	a
1254                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1256  002d 7b08          	ld	a,(OFST+6,sp)
1257  002f cd0000        	call	_TIM2_SetIC1Prescaler
1259                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1261  0032 7b09          	ld	a,(OFST+7,sp)
1262  0034 88            	push	a
1263  0035 7b03          	ld	a,(OFST+1,sp)
1264  0037 97            	ld	xl,a
1265  0038 7b02          	ld	a,(OFST+0,sp)
1266  003a 95            	ld	xh,a
1267  003b cd0000        	call	L74_TI2_Config
1269  003e 84            	pop	a
1270                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1272  003f 7b08          	ld	a,(OFST+6,sp)
1273  0041 cd0000        	call	_TIM2_SetIC2Prescaler
1276  0044 2024          	jra	L335
1277  0046               L135:
1278                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1278                     ; 320                (uint8_t)TIM2_ICFilter);
1280  0046 7b09          	ld	a,(OFST+7,sp)
1281  0048 88            	push	a
1282  0049 7b08          	ld	a,(OFST+6,sp)
1283  004b 97            	ld	xl,a
1284  004c 7b05          	ld	a,(OFST+3,sp)
1285  004e 95            	ld	xh,a
1286  004f cd0000        	call	L74_TI2_Config
1288  0052 84            	pop	a
1289                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1291  0053 7b08          	ld	a,(OFST+6,sp)
1292  0055 cd0000        	call	_TIM2_SetIC2Prescaler
1294                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1296  0058 7b09          	ld	a,(OFST+7,sp)
1297  005a 88            	push	a
1298  005b 7b03          	ld	a,(OFST+1,sp)
1299  005d 97            	ld	xl,a
1300  005e 7b02          	ld	a,(OFST+0,sp)
1301  0060 95            	ld	xh,a
1302  0061 cd0000        	call	L54_TI1_Config
1304  0064 84            	pop	a
1305                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1307  0065 7b08          	ld	a,(OFST+6,sp)
1308  0067 cd0000        	call	_TIM2_SetIC1Prescaler
1310  006a               L335:
1311                     ; 331 }
1314  006a 5b04          	addw	sp,#4
1315  006c 81            	ret	
1370                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1370                     ; 340 {
1371                     .text:	section	.text,new
1372  0000               _TIM2_Cmd:
1376                     ; 342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1378                     ; 345   if (NewState != DISABLE)
1380  0000 4d            	tnz	a
1381  0001 2705          	jreq	L365
1382                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1384  0003 72105300      	bset	21248,#0
1387  0007 81            	ret	
1388  0008               L365:
1389                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1391  0008 72115300      	bres	21248,#0
1392                     ; 353 }
1395  000c 81            	ret	
1474                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1474                     ; 369 {
1475                     .text:	section	.text,new
1476  0000               _TIM2_ITConfig:
1478  0000 89            	pushw	x
1479       00000000      OFST:	set	0
1482                     ; 371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1484                     ; 372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1486                     ; 374   if (NewState != DISABLE)
1488  0001 9f            	ld	a,xl
1489  0002 4d            	tnz	a
1490  0003 2706          	jreq	L526
1491                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
1493  0005 9e            	ld	a,xh
1494  0006 ca5303        	or	a,21251
1496  0009 2006          	jra	L726
1497  000b               L526:
1498                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
1500  000b 7b01          	ld	a,(OFST+1,sp)
1501  000d 43            	cpl	a
1502  000e c45303        	and	a,21251
1503  0011               L726:
1504  0011 c75303        	ld	21251,a
1505                     ; 384 }
1508  0014 85            	popw	x
1509  0015 81            	ret	
1545                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1545                     ; 393 {
1546                     .text:	section	.text,new
1547  0000               _TIM2_UpdateDisableConfig:
1551                     ; 395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1553                     ; 398   if (NewState != DISABLE)
1555  0000 4d            	tnz	a
1556  0001 2705          	jreq	L746
1557                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1559  0003 72125300      	bset	21248,#1
1562  0007 81            	ret	
1563  0008               L746:
1564                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1566  0008 72135300      	bres	21248,#1
1567                     ; 406 }
1570  000c 81            	ret	
1628                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1628                     ; 417 {
1629                     .text:	section	.text,new
1630  0000               _TIM2_UpdateRequestConfig:
1634                     ; 419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1636                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1638  0000 4d            	tnz	a
1639  0001 2705          	jreq	L107
1640                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1642  0003 72145300      	bset	21248,#2
1645  0007 81            	ret	
1646  0008               L107:
1647                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1649  0008 72155300      	bres	21248,#2
1650                     ; 430 }
1653  000c 81            	ret	
1710                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1710                     ; 441 {
1711                     .text:	section	.text,new
1712  0000               _TIM2_SelectOnePulseMode:
1716                     ; 443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1718                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1720  0000 4d            	tnz	a
1721  0001 2705          	jreq	L337
1722                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1724  0003 72165300      	bset	21248,#3
1727  0007 81            	ret	
1728  0008               L337:
1729                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1731  0008 72175300      	bres	21248,#3
1732                     ; 454 }
1735  000c 81            	ret	
1803                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1803                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1803                     ; 486 {
1804                     .text:	section	.text,new
1805  0000               _TIM2_PrescalerConfig:
1809                     ; 488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
1811                     ; 489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
1813                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
1815  0000 9e            	ld	a,xh
1816  0001 c7530e        	ld	21262,a
1817                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
1819  0004 9f            	ld	a,xl
1820  0005 c75306        	ld	21254,a
1821                     ; 496 }
1824  0008 81            	ret	
1882                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1882                     ; 508 {
1883                     .text:	section	.text,new
1884  0000               _TIM2_ForcedOC1Config:
1886  0000 88            	push	a
1887       00000000      OFST:	set	0
1890                     ; 510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1892                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
1892                     ; 514                             | (uint8_t)TIM2_ForcedAction);
1894  0001 c65307        	ld	a,21255
1895  0004 a48f          	and	a,#143
1896  0006 1a01          	or	a,(OFST+1,sp)
1897  0008 c75307        	ld	21255,a
1898                     ; 515 }
1901  000b 84            	pop	a
1902  000c 81            	ret	
1938                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1938                     ; 527 {
1939                     .text:	section	.text,new
1940  0000               _TIM2_ForcedOC2Config:
1942  0000 88            	push	a
1943       00000000      OFST:	set	0
1946                     ; 529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1948                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
1948                     ; 533                           | (uint8_t)TIM2_ForcedAction);
1950  0001 c65308        	ld	a,21256
1951  0004 a48f          	and	a,#143
1952  0006 1a01          	or	a,(OFST+1,sp)
1953  0008 c75308        	ld	21256,a
1954                     ; 534 }
1957  000b 84            	pop	a
1958  000c 81            	ret	
1994                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1994                     ; 546 {
1995                     .text:	section	.text,new
1996  0000               _TIM2_ForcedOC3Config:
1998  0000 88            	push	a
1999       00000000      OFST:	set	0
2002                     ; 548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2004                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2004                     ; 552                             | (uint8_t)TIM2_ForcedAction);
2006  0001 c65309        	ld	a,21257
2007  0004 a48f          	and	a,#143
2008  0006 1a01          	or	a,(OFST+1,sp)
2009  0008 c75309        	ld	21257,a
2010                     ; 553 }
2013  000b 84            	pop	a
2014  000c 81            	ret	
2050                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
2050                     ; 562 {
2051                     .text:	section	.text,new
2052  0000               _TIM2_ARRPreloadConfig:
2056                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2058                     ; 567   if (NewState != DISABLE)
2060  0000 4d            	tnz	a
2061  0001 2705          	jreq	L1701
2062                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
2064  0003 721e5300      	bset	21248,#7
2067  0007 81            	ret	
2068  0008               L1701:
2069                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
2071  0008 721f5300      	bres	21248,#7
2072                     ; 575 }
2075  000c 81            	ret	
2111                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2111                     ; 584 {
2112                     .text:	section	.text,new
2113  0000               _TIM2_OC1PreloadConfig:
2117                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2119                     ; 589   if (NewState != DISABLE)
2121  0000 4d            	tnz	a
2122  0001 2705          	jreq	L3111
2123                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2125  0003 72165307      	bset	21255,#3
2128  0007 81            	ret	
2129  0008               L3111:
2130                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2132  0008 72175307      	bres	21255,#3
2133                     ; 597 }
2136  000c 81            	ret	
2172                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2172                     ; 606 {
2173                     .text:	section	.text,new
2174  0000               _TIM2_OC2PreloadConfig:
2178                     ; 608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2180                     ; 611   if (NewState != DISABLE)
2182  0000 4d            	tnz	a
2183  0001 2705          	jreq	L5311
2184                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2186  0003 72165308      	bset	21256,#3
2189  0007 81            	ret	
2190  0008               L5311:
2191                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2193  0008 72175308      	bres	21256,#3
2194                     ; 619 }
2197  000c 81            	ret	
2233                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2233                     ; 628 {
2234                     .text:	section	.text,new
2235  0000               _TIM2_OC3PreloadConfig:
2239                     ; 630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2241                     ; 633   if (NewState != DISABLE)
2243  0000 4d            	tnz	a
2244  0001 2705          	jreq	L7511
2245                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2247  0003 72165309      	bset	21257,#3
2250  0007 81            	ret	
2251  0008               L7511:
2252                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2254  0008 72175309      	bres	21257,#3
2255                     ; 641 }
2258  000c 81            	ret	
2331                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2331                     ; 654 {
2332                     .text:	section	.text,new
2333  0000               _TIM2_GenerateEvent:
2337                     ; 656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2339                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
2341  0000 c75306        	ld	21254,a
2342                     ; 660 }
2345  0003 81            	ret	
2381                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2381                     ; 671 {
2382                     .text:	section	.text,new
2383  0000               _TIM2_OC1PolarityConfig:
2387                     ; 673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2389                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2391  0000 4d            	tnz	a
2392  0001 2705          	jreq	L3321
2393                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2395  0003 7212530a      	bset	21258,#1
2398  0007 81            	ret	
2399  0008               L3321:
2400                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2402  0008 7213530a      	bres	21258,#1
2403                     ; 684 }
2406  000c 81            	ret	
2442                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2442                     ; 695 {
2443                     .text:	section	.text,new
2444  0000               _TIM2_OC2PolarityConfig:
2448                     ; 697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2450                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2452  0000 4d            	tnz	a
2453  0001 2705          	jreq	L5521
2454                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
2456  0003 721a530a      	bset	21258,#5
2459  0007 81            	ret	
2460  0008               L5521:
2461                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2463  0008 721b530a      	bres	21258,#5
2464                     ; 708 }
2467  000c 81            	ret	
2503                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2503                     ; 719 {
2504                     .text:	section	.text,new
2505  0000               _TIM2_OC3PolarityConfig:
2509                     ; 721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2511                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2513  0000 4d            	tnz	a
2514  0001 2705          	jreq	L7721
2515                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
2517  0003 7212530b      	bset	21259,#1
2520  0007 81            	ret	
2521  0008               L7721:
2522                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
2524  0008 7213530b      	bres	21259,#1
2525                     ; 732 }
2528  000c 81            	ret	
2573                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2573                     ; 746 {
2574                     .text:	section	.text,new
2575  0000               _TIM2_CCxCmd:
2577  0000 89            	pushw	x
2578       00000000      OFST:	set	0
2581                     ; 748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2583                     ; 749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2585                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
2587  0001 9e            	ld	a,xh
2588  0002 4d            	tnz	a
2589  0003 2610          	jrne	L5231
2590                     ; 754     if (NewState != DISABLE)
2592  0005 9f            	ld	a,xl
2593  0006 4d            	tnz	a
2594  0007 2706          	jreq	L7231
2595                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
2597  0009 7210530a      	bset	21258,#0
2599  000d 2029          	jra	L3331
2600  000f               L7231:
2601                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2603  000f 7211530a      	bres	21258,#0
2604  0013 2023          	jra	L3331
2605  0015               L5231:
2606                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
2608  0015 7b01          	ld	a,(OFST+1,sp)
2609  0017 4a            	dec	a
2610  0018 2610          	jrne	L5331
2611                     ; 767     if (NewState != DISABLE)
2613  001a 7b02          	ld	a,(OFST+2,sp)
2614  001c 2706          	jreq	L7331
2615                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
2617  001e 7218530a      	bset	21258,#4
2619  0022 2014          	jra	L3331
2620  0024               L7331:
2621                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2623  0024 7219530a      	bres	21258,#4
2624  0028 200e          	jra	L3331
2625  002a               L5331:
2626                     ; 779     if (NewState != DISABLE)
2628  002a 7b02          	ld	a,(OFST+2,sp)
2629  002c 2706          	jreq	L5431
2630                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
2632  002e 7210530b      	bset	21259,#0
2634  0032 2004          	jra	L3331
2635  0034               L5431:
2636                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2638  0034 7211530b      	bres	21259,#0
2639  0038               L3331:
2640                     ; 788 }
2643  0038 85            	popw	x
2644  0039 81            	ret	
2689                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2689                     ; 811 {
2690                     .text:	section	.text,new
2691  0000               _TIM2_SelectOCxM:
2693  0000 89            	pushw	x
2694       00000000      OFST:	set	0
2697                     ; 813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2699                     ; 814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
2701                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
2703  0001 9e            	ld	a,xh
2704  0002 4d            	tnz	a
2705  0003 2610          	jrne	L3731
2706                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2708  0005 7211530a      	bres	21258,#0
2709                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
2709                     ; 823                             | (uint8_t)TIM2_OCMode);
2711  0009 c65307        	ld	a,21255
2712  000c a48f          	and	a,#143
2713  000e 1a02          	or	a,(OFST+2,sp)
2714  0010 c75307        	ld	21255,a
2716  0013 2023          	jra	L5731
2717  0015               L3731:
2718                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
2720  0015 7b01          	ld	a,(OFST+1,sp)
2721  0017 4a            	dec	a
2722  0018 2610          	jrne	L7731
2723                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2725  001a 7219530a      	bres	21258,#4
2726                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
2726                     ; 832                             | (uint8_t)TIM2_OCMode);
2728  001e c65308        	ld	a,21256
2729  0021 a48f          	and	a,#143
2730  0023 1a02          	or	a,(OFST+2,sp)
2731  0025 c75308        	ld	21256,a
2733  0028 200e          	jra	L5731
2734  002a               L7731:
2735                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2737  002a 7211530b      	bres	21259,#0
2738                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2738                     ; 841                             | (uint8_t)TIM2_OCMode);
2740  002e c65309        	ld	a,21257
2741  0031 a48f          	and	a,#143
2742  0033 1a02          	or	a,(OFST+2,sp)
2743  0035 c75309        	ld	21257,a
2744  0038               L5731:
2745                     ; 843 }
2748  0038 85            	popw	x
2749  0039 81            	ret	
2783                     ; 851 void TIM2_SetCounter(uint16_t Counter)
2783                     ; 852 {
2784                     .text:	section	.text,new
2785  0000               _TIM2_SetCounter:
2789                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
2791  0000 9e            	ld	a,xh
2792  0001 c7530c        	ld	21260,a
2793                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
2795  0004 9f            	ld	a,xl
2796  0005 c7530d        	ld	21261,a
2797                     ; 856 }
2800  0008 81            	ret	
2834                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
2834                     ; 865 {
2835                     .text:	section	.text,new
2836  0000               _TIM2_SetAutoreload:
2840                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
2842  0000 9e            	ld	a,xh
2843  0001 c7530f        	ld	21263,a
2844                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
2846  0004 9f            	ld	a,xl
2847  0005 c75310        	ld	21264,a
2848                     ; 869 }
2851  0008 81            	ret	
2885                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
2885                     ; 878 {
2886                     .text:	section	.text,new
2887  0000               _TIM2_SetCompare1:
2891                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
2893  0000 9e            	ld	a,xh
2894  0001 c75311        	ld	21265,a
2895                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
2897  0004 9f            	ld	a,xl
2898  0005 c75312        	ld	21266,a
2899                     ; 882 }
2902  0008 81            	ret	
2936                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
2936                     ; 891 {
2937                     .text:	section	.text,new
2938  0000               _TIM2_SetCompare2:
2942                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
2944  0000 9e            	ld	a,xh
2945  0001 c75313        	ld	21267,a
2946                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
2948  0004 9f            	ld	a,xl
2949  0005 c75314        	ld	21268,a
2950                     ; 895 }
2953  0008 81            	ret	
2987                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
2987                     ; 904 {
2988                     .text:	section	.text,new
2989  0000               _TIM2_SetCompare3:
2993                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
2995  0000 9e            	ld	a,xh
2996  0001 c75315        	ld	21269,a
2997                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
2999  0004 9f            	ld	a,xl
3000  0005 c75316        	ld	21270,a
3001                     ; 908 }
3004  0008 81            	ret	
3040                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
3040                     ; 921 {
3041                     .text:	section	.text,new
3042  0000               _TIM2_SetIC1Prescaler:
3044  0000 88            	push	a
3045       00000000      OFST:	set	0
3048                     ; 923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
3050                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3050                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
3052  0001 c65307        	ld	a,21255
3053  0004 a4f3          	and	a,#243
3054  0006 1a01          	or	a,(OFST+1,sp)
3055  0008 c75307        	ld	21255,a
3056                     ; 928 }
3059  000b 84            	pop	a
3060  000c 81            	ret	
3096                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3096                     ; 941 {
3097                     .text:	section	.text,new
3098  0000               _TIM2_SetIC2Prescaler:
3100  0000 88            	push	a
3101       00000000      OFST:	set	0
3104                     ; 943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3106                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3106                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
3108  0001 c65308        	ld	a,21256
3109  0004 a4f3          	and	a,#243
3110  0006 1a01          	or	a,(OFST+1,sp)
3111  0008 c75308        	ld	21256,a
3112                     ; 948 }
3115  000b 84            	pop	a
3116  000c 81            	ret	
3152                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3152                     ; 961 {
3153                     .text:	section	.text,new
3154  0000               _TIM2_SetIC3Prescaler:
3156  0000 88            	push	a
3157       00000000      OFST:	set	0
3160                     ; 964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3162                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3162                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
3164  0001 c65309        	ld	a,21257
3165  0004 a4f3          	and	a,#243
3166  0006 1a01          	or	a,(OFST+1,sp)
3167  0008 c75309        	ld	21257,a
3168                     ; 968 }
3171  000b 84            	pop	a
3172  000c 81            	ret	
3224                     ; 975 uint16_t TIM2_GetCapture1(void)
3224                     ; 976 {
3225                     .text:	section	.text,new
3226  0000               _TIM2_GetCapture1:
3228  0000 5204          	subw	sp,#4
3229       00000004      OFST:	set	4
3232                     ; 978   uint16_t tmpccr1 = 0;
3234                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
3238                     ; 981   tmpccr1h = TIM2->CCR1H;
3240  0002 c65311        	ld	a,21265
3241  0005 6b02          	ld	(OFST-2,sp),a
3243                     ; 982   tmpccr1l = TIM2->CCR1L;
3245  0007 c65312        	ld	a,21266
3246  000a 6b01          	ld	(OFST-3,sp),a
3248                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
3250  000c 5f            	clrw	x
3251  000d 97            	ld	xl,a
3252  000e 1f03          	ldw	(OFST-1,sp),x
3254                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3256  0010 5f            	clrw	x
3257  0011 7b02          	ld	a,(OFST-2,sp)
3258  0013 97            	ld	xl,a
3259  0014 7b04          	ld	a,(OFST+0,sp)
3260  0016 01            	rrwa	x,a
3261  0017 1a03          	or	a,(OFST-1,sp)
3262  0019 01            	rrwa	x,a
3264                     ; 987   return (uint16_t)tmpccr1;
3268  001a 5b04          	addw	sp,#4
3269  001c 81            	ret	
3321                     ; 995 uint16_t TIM2_GetCapture2(void)
3321                     ; 996 {
3322                     .text:	section	.text,new
3323  0000               _TIM2_GetCapture2:
3325  0000 5204          	subw	sp,#4
3326       00000004      OFST:	set	4
3329                     ; 998   uint16_t tmpccr2 = 0;
3331                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
3335                     ; 1001   tmpccr2h = TIM2->CCR2H;
3337  0002 c65313        	ld	a,21267
3338  0005 6b02          	ld	(OFST-2,sp),a
3340                     ; 1002   tmpccr2l = TIM2->CCR2L;
3342  0007 c65314        	ld	a,21268
3343  000a 6b01          	ld	(OFST-3,sp),a
3345                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
3347  000c 5f            	clrw	x
3348  000d 97            	ld	xl,a
3349  000e 1f03          	ldw	(OFST-1,sp),x
3351                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3353  0010 5f            	clrw	x
3354  0011 7b02          	ld	a,(OFST-2,sp)
3355  0013 97            	ld	xl,a
3356  0014 7b04          	ld	a,(OFST+0,sp)
3357  0016 01            	rrwa	x,a
3358  0017 1a03          	or	a,(OFST-1,sp)
3359  0019 01            	rrwa	x,a
3361                     ; 1007   return (uint16_t)tmpccr2;
3365  001a 5b04          	addw	sp,#4
3366  001c 81            	ret	
3418                     ; 1015 uint16_t TIM2_GetCapture3(void)
3418                     ; 1016 {
3419                     .text:	section	.text,new
3420  0000               _TIM2_GetCapture3:
3422  0000 5204          	subw	sp,#4
3423       00000004      OFST:	set	4
3426                     ; 1018   uint16_t tmpccr3 = 0;
3428                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
3432                     ; 1021   tmpccr3h = TIM2->CCR3H;
3434  0002 c65315        	ld	a,21269
3435  0005 6b02          	ld	(OFST-2,sp),a
3437                     ; 1022   tmpccr3l = TIM2->CCR3L;
3439  0007 c65316        	ld	a,21270
3440  000a 6b01          	ld	(OFST-3,sp),a
3442                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
3444  000c 5f            	clrw	x
3445  000d 97            	ld	xl,a
3446  000e 1f03          	ldw	(OFST-1,sp),x
3448                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
3450  0010 5f            	clrw	x
3451  0011 7b02          	ld	a,(OFST-2,sp)
3452  0013 97            	ld	xl,a
3453  0014 7b04          	ld	a,(OFST+0,sp)
3454  0016 01            	rrwa	x,a
3455  0017 1a03          	or	a,(OFST-1,sp)
3456  0019 01            	rrwa	x,a
3458                     ; 1027   return (uint16_t)tmpccr3;
3462  001a 5b04          	addw	sp,#4
3463  001c 81            	ret	
3497                     ; 1035 uint16_t TIM2_GetCounter(void)
3497                     ; 1036 {
3498                     .text:	section	.text,new
3499  0000               _TIM2_GetCounter:
3501  0000 89            	pushw	x
3502       00000002      OFST:	set	2
3505                     ; 1037   uint16_t tmpcntr = 0;
3507                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
3509  0001 c6530c        	ld	a,21260
3510  0004 97            	ld	xl,a
3511  0005 4f            	clr	a
3512  0006 02            	rlwa	x,a
3513  0007 1f01          	ldw	(OFST-1,sp),x
3515                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
3517  0009 c6530d        	ld	a,21261
3518  000c 5f            	clrw	x
3519  000d 97            	ld	xl,a
3520  000e 01            	rrwa	x,a
3521  000f 1a02          	or	a,(OFST+0,sp)
3522  0011 01            	rrwa	x,a
3523  0012 1a01          	or	a,(OFST-1,sp)
3524  0014 01            	rrwa	x,a
3527  0015 5b02          	addw	sp,#2
3528  0017 81            	ret	
3552                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3552                     ; 1050 {
3553                     .text:	section	.text,new
3554  0000               _TIM2_GetPrescaler:
3558                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3560  0000 c6530e        	ld	a,21262
3563  0003 81            	ret	
3702                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3702                     ; 1069 {
3703                     .text:	section	.text,new
3704  0000               _TIM2_GetFlagStatus:
3706  0000 89            	pushw	x
3707  0001 89            	pushw	x
3708       00000002      OFST:	set	2
3711                     ; 1070   FlagStatus bitstatus = RESET;
3713                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3717                     ; 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
3719                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
3721  0002 9f            	ld	a,xl
3722  0003 c45304        	and	a,21252
3723  0006 6b01          	ld	(OFST-1,sp),a
3725                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
3727  0008 7b03          	ld	a,(OFST+1,sp)
3728  000a 6b02          	ld	(OFST+0,sp),a
3730                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
3732  000c c45305        	and	a,21253
3733  000f 1a01          	or	a,(OFST-1,sp)
3734  0011 2702          	jreq	L7771
3735                     ; 1081     bitstatus = SET;
3737  0013 a601          	ld	a,#1
3740  0015               L7771:
3741                     ; 1085     bitstatus = RESET;
3744                     ; 1087   return (FlagStatus)bitstatus;
3748  0015 5b04          	addw	sp,#4
3749  0017 81            	ret	
3784                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3784                     ; 1104 {
3785                     .text:	section	.text,new
3786  0000               _TIM2_ClearFlag:
3790                     ; 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
3792                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
3794  0000 9f            	ld	a,xl
3795  0001 43            	cpl	a
3796  0002 c75304        	ld	21252,a
3797                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
3799  0005 35ff5305      	mov	21253,#255
3800                     ; 1111 }
3803  0009 81            	ret	
3867                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3867                     ; 1124 {
3868                     .text:	section	.text,new
3869  0000               _TIM2_GetITStatus:
3871  0000 88            	push	a
3872  0001 89            	pushw	x
3873       00000002      OFST:	set	2
3876                     ; 1125   ITStatus bitstatus = RESET;
3878                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
3882                     ; 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
3884                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
3886  0002 c45304        	and	a,21252
3887  0005 6b01          	ld	(OFST-1,sp),a
3889                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
3891  0007 c65303        	ld	a,21251
3892  000a 1403          	and	a,(OFST+1,sp)
3893  000c 6b02          	ld	(OFST+0,sp),a
3895                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
3897  000e 7b01          	ld	a,(OFST-1,sp)
3898  0010 2708          	jreq	L3502
3900  0012 7b02          	ld	a,(OFST+0,sp)
3901  0014 2704          	jreq	L3502
3902                     ; 1137     bitstatus = SET;
3904  0016 a601          	ld	a,#1
3907  0018 2001          	jra	L5502
3908  001a               L3502:
3909                     ; 1141     bitstatus = RESET;
3911  001a 4f            	clr	a
3913  001b               L5502:
3914                     ; 1143   return (ITStatus)(bitstatus);
3918  001b 5b03          	addw	sp,#3
3919  001d 81            	ret	
3955                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3955                     ; 1157 {
3956                     .text:	section	.text,new
3957  0000               _TIM2_ClearITPendingBit:
3961                     ; 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
3963                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
3965  0000 43            	cpl	a
3966  0001 c75304        	ld	21252,a
3967                     ; 1163 }
3970  0004 81            	ret	
4022                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
4022                     ; 1182                        uint8_t TIM2_ICSelection,
4022                     ; 1183                        uint8_t TIM2_ICFilter)
4022                     ; 1184 {
4023                     .text:	section	.text,new
4024  0000               L54_TI1_Config:
4026  0000 89            	pushw	x
4027  0001 88            	push	a
4028       00000001      OFST:	set	1
4031                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
4033  0002 7211530a      	bres	21258,#0
4034                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
4034                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4036  0006 7b06          	ld	a,(OFST+5,sp)
4037  0008 97            	ld	xl,a
4038  0009 a610          	ld	a,#16
4039  000b 42            	mul	x,a
4040  000c 9f            	ld	a,xl
4041  000d 1a03          	or	a,(OFST+2,sp)
4042  000f 6b01          	ld	(OFST+0,sp),a
4044  0011 c65307        	ld	a,21255
4045  0014 a40c          	and	a,#12
4046  0016 1a01          	or	a,(OFST+0,sp)
4047  0018 c75307        	ld	21255,a
4048                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4050  001b 7b02          	ld	a,(OFST+1,sp)
4051  001d 2706          	jreq	L3212
4052                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
4054  001f 7212530a      	bset	21258,#1
4056  0023 2004          	jra	L5212
4057  0025               L3212:
4058                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
4060  0025 7213530a      	bres	21258,#1
4061  0029               L5212:
4062                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
4064  0029 7210530a      	bset	21258,#0
4065                     ; 1203 }
4068  002d 5b03          	addw	sp,#3
4069  002f 81            	ret	
4121                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
4121                     ; 1222                        uint8_t TIM2_ICSelection,
4121                     ; 1223                        uint8_t TIM2_ICFilter)
4121                     ; 1224 {
4122                     .text:	section	.text,new
4123  0000               L74_TI2_Config:
4125  0000 89            	pushw	x
4126  0001 88            	push	a
4127       00000001      OFST:	set	1
4130                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
4132  0002 7219530a      	bres	21258,#4
4133                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
4133                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4135  0006 7b06          	ld	a,(OFST+5,sp)
4136  0008 97            	ld	xl,a
4137  0009 a610          	ld	a,#16
4138  000b 42            	mul	x,a
4139  000c 9f            	ld	a,xl
4140  000d 1a03          	or	a,(OFST+2,sp)
4141  000f 6b01          	ld	(OFST+0,sp),a
4143  0011 c65308        	ld	a,21256
4144  0014 a40c          	and	a,#12
4145  0016 1a01          	or	a,(OFST+0,sp)
4146  0018 c75308        	ld	21256,a
4147                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4149  001b 7b02          	ld	a,(OFST+1,sp)
4150  001d 2706          	jreq	L5512
4151                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
4153  001f 721a530a      	bset	21258,#5
4155  0023 2004          	jra	L7512
4156  0025               L5512:
4157                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4159  0025 721b530a      	bres	21258,#5
4160  0029               L7512:
4161                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
4163  0029 7218530a      	bset	21258,#4
4164                     ; 1245 }
4167  002d 5b03          	addw	sp,#3
4168  002f 81            	ret	
4220                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4220                     ; 1262                        uint8_t TIM2_ICFilter)
4220                     ; 1263 {
4221                     .text:	section	.text,new
4222  0000               L15_TI3_Config:
4224  0000 89            	pushw	x
4225  0001 88            	push	a
4226       00000001      OFST:	set	1
4229                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4231  0002 7211530b      	bres	21259,#0
4232                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4232                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4234  0006 7b06          	ld	a,(OFST+5,sp)
4235  0008 97            	ld	xl,a
4236  0009 a610          	ld	a,#16
4237  000b 42            	mul	x,a
4238  000c 9f            	ld	a,xl
4239  000d 1a03          	or	a,(OFST+2,sp)
4240  000f 6b01          	ld	(OFST+0,sp),a
4242  0011 c65309        	ld	a,21257
4243  0014 a40c          	and	a,#12
4244  0016 1a01          	or	a,(OFST+0,sp)
4245  0018 c75309        	ld	21257,a
4246                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4248  001b 7b02          	ld	a,(OFST+1,sp)
4249  001d 2706          	jreq	L7022
4250                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
4252  001f 7212530b      	bset	21259,#1
4254  0023 2004          	jra	L1122
4255  0025               L7022:
4256                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4258  0025 7213530b      	bres	21259,#1
4259  0029               L1122:
4260                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
4262  0029 7210530b      	bset	21259,#0
4263                     ; 1283 }
4266  002d 5b03          	addw	sp,#3
4267  002f 81            	ret	
4280                     	xdef	_TIM2_ClearITPendingBit
4281                     	xdef	_TIM2_GetITStatus
4282                     	xdef	_TIM2_ClearFlag
4283                     	xdef	_TIM2_GetFlagStatus
4284                     	xdef	_TIM2_GetPrescaler
4285                     	xdef	_TIM2_GetCounter
4286                     	xdef	_TIM2_GetCapture3
4287                     	xdef	_TIM2_GetCapture2
4288                     	xdef	_TIM2_GetCapture1
4289                     	xdef	_TIM2_SetIC3Prescaler
4290                     	xdef	_TIM2_SetIC2Prescaler
4291                     	xdef	_TIM2_SetIC1Prescaler
4292                     	xdef	_TIM2_SetCompare3
4293                     	xdef	_TIM2_SetCompare2
4294                     	xdef	_TIM2_SetCompare1
4295                     	xdef	_TIM2_SetAutoreload
4296                     	xdef	_TIM2_SetCounter
4297                     	xdef	_TIM2_SelectOCxM
4298                     	xdef	_TIM2_CCxCmd
4299                     	xdef	_TIM2_OC3PolarityConfig
4300                     	xdef	_TIM2_OC2PolarityConfig
4301                     	xdef	_TIM2_OC1PolarityConfig
4302                     	xdef	_TIM2_GenerateEvent
4303                     	xdef	_TIM2_OC3PreloadConfig
4304                     	xdef	_TIM2_OC2PreloadConfig
4305                     	xdef	_TIM2_OC1PreloadConfig
4306                     	xdef	_TIM2_ARRPreloadConfig
4307                     	xdef	_TIM2_ForcedOC3Config
4308                     	xdef	_TIM2_ForcedOC2Config
4309                     	xdef	_TIM2_ForcedOC1Config
4310                     	xdef	_TIM2_PrescalerConfig
4311                     	xdef	_TIM2_SelectOnePulseMode
4312                     	xdef	_TIM2_UpdateRequestConfig
4313                     	xdef	_TIM2_UpdateDisableConfig
4314                     	xdef	_TIM2_ITConfig
4315                     	xdef	_TIM2_Cmd
4316                     	xdef	_TIM2_PWMIConfig
4317                     	xdef	_TIM2_ICInit
4318                     	xdef	_TIM2_OC3Init
4319                     	xdef	_TIM2_OC2Init
4320                     	xdef	_TIM2_OC1Init
4321                     	xdef	_TIM2_TimeBaseInit
4322                     	xdef	_TIM2_DeInit
4341                     	end

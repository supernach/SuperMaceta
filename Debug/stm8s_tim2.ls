   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  46                     ; 52 void TIM2_DeInit(void)
  46                     ; 53 {
  48                     .text:	section	.text,new
  49  0000               _TIM2_DeInit:
  53                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  55  0000 725f5300      	clr	21248
  56                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  58  0004 725f5303      	clr	21251
  59                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  61  0008 725f5305      	clr	21253
  62                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  64  000c 725f530a      	clr	21258
  65                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  67  0010 725f530b      	clr	21259
  68                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  70  0014 725f530a      	clr	21258
  71                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  73  0018 725f530b      	clr	21259
  74                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  76  001c 725f5307      	clr	21255
  77                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  79  0020 725f5308      	clr	21256
  80                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  82  0024 725f5309      	clr	21257
  83                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  85  0028 725f530c      	clr	21260
  86                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  88  002c 725f530d      	clr	21261
  89                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  91  0030 725f530e      	clr	21262
  92                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  94  0034 35ff530f      	mov	21263,#255
  95                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  97  0038 35ff5310      	mov	21264,#255
  98                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
 100  003c 725f5311      	clr	21265
 101                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 103  0040 725f5312      	clr	21266
 104                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 106  0044 725f5313      	clr	21267
 107                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 109  0048 725f5314      	clr	21268
 110                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 112  004c 725f5315      	clr	21269
 113                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 115  0050 725f5316      	clr	21270
 116                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 118  0054 725f5304      	clr	21252
 119                     ; 81 }
 122  0058 81            	ret	
 290                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 290                     ; 90                         uint16_t TIM2_Period)
 290                     ; 91 {
 291                     .text:	section	.text,new
 292  0000               _TIM2_TimeBaseInit:
 294       ffffffff      OFST: set -1
 297                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 299  0000 c7530e        	ld	21262,a
 300                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 302  0003 7b03          	ld	a,(OFST+4,sp)
 303  0005 c7530f        	ld	21263,a
 304                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
 306  0008 7b04          	ld	a,(OFST+5,sp)
 307  000a c75310        	ld	21264,a
 308                     ; 97 }
 311  000d 81            	ret	
 468                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 468                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
 468                     ; 110                   uint16_t TIM2_Pulse,
 468                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 468                     ; 112 {
 469                     .text:	section	.text,new
 470  0000               _TIM2_OC1Init:
 472  0000 89            	pushw	x
 473  0001 88            	push	a
 474       00000001      OFST:	set	1
 477                     ; 114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 479                     ; 115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 481                     ; 116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 483                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 485  0002 c6530a        	ld	a,21258
 486  0005 a4fc          	and	a,#252
 487  0007 c7530a        	ld	21258,a
 488                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 488                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 490  000a 7b08          	ld	a,(OFST+7,sp)
 491  000c a402          	and	a,#2
 492  000e 6b01          	ld	(OFST+0,sp),a
 494  0010 9f            	ld	a,xl
 495  0011 a401          	and	a,#1
 496  0013 1a01          	or	a,(OFST+0,sp)
 497  0015 ca530a        	or	a,21258
 498  0018 c7530a        	ld	21258,a
 499                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 499                     ; 126                           (uint8_t)TIM2_OCMode);
 501  001b c65307        	ld	a,21255
 502  001e a48f          	and	a,#143
 503  0020 1a02          	or	a,(OFST+1,sp)
 504  0022 c75307        	ld	21255,a
 505                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 507  0025 7b06          	ld	a,(OFST+5,sp)
 508  0027 c75311        	ld	21265,a
 509                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 511  002a 7b07          	ld	a,(OFST+6,sp)
 512  002c c75312        	ld	21266,a
 513                     ; 131 }
 516  002f 5b03          	addw	sp,#3
 517  0031 81            	ret	
 581                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 581                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 581                     ; 144                   uint16_t TIM2_Pulse,
 581                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 581                     ; 146 {
 582                     .text:	section	.text,new
 583  0000               _TIM2_OC2Init:
 585  0000 89            	pushw	x
 586  0001 88            	push	a
 587       00000001      OFST:	set	1
 590                     ; 148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 592                     ; 149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 594                     ; 150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 596                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 598  0002 c6530a        	ld	a,21258
 599  0005 a4cf          	and	a,#207
 600  0007 c7530a        	ld	21258,a
 601                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 601                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 603  000a 7b08          	ld	a,(OFST+7,sp)
 604  000c a420          	and	a,#32
 605  000e 6b01          	ld	(OFST+0,sp),a
 607  0010 9f            	ld	a,xl
 608  0011 a410          	and	a,#16
 609  0013 1a01          	or	a,(OFST+0,sp)
 610  0015 ca530a        	or	a,21258
 611  0018 c7530a        	ld	21258,a
 612                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 612                     ; 162                           (uint8_t)TIM2_OCMode);
 614  001b c65308        	ld	a,21256
 615  001e a48f          	and	a,#143
 616  0020 1a02          	or	a,(OFST+1,sp)
 617  0022 c75308        	ld	21256,a
 618                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 620  0025 7b06          	ld	a,(OFST+5,sp)
 621  0027 c75313        	ld	21267,a
 622                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 624  002a 7b07          	ld	a,(OFST+6,sp)
 625  002c c75314        	ld	21268,a
 626                     ; 168 }
 629  002f 5b03          	addw	sp,#3
 630  0031 81            	ret	
 694                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 694                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 694                     ; 181                   uint16_t TIM2_Pulse,
 694                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 694                     ; 183 {
 695                     .text:	section	.text,new
 696  0000               _TIM2_OC3Init:
 698  0000 89            	pushw	x
 699  0001 88            	push	a
 700       00000001      OFST:	set	1
 703                     ; 185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 705                     ; 186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 707                     ; 187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 709                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 711  0002 c6530b        	ld	a,21259
 712  0005 a4fc          	and	a,#252
 713  0007 c7530b        	ld	21259,a
 714                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 714                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 716  000a 7b08          	ld	a,(OFST+7,sp)
 717  000c a402          	and	a,#2
 718  000e 6b01          	ld	(OFST+0,sp),a
 720  0010 9f            	ld	a,xl
 721  0011 a401          	and	a,#1
 722  0013 1a01          	or	a,(OFST+0,sp)
 723  0015 ca530b        	or	a,21259
 724  0018 c7530b        	ld	21259,a
 725                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 725                     ; 196                           (uint8_t)TIM2_OCMode);
 727  001b c65309        	ld	a,21257
 728  001e a48f          	and	a,#143
 729  0020 1a02          	or	a,(OFST+1,sp)
 730  0022 c75309        	ld	21257,a
 731                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 733  0025 7b06          	ld	a,(OFST+5,sp)
 734  0027 c75315        	ld	21269,a
 735                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 737  002a 7b07          	ld	a,(OFST+6,sp)
 738  002c c75316        	ld	21270,a
 739                     ; 201 }
 742  002f 5b03          	addw	sp,#3
 743  0031 81            	ret	
 936                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 936                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 936                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 936                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 936                     ; 216                  uint8_t TIM2_ICFilter)
 936                     ; 217 {
 937                     .text:	section	.text,new
 938  0000               _TIM2_ICInit:
 940  0000 89            	pushw	x
 941       00000000      OFST:	set	0
 944                     ; 219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
 946                     ; 220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 948                     ; 221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 950                     ; 222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 952                     ; 223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
 954                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
 956  0001 9e            	ld	a,xh
 957  0002 4d            	tnz	a
 958  0003 2614          	jrne	L104
 959                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
 959                     ; 229                (uint8_t)TIM2_ICSelection,
 959                     ; 230                (uint8_t)TIM2_ICFilter);
 961  0005 7b07          	ld	a,(OFST+7,sp)
 962  0007 88            	push	a
 963  0008 7b06          	ld	a,(OFST+6,sp)
 964  000a 97            	ld	xl,a
 965  000b 7b03          	ld	a,(OFST+3,sp)
 966  000d 95            	ld	xh,a
 967  000e cd0000        	call	L3_TI1_Config
 969  0011 84            	pop	a
 970                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 972  0012 7b06          	ld	a,(OFST+6,sp)
 973  0014 cd0000        	call	_TIM2_SetIC1Prescaler
 976  0017 202b          	jra	L304
 977  0019               L104:
 978                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
 980  0019 7b01          	ld	a,(OFST+1,sp)
 981  001b 4a            	dec	a
 982  001c 2614          	jrne	L504
 983                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
 983                     ; 239                (uint8_t)TIM2_ICSelection,
 983                     ; 240                (uint8_t)TIM2_ICFilter);
 985  001e 7b07          	ld	a,(OFST+7,sp)
 986  0020 88            	push	a
 987  0021 7b06          	ld	a,(OFST+6,sp)
 988  0023 97            	ld	xl,a
 989  0024 7b03          	ld	a,(OFST+3,sp)
 990  0026 95            	ld	xh,a
 991  0027 cd0000        	call	L5_TI2_Config
 993  002a 84            	pop	a
 994                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 996  002b 7b06          	ld	a,(OFST+6,sp)
 997  002d cd0000        	call	_TIM2_SetIC2Prescaler
1000  0030 2012          	jra	L304
1001  0032               L504:
1002                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
1002                     ; 249                (uint8_t)TIM2_ICSelection,
1002                     ; 250                (uint8_t)TIM2_ICFilter);
1004  0032 7b07          	ld	a,(OFST+7,sp)
1005  0034 88            	push	a
1006  0035 7b06          	ld	a,(OFST+6,sp)
1007  0037 97            	ld	xl,a
1008  0038 7b03          	ld	a,(OFST+3,sp)
1009  003a 95            	ld	xh,a
1010  003b cd0000        	call	L7_TI3_Config
1012  003e 84            	pop	a
1013                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1015  003f 7b06          	ld	a,(OFST+6,sp)
1016  0041 cd0000        	call	_TIM2_SetIC3Prescaler
1018  0044               L304:
1019                     ; 255 }
1022  0044 85            	popw	x
1023  0045 81            	ret	
1119                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1119                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1119                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1119                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1119                     ; 270                      uint8_t TIM2_ICFilter)
1119                     ; 271 {
1120                     .text:	section	.text,new
1121  0000               _TIM2_PWMIConfig:
1123  0000 89            	pushw	x
1124  0001 89            	pushw	x
1125       00000002      OFST:	set	2
1128                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1130                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1132                     ; 276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1134                     ; 277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1136                     ; 278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1138                     ; 279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1140                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1142  0002 9f            	ld	a,xl
1143  0003 a144          	cp	a,#68
1144  0005 2706          	jreq	L754
1145                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1147  0007 a644          	ld	a,#68
1148  0009 6b01          	ld	(OFST-1,sp),a
1151  000b 2002          	jra	L164
1152  000d               L754:
1153                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1155  000d 0f01          	clr	(OFST-1,sp)
1157  000f               L164:
1158                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1160  000f 7b07          	ld	a,(OFST+5,sp)
1161  0011 4a            	dec	a
1162  0012 2604          	jrne	L364
1163                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1165  0014 a602          	ld	a,#2
1167  0016 2002          	jra	L564
1168  0018               L364:
1169                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1171  0018 a601          	ld	a,#1
1172  001a               L564:
1173  001a 6b02          	ld	(OFST+0,sp),a
1175                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
1177  001c 7b03          	ld	a,(OFST+1,sp)
1178  001e 2626          	jrne	L764
1179                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1179                     ; 305                (uint8_t)TIM2_ICFilter);
1181  0020 7b09          	ld	a,(OFST+7,sp)
1182  0022 88            	push	a
1183  0023 7b08          	ld	a,(OFST+6,sp)
1184  0025 97            	ld	xl,a
1185  0026 7b05          	ld	a,(OFST+3,sp)
1186  0028 95            	ld	xh,a
1187  0029 cd0000        	call	L3_TI1_Config
1189  002c 84            	pop	a
1190                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1192  002d 7b08          	ld	a,(OFST+6,sp)
1193  002f cd0000        	call	_TIM2_SetIC1Prescaler
1195                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1197  0032 7b09          	ld	a,(OFST+7,sp)
1198  0034 88            	push	a
1199  0035 7b03          	ld	a,(OFST+1,sp)
1200  0037 97            	ld	xl,a
1201  0038 7b02          	ld	a,(OFST+0,sp)
1202  003a 95            	ld	xh,a
1203  003b cd0000        	call	L5_TI2_Config
1205  003e 84            	pop	a
1206                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1208  003f 7b08          	ld	a,(OFST+6,sp)
1209  0041 cd0000        	call	_TIM2_SetIC2Prescaler
1212  0044 2024          	jra	L174
1213  0046               L764:
1214                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1214                     ; 320                (uint8_t)TIM2_ICFilter);
1216  0046 7b09          	ld	a,(OFST+7,sp)
1217  0048 88            	push	a
1218  0049 7b08          	ld	a,(OFST+6,sp)
1219  004b 97            	ld	xl,a
1220  004c 7b05          	ld	a,(OFST+3,sp)
1221  004e 95            	ld	xh,a
1222  004f cd0000        	call	L5_TI2_Config
1224  0052 84            	pop	a
1225                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1227  0053 7b08          	ld	a,(OFST+6,sp)
1228  0055 cd0000        	call	_TIM2_SetIC2Prescaler
1230                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1232  0058 7b09          	ld	a,(OFST+7,sp)
1233  005a 88            	push	a
1234  005b 7b03          	ld	a,(OFST+1,sp)
1235  005d 97            	ld	xl,a
1236  005e 7b02          	ld	a,(OFST+0,sp)
1237  0060 95            	ld	xh,a
1238  0061 cd0000        	call	L3_TI1_Config
1240  0064 84            	pop	a
1241                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1243  0065 7b08          	ld	a,(OFST+6,sp)
1244  0067 cd0000        	call	_TIM2_SetIC1Prescaler
1246  006a               L174:
1247                     ; 331 }
1250  006a 5b04          	addw	sp,#4
1251  006c 81            	ret	
1306                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1306                     ; 340 {
1307                     .text:	section	.text,new
1308  0000               _TIM2_Cmd:
1312                     ; 342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1314                     ; 345   if (NewState != DISABLE)
1316  0000 4d            	tnz	a
1317  0001 2705          	jreq	L125
1318                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1320  0003 72105300      	bset	21248,#0
1323  0007 81            	ret	
1324  0008               L125:
1325                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1327  0008 72115300      	bres	21248,#0
1328                     ; 353 }
1331  000c 81            	ret	
1410                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1410                     ; 369 {
1411                     .text:	section	.text,new
1412  0000               _TIM2_ITConfig:
1414  0000 89            	pushw	x
1415       00000000      OFST:	set	0
1418                     ; 371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1420                     ; 372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1422                     ; 374   if (NewState != DISABLE)
1424  0001 9f            	ld	a,xl
1425  0002 4d            	tnz	a
1426  0003 2706          	jreq	L365
1427                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
1429  0005 9e            	ld	a,xh
1430  0006 ca5303        	or	a,21251
1432  0009 2006          	jra	L565
1433  000b               L365:
1434                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
1436  000b 7b01          	ld	a,(OFST+1,sp)
1437  000d 43            	cpl	a
1438  000e c45303        	and	a,21251
1439  0011               L565:
1440  0011 c75303        	ld	21251,a
1441                     ; 384 }
1444  0014 85            	popw	x
1445  0015 81            	ret	
1481                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1481                     ; 393 {
1482                     .text:	section	.text,new
1483  0000               _TIM2_UpdateDisableConfig:
1487                     ; 395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1489                     ; 398   if (NewState != DISABLE)
1491  0000 4d            	tnz	a
1492  0001 2705          	jreq	L506
1493                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1495  0003 72125300      	bset	21248,#1
1498  0007 81            	ret	
1499  0008               L506:
1500                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1502  0008 72135300      	bres	21248,#1
1503                     ; 406 }
1506  000c 81            	ret	
1564                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1564                     ; 417 {
1565                     .text:	section	.text,new
1566  0000               _TIM2_UpdateRequestConfig:
1570                     ; 419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1572                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1574  0000 4d            	tnz	a
1575  0001 2705          	jreq	L736
1576                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1578  0003 72145300      	bset	21248,#2
1581  0007 81            	ret	
1582  0008               L736:
1583                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1585  0008 72155300      	bres	21248,#2
1586                     ; 430 }
1589  000c 81            	ret	
1646                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1646                     ; 441 {
1647                     .text:	section	.text,new
1648  0000               _TIM2_SelectOnePulseMode:
1652                     ; 443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1654                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1656  0000 4d            	tnz	a
1657  0001 2705          	jreq	L176
1658                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1660  0003 72165300      	bset	21248,#3
1663  0007 81            	ret	
1664  0008               L176:
1665                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1667  0008 72175300      	bres	21248,#3
1668                     ; 454 }
1671  000c 81            	ret	
1739                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1739                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1739                     ; 486 {
1740                     .text:	section	.text,new
1741  0000               _TIM2_PrescalerConfig:
1745                     ; 488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
1747                     ; 489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
1749                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
1751  0000 9e            	ld	a,xh
1752  0001 c7530e        	ld	21262,a
1753                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
1755  0004 9f            	ld	a,xl
1756  0005 c75306        	ld	21254,a
1757                     ; 496 }
1760  0008 81            	ret	
1818                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1818                     ; 508 {
1819                     .text:	section	.text,new
1820  0000               _TIM2_ForcedOC1Config:
1822  0000 88            	push	a
1823       00000000      OFST:	set	0
1826                     ; 510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1828                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
1828                     ; 514                             | (uint8_t)TIM2_ForcedAction);
1830  0001 c65307        	ld	a,21255
1831  0004 a48f          	and	a,#143
1832  0006 1a01          	or	a,(OFST+1,sp)
1833  0008 c75307        	ld	21255,a
1834                     ; 515 }
1837  000b 84            	pop	a
1838  000c 81            	ret	
1874                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1874                     ; 527 {
1875                     .text:	section	.text,new
1876  0000               _TIM2_ForcedOC2Config:
1878  0000 88            	push	a
1879       00000000      OFST:	set	0
1882                     ; 529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1884                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
1884                     ; 533                           | (uint8_t)TIM2_ForcedAction);
1886  0001 c65308        	ld	a,21256
1887  0004 a48f          	and	a,#143
1888  0006 1a01          	or	a,(OFST+1,sp)
1889  0008 c75308        	ld	21256,a
1890                     ; 534 }
1893  000b 84            	pop	a
1894  000c 81            	ret	
1930                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1930                     ; 546 {
1931                     .text:	section	.text,new
1932  0000               _TIM2_ForcedOC3Config:
1934  0000 88            	push	a
1935       00000000      OFST:	set	0
1938                     ; 548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1940                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
1940                     ; 552                             | (uint8_t)TIM2_ForcedAction);
1942  0001 c65309        	ld	a,21257
1943  0004 a48f          	and	a,#143
1944  0006 1a01          	or	a,(OFST+1,sp)
1945  0008 c75309        	ld	21257,a
1946                     ; 553 }
1949  000b 84            	pop	a
1950  000c 81            	ret	
1986                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
1986                     ; 562 {
1987                     .text:	section	.text,new
1988  0000               _TIM2_ARRPreloadConfig:
1992                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1994                     ; 567   if (NewState != DISABLE)
1996  0000 4d            	tnz	a
1997  0001 2705          	jreq	L7201
1998                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
2000  0003 721e5300      	bset	21248,#7
2003  0007 81            	ret	
2004  0008               L7201:
2005                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
2007  0008 721f5300      	bres	21248,#7
2008                     ; 575 }
2011  000c 81            	ret	
2047                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2047                     ; 584 {
2048                     .text:	section	.text,new
2049  0000               _TIM2_OC1PreloadConfig:
2053                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2055                     ; 589   if (NewState != DISABLE)
2057  0000 4d            	tnz	a
2058  0001 2705          	jreq	L1501
2059                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2061  0003 72165307      	bset	21255,#3
2064  0007 81            	ret	
2065  0008               L1501:
2066                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2068  0008 72175307      	bres	21255,#3
2069                     ; 597 }
2072  000c 81            	ret	
2108                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2108                     ; 606 {
2109                     .text:	section	.text,new
2110  0000               _TIM2_OC2PreloadConfig:
2114                     ; 608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2116                     ; 611   if (NewState != DISABLE)
2118  0000 4d            	tnz	a
2119  0001 2705          	jreq	L3701
2120                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2122  0003 72165308      	bset	21256,#3
2125  0007 81            	ret	
2126  0008               L3701:
2127                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2129  0008 72175308      	bres	21256,#3
2130                     ; 619 }
2133  000c 81            	ret	
2169                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2169                     ; 628 {
2170                     .text:	section	.text,new
2171  0000               _TIM2_OC3PreloadConfig:
2175                     ; 630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2177                     ; 633   if (NewState != DISABLE)
2179  0000 4d            	tnz	a
2180  0001 2705          	jreq	L5111
2181                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2183  0003 72165309      	bset	21257,#3
2186  0007 81            	ret	
2187  0008               L5111:
2188                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2190  0008 72175309      	bres	21257,#3
2191                     ; 641 }
2194  000c 81            	ret	
2267                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2267                     ; 654 {
2268                     .text:	section	.text,new
2269  0000               _TIM2_GenerateEvent:
2273                     ; 656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2275                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
2277  0000 c75306        	ld	21254,a
2278                     ; 660 }
2281  0003 81            	ret	
2317                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2317                     ; 671 {
2318                     .text:	section	.text,new
2319  0000               _TIM2_OC1PolarityConfig:
2323                     ; 673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2325                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2327  0000 4d            	tnz	a
2328  0001 2705          	jreq	L1711
2329                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2331  0003 7212530a      	bset	21258,#1
2334  0007 81            	ret	
2335  0008               L1711:
2336                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2338  0008 7213530a      	bres	21258,#1
2339                     ; 684 }
2342  000c 81            	ret	
2378                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2378                     ; 695 {
2379                     .text:	section	.text,new
2380  0000               _TIM2_OC2PolarityConfig:
2384                     ; 697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2386                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2388  0000 4d            	tnz	a
2389  0001 2705          	jreq	L3121
2390                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
2392  0003 721a530a      	bset	21258,#5
2395  0007 81            	ret	
2396  0008               L3121:
2397                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2399  0008 721b530a      	bres	21258,#5
2400                     ; 708 }
2403  000c 81            	ret	
2439                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2439                     ; 719 {
2440                     .text:	section	.text,new
2441  0000               _TIM2_OC3PolarityConfig:
2445                     ; 721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2447                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2449  0000 4d            	tnz	a
2450  0001 2705          	jreq	L5321
2451                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
2453  0003 7212530b      	bset	21259,#1
2456  0007 81            	ret	
2457  0008               L5321:
2458                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
2460  0008 7213530b      	bres	21259,#1
2461                     ; 732 }
2464  000c 81            	ret	
2509                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2509                     ; 746 {
2510                     .text:	section	.text,new
2511  0000               _TIM2_CCxCmd:
2513  0000 89            	pushw	x
2514       00000000      OFST:	set	0
2517                     ; 748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2519                     ; 749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2521                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
2523  0001 9e            	ld	a,xh
2524  0002 4d            	tnz	a
2525  0003 2610          	jrne	L3621
2526                     ; 754     if (NewState != DISABLE)
2528  0005 9f            	ld	a,xl
2529  0006 4d            	tnz	a
2530  0007 2706          	jreq	L5621
2531                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
2533  0009 7210530a      	bset	21258,#0
2535  000d 2029          	jra	L1721
2536  000f               L5621:
2537                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2539  000f 7211530a      	bres	21258,#0
2540  0013 2023          	jra	L1721
2541  0015               L3621:
2542                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
2544  0015 7b01          	ld	a,(OFST+1,sp)
2545  0017 4a            	dec	a
2546  0018 2610          	jrne	L3721
2547                     ; 767     if (NewState != DISABLE)
2549  001a 7b02          	ld	a,(OFST+2,sp)
2550  001c 2706          	jreq	L5721
2551                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
2553  001e 7218530a      	bset	21258,#4
2555  0022 2014          	jra	L1721
2556  0024               L5721:
2557                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2559  0024 7219530a      	bres	21258,#4
2560  0028 200e          	jra	L1721
2561  002a               L3721:
2562                     ; 779     if (NewState != DISABLE)
2564  002a 7b02          	ld	a,(OFST+2,sp)
2565  002c 2706          	jreq	L3031
2566                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
2568  002e 7210530b      	bset	21259,#0
2570  0032 2004          	jra	L1721
2571  0034               L3031:
2572                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2574  0034 7211530b      	bres	21259,#0
2575  0038               L1721:
2576                     ; 788 }
2579  0038 85            	popw	x
2580  0039 81            	ret	
2625                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2625                     ; 811 {
2626                     .text:	section	.text,new
2627  0000               _TIM2_SelectOCxM:
2629  0000 89            	pushw	x
2630       00000000      OFST:	set	0
2633                     ; 813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2635                     ; 814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
2637                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
2639  0001 9e            	ld	a,xh
2640  0002 4d            	tnz	a
2641  0003 2610          	jrne	L1331
2642                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2644  0005 7211530a      	bres	21258,#0
2645                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
2645                     ; 823                             | (uint8_t)TIM2_OCMode);
2647  0009 c65307        	ld	a,21255
2648  000c a48f          	and	a,#143
2649  000e 1a02          	or	a,(OFST+2,sp)
2650  0010 c75307        	ld	21255,a
2652  0013 2023          	jra	L3331
2653  0015               L1331:
2654                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
2656  0015 7b01          	ld	a,(OFST+1,sp)
2657  0017 4a            	dec	a
2658  0018 2610          	jrne	L5331
2659                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2661  001a 7219530a      	bres	21258,#4
2662                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
2662                     ; 832                             | (uint8_t)TIM2_OCMode);
2664  001e c65308        	ld	a,21256
2665  0021 a48f          	and	a,#143
2666  0023 1a02          	or	a,(OFST+2,sp)
2667  0025 c75308        	ld	21256,a
2669  0028 200e          	jra	L3331
2670  002a               L5331:
2671                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2673  002a 7211530b      	bres	21259,#0
2674                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2674                     ; 841                             | (uint8_t)TIM2_OCMode);
2676  002e c65309        	ld	a,21257
2677  0031 a48f          	and	a,#143
2678  0033 1a02          	or	a,(OFST+2,sp)
2679  0035 c75309        	ld	21257,a
2680  0038               L3331:
2681                     ; 843 }
2684  0038 85            	popw	x
2685  0039 81            	ret	
2719                     ; 851 void TIM2_SetCounter(uint16_t Counter)
2719                     ; 852 {
2720                     .text:	section	.text,new
2721  0000               _TIM2_SetCounter:
2725                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
2727  0000 9e            	ld	a,xh
2728  0001 c7530c        	ld	21260,a
2729                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
2731  0004 9f            	ld	a,xl
2732  0005 c7530d        	ld	21261,a
2733                     ; 856 }
2736  0008 81            	ret	
2770                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
2770                     ; 865 {
2771                     .text:	section	.text,new
2772  0000               _TIM2_SetAutoreload:
2776                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
2778  0000 9e            	ld	a,xh
2779  0001 c7530f        	ld	21263,a
2780                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
2782  0004 9f            	ld	a,xl
2783  0005 c75310        	ld	21264,a
2784                     ; 869 }
2787  0008 81            	ret	
2821                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
2821                     ; 878 {
2822                     .text:	section	.text,new
2823  0000               _TIM2_SetCompare1:
2827                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
2829  0000 9e            	ld	a,xh
2830  0001 c75311        	ld	21265,a
2831                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
2833  0004 9f            	ld	a,xl
2834  0005 c75312        	ld	21266,a
2835                     ; 882 }
2838  0008 81            	ret	
2872                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
2872                     ; 891 {
2873                     .text:	section	.text,new
2874  0000               _TIM2_SetCompare2:
2878                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
2880  0000 9e            	ld	a,xh
2881  0001 c75313        	ld	21267,a
2882                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
2884  0004 9f            	ld	a,xl
2885  0005 c75314        	ld	21268,a
2886                     ; 895 }
2889  0008 81            	ret	
2923                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
2923                     ; 904 {
2924                     .text:	section	.text,new
2925  0000               _TIM2_SetCompare3:
2929                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
2931  0000 9e            	ld	a,xh
2932  0001 c75315        	ld	21269,a
2933                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
2935  0004 9f            	ld	a,xl
2936  0005 c75316        	ld	21270,a
2937                     ; 908 }
2940  0008 81            	ret	
2976                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
2976                     ; 921 {
2977                     .text:	section	.text,new
2978  0000               _TIM2_SetIC1Prescaler:
2980  0000 88            	push	a
2981       00000000      OFST:	set	0
2984                     ; 923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
2986                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
2986                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
2988  0001 c65307        	ld	a,21255
2989  0004 a4f3          	and	a,#243
2990  0006 1a01          	or	a,(OFST+1,sp)
2991  0008 c75307        	ld	21255,a
2992                     ; 928 }
2995  000b 84            	pop	a
2996  000c 81            	ret	
3032                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3032                     ; 941 {
3033                     .text:	section	.text,new
3034  0000               _TIM2_SetIC2Prescaler:
3036  0000 88            	push	a
3037       00000000      OFST:	set	0
3040                     ; 943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3042                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3042                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
3044  0001 c65308        	ld	a,21256
3045  0004 a4f3          	and	a,#243
3046  0006 1a01          	or	a,(OFST+1,sp)
3047  0008 c75308        	ld	21256,a
3048                     ; 948 }
3051  000b 84            	pop	a
3052  000c 81            	ret	
3088                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3088                     ; 961 {
3089                     .text:	section	.text,new
3090  0000               _TIM2_SetIC3Prescaler:
3092  0000 88            	push	a
3093       00000000      OFST:	set	0
3096                     ; 964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3098                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3098                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
3100  0001 c65309        	ld	a,21257
3101  0004 a4f3          	and	a,#243
3102  0006 1a01          	or	a,(OFST+1,sp)
3103  0008 c75309        	ld	21257,a
3104                     ; 968 }
3107  000b 84            	pop	a
3108  000c 81            	ret	
3160                     ; 975 uint16_t TIM2_GetCapture1(void)
3160                     ; 976 {
3161                     .text:	section	.text,new
3162  0000               _TIM2_GetCapture1:
3164  0000 5204          	subw	sp,#4
3165       00000004      OFST:	set	4
3168                     ; 978   uint16_t tmpccr1 = 0;
3170                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
3174                     ; 981   tmpccr1h = TIM2->CCR1H;
3176  0002 c65311        	ld	a,21265
3177  0005 6b02          	ld	(OFST-2,sp),a
3179                     ; 982   tmpccr1l = TIM2->CCR1L;
3181  0007 c65312        	ld	a,21266
3182  000a 6b01          	ld	(OFST-3,sp),a
3184                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
3186  000c 5f            	clrw	x
3187  000d 97            	ld	xl,a
3188  000e 1f03          	ldw	(OFST-1,sp),x
3190                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3192  0010 5f            	clrw	x
3193  0011 7b02          	ld	a,(OFST-2,sp)
3194  0013 97            	ld	xl,a
3195  0014 7b04          	ld	a,(OFST+0,sp)
3196  0016 01            	rrwa	x,a
3197  0017 1a03          	or	a,(OFST-1,sp)
3198  0019 01            	rrwa	x,a
3200                     ; 987   return (uint16_t)tmpccr1;
3204  001a 5b04          	addw	sp,#4
3205  001c 81            	ret	
3257                     ; 995 uint16_t TIM2_GetCapture2(void)
3257                     ; 996 {
3258                     .text:	section	.text,new
3259  0000               _TIM2_GetCapture2:
3261  0000 5204          	subw	sp,#4
3262       00000004      OFST:	set	4
3265                     ; 998   uint16_t tmpccr2 = 0;
3267                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
3271                     ; 1001   tmpccr2h = TIM2->CCR2H;
3273  0002 c65313        	ld	a,21267
3274  0005 6b02          	ld	(OFST-2,sp),a
3276                     ; 1002   tmpccr2l = TIM2->CCR2L;
3278  0007 c65314        	ld	a,21268
3279  000a 6b01          	ld	(OFST-3,sp),a
3281                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
3283  000c 5f            	clrw	x
3284  000d 97            	ld	xl,a
3285  000e 1f03          	ldw	(OFST-1,sp),x
3287                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3289  0010 5f            	clrw	x
3290  0011 7b02          	ld	a,(OFST-2,sp)
3291  0013 97            	ld	xl,a
3292  0014 7b04          	ld	a,(OFST+0,sp)
3293  0016 01            	rrwa	x,a
3294  0017 1a03          	or	a,(OFST-1,sp)
3295  0019 01            	rrwa	x,a
3297                     ; 1007   return (uint16_t)tmpccr2;
3301  001a 5b04          	addw	sp,#4
3302  001c 81            	ret	
3354                     ; 1015 uint16_t TIM2_GetCapture3(void)
3354                     ; 1016 {
3355                     .text:	section	.text,new
3356  0000               _TIM2_GetCapture3:
3358  0000 5204          	subw	sp,#4
3359       00000004      OFST:	set	4
3362                     ; 1018   uint16_t tmpccr3 = 0;
3364                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
3368                     ; 1021   tmpccr3h = TIM2->CCR3H;
3370  0002 c65315        	ld	a,21269
3371  0005 6b02          	ld	(OFST-2,sp),a
3373                     ; 1022   tmpccr3l = TIM2->CCR3L;
3375  0007 c65316        	ld	a,21270
3376  000a 6b01          	ld	(OFST-3,sp),a
3378                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
3380  000c 5f            	clrw	x
3381  000d 97            	ld	xl,a
3382  000e 1f03          	ldw	(OFST-1,sp),x
3384                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
3386  0010 5f            	clrw	x
3387  0011 7b02          	ld	a,(OFST-2,sp)
3388  0013 97            	ld	xl,a
3389  0014 7b04          	ld	a,(OFST+0,sp)
3390  0016 01            	rrwa	x,a
3391  0017 1a03          	or	a,(OFST-1,sp)
3392  0019 01            	rrwa	x,a
3394                     ; 1027   return (uint16_t)tmpccr3;
3398  001a 5b04          	addw	sp,#4
3399  001c 81            	ret	
3433                     ; 1035 uint16_t TIM2_GetCounter(void)
3433                     ; 1036 {
3434                     .text:	section	.text,new
3435  0000               _TIM2_GetCounter:
3437  0000 89            	pushw	x
3438       00000002      OFST:	set	2
3441                     ; 1037   uint16_t tmpcntr = 0;
3443                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
3445  0001 c6530c        	ld	a,21260
3446  0004 97            	ld	xl,a
3447  0005 4f            	clr	a
3448  0006 02            	rlwa	x,a
3449  0007 1f01          	ldw	(OFST-1,sp),x
3451                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
3453  0009 c6530d        	ld	a,21261
3454  000c 5f            	clrw	x
3455  000d 97            	ld	xl,a
3456  000e 01            	rrwa	x,a
3457  000f 1a02          	or	a,(OFST+0,sp)
3458  0011 01            	rrwa	x,a
3459  0012 1a01          	or	a,(OFST-1,sp)
3460  0014 01            	rrwa	x,a
3463  0015 5b02          	addw	sp,#2
3464  0017 81            	ret	
3488                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3488                     ; 1050 {
3489                     .text:	section	.text,new
3490  0000               _TIM2_GetPrescaler:
3494                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3496  0000 c6530e        	ld	a,21262
3499  0003 81            	ret	
3638                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3638                     ; 1069 {
3639                     .text:	section	.text,new
3640  0000               _TIM2_GetFlagStatus:
3642  0000 89            	pushw	x
3643  0001 89            	pushw	x
3644       00000002      OFST:	set	2
3647                     ; 1070   FlagStatus bitstatus = RESET;
3649                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3653                     ; 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
3655                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
3657  0002 9f            	ld	a,xl
3658  0003 c45304        	and	a,21252
3659  0006 6b01          	ld	(OFST-1,sp),a
3661                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
3663  0008 7b03          	ld	a,(OFST+1,sp)
3664  000a 6b02          	ld	(OFST+0,sp),a
3666                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
3668  000c c45305        	and	a,21253
3669  000f 1a01          	or	a,(OFST-1,sp)
3670  0011 2702          	jreq	L5371
3671                     ; 1081     bitstatus = SET;
3673  0013 a601          	ld	a,#1
3676  0015               L5371:
3677                     ; 1085     bitstatus = RESET;
3680                     ; 1087   return (FlagStatus)bitstatus;
3684  0015 5b04          	addw	sp,#4
3685  0017 81            	ret	
3720                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3720                     ; 1104 {
3721                     .text:	section	.text,new
3722  0000               _TIM2_ClearFlag:
3726                     ; 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
3728                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
3730  0000 9f            	ld	a,xl
3731  0001 43            	cpl	a
3732  0002 c75304        	ld	21252,a
3733                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
3735  0005 35ff5305      	mov	21253,#255
3736                     ; 1111 }
3739  0009 81            	ret	
3803                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3803                     ; 1124 {
3804                     .text:	section	.text,new
3805  0000               _TIM2_GetITStatus:
3807  0000 88            	push	a
3808  0001 89            	pushw	x
3809       00000002      OFST:	set	2
3812                     ; 1125   ITStatus bitstatus = RESET;
3814                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
3818                     ; 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
3820                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
3822  0002 c45304        	and	a,21252
3823  0005 6b01          	ld	(OFST-1,sp),a
3825                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
3827  0007 c65303        	ld	a,21251
3828  000a 1403          	and	a,(OFST+1,sp)
3829  000c 6b02          	ld	(OFST+0,sp),a
3831                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
3833  000e 7b01          	ld	a,(OFST-1,sp)
3834  0010 2708          	jreq	L1102
3836  0012 7b02          	ld	a,(OFST+0,sp)
3837  0014 2704          	jreq	L1102
3838                     ; 1137     bitstatus = SET;
3840  0016 a601          	ld	a,#1
3843  0018 2001          	jra	L3102
3844  001a               L1102:
3845                     ; 1141     bitstatus = RESET;
3847  001a 4f            	clr	a
3849  001b               L3102:
3850                     ; 1143   return (ITStatus)(bitstatus);
3854  001b 5b03          	addw	sp,#3
3855  001d 81            	ret	
3891                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3891                     ; 1157 {
3892                     .text:	section	.text,new
3893  0000               _TIM2_ClearITPendingBit:
3897                     ; 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
3899                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
3901  0000 43            	cpl	a
3902  0001 c75304        	ld	21252,a
3903                     ; 1163 }
3906  0004 81            	ret	
3958                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
3958                     ; 1182                        uint8_t TIM2_ICSelection,
3958                     ; 1183                        uint8_t TIM2_ICFilter)
3958                     ; 1184 {
3959                     .text:	section	.text,new
3960  0000               L3_TI1_Config:
3962  0000 89            	pushw	x
3963  0001 88            	push	a
3964       00000001      OFST:	set	1
3967                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3969  0002 7211530a      	bres	21258,#0
3970                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
3970                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
3972  0006 7b06          	ld	a,(OFST+5,sp)
3973  0008 97            	ld	xl,a
3974  0009 a610          	ld	a,#16
3975  000b 42            	mul	x,a
3976  000c 9f            	ld	a,xl
3977  000d 1a03          	or	a,(OFST+2,sp)
3978  000f 6b01          	ld	(OFST+0,sp),a
3980  0011 c65307        	ld	a,21255
3981  0014 a40c          	and	a,#12
3982  0016 1a01          	or	a,(OFST+0,sp)
3983  0018 c75307        	ld	21255,a
3984                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
3986  001b 7b02          	ld	a,(OFST+1,sp)
3987  001d 2706          	jreq	L1602
3988                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
3990  001f 7212530a      	bset	21258,#1
3992  0023 2004          	jra	L3602
3993  0025               L1602:
3994                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
3996  0025 7213530a      	bres	21258,#1
3997  0029               L3602:
3998                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
4000  0029 7210530a      	bset	21258,#0
4001                     ; 1203 }
4004  002d 5b03          	addw	sp,#3
4005  002f 81            	ret	
4057                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
4057                     ; 1222                        uint8_t TIM2_ICSelection,
4057                     ; 1223                        uint8_t TIM2_ICFilter)
4057                     ; 1224 {
4058                     .text:	section	.text,new
4059  0000               L5_TI2_Config:
4061  0000 89            	pushw	x
4062  0001 88            	push	a
4063       00000001      OFST:	set	1
4066                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
4068  0002 7219530a      	bres	21258,#4
4069                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
4069                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4071  0006 7b06          	ld	a,(OFST+5,sp)
4072  0008 97            	ld	xl,a
4073  0009 a610          	ld	a,#16
4074  000b 42            	mul	x,a
4075  000c 9f            	ld	a,xl
4076  000d 1a03          	or	a,(OFST+2,sp)
4077  000f 6b01          	ld	(OFST+0,sp),a
4079  0011 c65308        	ld	a,21256
4080  0014 a40c          	and	a,#12
4081  0016 1a01          	or	a,(OFST+0,sp)
4082  0018 c75308        	ld	21256,a
4083                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4085  001b 7b02          	ld	a,(OFST+1,sp)
4086  001d 2706          	jreq	L3112
4087                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
4089  001f 721a530a      	bset	21258,#5
4091  0023 2004          	jra	L5112
4092  0025               L3112:
4093                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4095  0025 721b530a      	bres	21258,#5
4096  0029               L5112:
4097                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
4099  0029 7218530a      	bset	21258,#4
4100                     ; 1245 }
4103  002d 5b03          	addw	sp,#3
4104  002f 81            	ret	
4156                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4156                     ; 1262                        uint8_t TIM2_ICFilter)
4156                     ; 1263 {
4157                     .text:	section	.text,new
4158  0000               L7_TI3_Config:
4160  0000 89            	pushw	x
4161  0001 88            	push	a
4162       00000001      OFST:	set	1
4165                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4167  0002 7211530b      	bres	21259,#0
4168                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4168                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4170  0006 7b06          	ld	a,(OFST+5,sp)
4171  0008 97            	ld	xl,a
4172  0009 a610          	ld	a,#16
4173  000b 42            	mul	x,a
4174  000c 9f            	ld	a,xl
4175  000d 1a03          	or	a,(OFST+2,sp)
4176  000f 6b01          	ld	(OFST+0,sp),a
4178  0011 c65309        	ld	a,21257
4179  0014 a40c          	and	a,#12
4180  0016 1a01          	or	a,(OFST+0,sp)
4181  0018 c75309        	ld	21257,a
4182                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4184  001b 7b02          	ld	a,(OFST+1,sp)
4185  001d 2706          	jreq	L5412
4186                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
4188  001f 7212530b      	bset	21259,#1
4190  0023 2004          	jra	L7412
4191  0025               L5412:
4192                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4194  0025 7213530b      	bres	21259,#1
4195  0029               L7412:
4196                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
4198  0029 7210530b      	bset	21259,#0
4199                     ; 1283 }
4202  002d 5b03          	addw	sp,#3
4203  002f 81            	ret	
4216                     	xdef	_TIM2_ClearITPendingBit
4217                     	xdef	_TIM2_GetITStatus
4218                     	xdef	_TIM2_ClearFlag
4219                     	xdef	_TIM2_GetFlagStatus
4220                     	xdef	_TIM2_GetPrescaler
4221                     	xdef	_TIM2_GetCounter
4222                     	xdef	_TIM2_GetCapture3
4223                     	xdef	_TIM2_GetCapture2
4224                     	xdef	_TIM2_GetCapture1
4225                     	xdef	_TIM2_SetIC3Prescaler
4226                     	xdef	_TIM2_SetIC2Prescaler
4227                     	xdef	_TIM2_SetIC1Prescaler
4228                     	xdef	_TIM2_SetCompare3
4229                     	xdef	_TIM2_SetCompare2
4230                     	xdef	_TIM2_SetCompare1
4231                     	xdef	_TIM2_SetAutoreload
4232                     	xdef	_TIM2_SetCounter
4233                     	xdef	_TIM2_SelectOCxM
4234                     	xdef	_TIM2_CCxCmd
4235                     	xdef	_TIM2_OC3PolarityConfig
4236                     	xdef	_TIM2_OC2PolarityConfig
4237                     	xdef	_TIM2_OC1PolarityConfig
4238                     	xdef	_TIM2_GenerateEvent
4239                     	xdef	_TIM2_OC3PreloadConfig
4240                     	xdef	_TIM2_OC2PreloadConfig
4241                     	xdef	_TIM2_OC1PreloadConfig
4242                     	xdef	_TIM2_ARRPreloadConfig
4243                     	xdef	_TIM2_ForcedOC3Config
4244                     	xdef	_TIM2_ForcedOC2Config
4245                     	xdef	_TIM2_ForcedOC1Config
4246                     	xdef	_TIM2_PrescalerConfig
4247                     	xdef	_TIM2_SelectOnePulseMode
4248                     	xdef	_TIM2_UpdateRequestConfig
4249                     	xdef	_TIM2_UpdateDisableConfig
4250                     	xdef	_TIM2_ITConfig
4251                     	xdef	_TIM2_Cmd
4252                     	xdef	_TIM2_PWMIConfig
4253                     	xdef	_TIM2_ICInit
4254                     	xdef	_TIM2_OC3Init
4255                     	xdef	_TIM2_OC2Init
4256                     	xdef	_TIM2_OC1Init
4257                     	xdef	_TIM2_TimeBaseInit
4258                     	xdef	_TIM2_DeInit
4277                     	end

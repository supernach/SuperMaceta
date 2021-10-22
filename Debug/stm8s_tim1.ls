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
 110                     ; 58 void TIM1_DeInit(void)
 110                     ; 59 {
 112                     .text:	section	.text,new
 113  0000               _TIM1_DeInit:
 117                     ; 60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
 119  0000 725f5250      	clr	21072
 120                     ; 61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
 122  0004 725f5251      	clr	21073
 123                     ; 62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
 125  0008 725f5252      	clr	21074
 126                     ; 63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
 128  000c 725f5253      	clr	21075
 129                     ; 64   TIM1->IER  = TIM1_IER_RESET_VALUE;
 131  0010 725f5254      	clr	21076
 132                     ; 65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
 134  0014 725f5256      	clr	21078
 135                     ; 67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
 137  0018 725f525c      	clr	21084
 138                     ; 68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
 140  001c 725f525d      	clr	21085
 141                     ; 70   TIM1->CCMR1 = 0x01;
 143  0020 35015258      	mov	21080,#1
 144                     ; 71   TIM1->CCMR2 = 0x01;
 146  0024 35015259      	mov	21081,#1
 147                     ; 72   TIM1->CCMR3 = 0x01;
 149  0028 3501525a      	mov	21082,#1
 150                     ; 73   TIM1->CCMR4 = 0x01;
 152  002c 3501525b      	mov	21083,#1
 153                     ; 75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
 155  0030 725f525c      	clr	21084
 156                     ; 76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
 158  0034 725f525d      	clr	21085
 159                     ; 77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
 161  0038 725f5258      	clr	21080
 162                     ; 78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
 164  003c 725f5259      	clr	21081
 165                     ; 79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 167  0040 725f525a      	clr	21082
 168                     ; 80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 170  0044 725f525b      	clr	21083
 171                     ; 81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 173  0048 725f525e      	clr	21086
 174                     ; 82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 176  004c 725f525f      	clr	21087
 177                     ; 83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 179  0050 725f5260      	clr	21088
 180                     ; 84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 182  0054 725f5261      	clr	21089
 183                     ; 85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 185  0058 35ff5262      	mov	21090,#255
 186                     ; 86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 188  005c 35ff5263      	mov	21091,#255
 189                     ; 87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 191  0060 725f5265      	clr	21093
 192                     ; 88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 194  0064 725f5266      	clr	21094
 195                     ; 89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 197  0068 725f5267      	clr	21095
 198                     ; 90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 200  006c 725f5268      	clr	21096
 201                     ; 91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 203  0070 725f5269      	clr	21097
 204                     ; 92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 206  0074 725f526a      	clr	21098
 207                     ; 93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 209  0078 725f526b      	clr	21099
 210                     ; 94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 212  007c 725f526c      	clr	21100
 213                     ; 95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 215  0080 725f526f      	clr	21103
 216                     ; 96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 218  0084 35015257      	mov	21079,#1
 219                     ; 97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 221  0088 725f526e      	clr	21102
 222                     ; 98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 224  008c 725f526d      	clr	21101
 225                     ; 99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 227  0090 725f5264      	clr	21092
 228                     ; 100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 230  0094 725f5255      	clr	21077
 231                     ; 101 }
 234  0098 81            	ret	
 343                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 343                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 343                     ; 113                        uint16_t TIM1_Period,
 343                     ; 114                        uint8_t TIM1_RepetitionCounter)
 343                     ; 115 {
 344                     .text:	section	.text,new
 345  0000               _TIM1_TimeBaseInit:
 347       fffffffe      OFST: set -2
 350                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 352                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 354  0000 7b04          	ld	a,(OFST+6,sp)
 355  0002 c75262        	ld	21090,a
 356                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 358  0005 7b05          	ld	a,(OFST+7,sp)
 359  0007 c75263        	ld	21091,a
 360                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 362  000a 9e            	ld	a,xh
 363  000b c75260        	ld	21088,a
 364                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 366  000e 9f            	ld	a,xl
 367  000f c75261        	ld	21089,a
 368                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 368                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 370  0012 c65250        	ld	a,21072
 371  0015 a48f          	and	a,#143
 372  0017 1a03          	or	a,(OFST+5,sp)
 373  0019 c75250        	ld	21072,a
 374                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 376  001c 7b06          	ld	a,(OFST+8,sp)
 377  001e c75264        	ld	21092,a
 378                     ; 133 }
 381  0021 81            	ret	
 666                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 666                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 666                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 666                     ; 157                   uint16_t TIM1_Pulse,
 666                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 666                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 666                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 666                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 666                     ; 162 {
 667                     .text:	section	.text,new
 668  0000               _TIM1_OC1Init:
 670  0000 89            	pushw	x
 671  0001 5203          	subw	sp,#3
 672       00000003      OFST:	set	3
 675                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 677                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 679                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 681                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 683                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 685                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 687                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 689                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 689                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 691  0003 c6525c        	ld	a,21084
 692  0006 a4f0          	and	a,#240
 693  0008 c7525c        	ld	21084,a
 694                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 694                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 694                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 694                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 696  000b 7b0c          	ld	a,(OFST+9,sp)
 697  000d a408          	and	a,#8
 698  000f 6b03          	ld	(OFST+0,sp),a
 700  0011 7b0b          	ld	a,(OFST+8,sp)
 701  0013 a402          	and	a,#2
 702  0015 1a03          	or	a,(OFST+0,sp)
 703  0017 6b02          	ld	(OFST-1,sp),a
 705  0019 7b08          	ld	a,(OFST+5,sp)
 706  001b a404          	and	a,#4
 707  001d 6b01          	ld	(OFST-2,sp),a
 709  001f 9f            	ld	a,xl
 710  0020 a401          	and	a,#1
 711  0022 1a01          	or	a,(OFST-2,sp)
 712  0024 1a02          	or	a,(OFST-1,sp)
 713  0026 ca525c        	or	a,21084
 714  0029 c7525c        	ld	21084,a
 715                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 715                     ; 185                           (uint8_t)TIM1_OCMode);
 717  002c c65258        	ld	a,21080
 718  002f a48f          	and	a,#143
 719  0031 1a04          	or	a,(OFST+1,sp)
 720  0033 c75258        	ld	21080,a
 721                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 723  0036 c6526f        	ld	a,21103
 724  0039 a4fc          	and	a,#252
 725  003b c7526f        	ld	21103,a
 726                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 726                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 728  003e 7b0e          	ld	a,(OFST+11,sp)
 729  0040 a402          	and	a,#2
 730  0042 6b03          	ld	(OFST+0,sp),a
 732  0044 7b0d          	ld	a,(OFST+10,sp)
 733  0046 a401          	and	a,#1
 734  0048 1a03          	or	a,(OFST+0,sp)
 735  004a ca526f        	or	a,21103
 736  004d c7526f        	ld	21103,a
 737                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 739  0050 7b09          	ld	a,(OFST+6,sp)
 740  0052 c75265        	ld	21093,a
 741                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 743  0055 7b0a          	ld	a,(OFST+7,sp)
 744  0057 c75266        	ld	21094,a
 745                     ; 196 }
 748  005a 5b05          	addw	sp,#5
 749  005c 81            	ret	
 853                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 853                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 853                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 853                     ; 220                   uint16_t TIM1_Pulse,
 853                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 853                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 853                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 853                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 853                     ; 225 {
 854                     .text:	section	.text,new
 855  0000               _TIM1_OC2Init:
 857  0000 89            	pushw	x
 858  0001 5203          	subw	sp,#3
 859       00000003      OFST:	set	3
 862                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 864                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 866                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 868                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 870                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 872                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 874                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 876                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 876                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 878  0003 c6525c        	ld	a,21084
 879  0006 a40f          	and	a,#15
 880  0008 c7525c        	ld	21084,a
 881                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 881                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 881                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 881                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 883  000b 7b0c          	ld	a,(OFST+9,sp)
 884  000d a480          	and	a,#128
 885  000f 6b03          	ld	(OFST+0,sp),a
 887  0011 7b0b          	ld	a,(OFST+8,sp)
 888  0013 a420          	and	a,#32
 889  0015 1a03          	or	a,(OFST+0,sp)
 890  0017 6b02          	ld	(OFST-1,sp),a
 892  0019 7b08          	ld	a,(OFST+5,sp)
 893  001b a440          	and	a,#64
 894  001d 6b01          	ld	(OFST-2,sp),a
 896  001f 9f            	ld	a,xl
 897  0020 a410          	and	a,#16
 898  0022 1a01          	or	a,(OFST-2,sp)
 899  0024 1a02          	or	a,(OFST-1,sp)
 900  0026 ca525c        	or	a,21084
 901  0029 c7525c        	ld	21084,a
 902                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 902                     ; 249                           (uint8_t)TIM1_OCMode);
 904  002c c65259        	ld	a,21081
 905  002f a48f          	and	a,#143
 906  0031 1a04          	or	a,(OFST+1,sp)
 907  0033 c75259        	ld	21081,a
 908                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 910  0036 c6526f        	ld	a,21103
 911  0039 a4f3          	and	a,#243
 912  003b c7526f        	ld	21103,a
 913                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 913                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 915  003e 7b0e          	ld	a,(OFST+11,sp)
 916  0040 a408          	and	a,#8
 917  0042 6b03          	ld	(OFST+0,sp),a
 919  0044 7b0d          	ld	a,(OFST+10,sp)
 920  0046 a404          	and	a,#4
 921  0048 1a03          	or	a,(OFST+0,sp)
 922  004a ca526f        	or	a,21103
 923  004d c7526f        	ld	21103,a
 924                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 926  0050 7b09          	ld	a,(OFST+6,sp)
 927  0052 c75267        	ld	21095,a
 928                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 930  0055 7b0a          	ld	a,(OFST+7,sp)
 931  0057 c75268        	ld	21096,a
 932                     ; 260 }
 935  005a 5b05          	addw	sp,#5
 936  005c 81            	ret	
1040                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1040                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
1040                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1040                     ; 284                   uint16_t TIM1_Pulse,
1040                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1040                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1040                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1040                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1040                     ; 289 {
1041                     .text:	section	.text,new
1042  0000               _TIM1_OC3Init:
1044  0000 89            	pushw	x
1045  0001 5203          	subw	sp,#3
1046       00000003      OFST:	set	3
1049                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1051                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1053                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
1055                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1057                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1059                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1061                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1063                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
1063                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1065  0003 c6525d        	ld	a,21085
1066  0006 a4f0          	and	a,#240
1067  0008 c7525d        	ld	21085,a
1068                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
1068                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
1068                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
1068                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
1070  000b 7b0c          	ld	a,(OFST+9,sp)
1071  000d a408          	and	a,#8
1072  000f 6b03          	ld	(OFST+0,sp),a
1074  0011 7b0b          	ld	a,(OFST+8,sp)
1075  0013 a402          	and	a,#2
1076  0015 1a03          	or	a,(OFST+0,sp)
1077  0017 6b02          	ld	(OFST-1,sp),a
1079  0019 7b08          	ld	a,(OFST+5,sp)
1080  001b a404          	and	a,#4
1081  001d 6b01          	ld	(OFST-2,sp),a
1083  001f 9f            	ld	a,xl
1084  0020 a401          	and	a,#1
1085  0022 1a01          	or	a,(OFST-2,sp)
1086  0024 1a02          	or	a,(OFST-1,sp)
1087  0026 ca525d        	or	a,21085
1088  0029 c7525d        	ld	21085,a
1089                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1089                     ; 312                           (uint8_t)TIM1_OCMode);
1091  002c c6525a        	ld	a,21082
1092  002f a48f          	and	a,#143
1093  0031 1a04          	or	a,(OFST+1,sp)
1094  0033 c7525a        	ld	21082,a
1095                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1097  0036 c6526f        	ld	a,21103
1098  0039 a4cf          	and	a,#207
1099  003b c7526f        	ld	21103,a
1100                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1100                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1102  003e 7b0e          	ld	a,(OFST+11,sp)
1103  0040 a420          	and	a,#32
1104  0042 6b03          	ld	(OFST+0,sp),a
1106  0044 7b0d          	ld	a,(OFST+10,sp)
1107  0046 a410          	and	a,#16
1108  0048 1a03          	or	a,(OFST+0,sp)
1109  004a ca526f        	or	a,21103
1110  004d c7526f        	ld	21103,a
1111                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1113  0050 7b09          	ld	a,(OFST+6,sp)
1114  0052 c75269        	ld	21097,a
1115                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1117  0055 7b0a          	ld	a,(OFST+7,sp)
1118  0057 c7526a        	ld	21098,a
1119                     ; 323 }
1122  005a 5b05          	addw	sp,#5
1123  005c 81            	ret	
1197                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1197                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
1197                     ; 340                   uint16_t TIM1_Pulse,
1197                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1197                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1197                     ; 343 {
1198                     .text:	section	.text,new
1199  0000               _TIM1_OC4Init:
1201  0000 89            	pushw	x
1202  0001 88            	push	a
1203       00000001      OFST:	set	1
1206                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1208                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1210                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1212                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1214                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1216  0002 c6525d        	ld	a,21085
1217  0005 a4cf          	and	a,#207
1218  0007 c7525d        	ld	21085,a
1219                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1219                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1221  000a 7b08          	ld	a,(OFST+7,sp)
1222  000c a420          	and	a,#32
1223  000e 6b01          	ld	(OFST+0,sp),a
1225  0010 9f            	ld	a,xl
1226  0011 a410          	and	a,#16
1227  0013 1a01          	or	a,(OFST+0,sp)
1228  0015 ca525d        	or	a,21085
1229  0018 c7525d        	ld	21085,a
1230                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1230                     ; 358                           TIM1_OCMode);
1232  001b c6525b        	ld	a,21083
1233  001e a48f          	and	a,#143
1234  0020 1a02          	or	a,(OFST+1,sp)
1235  0022 c7525b        	ld	21083,a
1236                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1238  0025 7b09          	ld	a,(OFST+8,sp)
1239  0027 270a          	jreq	L774
1240                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1242  0029 c6526f        	ld	a,21103
1243  002c aadf          	or	a,#223
1244  002e c7526f        	ld	21103,a
1246  0031 2004          	jra	L105
1247  0033               L774:
1248                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1250  0033 721d526f      	bres	21103,#6
1251  0037               L105:
1252                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1254  0037 7b06          	ld	a,(OFST+5,sp)
1255  0039 c7526b        	ld	21099,a
1256                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1258  003c 7b07          	ld	a,(OFST+6,sp)
1259  003e c7526c        	ld	21100,a
1260                     ; 373 }
1263  0041 5b03          	addw	sp,#3
1264  0043 81            	ret	
1469                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1469                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1469                     ; 390                      uint8_t TIM1_DeadTime,
1469                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
1469                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1469                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1469                     ; 394 {
1470                     .text:	section	.text,new
1471  0000               _TIM1_BDTRConfig:
1473  0000 89            	pushw	x
1474  0001 88            	push	a
1475       00000001      OFST:	set	1
1478                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1480                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1482                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1484                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1486                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1488                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1490  0002 7b06          	ld	a,(OFST+5,sp)
1491  0004 c7526e        	ld	21102,a
1492                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1492                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1492                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
1494  0007 7b07          	ld	a,(OFST+6,sp)
1495  0009 1a08          	or	a,(OFST+7,sp)
1496  000b 1a09          	or	a,(OFST+8,sp)
1497  000d 6b01          	ld	(OFST+0,sp),a
1499  000f 9f            	ld	a,xl
1500  0010 1a02          	or	a,(OFST+1,sp)
1501  0012 1a01          	or	a,(OFST+0,sp)
1502  0014 c7526d        	ld	21101,a
1503                     ; 409 }
1506  0017 5b03          	addw	sp,#3
1507  0019 81            	ret	
1709                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1709                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1709                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1709                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1709                     ; 427                  uint8_t TIM1_ICFilter)
1709                     ; 428 {
1710                     .text:	section	.text,new
1711  0000               _TIM1_ICInit:
1713  0000 89            	pushw	x
1714       00000000      OFST:	set	0
1717                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1719                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1721                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1723                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1725                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1727                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
1729  0001 9e            	ld	a,xh
1730  0002 4d            	tnz	a
1731  0003 2614          	jrne	L137
1732                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
1732                     ; 440                (uint8_t)TIM1_ICSelection,
1732                     ; 441                (uint8_t)TIM1_ICFilter);
1734  0005 7b07          	ld	a,(OFST+7,sp)
1735  0007 88            	push	a
1736  0008 7b06          	ld	a,(OFST+6,sp)
1737  000a 97            	ld	xl,a
1738  000b 7b03          	ld	a,(OFST+3,sp)
1739  000d 95            	ld	xh,a
1740  000e cd0000        	call	L54_TI1_Config
1742  0011 84            	pop	a
1743                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1745  0012 7b06          	ld	a,(OFST+6,sp)
1746  0014 cd0000        	call	_TIM1_SetIC1Prescaler
1749  0017 2044          	jra	L337
1750  0019               L137:
1751                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
1753  0019 7b01          	ld	a,(OFST+1,sp)
1754  001b a101          	cp	a,#1
1755  001d 2614          	jrne	L537
1756                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
1756                     ; 449                (uint8_t)TIM1_ICSelection,
1756                     ; 450                (uint8_t)TIM1_ICFilter);
1758  001f 7b07          	ld	a,(OFST+7,sp)
1759  0021 88            	push	a
1760  0022 7b06          	ld	a,(OFST+6,sp)
1761  0024 97            	ld	xl,a
1762  0025 7b03          	ld	a,(OFST+3,sp)
1763  0027 95            	ld	xh,a
1764  0028 cd0000        	call	L74_TI2_Config
1766  002b 84            	pop	a
1767                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1769  002c 7b06          	ld	a,(OFST+6,sp)
1770  002e cd0000        	call	_TIM1_SetIC2Prescaler
1773  0031 202a          	jra	L337
1774  0033               L537:
1775                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
1777  0033 a102          	cp	a,#2
1778  0035 2614          	jrne	L147
1779                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
1779                     ; 458                (uint8_t)TIM1_ICSelection,
1779                     ; 459                (uint8_t)TIM1_ICFilter);
1781  0037 7b07          	ld	a,(OFST+7,sp)
1782  0039 88            	push	a
1783  003a 7b06          	ld	a,(OFST+6,sp)
1784  003c 97            	ld	xl,a
1785  003d 7b03          	ld	a,(OFST+3,sp)
1786  003f 95            	ld	xh,a
1787  0040 cd0000        	call	L15_TI3_Config
1789  0043 84            	pop	a
1790                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1792  0044 7b06          	ld	a,(OFST+6,sp)
1793  0046 cd0000        	call	_TIM1_SetIC3Prescaler
1796  0049 2012          	jra	L337
1797  004b               L147:
1798                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
1798                     ; 467                (uint8_t)TIM1_ICSelection,
1798                     ; 468                (uint8_t)TIM1_ICFilter);
1800  004b 7b07          	ld	a,(OFST+7,sp)
1801  004d 88            	push	a
1802  004e 7b06          	ld	a,(OFST+6,sp)
1803  0050 97            	ld	xl,a
1804  0051 7b03          	ld	a,(OFST+3,sp)
1805  0053 95            	ld	xh,a
1806  0054 cd0000        	call	L35_TI4_Config
1808  0057 84            	pop	a
1809                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1811  0058 7b06          	ld	a,(OFST+6,sp)
1812  005a cd0000        	call	_TIM1_SetIC4Prescaler
1814  005d               L337:
1815                     ; 472 }
1818  005d 85            	popw	x
1819  005e 81            	ret	
1915                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1915                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1915                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1915                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1915                     ; 492                      uint8_t TIM1_ICFilter)
1915                     ; 493 {
1916                     .text:	section	.text,new
1917  0000               _TIM1_PWMIConfig:
1919  0000 89            	pushw	x
1920  0001 89            	pushw	x
1921       00000002      OFST:	set	2
1924                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
1926                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
1928                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1930                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1932                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1934                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1936                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1938  0002 9f            	ld	a,xl
1939  0003 4a            	dec	a
1940  0004 2702          	jreq	L3101
1941                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
1943  0006 a601          	ld	a,#1
1945  0008               L3101:
1946                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
1948  0008 6b01          	ld	(OFST-1,sp),a
1950                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1952  000a 7b07          	ld	a,(OFST+5,sp)
1953  000c 4a            	dec	a
1954  000d 2604          	jrne	L7101
1955                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
1957  000f a602          	ld	a,#2
1959  0011 2002          	jra	L1201
1960  0013               L7101:
1961                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
1963  0013 a601          	ld	a,#1
1964  0015               L1201:
1965  0015 6b02          	ld	(OFST+0,sp),a
1967                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
1969  0017 7b03          	ld	a,(OFST+1,sp)
1970  0019 2626          	jrne	L3201
1971                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1971                     ; 527                (uint8_t)TIM1_ICFilter);
1973  001b 7b09          	ld	a,(OFST+7,sp)
1974  001d 88            	push	a
1975  001e 7b08          	ld	a,(OFST+6,sp)
1976  0020 97            	ld	xl,a
1977  0021 7b05          	ld	a,(OFST+3,sp)
1978  0023 95            	ld	xh,a
1979  0024 cd0000        	call	L54_TI1_Config
1981  0027 84            	pop	a
1982                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1984  0028 7b08          	ld	a,(OFST+6,sp)
1985  002a cd0000        	call	_TIM1_SetIC1Prescaler
1987                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1989  002d 7b09          	ld	a,(OFST+7,sp)
1990  002f 88            	push	a
1991  0030 7b03          	ld	a,(OFST+1,sp)
1992  0032 97            	ld	xl,a
1993  0033 7b02          	ld	a,(OFST+0,sp)
1994  0035 95            	ld	xh,a
1995  0036 cd0000        	call	L74_TI2_Config
1997  0039 84            	pop	a
1998                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2000  003a 7b08          	ld	a,(OFST+6,sp)
2001  003c cd0000        	call	_TIM1_SetIC2Prescaler
2004  003f 2024          	jra	L5201
2005  0041               L3201:
2006                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
2006                     ; 542                (uint8_t)TIM1_ICFilter);
2008  0041 7b09          	ld	a,(OFST+7,sp)
2009  0043 88            	push	a
2010  0044 7b08          	ld	a,(OFST+6,sp)
2011  0046 97            	ld	xl,a
2012  0047 7b05          	ld	a,(OFST+3,sp)
2013  0049 95            	ld	xh,a
2014  004a cd0000        	call	L74_TI2_Config
2016  004d 84            	pop	a
2017                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2019  004e 7b08          	ld	a,(OFST+6,sp)
2020  0050 cd0000        	call	_TIM1_SetIC2Prescaler
2022                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
2024  0053 7b09          	ld	a,(OFST+7,sp)
2025  0055 88            	push	a
2026  0056 7b03          	ld	a,(OFST+1,sp)
2027  0058 97            	ld	xl,a
2028  0059 7b02          	ld	a,(OFST+0,sp)
2029  005b 95            	ld	xh,a
2030  005c cd0000        	call	L54_TI1_Config
2032  005f 84            	pop	a
2033                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2035  0060 7b08          	ld	a,(OFST+6,sp)
2036  0062 cd0000        	call	_TIM1_SetIC1Prescaler
2038  0065               L5201:
2039                     ; 553 }
2042  0065 5b04          	addw	sp,#4
2043  0067 81            	ret	
2098                     ; 561 void TIM1_Cmd(FunctionalState NewState)
2098                     ; 562 {
2099                     .text:	section	.text,new
2100  0000               _TIM1_Cmd:
2104                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2106                     ; 567   if (NewState != DISABLE)
2108  0000 4d            	tnz	a
2109  0001 2705          	jreq	L5501
2110                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
2112  0003 72105250      	bset	21072,#0
2115  0007 81            	ret	
2116  0008               L5501:
2117                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2119  0008 72115250      	bres	21072,#0
2120                     ; 575 }
2123  000c 81            	ret	
2159                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2159                     ; 584 {
2160                     .text:	section	.text,new
2161  0000               _TIM1_CtrlPWMOutputs:
2165                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2167                     ; 590   if (NewState != DISABLE)
2169  0000 4d            	tnz	a
2170  0001 2705          	jreq	L7701
2171                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
2173  0003 721e526d      	bset	21101,#7
2176  0007 81            	ret	
2177  0008               L7701:
2178                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2180  0008 721f526d      	bres	21101,#7
2181                     ; 598 }
2184  000c 81            	ret	
2291                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2291                     ; 618 {
2292                     .text:	section	.text,new
2293  0000               _TIM1_ITConfig:
2295  0000 89            	pushw	x
2296       00000000      OFST:	set	0
2299                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
2301                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2303                     ; 623   if (NewState != DISABLE)
2305  0001 9f            	ld	a,xl
2306  0002 4d            	tnz	a
2307  0003 2706          	jreq	L1511
2308                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
2310  0005 9e            	ld	a,xh
2311  0006 ca5254        	or	a,21076
2313  0009 2006          	jra	L3511
2314  000b               L1511:
2315                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2317  000b 7b01          	ld	a,(OFST+1,sp)
2318  000d 43            	cpl	a
2319  000e c45254        	and	a,21076
2320  0011               L3511:
2321  0011 c75254        	ld	21076,a
2322                     ; 633 }
2325  0014 85            	popw	x
2326  0015 81            	ret	
2350                     ; 640 void TIM1_InternalClockConfig(void)
2350                     ; 641 {
2351                     .text:	section	.text,new
2352  0000               _TIM1_InternalClockConfig:
2356                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2358  0000 c65252        	ld	a,21074
2359  0003 a4f8          	and	a,#248
2360  0005 c75252        	ld	21074,a
2361                     ; 644 }
2364  0008 81            	ret	
2481                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2481                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2481                     ; 664                               uint8_t ExtTRGFilter)
2481                     ; 665 {
2482                     .text:	section	.text,new
2483  0000               _TIM1_ETRClockMode1Config:
2485  0000 89            	pushw	x
2486       00000000      OFST:	set	0
2489                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2491                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2493                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2495  0001 7b05          	ld	a,(OFST+5,sp)
2496  0003 88            	push	a
2497  0004 7b02          	ld	a,(OFST+2,sp)
2498  0006 95            	ld	xh,a
2499  0007 cd0000        	call	_TIM1_ETRConfig
2501  000a 84            	pop	a
2502                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
2502                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2504  000b c65252        	ld	a,21074
2505  000e aa77          	or	a,#119
2506  0010 c75252        	ld	21074,a
2507                     ; 676 }
2510  0013 85            	popw	x
2511  0014 81            	ret	
2569                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2569                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2569                     ; 696                               uint8_t ExtTRGFilter)
2569                     ; 697 {
2570                     .text:	section	.text,new
2571  0000               _TIM1_ETRClockMode2Config:
2573  0000 89            	pushw	x
2574       00000000      OFST:	set	0
2577                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2579                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2581                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2583  0001 7b05          	ld	a,(OFST+5,sp)
2584  0003 88            	push	a
2585  0004 7b02          	ld	a,(OFST+2,sp)
2586  0006 95            	ld	xh,a
2587  0007 cd0000        	call	_TIM1_ETRConfig
2589  000a 721c5253      	bset	21075,#6
2590                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
2592                     ; 707 }
2595  000e 5b03          	addw	sp,#3
2596  0010 81            	ret	
2652                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2652                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2652                     ; 727                     uint8_t ExtTRGFilter)
2652                     ; 728 {
2653                     .text:	section	.text,new
2654  0000               _TIM1_ETRConfig:
2656  0000 89            	pushw	x
2657       00000000      OFST:	set	0
2660                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
2662                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
2662                     ; 733                          (uint8_t)ExtTRGFilter );
2664  0001 9f            	ld	a,xl
2665  0002 1a01          	or	a,(OFST+1,sp)
2666  0004 1a05          	or	a,(OFST+5,sp)
2667  0006 ca5253        	or	a,21075
2668  0009 c75253        	ld	21075,a
2669                     ; 734 }
2672  000c 85            	popw	x
2673  000d 81            	ret	
2762                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2762                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2762                     ; 753                                  uint8_t ICFilter)
2762                     ; 754 {
2763                     .text:	section	.text,new
2764  0000               _TIM1_TIxExternalClockConfig:
2766  0000 89            	pushw	x
2767       00000000      OFST:	set	0
2770                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2772                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2774                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2776                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2778  0001 9e            	ld	a,xh
2779  0002 a160          	cp	a,#96
2780  0004 260d          	jrne	L3531
2781                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2783  0006 7b05          	ld	a,(OFST+5,sp)
2784  0008 88            	push	a
2785  0009 9f            	ld	a,xl
2786  000a ae0001        	ldw	x,#1
2787  000d 95            	ld	xh,a
2788  000e cd0000        	call	L74_TI2_Config
2791  0011 200c          	jra	L5531
2792  0013               L3531:
2793                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2795  0013 7b05          	ld	a,(OFST+5,sp)
2796  0015 88            	push	a
2797  0016 7b03          	ld	a,(OFST+3,sp)
2798  0018 ae0001        	ldw	x,#1
2799  001b 95            	ld	xh,a
2800  001c cd0000        	call	L54_TI1_Config
2802  001f               L5531:
2803  001f 84            	pop	a
2804                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
2806  0020 7b01          	ld	a,(OFST+1,sp)
2807  0022 cd0000        	call	_TIM1_SelectInputTrigger
2809                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
2811  0025 c65252        	ld	a,21074
2812  0028 aa07          	or	a,#7
2813  002a c75252        	ld	21074,a
2814                     ; 775 }
2817  002d 85            	popw	x
2818  002e 81            	ret	
2903                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2903                     ; 788 {
2904                     .text:	section	.text,new
2905  0000               _TIM1_SelectInputTrigger:
2907  0000 88            	push	a
2908       00000000      OFST:	set	0
2911                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2913                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
2915  0001 c65252        	ld	a,21074
2916  0004 a48f          	and	a,#143
2917  0006 1a01          	or	a,(OFST+1,sp)
2918  0008 c75252        	ld	21074,a
2919                     ; 794 }
2922  000b 84            	pop	a
2923  000c 81            	ret	
2959                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2959                     ; 804 {
2960                     .text:	section	.text,new
2961  0000               _TIM1_UpdateDisableConfig:
2965                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2967                     ; 809   if (NewState != DISABLE)
2969  0000 4d            	tnz	a
2970  0001 2705          	jreq	L3341
2971                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
2973  0003 72125250      	bset	21072,#1
2976  0007 81            	ret	
2977  0008               L3341:
2978                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
2980  0008 72135250      	bres	21072,#1
2981                     ; 817 }
2984  000c 81            	ret	
3042                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
3042                     ; 828 {
3043                     .text:	section	.text,new
3044  0000               _TIM1_UpdateRequestConfig:
3048                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
3050                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
3052  0000 4d            	tnz	a
3053  0001 2705          	jreq	L5641
3054                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
3056  0003 72145250      	bset	21072,#2
3059  0007 81            	ret	
3060  0008               L5641:
3061                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
3063  0008 72155250      	bres	21072,#2
3064                     ; 841 }
3067  000c 81            	ret	
3103                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
3103                     ; 850 {
3104                     .text:	section	.text,new
3105  0000               _TIM1_SelectHallSensor:
3109                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3111                     ; 855   if (NewState != DISABLE)
3113  0000 4d            	tnz	a
3114  0001 2705          	jreq	L7051
3115                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
3117  0003 721e5251      	bset	21073,#7
3120  0007 81            	ret	
3121  0008               L7051:
3122                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3124  0008 721f5251      	bres	21073,#7
3125                     ; 863 }
3128  000c 81            	ret	
3185                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3185                     ; 874 {
3186                     .text:	section	.text,new
3187  0000               _TIM1_SelectOnePulseMode:
3191                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3193                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3195  0000 4d            	tnz	a
3196  0001 2705          	jreq	L1451
3197                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
3199  0003 72165250      	bset	21072,#3
3202  0007 81            	ret	
3203  0008               L1451:
3204                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3206  0008 72175250      	bres	21072,#3
3207                     ; 888 }
3210  000c 81            	ret	
3308                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3308                     ; 904 {
3309                     .text:	section	.text,new
3310  0000               _TIM1_SelectOutputTrigger:
3312  0000 88            	push	a
3313       00000000      OFST:	set	0
3316                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3318                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
3318                     ; 910                         (uint8_t) TIM1_TRGOSource);
3320  0001 c65251        	ld	a,21073
3321  0004 a48f          	and	a,#143
3322  0006 1a01          	or	a,(OFST+1,sp)
3323  0008 c75251        	ld	21073,a
3324                     ; 911 }
3327  000b 84            	pop	a
3328  000c 81            	ret	
3402                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3402                     ; 924 {
3403                     .text:	section	.text,new
3404  0000               _TIM1_SelectSlaveMode:
3406  0000 88            	push	a
3407       00000000      OFST:	set	0
3410                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3412                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
3412                     ; 930                          (uint8_t)TIM1_SlaveMode);
3414  0001 c65252        	ld	a,21074
3415  0004 a4f8          	and	a,#248
3416  0006 1a01          	or	a,(OFST+1,sp)
3417  0008 c75252        	ld	21074,a
3418                     ; 931 }
3421  000b 84            	pop	a
3422  000c 81            	ret	
3458                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3458                     ; 940 {
3459                     .text:	section	.text,new
3460  0000               _TIM1_SelectMasterSlaveMode:
3464                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3466                     ; 945   if (NewState != DISABLE)
3468  0000 4d            	tnz	a
3469  0001 2705          	jreq	L5561
3470                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
3472  0003 721e5252      	bset	21074,#7
3475  0007 81            	ret	
3476  0008               L5561:
3477                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
3479  0008 721f5252      	bres	21074,#7
3480                     ; 953 }
3483  000c 81            	ret	
3569                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3569                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3569                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3569                     ; 978 {
3570                     .text:	section	.text,new
3571  0000               _TIM1_EncoderInterfaceConfig:
3573  0000 89            	pushw	x
3574       00000000      OFST:	set	0
3577                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3579                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3581                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3583                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3585  0001 9f            	ld	a,xl
3586  0002 4d            	tnz	a
3587  0003 2706          	jreq	L1271
3588                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3590  0005 7212525c      	bset	21084,#1
3592  0009 2004          	jra	L3271
3593  000b               L1271:
3594                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3596  000b 7213525c      	bres	21084,#1
3597  000f               L3271:
3598                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3600  000f 7b05          	ld	a,(OFST+5,sp)
3601  0011 2706          	jreq	L5271
3602                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3604  0013 721a525c      	bset	21084,#5
3606  0017 2004          	jra	L7271
3607  0019               L5271:
3608                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3610  0019 721b525c      	bres	21084,#5
3611  001d               L7271:
3612                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
3612                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
3614  001d c65252        	ld	a,21074
3615  0020 a4f0          	and	a,#240
3616  0022 1a01          	or	a,(OFST+1,sp)
3617  0024 c75252        	ld	21074,a
3618                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
3618                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
3620  0027 c65258        	ld	a,21080
3621  002a a4fc          	and	a,#252
3622  002c aa01          	or	a,#1
3623  002e c75258        	ld	21080,a
3624                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
3624                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
3626  0031 c65259        	ld	a,21081
3627  0034 a4fc          	and	a,#252
3628  0036 aa01          	or	a,#1
3629  0038 c75259        	ld	21081,a
3630                     ; 1011 }
3633  003b 85            	popw	x
3634  003c 81            	ret	
3701                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
3701                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3701                     ; 1025 {
3702                     .text:	section	.text,new
3703  0000               _TIM1_PrescalerConfig:
3705       fffffffe      OFST: set -2
3708                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3710                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
3712  0000 9e            	ld	a,xh
3713  0001 c75260        	ld	21088,a
3714                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
3716  0004 9f            	ld	a,xl
3717  0005 c75261        	ld	21089,a
3718                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
3720  0008 7b03          	ld	a,(OFST+5,sp)
3721  000a c75257        	ld	21079,a
3722                     ; 1035 }
3725  000d 81            	ret	
3761                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3761                     ; 1049 {
3762                     .text:	section	.text,new
3763  0000               _TIM1_CounterModeConfig:
3765  0000 88            	push	a
3766       00000000      OFST:	set	0
3769                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3771                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
3771                     ; 1056                         | (uint8_t)TIM1_CounterMode);
3773  0001 c65250        	ld	a,21072
3774  0004 a48f          	and	a,#143
3775  0006 1a01          	or	a,(OFST+1,sp)
3776  0008 c75250        	ld	21072,a
3777                     ; 1057 }
3780  000b 84            	pop	a
3781  000c 81            	ret	
3839                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3839                     ; 1068 {
3840                     .text:	section	.text,new
3841  0000               _TIM1_ForcedOC1Config:
3843  0000 88            	push	a
3844       00000000      OFST:	set	0
3847                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3849                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
3849                     ; 1074                            (uint8_t)TIM1_ForcedAction);
3851  0001 c65258        	ld	a,21080
3852  0004 a48f          	and	a,#143
3853  0006 1a01          	or	a,(OFST+1,sp)
3854  0008 c75258        	ld	21080,a
3855                     ; 1075 }
3858  000b 84            	pop	a
3859  000c 81            	ret	
3895                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3895                     ; 1086 {
3896                     .text:	section	.text,new
3897  0000               _TIM1_ForcedOC2Config:
3899  0000 88            	push	a
3900       00000000      OFST:	set	0
3903                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3905                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
3905                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
3907  0001 c65259        	ld	a,21081
3908  0004 a48f          	and	a,#143
3909  0006 1a01          	or	a,(OFST+1,sp)
3910  0008 c75259        	ld	21081,a
3911                     ; 1093 }
3914  000b 84            	pop	a
3915  000c 81            	ret	
3951                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3951                     ; 1105 {
3952                     .text:	section	.text,new
3953  0000               _TIM1_ForcedOC3Config:
3955  0000 88            	push	a
3956       00000000      OFST:	set	0
3959                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3961                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
3961                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
3963  0001 c6525a        	ld	a,21082
3964  0004 a48f          	and	a,#143
3965  0006 1a01          	or	a,(OFST+1,sp)
3966  0008 c7525a        	ld	21082,a
3967                     ; 1112 }
3970  000b 84            	pop	a
3971  000c 81            	ret	
4007                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
4007                     ; 1124 {
4008                     .text:	section	.text,new
4009  0000               _TIM1_ForcedOC4Config:
4011  0000 88            	push	a
4012       00000000      OFST:	set	0
4015                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
4017                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
4017                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
4019  0001 c6525b        	ld	a,21083
4020  0004 a48f          	and	a,#143
4021  0006 1a01          	or	a,(OFST+1,sp)
4022  0008 c7525b        	ld	21083,a
4023                     ; 1131 }
4026  000b 84            	pop	a
4027  000c 81            	ret	
4063                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
4063                     ; 1140 {
4064                     .text:	section	.text,new
4065  0000               _TIM1_ARRPreloadConfig:
4069                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4071                     ; 1145   if (NewState != DISABLE)
4073  0000 4d            	tnz	a
4074  0001 2705          	jreq	L7112
4075                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
4077  0003 721e5250      	bset	21072,#7
4080  0007 81            	ret	
4081  0008               L7112:
4082                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
4084  0008 721f5250      	bres	21072,#7
4085                     ; 1153 }
4088  000c 81            	ret	
4123                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
4123                     ; 1162 {
4124                     .text:	section	.text,new
4125  0000               _TIM1_SelectCOM:
4129                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4131                     ; 1167   if (NewState != DISABLE)
4133  0000 4d            	tnz	a
4134  0001 2705          	jreq	L1412
4135                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
4137  0003 72145251      	bset	21073,#2
4140  0007 81            	ret	
4141  0008               L1412:
4142                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
4144  0008 72155251      	bres	21073,#2
4145                     ; 1175 }
4148  000c 81            	ret	
4184                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
4184                     ; 1184 {
4185                     .text:	section	.text,new
4186  0000               _TIM1_CCPreloadControl:
4190                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4192                     ; 1189   if (NewState != DISABLE)
4194  0000 4d            	tnz	a
4195  0001 2705          	jreq	L3612
4196                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
4198  0003 72105251      	bset	21073,#0
4201  0007 81            	ret	
4202  0008               L3612:
4203                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4205  0008 72115251      	bres	21073,#0
4206                     ; 1197 }
4209  000c 81            	ret	
4245                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4245                     ; 1206 {
4246                     .text:	section	.text,new
4247  0000               _TIM1_OC1PreloadConfig:
4251                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4253                     ; 1211   if (NewState != DISABLE)
4255  0000 4d            	tnz	a
4256  0001 2705          	jreq	L5022
4257                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4259  0003 72165258      	bset	21080,#3
4262  0007 81            	ret	
4263  0008               L5022:
4264                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4266  0008 72175258      	bres	21080,#3
4267                     ; 1219 }
4270  000c 81            	ret	
4306                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4306                     ; 1228 {
4307                     .text:	section	.text,new
4308  0000               _TIM1_OC2PreloadConfig:
4312                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4314                     ; 1233   if (NewState != DISABLE)
4316  0000 4d            	tnz	a
4317  0001 2705          	jreq	L7222
4318                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4320  0003 72165259      	bset	21081,#3
4323  0007 81            	ret	
4324  0008               L7222:
4325                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4327  0008 72175259      	bres	21081,#3
4328                     ; 1241 }
4331  000c 81            	ret	
4367                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4367                     ; 1250 {
4368                     .text:	section	.text,new
4369  0000               _TIM1_OC3PreloadConfig:
4373                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4375                     ; 1255   if (NewState != DISABLE)
4377  0000 4d            	tnz	a
4378  0001 2705          	jreq	L1522
4379                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4381  0003 7216525a      	bset	21082,#3
4384  0007 81            	ret	
4385  0008               L1522:
4386                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4388  0008 7217525a      	bres	21082,#3
4389                     ; 1263 }
4392  000c 81            	ret	
4428                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4428                     ; 1272 {
4429                     .text:	section	.text,new
4430  0000               _TIM1_OC4PreloadConfig:
4434                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4436                     ; 1277   if (NewState != DISABLE)
4438  0000 4d            	tnz	a
4439  0001 2705          	jreq	L3722
4440                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4442  0003 7216525b      	bset	21083,#3
4445  0007 81            	ret	
4446  0008               L3722:
4447                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4449  0008 7217525b      	bres	21083,#3
4450                     ; 1285 }
4453  000c 81            	ret	
4488                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
4488                     ; 1294 {
4489                     .text:	section	.text,new
4490  0000               _TIM1_OC1FastConfig:
4494                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4496                     ; 1299   if (NewState != DISABLE)
4498  0000 4d            	tnz	a
4499  0001 2705          	jreq	L5132
4500                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4502  0003 72145258      	bset	21080,#2
4505  0007 81            	ret	
4506  0008               L5132:
4507                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4509  0008 72155258      	bres	21080,#2
4510                     ; 1307 }
4513  000c 81            	ret	
4548                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
4548                     ; 1316 {
4549                     .text:	section	.text,new
4550  0000               _TIM1_OC2FastConfig:
4554                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4556                     ; 1321   if (NewState != DISABLE)
4558  0000 4d            	tnz	a
4559  0001 2705          	jreq	L7332
4560                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4562  0003 72145259      	bset	21081,#2
4565  0007 81            	ret	
4566  0008               L7332:
4567                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4569  0008 72155259      	bres	21081,#2
4570                     ; 1329 }
4573  000c 81            	ret	
4608                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
4608                     ; 1338 {
4609                     .text:	section	.text,new
4610  0000               _TIM1_OC3FastConfig:
4614                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4616                     ; 1343   if (NewState != DISABLE)
4618  0000 4d            	tnz	a
4619  0001 2705          	jreq	L1632
4620                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4622  0003 7214525a      	bset	21082,#2
4625  0007 81            	ret	
4626  0008               L1632:
4627                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4629  0008 7215525a      	bres	21082,#2
4630                     ; 1351 }
4633  000c 81            	ret	
4668                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
4668                     ; 1360 {
4669                     .text:	section	.text,new
4670  0000               _TIM1_OC4FastConfig:
4674                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4676                     ; 1365   if (NewState != DISABLE)
4678  0000 4d            	tnz	a
4679  0001 2705          	jreq	L3042
4680                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4682  0003 7214525b      	bset	21083,#2
4685  0007 81            	ret	
4686  0008               L3042:
4687                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4689  0008 7215525b      	bres	21083,#2
4690                     ; 1373 }
4693  000c 81            	ret	
4798                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4798                     ; 1390 {
4799                     .text:	section	.text,new
4800  0000               _TIM1_GenerateEvent:
4804                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4806                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
4808  0000 c75257        	ld	21079,a
4809                     ; 1396 }
4812  0003 81            	ret	
4848                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4848                     ; 1407 {
4849                     .text:	section	.text,new
4850  0000               _TIM1_OC1PolarityConfig:
4854                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4856                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4858  0000 4d            	tnz	a
4859  0001 2705          	jreq	L7642
4860                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4862  0003 7212525c      	bset	21084,#1
4865  0007 81            	ret	
4866  0008               L7642:
4867                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4869  0008 7213525c      	bres	21084,#1
4870                     ; 1420 }
4873  000c 81            	ret	
4909                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4909                     ; 1431 {
4910                     .text:	section	.text,new
4911  0000               _TIM1_OC1NPolarityConfig:
4915                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4917                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4919  0000 4d            	tnz	a
4920  0001 2705          	jreq	L1152
4921                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4923  0003 7216525c      	bset	21084,#3
4926  0007 81            	ret	
4927  0008               L1152:
4928                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
4930  0008 7217525c      	bres	21084,#3
4931                     ; 1444 }
4934  000c 81            	ret	
4970                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4970                     ; 1455 {
4971                     .text:	section	.text,new
4972  0000               _TIM1_OC2PolarityConfig:
4976                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4978                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4980  0000 4d            	tnz	a
4981  0001 2705          	jreq	L3352
4982                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4984  0003 721a525c      	bset	21084,#5
4987  0007 81            	ret	
4988  0008               L3352:
4989                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4991  0008 721b525c      	bres	21084,#5
4992                     ; 1468 }
4995  000c 81            	ret	
5031                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5031                     ; 1479 {
5032                     .text:	section	.text,new
5033  0000               _TIM1_OC2NPolarityConfig:
5037                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5039                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5041  0000 4d            	tnz	a
5042  0001 2705          	jreq	L5552
5043                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
5045  0003 721e525c      	bset	21084,#7
5048  0007 81            	ret	
5049  0008               L5552:
5050                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
5052  0008 721f525c      	bres	21084,#7
5053                     ; 1492 }
5056  000c 81            	ret	
5092                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5092                     ; 1503 {
5093                     .text:	section	.text,new
5094  0000               _TIM1_OC3PolarityConfig:
5098                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5100                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5102  0000 4d            	tnz	a
5103  0001 2705          	jreq	L7752
5104                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
5106  0003 7212525d      	bset	21085,#1
5109  0007 81            	ret	
5110  0008               L7752:
5111                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
5113  0008 7213525d      	bres	21085,#1
5114                     ; 1516 }
5117  000c 81            	ret	
5153                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5153                     ; 1528 {
5154                     .text:	section	.text,new
5155  0000               _TIM1_OC3NPolarityConfig:
5159                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5161                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5163  0000 4d            	tnz	a
5164  0001 2705          	jreq	L1262
5165                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5167  0003 7216525d      	bset	21085,#3
5170  0007 81            	ret	
5171  0008               L1262:
5172                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5174  0008 7217525d      	bres	21085,#3
5175                     ; 1541 }
5178  000c 81            	ret	
5214                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5214                     ; 1552 {
5215                     .text:	section	.text,new
5216  0000               _TIM1_OC4PolarityConfig:
5220                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5222                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5224  0000 4d            	tnz	a
5225  0001 2705          	jreq	L3462
5226                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
5228  0003 721a525d      	bset	21085,#5
5231  0007 81            	ret	
5232  0008               L3462:
5233                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
5235  0008 721b525d      	bres	21085,#5
5236                     ; 1565 }
5239  000c 81            	ret	
5284                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5284                     ; 1580 {
5285                     .text:	section	.text,new
5286  0000               _TIM1_CCxCmd:
5288  0000 89            	pushw	x
5289       00000000      OFST:	set	0
5292                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5294                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5296                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
5298  0001 9e            	ld	a,xh
5299  0002 4d            	tnz	a
5300  0003 2610          	jrne	L1762
5301                     ; 1588     if (NewState != DISABLE)
5303  0005 9f            	ld	a,xl
5304  0006 4d            	tnz	a
5305  0007 2706          	jreq	L3762
5306                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
5308  0009 7210525c      	bset	21084,#0
5310  000d 203e          	jra	L7762
5311  000f               L3762:
5312                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5314  000f 7211525c      	bres	21084,#0
5315  0013 2038          	jra	L7762
5316  0015               L1762:
5317                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
5319  0015 7b01          	ld	a,(OFST+1,sp)
5320  0017 a101          	cp	a,#1
5321  0019 2610          	jrne	L1072
5322                     ; 1601     if (NewState != DISABLE)
5324  001b 7b02          	ld	a,(OFST+2,sp)
5325  001d 2706          	jreq	L3072
5326                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
5328  001f 7218525c      	bset	21084,#4
5330  0023 2028          	jra	L7762
5331  0025               L3072:
5332                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5334  0025 7219525c      	bres	21084,#4
5335  0029 2022          	jra	L7762
5336  002b               L1072:
5337                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
5339  002b a102          	cp	a,#2
5340  002d 2610          	jrne	L1172
5341                     ; 1613     if (NewState != DISABLE)
5343  002f 7b02          	ld	a,(OFST+2,sp)
5344  0031 2706          	jreq	L3172
5345                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
5347  0033 7210525d      	bset	21085,#0
5349  0037 2014          	jra	L7762
5350  0039               L3172:
5351                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5353  0039 7211525d      	bres	21085,#0
5354  003d 200e          	jra	L7762
5355  003f               L1172:
5356                     ; 1625     if (NewState != DISABLE)
5358  003f 7b02          	ld	a,(OFST+2,sp)
5359  0041 2706          	jreq	L1272
5360                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
5362  0043 7218525d      	bset	21085,#4
5364  0047 2004          	jra	L7762
5365  0049               L1272:
5366                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5368  0049 7219525d      	bres	21085,#4
5369  004d               L7762:
5370                     ; 1634 }
5373  004d 85            	popw	x
5374  004e 81            	ret	
5419                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5419                     ; 1648 {
5420                     .text:	section	.text,new
5421  0000               _TIM1_CCxNCmd:
5423  0000 89            	pushw	x
5424       00000000      OFST:	set	0
5427                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5429                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5431                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
5433  0001 9e            	ld	a,xh
5434  0002 4d            	tnz	a
5435  0003 2610          	jrne	L7472
5436                     ; 1656     if (NewState != DISABLE)
5438  0005 9f            	ld	a,xl
5439  0006 4d            	tnz	a
5440  0007 2706          	jreq	L1572
5441                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5443  0009 7214525c      	bset	21084,#2
5445  000d 2029          	jra	L5572
5446  000f               L1572:
5447                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
5449  000f 7215525c      	bres	21084,#2
5450  0013 2023          	jra	L5572
5451  0015               L7472:
5452                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
5454  0015 7b01          	ld	a,(OFST+1,sp)
5455  0017 4a            	dec	a
5456  0018 2610          	jrne	L7572
5457                     ; 1668     if (NewState != DISABLE)
5459  001a 7b02          	ld	a,(OFST+2,sp)
5460  001c 2706          	jreq	L1672
5461                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5463  001e 721c525c      	bset	21084,#6
5465  0022 2014          	jra	L5572
5466  0024               L1672:
5467                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
5469  0024 721d525c      	bres	21084,#6
5470  0028 200e          	jra	L5572
5471  002a               L7572:
5472                     ; 1680     if (NewState != DISABLE)
5474  002a 7b02          	ld	a,(OFST+2,sp)
5475  002c 2706          	jreq	L7672
5476                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5478  002e 7214525d      	bset	21085,#2
5480  0032 2004          	jra	L5572
5481  0034               L7672:
5482                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
5484  0034 7215525d      	bres	21085,#2
5485  0038               L5572:
5486                     ; 1689 }
5489  0038 85            	popw	x
5490  0039 81            	ret	
5535                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5535                     ; 1713 {
5536                     .text:	section	.text,new
5537  0000               _TIM1_SelectOCxM:
5539  0000 89            	pushw	x
5540       00000000      OFST:	set	0
5543                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5545                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5547                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
5549  0001 9e            	ld	a,xh
5550  0002 4d            	tnz	a
5551  0003 2610          	jrne	L5103
5552                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5554  0005 7211525c      	bres	21084,#0
5555                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
5555                     ; 1725                             | (uint8_t)TIM1_OCMode);
5557  0009 c65258        	ld	a,21080
5558  000c a48f          	and	a,#143
5559  000e 1a02          	or	a,(OFST+2,sp)
5560  0010 c75258        	ld	21080,a
5562  0013 2038          	jra	L7103
5563  0015               L5103:
5564                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
5566  0015 7b01          	ld	a,(OFST+1,sp)
5567  0017 a101          	cp	a,#1
5568  0019 2610          	jrne	L1203
5569                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5571  001b 7219525c      	bres	21084,#4
5572                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5572                     ; 1734                             | (uint8_t)TIM1_OCMode);
5574  001f c65259        	ld	a,21081
5575  0022 a48f          	and	a,#143
5576  0024 1a02          	or	a,(OFST+2,sp)
5577  0026 c75259        	ld	21081,a
5579  0029 2022          	jra	L7103
5580  002b               L1203:
5581                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
5583  002b a102          	cp	a,#2
5584  002d 2610          	jrne	L5203
5585                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5587  002f 7211525d      	bres	21085,#0
5588                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
5588                     ; 1743                             | (uint8_t)TIM1_OCMode);
5590  0033 c6525a        	ld	a,21082
5591  0036 a48f          	and	a,#143
5592  0038 1a02          	or	a,(OFST+2,sp)
5593  003a c7525a        	ld	21082,a
5595  003d 200e          	jra	L7103
5596  003f               L5203:
5597                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5599  003f 7219525d      	bres	21085,#4
5600                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5600                     ; 1752                             | (uint8_t)TIM1_OCMode);
5602  0043 c6525b        	ld	a,21083
5603  0046 a48f          	and	a,#143
5604  0048 1a02          	or	a,(OFST+2,sp)
5605  004a c7525b        	ld	21083,a
5606  004d               L7103:
5607                     ; 1754 }
5610  004d 85            	popw	x
5611  004e 81            	ret	
5645                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
5645                     ; 1763 {
5646                     .text:	section	.text,new
5647  0000               _TIM1_SetCounter:
5651                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
5653  0000 9e            	ld	a,xh
5654  0001 c7525e        	ld	21086,a
5655                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
5657  0004 9f            	ld	a,xl
5658  0005 c7525f        	ld	21087,a
5659                     ; 1767 }
5662  0008 81            	ret	
5696                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
5696                     ; 1776 {
5697                     .text:	section	.text,new
5698  0000               _TIM1_SetAutoreload:
5702                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
5704  0000 9e            	ld	a,xh
5705  0001 c75262        	ld	21090,a
5706                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
5708  0004 9f            	ld	a,xl
5709  0005 c75263        	ld	21091,a
5710                     ; 1780  }
5713  0008 81            	ret	
5747                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
5747                     ; 1789 {
5748                     .text:	section	.text,new
5749  0000               _TIM1_SetCompare1:
5753                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
5755  0000 9e            	ld	a,xh
5756  0001 c75265        	ld	21093,a
5757                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
5759  0004 9f            	ld	a,xl
5760  0005 c75266        	ld	21094,a
5761                     ; 1793 }
5764  0008 81            	ret	
5798                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
5798                     ; 1802 {
5799                     .text:	section	.text,new
5800  0000               _TIM1_SetCompare2:
5804                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
5806  0000 9e            	ld	a,xh
5807  0001 c75267        	ld	21095,a
5808                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
5810  0004 9f            	ld	a,xl
5811  0005 c75268        	ld	21096,a
5812                     ; 1806 }
5815  0008 81            	ret	
5849                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
5849                     ; 1815 {
5850                     .text:	section	.text,new
5851  0000               _TIM1_SetCompare3:
5855                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
5857  0000 9e            	ld	a,xh
5858  0001 c75269        	ld	21097,a
5859                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
5861  0004 9f            	ld	a,xl
5862  0005 c7526a        	ld	21098,a
5863                     ; 1819 }
5866  0008 81            	ret	
5900                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
5900                     ; 1828 {
5901                     .text:	section	.text,new
5902  0000               _TIM1_SetCompare4:
5906                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
5908  0000 9e            	ld	a,xh
5909  0001 c7526b        	ld	21099,a
5910                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
5912  0004 9f            	ld	a,xl
5913  0005 c7526c        	ld	21100,a
5914                     ; 1832 }
5917  0008 81            	ret	
5953                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5953                     ; 1845 {
5954                     .text:	section	.text,new
5955  0000               _TIM1_SetIC1Prescaler:
5957  0000 88            	push	a
5958       00000000      OFST:	set	0
5961                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5963                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
5963                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
5965  0001 c65258        	ld	a,21080
5966  0004 a4f3          	and	a,#243
5967  0006 1a01          	or	a,(OFST+1,sp)
5968  0008 c75258        	ld	21080,a
5969                     ; 1852 }
5972  000b 84            	pop	a
5973  000c 81            	ret	
6009                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
6009                     ; 1865 {
6010                     .text:	section	.text,new
6011  0000               _TIM1_SetIC2Prescaler:
6013  0000 88            	push	a
6014       00000000      OFST:	set	0
6017                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
6019                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
6019                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
6021  0001 c65259        	ld	a,21081
6022  0004 a4f3          	and	a,#243
6023  0006 1a01          	or	a,(OFST+1,sp)
6024  0008 c75259        	ld	21081,a
6025                     ; 1873 }
6028  000b 84            	pop	a
6029  000c 81            	ret	
6065                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
6065                     ; 1886 {
6066                     .text:	section	.text,new
6067  0000               _TIM1_SetIC3Prescaler:
6069  0000 88            	push	a
6070       00000000      OFST:	set	0
6073                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
6075                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
6075                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
6077  0001 c6525a        	ld	a,21082
6078  0004 a4f3          	and	a,#243
6079  0006 1a01          	or	a,(OFST+1,sp)
6080  0008 c7525a        	ld	21082,a
6081                     ; 1894 }
6084  000b 84            	pop	a
6085  000c 81            	ret	
6121                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6121                     ; 1907 {
6122                     .text:	section	.text,new
6123  0000               _TIM1_SetIC4Prescaler:
6125  0000 88            	push	a
6126       00000000      OFST:	set	0
6129                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
6131                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
6131                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
6133  0001 c6525b        	ld	a,21083
6134  0004 a4f3          	and	a,#243
6135  0006 1a01          	or	a,(OFST+1,sp)
6136  0008 c7525b        	ld	21083,a
6137                     ; 1915 }
6140  000b 84            	pop	a
6141  000c 81            	ret	
6193                     ; 1922 uint16_t TIM1_GetCapture1(void)
6193                     ; 1923 {
6194                     .text:	section	.text,new
6195  0000               _TIM1_GetCapture1:
6197  0000 5204          	subw	sp,#4
6198       00000004      OFST:	set	4
6201                     ; 1926   uint16_t tmpccr1 = 0;
6203                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
6207                     ; 1929   tmpccr1h = TIM1->CCR1H;
6209  0002 c65265        	ld	a,21093
6210  0005 6b02          	ld	(OFST-2,sp),a
6212                     ; 1930   tmpccr1l = TIM1->CCR1L;
6214  0007 c65266        	ld	a,21094
6215  000a 6b01          	ld	(OFST-3,sp),a
6217                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
6219  000c 5f            	clrw	x
6220  000d 97            	ld	xl,a
6221  000e 1f03          	ldw	(OFST-1,sp),x
6223                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6225  0010 5f            	clrw	x
6226  0011 7b02          	ld	a,(OFST-2,sp)
6227  0013 97            	ld	xl,a
6228  0014 7b04          	ld	a,(OFST+0,sp)
6229  0016 01            	rrwa	x,a
6230  0017 1a03          	or	a,(OFST-1,sp)
6231  0019 01            	rrwa	x,a
6233                     ; 1935   return (uint16_t)tmpccr1;
6237  001a 5b04          	addw	sp,#4
6238  001c 81            	ret	
6290                     ; 1943 uint16_t TIM1_GetCapture2(void)
6290                     ; 1944 {
6291                     .text:	section	.text,new
6292  0000               _TIM1_GetCapture2:
6294  0000 5204          	subw	sp,#4
6295       00000004      OFST:	set	4
6298                     ; 1947   uint16_t tmpccr2 = 0;
6300                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
6304                     ; 1950   tmpccr2h = TIM1->CCR2H;
6306  0002 c65267        	ld	a,21095
6307  0005 6b02          	ld	(OFST-2,sp),a
6309                     ; 1951   tmpccr2l = TIM1->CCR2L;
6311  0007 c65268        	ld	a,21096
6312  000a 6b01          	ld	(OFST-3,sp),a
6314                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
6316  000c 5f            	clrw	x
6317  000d 97            	ld	xl,a
6318  000e 1f03          	ldw	(OFST-1,sp),x
6320                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6322  0010 5f            	clrw	x
6323  0011 7b02          	ld	a,(OFST-2,sp)
6324  0013 97            	ld	xl,a
6325  0014 7b04          	ld	a,(OFST+0,sp)
6326  0016 01            	rrwa	x,a
6327  0017 1a03          	or	a,(OFST-1,sp)
6328  0019 01            	rrwa	x,a
6330                     ; 1956   return (uint16_t)tmpccr2;
6334  001a 5b04          	addw	sp,#4
6335  001c 81            	ret	
6387                     ; 1964 uint16_t TIM1_GetCapture3(void)
6387                     ; 1965 {
6388                     .text:	section	.text,new
6389  0000               _TIM1_GetCapture3:
6391  0000 5204          	subw	sp,#4
6392       00000004      OFST:	set	4
6395                     ; 1967   uint16_t tmpccr3 = 0;
6397                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
6401                     ; 1970   tmpccr3h = TIM1->CCR3H;
6403  0002 c65269        	ld	a,21097
6404  0005 6b02          	ld	(OFST-2,sp),a
6406                     ; 1971   tmpccr3l = TIM1->CCR3L;
6408  0007 c6526a        	ld	a,21098
6409  000a 6b01          	ld	(OFST-3,sp),a
6411                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
6413  000c 5f            	clrw	x
6414  000d 97            	ld	xl,a
6415  000e 1f03          	ldw	(OFST-1,sp),x
6417                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
6419  0010 5f            	clrw	x
6420  0011 7b02          	ld	a,(OFST-2,sp)
6421  0013 97            	ld	xl,a
6422  0014 7b04          	ld	a,(OFST+0,sp)
6423  0016 01            	rrwa	x,a
6424  0017 1a03          	or	a,(OFST-1,sp)
6425  0019 01            	rrwa	x,a
6427                     ; 1976   return (uint16_t)tmpccr3;
6431  001a 5b04          	addw	sp,#4
6432  001c 81            	ret	
6484                     ; 1984 uint16_t TIM1_GetCapture4(void)
6484                     ; 1985 {
6485                     .text:	section	.text,new
6486  0000               _TIM1_GetCapture4:
6488  0000 5204          	subw	sp,#4
6489       00000004      OFST:	set	4
6492                     ; 1987   uint16_t tmpccr4 = 0;
6494                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
6498                     ; 1990   tmpccr4h = TIM1->CCR4H;
6500  0002 c6526b        	ld	a,21099
6501  0005 6b02          	ld	(OFST-2,sp),a
6503                     ; 1991   tmpccr4l = TIM1->CCR4L;
6505  0007 c6526c        	ld	a,21100
6506  000a 6b01          	ld	(OFST-3,sp),a
6508                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
6510  000c 5f            	clrw	x
6511  000d 97            	ld	xl,a
6512  000e 1f03          	ldw	(OFST-1,sp),x
6514                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
6516  0010 5f            	clrw	x
6517  0011 7b02          	ld	a,(OFST-2,sp)
6518  0013 97            	ld	xl,a
6519  0014 7b04          	ld	a,(OFST+0,sp)
6520  0016 01            	rrwa	x,a
6521  0017 1a03          	or	a,(OFST-1,sp)
6522  0019 01            	rrwa	x,a
6524                     ; 1996   return (uint16_t)tmpccr4;
6528  001a 5b04          	addw	sp,#4
6529  001c 81            	ret	
6563                     ; 2004 uint16_t TIM1_GetCounter(void)
6563                     ; 2005 {
6564                     .text:	section	.text,new
6565  0000               _TIM1_GetCounter:
6567  0000 89            	pushw	x
6568       00000002      OFST:	set	2
6571                     ; 2006   uint16_t tmpcntr = 0;
6573                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
6575  0001 c6525e        	ld	a,21086
6576  0004 97            	ld	xl,a
6577  0005 4f            	clr	a
6578  0006 02            	rlwa	x,a
6579  0007 1f01          	ldw	(OFST-1,sp),x
6581                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
6583  0009 c6525f        	ld	a,21087
6584  000c 5f            	clrw	x
6585  000d 97            	ld	xl,a
6586  000e 01            	rrwa	x,a
6587  000f 1a02          	or	a,(OFST+0,sp)
6588  0011 01            	rrwa	x,a
6589  0012 1a01          	or	a,(OFST-1,sp)
6590  0014 01            	rrwa	x,a
6593  0015 5b02          	addw	sp,#2
6594  0017 81            	ret	
6628                     ; 2019 uint16_t TIM1_GetPrescaler(void)
6628                     ; 2020 {
6629                     .text:	section	.text,new
6630  0000               _TIM1_GetPrescaler:
6632  0000 89            	pushw	x
6633       00000002      OFST:	set	2
6636                     ; 2021   uint16_t temp = 0;
6638                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
6640  0001 c65260        	ld	a,21088
6641  0004 97            	ld	xl,a
6642  0005 4f            	clr	a
6643  0006 02            	rlwa	x,a
6644  0007 1f01          	ldw	(OFST-1,sp),x
6646                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
6648  0009 c65261        	ld	a,21089
6649  000c 5f            	clrw	x
6650  000d 97            	ld	xl,a
6651  000e 01            	rrwa	x,a
6652  000f 1a02          	or	a,(OFST+0,sp)
6653  0011 01            	rrwa	x,a
6654  0012 1a01          	or	a,(OFST-1,sp)
6655  0014 01            	rrwa	x,a
6658  0015 5b02          	addw	sp,#2
6659  0017 81            	ret	
6833                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6833                     ; 2048 {
6834                     .text:	section	.text,new
6835  0000               _TIM1_GetFlagStatus:
6837  0000 89            	pushw	x
6838  0001 89            	pushw	x
6839       00000002      OFST:	set	2
6842                     ; 2049   FlagStatus bitstatus = RESET;
6844                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
6848                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6850                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
6852  0002 9f            	ld	a,xl
6853  0003 c45255        	and	a,21077
6854  0006 6b01          	ld	(OFST-1,sp),a
6856                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
6858  0008 7b03          	ld	a,(OFST+1,sp)
6859  000a 6b02          	ld	(OFST+0,sp),a
6861                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
6863  000c c45256        	and	a,21078
6864  000f 1a01          	or	a,(OFST-1,sp)
6865  0011 2702          	jreq	L7253
6866                     ; 2060     bitstatus = SET;
6868  0013 a601          	ld	a,#1
6871  0015               L7253:
6872                     ; 2064     bitstatus = RESET;
6875                     ; 2066   return (FlagStatus)(bitstatus);
6879  0015 5b04          	addw	sp,#4
6880  0017 81            	ret	
6915                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6915                     ; 2088 {
6916                     .text:	section	.text,new
6917  0000               _TIM1_ClearFlag:
6919  0000 89            	pushw	x
6920       00000000      OFST:	set	0
6923                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6925                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
6927  0001 9f            	ld	a,xl
6928  0002 43            	cpl	a
6929  0003 c75255        	ld	21077,a
6930                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
6930                     ; 2095                         (uint8_t)0x1E);
6932  0006 7b01          	ld	a,(OFST+1,sp)
6933  0008 43            	cpl	a
6934  0009 a41e          	and	a,#30
6935  000b c75256        	ld	21078,a
6936                     ; 2096 }
6939  000e 85            	popw	x
6940  000f 81            	ret	
7004                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
7004                     ; 2113 {
7005                     .text:	section	.text,new
7006  0000               _TIM1_GetITStatus:
7008  0000 88            	push	a
7009  0001 89            	pushw	x
7010       00000002      OFST:	set	2
7013                     ; 2114   ITStatus bitstatus = RESET;
7015                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
7019                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
7021                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
7023  0002 c45255        	and	a,21077
7024  0005 6b01          	ld	(OFST-1,sp),a
7026                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
7028  0007 c65254        	ld	a,21076
7029  000a 1403          	and	a,(OFST+1,sp)
7030  000c 6b02          	ld	(OFST+0,sp),a
7032                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
7034  000e 7b01          	ld	a,(OFST-1,sp)
7035  0010 2708          	jreq	L3063
7037  0012 7b02          	ld	a,(OFST+0,sp)
7038  0014 2704          	jreq	L3063
7039                     ; 2126     bitstatus = SET;
7041  0016 a601          	ld	a,#1
7044  0018 2001          	jra	L5063
7045  001a               L3063:
7046                     ; 2130     bitstatus = RESET;
7048  001a 4f            	clr	a
7050  001b               L5063:
7051                     ; 2132   return (ITStatus)(bitstatus);
7055  001b 5b03          	addw	sp,#3
7056  001d 81            	ret	
7092                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
7092                     ; 2150 {
7093                     .text:	section	.text,new
7094  0000               _TIM1_ClearITPendingBit:
7098                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
7100                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
7102  0000 43            	cpl	a
7103  0001 c75255        	ld	21077,a
7104                     ; 2156 }
7107  0004 81            	ret	
7159                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
7159                     ; 2175                        uint8_t TIM1_ICSelection,
7159                     ; 2176                        uint8_t TIM1_ICFilter)
7159                     ; 2177 {
7160                     .text:	section	.text,new
7161  0000               L54_TI1_Config:
7163  0000 89            	pushw	x
7164  0001 88            	push	a
7165       00000001      OFST:	set	1
7168                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7170  0002 7211525c      	bres	21084,#0
7171                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
7171                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7173  0006 7b06          	ld	a,(OFST+5,sp)
7174  0008 97            	ld	xl,a
7175  0009 a610          	ld	a,#16
7176  000b 42            	mul	x,a
7177  000c 9f            	ld	a,xl
7178  000d 1a03          	or	a,(OFST+2,sp)
7179  000f 6b01          	ld	(OFST+0,sp),a
7181  0011 c65258        	ld	a,21080
7182  0014 a40c          	and	a,#12
7183  0016 1a01          	or	a,(OFST+0,sp)
7184  0018 c75258        	ld	21080,a
7185                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7187  001b 7b02          	ld	a,(OFST+1,sp)
7188  001d 2706          	jreq	L3563
7189                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7191  001f 7212525c      	bset	21084,#1
7193  0023 2004          	jra	L5563
7194  0025               L3563:
7195                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7197  0025 7213525c      	bres	21084,#1
7198  0029               L5563:
7199                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7201  0029 7210525c      	bset	21084,#0
7202                     ; 2197 }
7205  002d 5b03          	addw	sp,#3
7206  002f 81            	ret	
7258                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
7258                     ; 2216                        uint8_t TIM1_ICSelection,
7258                     ; 2217                        uint8_t TIM1_ICFilter)
7258                     ; 2218 {
7259                     .text:	section	.text,new
7260  0000               L74_TI2_Config:
7262  0000 89            	pushw	x
7263  0001 88            	push	a
7264       00000001      OFST:	set	1
7267                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7269  0002 7219525c      	bres	21084,#4
7270                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
7270                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7272  0006 7b06          	ld	a,(OFST+5,sp)
7273  0008 97            	ld	xl,a
7274  0009 a610          	ld	a,#16
7275  000b 42            	mul	x,a
7276  000c 9f            	ld	a,xl
7277  000d 1a03          	or	a,(OFST+2,sp)
7278  000f 6b01          	ld	(OFST+0,sp),a
7280  0011 c65259        	ld	a,21081
7281  0014 a40c          	and	a,#12
7282  0016 1a01          	or	a,(OFST+0,sp)
7283  0018 c75259        	ld	21081,a
7284                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7286  001b 7b02          	ld	a,(OFST+1,sp)
7287  001d 2706          	jreq	L5073
7288                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7290  001f 721a525c      	bset	21084,#5
7292  0023 2004          	jra	L7073
7293  0025               L5073:
7294                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7296  0025 721b525c      	bres	21084,#5
7297  0029               L7073:
7298                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7300  0029 7218525c      	bset	21084,#4
7301                     ; 2236 }
7304  002d 5b03          	addw	sp,#3
7305  002f 81            	ret	
7357                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
7357                     ; 2255                        uint8_t TIM1_ICSelection,
7357                     ; 2256                        uint8_t TIM1_ICFilter)
7357                     ; 2257 {
7358                     .text:	section	.text,new
7359  0000               L15_TI3_Config:
7361  0000 89            	pushw	x
7362  0001 88            	push	a
7363       00000001      OFST:	set	1
7366                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7368  0002 7211525d      	bres	21085,#0
7369                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
7369                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7371  0006 7b06          	ld	a,(OFST+5,sp)
7372  0008 97            	ld	xl,a
7373  0009 a610          	ld	a,#16
7374  000b 42            	mul	x,a
7375  000c 9f            	ld	a,xl
7376  000d 1a03          	or	a,(OFST+2,sp)
7377  000f 6b01          	ld	(OFST+0,sp),a
7379  0011 c6525a        	ld	a,21082
7380  0014 a40c          	and	a,#12
7381  0016 1a01          	or	a,(OFST+0,sp)
7382  0018 c7525a        	ld	21082,a
7383                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7385  001b 7b02          	ld	a,(OFST+1,sp)
7386  001d 2706          	jreq	L7373
7387                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
7389  001f 7212525d      	bset	21085,#1
7391  0023 2004          	jra	L1473
7392  0025               L7373:
7393                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7395  0025 7213525d      	bres	21085,#1
7396  0029               L1473:
7397                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7399  0029 7210525d      	bset	21085,#0
7400                     ; 2276 }
7403  002d 5b03          	addw	sp,#3
7404  002f 81            	ret	
7456                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
7456                     ; 2295                        uint8_t TIM1_ICSelection,
7456                     ; 2296                        uint8_t TIM1_ICFilter)
7456                     ; 2297 {
7457                     .text:	section	.text,new
7458  0000               L35_TI4_Config:
7460  0000 89            	pushw	x
7461  0001 88            	push	a
7462       00000001      OFST:	set	1
7465                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7467  0002 7219525d      	bres	21085,#4
7468                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
7468                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7470  0006 7b06          	ld	a,(OFST+5,sp)
7471  0008 97            	ld	xl,a
7472  0009 a610          	ld	a,#16
7473  000b 42            	mul	x,a
7474  000c 9f            	ld	a,xl
7475  000d 1a03          	or	a,(OFST+2,sp)
7476  000f 6b01          	ld	(OFST+0,sp),a
7478  0011 c6525b        	ld	a,21083
7479  0014 a40c          	and	a,#12
7480  0016 1a01          	or	a,(OFST+0,sp)
7481  0018 c7525b        	ld	21083,a
7482                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7484  001b 7b02          	ld	a,(OFST+1,sp)
7485  001d 2706          	jreq	L1773
7486                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
7488  001f 721a525d      	bset	21085,#5
7490  0023 2004          	jra	L3773
7491  0025               L1773:
7492                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
7494  0025 721b525d      	bres	21085,#5
7495  0029               L3773:
7496                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7498  0029 7218525d      	bset	21085,#4
7499                     ; 2317 }
7502  002d 5b03          	addw	sp,#3
7503  002f 81            	ret	
7516                     	xdef	_TIM1_ClearITPendingBit
7517                     	xdef	_TIM1_GetITStatus
7518                     	xdef	_TIM1_ClearFlag
7519                     	xdef	_TIM1_GetFlagStatus
7520                     	xdef	_TIM1_GetPrescaler
7521                     	xdef	_TIM1_GetCounter
7522                     	xdef	_TIM1_GetCapture4
7523                     	xdef	_TIM1_GetCapture3
7524                     	xdef	_TIM1_GetCapture2
7525                     	xdef	_TIM1_GetCapture1
7526                     	xdef	_TIM1_SetIC4Prescaler
7527                     	xdef	_TIM1_SetIC3Prescaler
7528                     	xdef	_TIM1_SetIC2Prescaler
7529                     	xdef	_TIM1_SetIC1Prescaler
7530                     	xdef	_TIM1_SetCompare4
7531                     	xdef	_TIM1_SetCompare3
7532                     	xdef	_TIM1_SetCompare2
7533                     	xdef	_TIM1_SetCompare1
7534                     	xdef	_TIM1_SetAutoreload
7535                     	xdef	_TIM1_SetCounter
7536                     	xdef	_TIM1_SelectOCxM
7537                     	xdef	_TIM1_CCxNCmd
7538                     	xdef	_TIM1_CCxCmd
7539                     	xdef	_TIM1_OC4PolarityConfig
7540                     	xdef	_TIM1_OC3NPolarityConfig
7541                     	xdef	_TIM1_OC3PolarityConfig
7542                     	xdef	_TIM1_OC2NPolarityConfig
7543                     	xdef	_TIM1_OC2PolarityConfig
7544                     	xdef	_TIM1_OC1NPolarityConfig
7545                     	xdef	_TIM1_OC1PolarityConfig
7546                     	xdef	_TIM1_GenerateEvent
7547                     	xdef	_TIM1_OC4FastConfig
7548                     	xdef	_TIM1_OC3FastConfig
7549                     	xdef	_TIM1_OC2FastConfig
7550                     	xdef	_TIM1_OC1FastConfig
7551                     	xdef	_TIM1_OC4PreloadConfig
7552                     	xdef	_TIM1_OC3PreloadConfig
7553                     	xdef	_TIM1_OC2PreloadConfig
7554                     	xdef	_TIM1_OC1PreloadConfig
7555                     	xdef	_TIM1_CCPreloadControl
7556                     	xdef	_TIM1_SelectCOM
7557                     	xdef	_TIM1_ARRPreloadConfig
7558                     	xdef	_TIM1_ForcedOC4Config
7559                     	xdef	_TIM1_ForcedOC3Config
7560                     	xdef	_TIM1_ForcedOC2Config
7561                     	xdef	_TIM1_ForcedOC1Config
7562                     	xdef	_TIM1_CounterModeConfig
7563                     	xdef	_TIM1_PrescalerConfig
7564                     	xdef	_TIM1_EncoderInterfaceConfig
7565                     	xdef	_TIM1_SelectMasterSlaveMode
7566                     	xdef	_TIM1_SelectSlaveMode
7567                     	xdef	_TIM1_SelectOutputTrigger
7568                     	xdef	_TIM1_SelectOnePulseMode
7569                     	xdef	_TIM1_SelectHallSensor
7570                     	xdef	_TIM1_UpdateRequestConfig
7571                     	xdef	_TIM1_UpdateDisableConfig
7572                     	xdef	_TIM1_SelectInputTrigger
7573                     	xdef	_TIM1_TIxExternalClockConfig
7574                     	xdef	_TIM1_ETRConfig
7575                     	xdef	_TIM1_ETRClockMode2Config
7576                     	xdef	_TIM1_ETRClockMode1Config
7577                     	xdef	_TIM1_InternalClockConfig
7578                     	xdef	_TIM1_ITConfig
7579                     	xdef	_TIM1_CtrlPWMOutputs
7580                     	xdef	_TIM1_Cmd
7581                     	xdef	_TIM1_PWMIConfig
7582                     	xdef	_TIM1_ICInit
7583                     	xdef	_TIM1_BDTRConfig
7584                     	xdef	_TIM1_OC4Init
7585                     	xdef	_TIM1_OC3Init
7586                     	xdef	_TIM1_OC2Init
7587                     	xdef	_TIM1_OC1Init
7588                     	xdef	_TIM1_TimeBaseInit
7589                     	xdef	_TIM1_DeInit
7608                     	end

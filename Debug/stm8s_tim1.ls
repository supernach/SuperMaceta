   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  46                     ; 58 void TIM1_DeInit(void)
  46                     ; 59 {
  48                     .text:	section	.text,new
  49  0000               _TIM1_DeInit:
  53                     ; 60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  55  0000 725f5250      	clr	21072
  56                     ; 61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  58  0004 725f5251      	clr	21073
  59                     ; 62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  61  0008 725f5252      	clr	21074
  62                     ; 63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  64  000c 725f5253      	clr	21075
  65                     ; 64   TIM1->IER  = TIM1_IER_RESET_VALUE;
  67  0010 725f5254      	clr	21076
  68                     ; 65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  70  0014 725f5256      	clr	21078
  71                     ; 67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  73  0018 725f525c      	clr	21084
  74                     ; 68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  76  001c 725f525d      	clr	21085
  77                     ; 70   TIM1->CCMR1 = 0x01;
  79  0020 35015258      	mov	21080,#1
  80                     ; 71   TIM1->CCMR2 = 0x01;
  82  0024 35015259      	mov	21081,#1
  83                     ; 72   TIM1->CCMR3 = 0x01;
  85  0028 3501525a      	mov	21082,#1
  86                     ; 73   TIM1->CCMR4 = 0x01;
  88  002c 3501525b      	mov	21083,#1
  89                     ; 75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  91  0030 725f525c      	clr	21084
  92                     ; 76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  94  0034 725f525d      	clr	21085
  95                     ; 77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  97  0038 725f5258      	clr	21080
  98                     ; 78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
 100  003c 725f5259      	clr	21081
 101                     ; 79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 103  0040 725f525a      	clr	21082
 104                     ; 80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 106  0044 725f525b      	clr	21083
 107                     ; 81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 109  0048 725f525e      	clr	21086
 110                     ; 82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 112  004c 725f525f      	clr	21087
 113                     ; 83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 115  0050 725f5260      	clr	21088
 116                     ; 84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 118  0054 725f5261      	clr	21089
 119                     ; 85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 121  0058 35ff5262      	mov	21090,#255
 122                     ; 86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 124  005c 35ff5263      	mov	21091,#255
 125                     ; 87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 127  0060 725f5265      	clr	21093
 128                     ; 88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 130  0064 725f5266      	clr	21094
 131                     ; 89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 133  0068 725f5267      	clr	21095
 134                     ; 90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 136  006c 725f5268      	clr	21096
 137                     ; 91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 139  0070 725f5269      	clr	21097
 140                     ; 92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 142  0074 725f526a      	clr	21098
 143                     ; 93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 145  0078 725f526b      	clr	21099
 146                     ; 94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 148  007c 725f526c      	clr	21100
 149                     ; 95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 151  0080 725f526f      	clr	21103
 152                     ; 96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 154  0084 35015257      	mov	21079,#1
 155                     ; 97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 157  0088 725f526e      	clr	21102
 158                     ; 98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 160  008c 725f526d      	clr	21101
 161                     ; 99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 163  0090 725f5264      	clr	21092
 164                     ; 100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 166  0094 725f5255      	clr	21077
 167                     ; 101 }
 170  0098 81            	ret	
 279                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 279                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 279                     ; 113                        uint16_t TIM1_Period,
 279                     ; 114                        uint8_t TIM1_RepetitionCounter)
 279                     ; 115 {
 280                     .text:	section	.text,new
 281  0000               _TIM1_TimeBaseInit:
 283       fffffffe      OFST: set -2
 286                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 288                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 290  0000 7b04          	ld	a,(OFST+6,sp)
 291  0002 c75262        	ld	21090,a
 292                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 294  0005 7b05          	ld	a,(OFST+7,sp)
 295  0007 c75263        	ld	21091,a
 296                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 298  000a 9e            	ld	a,xh
 299  000b c75260        	ld	21088,a
 300                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 302  000e 9f            	ld	a,xl
 303  000f c75261        	ld	21089,a
 304                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 304                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 306  0012 c65250        	ld	a,21072
 307  0015 a48f          	and	a,#143
 308  0017 1a03          	or	a,(OFST+5,sp)
 309  0019 c75250        	ld	21072,a
 310                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 312  001c 7b06          	ld	a,(OFST+8,sp)
 313  001e c75264        	ld	21092,a
 314                     ; 133 }
 317  0021 81            	ret	
 602                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 602                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 602                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 602                     ; 157                   uint16_t TIM1_Pulse,
 602                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 602                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 602                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 602                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 602                     ; 162 {
 603                     .text:	section	.text,new
 604  0000               _TIM1_OC1Init:
 606  0000 89            	pushw	x
 607  0001 5203          	subw	sp,#3
 608       00000003      OFST:	set	3
 611                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 613                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 615                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 617                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 619                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 621                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 623                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 625                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 625                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 627  0003 c6525c        	ld	a,21084
 628  0006 a4f0          	and	a,#240
 629  0008 c7525c        	ld	21084,a
 630                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 630                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 630                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 630                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 632  000b 7b0c          	ld	a,(OFST+9,sp)
 633  000d a408          	and	a,#8
 634  000f 6b03          	ld	(OFST+0,sp),a
 636  0011 7b0b          	ld	a,(OFST+8,sp)
 637  0013 a402          	and	a,#2
 638  0015 1a03          	or	a,(OFST+0,sp)
 639  0017 6b02          	ld	(OFST-1,sp),a
 641  0019 7b08          	ld	a,(OFST+5,sp)
 642  001b a404          	and	a,#4
 643  001d 6b01          	ld	(OFST-2,sp),a
 645  001f 9f            	ld	a,xl
 646  0020 a401          	and	a,#1
 647  0022 1a01          	or	a,(OFST-2,sp)
 648  0024 1a02          	or	a,(OFST-1,sp)
 649  0026 ca525c        	or	a,21084
 650  0029 c7525c        	ld	21084,a
 651                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 651                     ; 185                           (uint8_t)TIM1_OCMode);
 653  002c c65258        	ld	a,21080
 654  002f a48f          	and	a,#143
 655  0031 1a04          	or	a,(OFST+1,sp)
 656  0033 c75258        	ld	21080,a
 657                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 659  0036 c6526f        	ld	a,21103
 660  0039 a4fc          	and	a,#252
 661  003b c7526f        	ld	21103,a
 662                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 662                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 664  003e 7b0e          	ld	a,(OFST+11,sp)
 665  0040 a402          	and	a,#2
 666  0042 6b03          	ld	(OFST+0,sp),a
 668  0044 7b0d          	ld	a,(OFST+10,sp)
 669  0046 a401          	and	a,#1
 670  0048 1a03          	or	a,(OFST+0,sp)
 671  004a ca526f        	or	a,21103
 672  004d c7526f        	ld	21103,a
 673                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 675  0050 7b09          	ld	a,(OFST+6,sp)
 676  0052 c75265        	ld	21093,a
 677                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 679  0055 7b0a          	ld	a,(OFST+7,sp)
 680  0057 c75266        	ld	21094,a
 681                     ; 196 }
 684  005a 5b05          	addw	sp,#5
 685  005c 81            	ret	
 789                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 789                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 789                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 789                     ; 220                   uint16_t TIM1_Pulse,
 789                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 789                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 789                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 789                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 789                     ; 225 {
 790                     .text:	section	.text,new
 791  0000               _TIM1_OC2Init:
 793  0000 89            	pushw	x
 794  0001 5203          	subw	sp,#3
 795       00000003      OFST:	set	3
 798                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 800                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 802                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 804                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 806                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 808                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 810                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 812                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 812                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 814  0003 c6525c        	ld	a,21084
 815  0006 a40f          	and	a,#15
 816  0008 c7525c        	ld	21084,a
 817                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 817                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 817                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 817                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 819  000b 7b0c          	ld	a,(OFST+9,sp)
 820  000d a480          	and	a,#128
 821  000f 6b03          	ld	(OFST+0,sp),a
 823  0011 7b0b          	ld	a,(OFST+8,sp)
 824  0013 a420          	and	a,#32
 825  0015 1a03          	or	a,(OFST+0,sp)
 826  0017 6b02          	ld	(OFST-1,sp),a
 828  0019 7b08          	ld	a,(OFST+5,sp)
 829  001b a440          	and	a,#64
 830  001d 6b01          	ld	(OFST-2,sp),a
 832  001f 9f            	ld	a,xl
 833  0020 a410          	and	a,#16
 834  0022 1a01          	or	a,(OFST-2,sp)
 835  0024 1a02          	or	a,(OFST-1,sp)
 836  0026 ca525c        	or	a,21084
 837  0029 c7525c        	ld	21084,a
 838                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 838                     ; 249                           (uint8_t)TIM1_OCMode);
 840  002c c65259        	ld	a,21081
 841  002f a48f          	and	a,#143
 842  0031 1a04          	or	a,(OFST+1,sp)
 843  0033 c75259        	ld	21081,a
 844                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 846  0036 c6526f        	ld	a,21103
 847  0039 a4f3          	and	a,#243
 848  003b c7526f        	ld	21103,a
 849                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 849                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 851  003e 7b0e          	ld	a,(OFST+11,sp)
 852  0040 a408          	and	a,#8
 853  0042 6b03          	ld	(OFST+0,sp),a
 855  0044 7b0d          	ld	a,(OFST+10,sp)
 856  0046 a404          	and	a,#4
 857  0048 1a03          	or	a,(OFST+0,sp)
 858  004a ca526f        	or	a,21103
 859  004d c7526f        	ld	21103,a
 860                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 862  0050 7b09          	ld	a,(OFST+6,sp)
 863  0052 c75267        	ld	21095,a
 864                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 866  0055 7b0a          	ld	a,(OFST+7,sp)
 867  0057 c75268        	ld	21096,a
 868                     ; 260 }
 871  005a 5b05          	addw	sp,#5
 872  005c 81            	ret	
 976                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 976                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
 976                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 976                     ; 284                   uint16_t TIM1_Pulse,
 976                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 976                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 976                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 976                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 976                     ; 289 {
 977                     .text:	section	.text,new
 978  0000               _TIM1_OC3Init:
 980  0000 89            	pushw	x
 981  0001 5203          	subw	sp,#3
 982       00000003      OFST:	set	3
 985                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 987                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 989                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 991                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 993                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 995                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 997                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 999                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
 999                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1001  0003 c6525d        	ld	a,21085
1002  0006 a4f0          	and	a,#240
1003  0008 c7525d        	ld	21085,a
1004                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
1004                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
1004                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
1004                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
1006  000b 7b0c          	ld	a,(OFST+9,sp)
1007  000d a408          	and	a,#8
1008  000f 6b03          	ld	(OFST+0,sp),a
1010  0011 7b0b          	ld	a,(OFST+8,sp)
1011  0013 a402          	and	a,#2
1012  0015 1a03          	or	a,(OFST+0,sp)
1013  0017 6b02          	ld	(OFST-1,sp),a
1015  0019 7b08          	ld	a,(OFST+5,sp)
1016  001b a404          	and	a,#4
1017  001d 6b01          	ld	(OFST-2,sp),a
1019  001f 9f            	ld	a,xl
1020  0020 a401          	and	a,#1
1021  0022 1a01          	or	a,(OFST-2,sp)
1022  0024 1a02          	or	a,(OFST-1,sp)
1023  0026 ca525d        	or	a,21085
1024  0029 c7525d        	ld	21085,a
1025                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1025                     ; 312                           (uint8_t)TIM1_OCMode);
1027  002c c6525a        	ld	a,21082
1028  002f a48f          	and	a,#143
1029  0031 1a04          	or	a,(OFST+1,sp)
1030  0033 c7525a        	ld	21082,a
1031                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1033  0036 c6526f        	ld	a,21103
1034  0039 a4cf          	and	a,#207
1035  003b c7526f        	ld	21103,a
1036                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1036                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1038  003e 7b0e          	ld	a,(OFST+11,sp)
1039  0040 a420          	and	a,#32
1040  0042 6b03          	ld	(OFST+0,sp),a
1042  0044 7b0d          	ld	a,(OFST+10,sp)
1043  0046 a410          	and	a,#16
1044  0048 1a03          	or	a,(OFST+0,sp)
1045  004a ca526f        	or	a,21103
1046  004d c7526f        	ld	21103,a
1047                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1049  0050 7b09          	ld	a,(OFST+6,sp)
1050  0052 c75269        	ld	21097,a
1051                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1053  0055 7b0a          	ld	a,(OFST+7,sp)
1054  0057 c7526a        	ld	21098,a
1055                     ; 323 }
1058  005a 5b05          	addw	sp,#5
1059  005c 81            	ret	
1133                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1133                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
1133                     ; 340                   uint16_t TIM1_Pulse,
1133                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1133                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1133                     ; 343 {
1134                     .text:	section	.text,new
1135  0000               _TIM1_OC4Init:
1137  0000 89            	pushw	x
1138  0001 88            	push	a
1139       00000001      OFST:	set	1
1142                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1144                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1146                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1148                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1150                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1152  0002 c6525d        	ld	a,21085
1153  0005 a4cf          	and	a,#207
1154  0007 c7525d        	ld	21085,a
1155                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1155                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1157  000a 7b08          	ld	a,(OFST+7,sp)
1158  000c a420          	and	a,#32
1159  000e 6b01          	ld	(OFST+0,sp),a
1161  0010 9f            	ld	a,xl
1162  0011 a410          	and	a,#16
1163  0013 1a01          	or	a,(OFST+0,sp)
1164  0015 ca525d        	or	a,21085
1165  0018 c7525d        	ld	21085,a
1166                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1166                     ; 358                           TIM1_OCMode);
1168  001b c6525b        	ld	a,21083
1169  001e a48f          	and	a,#143
1170  0020 1a02          	or	a,(OFST+1,sp)
1171  0022 c7525b        	ld	21083,a
1172                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1174  0025 7b09          	ld	a,(OFST+8,sp)
1175  0027 270a          	jreq	L534
1176                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1178  0029 c6526f        	ld	a,21103
1179  002c aadf          	or	a,#223
1180  002e c7526f        	ld	21103,a
1182  0031 2004          	jra	L734
1183  0033               L534:
1184                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1186  0033 721d526f      	bres	21103,#6
1187  0037               L734:
1188                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1190  0037 7b06          	ld	a,(OFST+5,sp)
1191  0039 c7526b        	ld	21099,a
1192                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1194  003c 7b07          	ld	a,(OFST+6,sp)
1195  003e c7526c        	ld	21100,a
1196                     ; 373 }
1199  0041 5b03          	addw	sp,#3
1200  0043 81            	ret	
1405                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1405                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1405                     ; 390                      uint8_t TIM1_DeadTime,
1405                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
1405                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1405                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1405                     ; 394 {
1406                     .text:	section	.text,new
1407  0000               _TIM1_BDTRConfig:
1409  0000 89            	pushw	x
1410  0001 88            	push	a
1411       00000001      OFST:	set	1
1414                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1416                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1418                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1420                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1422                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1424                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1426  0002 7b06          	ld	a,(OFST+5,sp)
1427  0004 c7526e        	ld	21102,a
1428                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1428                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1428                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
1430  0007 7b07          	ld	a,(OFST+6,sp)
1431  0009 1a08          	or	a,(OFST+7,sp)
1432  000b 1a09          	or	a,(OFST+8,sp)
1433  000d 6b01          	ld	(OFST+0,sp),a
1435  000f 9f            	ld	a,xl
1436  0010 1a02          	or	a,(OFST+1,sp)
1437  0012 1a01          	or	a,(OFST+0,sp)
1438  0014 c7526d        	ld	21101,a
1439                     ; 409 }
1442  0017 5b03          	addw	sp,#3
1443  0019 81            	ret	
1645                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1645                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1645                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1645                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1645                     ; 427                  uint8_t TIM1_ICFilter)
1645                     ; 428 {
1646                     .text:	section	.text,new
1647  0000               _TIM1_ICInit:
1649  0000 89            	pushw	x
1650       00000000      OFST:	set	0
1653                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1655                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1657                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1659                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1661                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1663                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
1665  0001 9e            	ld	a,xh
1666  0002 4d            	tnz	a
1667  0003 2614          	jrne	L766
1668                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
1668                     ; 440                (uint8_t)TIM1_ICSelection,
1668                     ; 441                (uint8_t)TIM1_ICFilter);
1670  0005 7b07          	ld	a,(OFST+7,sp)
1671  0007 88            	push	a
1672  0008 7b06          	ld	a,(OFST+6,sp)
1673  000a 97            	ld	xl,a
1674  000b 7b03          	ld	a,(OFST+3,sp)
1675  000d 95            	ld	xh,a
1676  000e cd0000        	call	L3_TI1_Config
1678  0011 84            	pop	a
1679                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1681  0012 7b06          	ld	a,(OFST+6,sp)
1682  0014 cd0000        	call	_TIM1_SetIC1Prescaler
1685  0017 2044          	jra	L176
1686  0019               L766:
1687                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
1689  0019 7b01          	ld	a,(OFST+1,sp)
1690  001b a101          	cp	a,#1
1691  001d 2614          	jrne	L376
1692                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
1692                     ; 449                (uint8_t)TIM1_ICSelection,
1692                     ; 450                (uint8_t)TIM1_ICFilter);
1694  001f 7b07          	ld	a,(OFST+7,sp)
1695  0021 88            	push	a
1696  0022 7b06          	ld	a,(OFST+6,sp)
1697  0024 97            	ld	xl,a
1698  0025 7b03          	ld	a,(OFST+3,sp)
1699  0027 95            	ld	xh,a
1700  0028 cd0000        	call	L5_TI2_Config
1702  002b 84            	pop	a
1703                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1705  002c 7b06          	ld	a,(OFST+6,sp)
1706  002e cd0000        	call	_TIM1_SetIC2Prescaler
1709  0031 202a          	jra	L176
1710  0033               L376:
1711                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
1713  0033 a102          	cp	a,#2
1714  0035 2614          	jrne	L776
1715                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
1715                     ; 458                (uint8_t)TIM1_ICSelection,
1715                     ; 459                (uint8_t)TIM1_ICFilter);
1717  0037 7b07          	ld	a,(OFST+7,sp)
1718  0039 88            	push	a
1719  003a 7b06          	ld	a,(OFST+6,sp)
1720  003c 97            	ld	xl,a
1721  003d 7b03          	ld	a,(OFST+3,sp)
1722  003f 95            	ld	xh,a
1723  0040 cd0000        	call	L7_TI3_Config
1725  0043 84            	pop	a
1726                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1728  0044 7b06          	ld	a,(OFST+6,sp)
1729  0046 cd0000        	call	_TIM1_SetIC3Prescaler
1732  0049 2012          	jra	L176
1733  004b               L776:
1734                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
1734                     ; 467                (uint8_t)TIM1_ICSelection,
1734                     ; 468                (uint8_t)TIM1_ICFilter);
1736  004b 7b07          	ld	a,(OFST+7,sp)
1737  004d 88            	push	a
1738  004e 7b06          	ld	a,(OFST+6,sp)
1739  0050 97            	ld	xl,a
1740  0051 7b03          	ld	a,(OFST+3,sp)
1741  0053 95            	ld	xh,a
1742  0054 cd0000        	call	L11_TI4_Config
1744  0057 84            	pop	a
1745                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1747  0058 7b06          	ld	a,(OFST+6,sp)
1748  005a cd0000        	call	_TIM1_SetIC4Prescaler
1750  005d               L176:
1751                     ; 472 }
1754  005d 85            	popw	x
1755  005e 81            	ret	
1851                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1851                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1851                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1851                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1851                     ; 492                      uint8_t TIM1_ICFilter)
1851                     ; 493 {
1852                     .text:	section	.text,new
1853  0000               _TIM1_PWMIConfig:
1855  0000 89            	pushw	x
1856  0001 89            	pushw	x
1857       00000002      OFST:	set	2
1860                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
1862                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
1864                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1866                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1868                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1870                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1872                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1874  0002 9f            	ld	a,xl
1875  0003 4a            	dec	a
1876  0004 2702          	jreq	L157
1877                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
1879  0006 a601          	ld	a,#1
1881  0008               L157:
1882                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
1884  0008 6b01          	ld	(OFST-1,sp),a
1886                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1888  000a 7b07          	ld	a,(OFST+5,sp)
1889  000c 4a            	dec	a
1890  000d 2604          	jrne	L557
1891                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
1893  000f a602          	ld	a,#2
1895  0011 2002          	jra	L757
1896  0013               L557:
1897                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
1899  0013 a601          	ld	a,#1
1900  0015               L757:
1901  0015 6b02          	ld	(OFST+0,sp),a
1903                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
1905  0017 7b03          	ld	a,(OFST+1,sp)
1906  0019 2626          	jrne	L167
1907                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1907                     ; 527                (uint8_t)TIM1_ICFilter);
1909  001b 7b09          	ld	a,(OFST+7,sp)
1910  001d 88            	push	a
1911  001e 7b08          	ld	a,(OFST+6,sp)
1912  0020 97            	ld	xl,a
1913  0021 7b05          	ld	a,(OFST+3,sp)
1914  0023 95            	ld	xh,a
1915  0024 cd0000        	call	L3_TI1_Config
1917  0027 84            	pop	a
1918                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1920  0028 7b08          	ld	a,(OFST+6,sp)
1921  002a cd0000        	call	_TIM1_SetIC1Prescaler
1923                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1925  002d 7b09          	ld	a,(OFST+7,sp)
1926  002f 88            	push	a
1927  0030 7b03          	ld	a,(OFST+1,sp)
1928  0032 97            	ld	xl,a
1929  0033 7b02          	ld	a,(OFST+0,sp)
1930  0035 95            	ld	xh,a
1931  0036 cd0000        	call	L5_TI2_Config
1933  0039 84            	pop	a
1934                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1936  003a 7b08          	ld	a,(OFST+6,sp)
1937  003c cd0000        	call	_TIM1_SetIC2Prescaler
1940  003f 2024          	jra	L367
1941  0041               L167:
1942                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1942                     ; 542                (uint8_t)TIM1_ICFilter);
1944  0041 7b09          	ld	a,(OFST+7,sp)
1945  0043 88            	push	a
1946  0044 7b08          	ld	a,(OFST+6,sp)
1947  0046 97            	ld	xl,a
1948  0047 7b05          	ld	a,(OFST+3,sp)
1949  0049 95            	ld	xh,a
1950  004a cd0000        	call	L5_TI2_Config
1952  004d 84            	pop	a
1953                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1955  004e 7b08          	ld	a,(OFST+6,sp)
1956  0050 cd0000        	call	_TIM1_SetIC2Prescaler
1958                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1960  0053 7b09          	ld	a,(OFST+7,sp)
1961  0055 88            	push	a
1962  0056 7b03          	ld	a,(OFST+1,sp)
1963  0058 97            	ld	xl,a
1964  0059 7b02          	ld	a,(OFST+0,sp)
1965  005b 95            	ld	xh,a
1966  005c cd0000        	call	L3_TI1_Config
1968  005f 84            	pop	a
1969                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1971  0060 7b08          	ld	a,(OFST+6,sp)
1972  0062 cd0000        	call	_TIM1_SetIC1Prescaler
1974  0065               L367:
1975                     ; 553 }
1978  0065 5b04          	addw	sp,#4
1979  0067 81            	ret	
2034                     ; 561 void TIM1_Cmd(FunctionalState NewState)
2034                     ; 562 {
2035                     .text:	section	.text,new
2036  0000               _TIM1_Cmd:
2040                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2042                     ; 567   if (NewState != DISABLE)
2044  0000 4d            	tnz	a
2045  0001 2705          	jreq	L3101
2046                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
2048  0003 72105250      	bset	21072,#0
2051  0007 81            	ret	
2052  0008               L3101:
2053                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2055  0008 72115250      	bres	21072,#0
2056                     ; 575 }
2059  000c 81            	ret	
2095                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2095                     ; 584 {
2096                     .text:	section	.text,new
2097  0000               _TIM1_CtrlPWMOutputs:
2101                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2103                     ; 590   if (NewState != DISABLE)
2105  0000 4d            	tnz	a
2106  0001 2705          	jreq	L5301
2107                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
2109  0003 721e526d      	bset	21101,#7
2112  0007 81            	ret	
2113  0008               L5301:
2114                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2116  0008 721f526d      	bres	21101,#7
2117                     ; 598 }
2120  000c 81            	ret	
2227                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2227                     ; 618 {
2228                     .text:	section	.text,new
2229  0000               _TIM1_ITConfig:
2231  0000 89            	pushw	x
2232       00000000      OFST:	set	0
2235                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
2237                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2239                     ; 623   if (NewState != DISABLE)
2241  0001 9f            	ld	a,xl
2242  0002 4d            	tnz	a
2243  0003 2706          	jreq	L7011
2244                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
2246  0005 9e            	ld	a,xh
2247  0006 ca5254        	or	a,21076
2249  0009 2006          	jra	L1111
2250  000b               L7011:
2251                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2253  000b 7b01          	ld	a,(OFST+1,sp)
2254  000d 43            	cpl	a
2255  000e c45254        	and	a,21076
2256  0011               L1111:
2257  0011 c75254        	ld	21076,a
2258                     ; 633 }
2261  0014 85            	popw	x
2262  0015 81            	ret	
2286                     ; 640 void TIM1_InternalClockConfig(void)
2286                     ; 641 {
2287                     .text:	section	.text,new
2288  0000               _TIM1_InternalClockConfig:
2292                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2294  0000 c65252        	ld	a,21074
2295  0003 a4f8          	and	a,#248
2296  0005 c75252        	ld	21074,a
2297                     ; 644 }
2300  0008 81            	ret	
2417                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2417                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2417                     ; 664                               uint8_t ExtTRGFilter)
2417                     ; 665 {
2418                     .text:	section	.text,new
2419  0000               _TIM1_ETRClockMode1Config:
2421  0000 89            	pushw	x
2422       00000000      OFST:	set	0
2425                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2427                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2429                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2431  0001 7b05          	ld	a,(OFST+5,sp)
2432  0003 88            	push	a
2433  0004 7b02          	ld	a,(OFST+2,sp)
2434  0006 95            	ld	xh,a
2435  0007 cd0000        	call	_TIM1_ETRConfig
2437  000a 84            	pop	a
2438                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
2438                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2440  000b c65252        	ld	a,21074
2441  000e aa77          	or	a,#119
2442  0010 c75252        	ld	21074,a
2443                     ; 676 }
2446  0013 85            	popw	x
2447  0014 81            	ret	
2505                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2505                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2505                     ; 696                               uint8_t ExtTRGFilter)
2505                     ; 697 {
2506                     .text:	section	.text,new
2507  0000               _TIM1_ETRClockMode2Config:
2509  0000 89            	pushw	x
2510       00000000      OFST:	set	0
2513                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2515                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2517                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2519  0001 7b05          	ld	a,(OFST+5,sp)
2520  0003 88            	push	a
2521  0004 7b02          	ld	a,(OFST+2,sp)
2522  0006 95            	ld	xh,a
2523  0007 cd0000        	call	_TIM1_ETRConfig
2525  000a 721c5253      	bset	21075,#6
2526                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
2528                     ; 707 }
2531  000e 5b03          	addw	sp,#3
2532  0010 81            	ret	
2588                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2588                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2588                     ; 727                     uint8_t ExtTRGFilter)
2588                     ; 728 {
2589                     .text:	section	.text,new
2590  0000               _TIM1_ETRConfig:
2592  0000 89            	pushw	x
2593       00000000      OFST:	set	0
2596                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
2598                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
2598                     ; 733                          (uint8_t)ExtTRGFilter );
2600  0001 9f            	ld	a,xl
2601  0002 1a01          	or	a,(OFST+1,sp)
2602  0004 1a05          	or	a,(OFST+5,sp)
2603  0006 ca5253        	or	a,21075
2604  0009 c75253        	ld	21075,a
2605                     ; 734 }
2608  000c 85            	popw	x
2609  000d 81            	ret	
2698                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2698                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2698                     ; 753                                  uint8_t ICFilter)
2698                     ; 754 {
2699                     .text:	section	.text,new
2700  0000               _TIM1_TIxExternalClockConfig:
2702  0000 89            	pushw	x
2703       00000000      OFST:	set	0
2706                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2708                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2710                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2712                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2714  0001 9e            	ld	a,xh
2715  0002 a160          	cp	a,#96
2716  0004 260d          	jrne	L1131
2717                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2719  0006 7b05          	ld	a,(OFST+5,sp)
2720  0008 88            	push	a
2721  0009 9f            	ld	a,xl
2722  000a ae0001        	ldw	x,#1
2723  000d 95            	ld	xh,a
2724  000e cd0000        	call	L5_TI2_Config
2727  0011 200c          	jra	L3131
2728  0013               L1131:
2729                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2731  0013 7b05          	ld	a,(OFST+5,sp)
2732  0015 88            	push	a
2733  0016 7b03          	ld	a,(OFST+3,sp)
2734  0018 ae0001        	ldw	x,#1
2735  001b 95            	ld	xh,a
2736  001c cd0000        	call	L3_TI1_Config
2738  001f               L3131:
2739  001f 84            	pop	a
2740                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
2742  0020 7b01          	ld	a,(OFST+1,sp)
2743  0022 cd0000        	call	_TIM1_SelectInputTrigger
2745                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
2747  0025 c65252        	ld	a,21074
2748  0028 aa07          	or	a,#7
2749  002a c75252        	ld	21074,a
2750                     ; 775 }
2753  002d 85            	popw	x
2754  002e 81            	ret	
2839                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2839                     ; 788 {
2840                     .text:	section	.text,new
2841  0000               _TIM1_SelectInputTrigger:
2843  0000 88            	push	a
2844       00000000      OFST:	set	0
2847                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2849                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
2851  0001 c65252        	ld	a,21074
2852  0004 a48f          	and	a,#143
2853  0006 1a01          	or	a,(OFST+1,sp)
2854  0008 c75252        	ld	21074,a
2855                     ; 794 }
2858  000b 84            	pop	a
2859  000c 81            	ret	
2895                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2895                     ; 804 {
2896                     .text:	section	.text,new
2897  0000               _TIM1_UpdateDisableConfig:
2901                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2903                     ; 809   if (NewState != DISABLE)
2905  0000 4d            	tnz	a
2906  0001 2705          	jreq	L1731
2907                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
2909  0003 72125250      	bset	21072,#1
2912  0007 81            	ret	
2913  0008               L1731:
2914                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
2916  0008 72135250      	bres	21072,#1
2917                     ; 817 }
2920  000c 81            	ret	
2978                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
2978                     ; 828 {
2979                     .text:	section	.text,new
2980  0000               _TIM1_UpdateRequestConfig:
2984                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
2986                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
2988  0000 4d            	tnz	a
2989  0001 2705          	jreq	L3241
2990                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
2992  0003 72145250      	bset	21072,#2
2995  0007 81            	ret	
2996  0008               L3241:
2997                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
2999  0008 72155250      	bres	21072,#2
3000                     ; 841 }
3003  000c 81            	ret	
3039                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
3039                     ; 850 {
3040                     .text:	section	.text,new
3041  0000               _TIM1_SelectHallSensor:
3045                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3047                     ; 855   if (NewState != DISABLE)
3049  0000 4d            	tnz	a
3050  0001 2705          	jreq	L5441
3051                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
3053  0003 721e5251      	bset	21073,#7
3056  0007 81            	ret	
3057  0008               L5441:
3058                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3060  0008 721f5251      	bres	21073,#7
3061                     ; 863 }
3064  000c 81            	ret	
3121                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3121                     ; 874 {
3122                     .text:	section	.text,new
3123  0000               _TIM1_SelectOnePulseMode:
3127                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3129                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3131  0000 4d            	tnz	a
3132  0001 2705          	jreq	L7741
3133                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
3135  0003 72165250      	bset	21072,#3
3138  0007 81            	ret	
3139  0008               L7741:
3140                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3142  0008 72175250      	bres	21072,#3
3143                     ; 888 }
3146  000c 81            	ret	
3244                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3244                     ; 904 {
3245                     .text:	section	.text,new
3246  0000               _TIM1_SelectOutputTrigger:
3248  0000 88            	push	a
3249       00000000      OFST:	set	0
3252                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3254                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
3254                     ; 910                         (uint8_t) TIM1_TRGOSource);
3256  0001 c65251        	ld	a,21073
3257  0004 a48f          	and	a,#143
3258  0006 1a01          	or	a,(OFST+1,sp)
3259  0008 c75251        	ld	21073,a
3260                     ; 911 }
3263  000b 84            	pop	a
3264  000c 81            	ret	
3338                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3338                     ; 924 {
3339                     .text:	section	.text,new
3340  0000               _TIM1_SelectSlaveMode:
3342  0000 88            	push	a
3343       00000000      OFST:	set	0
3346                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3348                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
3348                     ; 930                          (uint8_t)TIM1_SlaveMode);
3350  0001 c65252        	ld	a,21074
3351  0004 a4f8          	and	a,#248
3352  0006 1a01          	or	a,(OFST+1,sp)
3353  0008 c75252        	ld	21074,a
3354                     ; 931 }
3357  000b 84            	pop	a
3358  000c 81            	ret	
3394                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3394                     ; 940 {
3395                     .text:	section	.text,new
3396  0000               _TIM1_SelectMasterSlaveMode:
3400                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3402                     ; 945   if (NewState != DISABLE)
3404  0000 4d            	tnz	a
3405  0001 2705          	jreq	L3161
3406                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
3408  0003 721e5252      	bset	21074,#7
3411  0007 81            	ret	
3412  0008               L3161:
3413                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
3415  0008 721f5252      	bres	21074,#7
3416                     ; 953 }
3419  000c 81            	ret	
3505                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3505                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3505                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3505                     ; 978 {
3506                     .text:	section	.text,new
3507  0000               _TIM1_EncoderInterfaceConfig:
3509  0000 89            	pushw	x
3510       00000000      OFST:	set	0
3513                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3515                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3517                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3519                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3521  0001 9f            	ld	a,xl
3522  0002 4d            	tnz	a
3523  0003 2706          	jreq	L7561
3524                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3526  0005 7212525c      	bset	21084,#1
3528  0009 2004          	jra	L1661
3529  000b               L7561:
3530                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3532  000b 7213525c      	bres	21084,#1
3533  000f               L1661:
3534                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3536  000f 7b05          	ld	a,(OFST+5,sp)
3537  0011 2706          	jreq	L3661
3538                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3540  0013 721a525c      	bset	21084,#5
3542  0017 2004          	jra	L5661
3543  0019               L3661:
3544                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3546  0019 721b525c      	bres	21084,#5
3547  001d               L5661:
3548                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
3548                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
3550  001d c65252        	ld	a,21074
3551  0020 a4f0          	and	a,#240
3552  0022 1a01          	or	a,(OFST+1,sp)
3553  0024 c75252        	ld	21074,a
3554                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
3554                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
3556  0027 c65258        	ld	a,21080
3557  002a a4fc          	and	a,#252
3558  002c aa01          	or	a,#1
3559  002e c75258        	ld	21080,a
3560                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
3560                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
3562  0031 c65259        	ld	a,21081
3563  0034 a4fc          	and	a,#252
3564  0036 aa01          	or	a,#1
3565  0038 c75259        	ld	21081,a
3566                     ; 1011 }
3569  003b 85            	popw	x
3570  003c 81            	ret	
3637                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
3637                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3637                     ; 1025 {
3638                     .text:	section	.text,new
3639  0000               _TIM1_PrescalerConfig:
3641       fffffffe      OFST: set -2
3644                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3646                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
3648  0000 9e            	ld	a,xh
3649  0001 c75260        	ld	21088,a
3650                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
3652  0004 9f            	ld	a,xl
3653  0005 c75261        	ld	21089,a
3654                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
3656  0008 7b03          	ld	a,(OFST+5,sp)
3657  000a c75257        	ld	21079,a
3658                     ; 1035 }
3661  000d 81            	ret	
3697                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3697                     ; 1049 {
3698                     .text:	section	.text,new
3699  0000               _TIM1_CounterModeConfig:
3701  0000 88            	push	a
3702       00000000      OFST:	set	0
3705                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3707                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
3707                     ; 1056                         | (uint8_t)TIM1_CounterMode);
3709  0001 c65250        	ld	a,21072
3710  0004 a48f          	and	a,#143
3711  0006 1a01          	or	a,(OFST+1,sp)
3712  0008 c75250        	ld	21072,a
3713                     ; 1057 }
3716  000b 84            	pop	a
3717  000c 81            	ret	
3775                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3775                     ; 1068 {
3776                     .text:	section	.text,new
3777  0000               _TIM1_ForcedOC1Config:
3779  0000 88            	push	a
3780       00000000      OFST:	set	0
3783                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3785                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
3785                     ; 1074                            (uint8_t)TIM1_ForcedAction);
3787  0001 c65258        	ld	a,21080
3788  0004 a48f          	and	a,#143
3789  0006 1a01          	or	a,(OFST+1,sp)
3790  0008 c75258        	ld	21080,a
3791                     ; 1075 }
3794  000b 84            	pop	a
3795  000c 81            	ret	
3831                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3831                     ; 1086 {
3832                     .text:	section	.text,new
3833  0000               _TIM1_ForcedOC2Config:
3835  0000 88            	push	a
3836       00000000      OFST:	set	0
3839                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3841                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
3841                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
3843  0001 c65259        	ld	a,21081
3844  0004 a48f          	and	a,#143
3845  0006 1a01          	or	a,(OFST+1,sp)
3846  0008 c75259        	ld	21081,a
3847                     ; 1093 }
3850  000b 84            	pop	a
3851  000c 81            	ret	
3887                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3887                     ; 1105 {
3888                     .text:	section	.text,new
3889  0000               _TIM1_ForcedOC3Config:
3891  0000 88            	push	a
3892       00000000      OFST:	set	0
3895                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3897                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
3897                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
3899  0001 c6525a        	ld	a,21082
3900  0004 a48f          	and	a,#143
3901  0006 1a01          	or	a,(OFST+1,sp)
3902  0008 c7525a        	ld	21082,a
3903                     ; 1112 }
3906  000b 84            	pop	a
3907  000c 81            	ret	
3943                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3943                     ; 1124 {
3944                     .text:	section	.text,new
3945  0000               _TIM1_ForcedOC4Config:
3947  0000 88            	push	a
3948       00000000      OFST:	set	0
3951                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3953                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
3953                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
3955  0001 c6525b        	ld	a,21083
3956  0004 a48f          	and	a,#143
3957  0006 1a01          	or	a,(OFST+1,sp)
3958  0008 c7525b        	ld	21083,a
3959                     ; 1131 }
3962  000b 84            	pop	a
3963  000c 81            	ret	
3999                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
3999                     ; 1140 {
4000                     .text:	section	.text,new
4001  0000               _TIM1_ARRPreloadConfig:
4005                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4007                     ; 1145   if (NewState != DISABLE)
4009  0000 4d            	tnz	a
4010  0001 2705          	jreq	L5502
4011                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
4013  0003 721e5250      	bset	21072,#7
4016  0007 81            	ret	
4017  0008               L5502:
4018                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
4020  0008 721f5250      	bres	21072,#7
4021                     ; 1153 }
4024  000c 81            	ret	
4059                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
4059                     ; 1162 {
4060                     .text:	section	.text,new
4061  0000               _TIM1_SelectCOM:
4065                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4067                     ; 1167   if (NewState != DISABLE)
4069  0000 4d            	tnz	a
4070  0001 2705          	jreq	L7702
4071                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
4073  0003 72145251      	bset	21073,#2
4076  0007 81            	ret	
4077  0008               L7702:
4078                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
4080  0008 72155251      	bres	21073,#2
4081                     ; 1175 }
4084  000c 81            	ret	
4120                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
4120                     ; 1184 {
4121                     .text:	section	.text,new
4122  0000               _TIM1_CCPreloadControl:
4126                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4128                     ; 1189   if (NewState != DISABLE)
4130  0000 4d            	tnz	a
4131  0001 2705          	jreq	L1212
4132                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
4134  0003 72105251      	bset	21073,#0
4137  0007 81            	ret	
4138  0008               L1212:
4139                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4141  0008 72115251      	bres	21073,#0
4142                     ; 1197 }
4145  000c 81            	ret	
4181                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4181                     ; 1206 {
4182                     .text:	section	.text,new
4183  0000               _TIM1_OC1PreloadConfig:
4187                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4189                     ; 1211   if (NewState != DISABLE)
4191  0000 4d            	tnz	a
4192  0001 2705          	jreq	L3412
4193                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4195  0003 72165258      	bset	21080,#3
4198  0007 81            	ret	
4199  0008               L3412:
4200                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4202  0008 72175258      	bres	21080,#3
4203                     ; 1219 }
4206  000c 81            	ret	
4242                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4242                     ; 1228 {
4243                     .text:	section	.text,new
4244  0000               _TIM1_OC2PreloadConfig:
4248                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4250                     ; 1233   if (NewState != DISABLE)
4252  0000 4d            	tnz	a
4253  0001 2705          	jreq	L5612
4254                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4256  0003 72165259      	bset	21081,#3
4259  0007 81            	ret	
4260  0008               L5612:
4261                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4263  0008 72175259      	bres	21081,#3
4264                     ; 1241 }
4267  000c 81            	ret	
4303                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4303                     ; 1250 {
4304                     .text:	section	.text,new
4305  0000               _TIM1_OC3PreloadConfig:
4309                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4311                     ; 1255   if (NewState != DISABLE)
4313  0000 4d            	tnz	a
4314  0001 2705          	jreq	L7022
4315                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4317  0003 7216525a      	bset	21082,#3
4320  0007 81            	ret	
4321  0008               L7022:
4322                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4324  0008 7217525a      	bres	21082,#3
4325                     ; 1263 }
4328  000c 81            	ret	
4364                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4364                     ; 1272 {
4365                     .text:	section	.text,new
4366  0000               _TIM1_OC4PreloadConfig:
4370                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4372                     ; 1277   if (NewState != DISABLE)
4374  0000 4d            	tnz	a
4375  0001 2705          	jreq	L1322
4376                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4378  0003 7216525b      	bset	21083,#3
4381  0007 81            	ret	
4382  0008               L1322:
4383                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4385  0008 7217525b      	bres	21083,#3
4386                     ; 1285 }
4389  000c 81            	ret	
4424                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
4424                     ; 1294 {
4425                     .text:	section	.text,new
4426  0000               _TIM1_OC1FastConfig:
4430                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4432                     ; 1299   if (NewState != DISABLE)
4434  0000 4d            	tnz	a
4435  0001 2705          	jreq	L3522
4436                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4438  0003 72145258      	bset	21080,#2
4441  0007 81            	ret	
4442  0008               L3522:
4443                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4445  0008 72155258      	bres	21080,#2
4446                     ; 1307 }
4449  000c 81            	ret	
4484                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
4484                     ; 1316 {
4485                     .text:	section	.text,new
4486  0000               _TIM1_OC2FastConfig:
4490                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4492                     ; 1321   if (NewState != DISABLE)
4494  0000 4d            	tnz	a
4495  0001 2705          	jreq	L5722
4496                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4498  0003 72145259      	bset	21081,#2
4501  0007 81            	ret	
4502  0008               L5722:
4503                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4505  0008 72155259      	bres	21081,#2
4506                     ; 1329 }
4509  000c 81            	ret	
4544                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
4544                     ; 1338 {
4545                     .text:	section	.text,new
4546  0000               _TIM1_OC3FastConfig:
4550                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4552                     ; 1343   if (NewState != DISABLE)
4554  0000 4d            	tnz	a
4555  0001 2705          	jreq	L7132
4556                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4558  0003 7214525a      	bset	21082,#2
4561  0007 81            	ret	
4562  0008               L7132:
4563                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4565  0008 7215525a      	bres	21082,#2
4566                     ; 1351 }
4569  000c 81            	ret	
4604                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
4604                     ; 1360 {
4605                     .text:	section	.text,new
4606  0000               _TIM1_OC4FastConfig:
4610                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4612                     ; 1365   if (NewState != DISABLE)
4614  0000 4d            	tnz	a
4615  0001 2705          	jreq	L1432
4616                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4618  0003 7214525b      	bset	21083,#2
4621  0007 81            	ret	
4622  0008               L1432:
4623                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4625  0008 7215525b      	bres	21083,#2
4626                     ; 1373 }
4629  000c 81            	ret	
4734                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4734                     ; 1390 {
4735                     .text:	section	.text,new
4736  0000               _TIM1_GenerateEvent:
4740                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4742                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
4744  0000 c75257        	ld	21079,a
4745                     ; 1396 }
4748  0003 81            	ret	
4784                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4784                     ; 1407 {
4785                     .text:	section	.text,new
4786  0000               _TIM1_OC1PolarityConfig:
4790                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4792                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4794  0000 4d            	tnz	a
4795  0001 2705          	jreq	L5242
4796                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4798  0003 7212525c      	bset	21084,#1
4801  0007 81            	ret	
4802  0008               L5242:
4803                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4805  0008 7213525c      	bres	21084,#1
4806                     ; 1420 }
4809  000c 81            	ret	
4845                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4845                     ; 1431 {
4846                     .text:	section	.text,new
4847  0000               _TIM1_OC1NPolarityConfig:
4851                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4853                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4855  0000 4d            	tnz	a
4856  0001 2705          	jreq	L7442
4857                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4859  0003 7216525c      	bset	21084,#3
4862  0007 81            	ret	
4863  0008               L7442:
4864                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
4866  0008 7217525c      	bres	21084,#3
4867                     ; 1444 }
4870  000c 81            	ret	
4906                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4906                     ; 1455 {
4907                     .text:	section	.text,new
4908  0000               _TIM1_OC2PolarityConfig:
4912                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4914                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4916  0000 4d            	tnz	a
4917  0001 2705          	jreq	L1742
4918                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4920  0003 721a525c      	bset	21084,#5
4923  0007 81            	ret	
4924  0008               L1742:
4925                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4927  0008 721b525c      	bres	21084,#5
4928                     ; 1468 }
4931  000c 81            	ret	
4967                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4967                     ; 1479 {
4968                     .text:	section	.text,new
4969  0000               _TIM1_OC2NPolarityConfig:
4973                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4975                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4977  0000 4d            	tnz	a
4978  0001 2705          	jreq	L3152
4979                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
4981  0003 721e525c      	bset	21084,#7
4984  0007 81            	ret	
4985  0008               L3152:
4986                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
4988  0008 721f525c      	bres	21084,#7
4989                     ; 1492 }
4992  000c 81            	ret	
5028                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5028                     ; 1503 {
5029                     .text:	section	.text,new
5030  0000               _TIM1_OC3PolarityConfig:
5034                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5036                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5038  0000 4d            	tnz	a
5039  0001 2705          	jreq	L5352
5040                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
5042  0003 7212525d      	bset	21085,#1
5045  0007 81            	ret	
5046  0008               L5352:
5047                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
5049  0008 7213525d      	bres	21085,#1
5050                     ; 1516 }
5053  000c 81            	ret	
5089                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5089                     ; 1528 {
5090                     .text:	section	.text,new
5091  0000               _TIM1_OC3NPolarityConfig:
5095                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5097                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5099  0000 4d            	tnz	a
5100  0001 2705          	jreq	L7552
5101                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5103  0003 7216525d      	bset	21085,#3
5106  0007 81            	ret	
5107  0008               L7552:
5108                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5110  0008 7217525d      	bres	21085,#3
5111                     ; 1541 }
5114  000c 81            	ret	
5150                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5150                     ; 1552 {
5151                     .text:	section	.text,new
5152  0000               _TIM1_OC4PolarityConfig:
5156                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5158                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5160  0000 4d            	tnz	a
5161  0001 2705          	jreq	L1062
5162                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
5164  0003 721a525d      	bset	21085,#5
5167  0007 81            	ret	
5168  0008               L1062:
5169                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
5171  0008 721b525d      	bres	21085,#5
5172                     ; 1565 }
5175  000c 81            	ret	
5220                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5220                     ; 1580 {
5221                     .text:	section	.text,new
5222  0000               _TIM1_CCxCmd:
5224  0000 89            	pushw	x
5225       00000000      OFST:	set	0
5228                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5230                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5232                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
5234  0001 9e            	ld	a,xh
5235  0002 4d            	tnz	a
5236  0003 2610          	jrne	L7262
5237                     ; 1588     if (NewState != DISABLE)
5239  0005 9f            	ld	a,xl
5240  0006 4d            	tnz	a
5241  0007 2706          	jreq	L1362
5242                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
5244  0009 7210525c      	bset	21084,#0
5246  000d 203e          	jra	L5362
5247  000f               L1362:
5248                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5250  000f 7211525c      	bres	21084,#0
5251  0013 2038          	jra	L5362
5252  0015               L7262:
5253                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
5255  0015 7b01          	ld	a,(OFST+1,sp)
5256  0017 a101          	cp	a,#1
5257  0019 2610          	jrne	L7362
5258                     ; 1601     if (NewState != DISABLE)
5260  001b 7b02          	ld	a,(OFST+2,sp)
5261  001d 2706          	jreq	L1462
5262                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
5264  001f 7218525c      	bset	21084,#4
5266  0023 2028          	jra	L5362
5267  0025               L1462:
5268                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5270  0025 7219525c      	bres	21084,#4
5271  0029 2022          	jra	L5362
5272  002b               L7362:
5273                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
5275  002b a102          	cp	a,#2
5276  002d 2610          	jrne	L7462
5277                     ; 1613     if (NewState != DISABLE)
5279  002f 7b02          	ld	a,(OFST+2,sp)
5280  0031 2706          	jreq	L1562
5281                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
5283  0033 7210525d      	bset	21085,#0
5285  0037 2014          	jra	L5362
5286  0039               L1562:
5287                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5289  0039 7211525d      	bres	21085,#0
5290  003d 200e          	jra	L5362
5291  003f               L7462:
5292                     ; 1625     if (NewState != DISABLE)
5294  003f 7b02          	ld	a,(OFST+2,sp)
5295  0041 2706          	jreq	L7562
5296                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
5298  0043 7218525d      	bset	21085,#4
5300  0047 2004          	jra	L5362
5301  0049               L7562:
5302                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5304  0049 7219525d      	bres	21085,#4
5305  004d               L5362:
5306                     ; 1634 }
5309  004d 85            	popw	x
5310  004e 81            	ret	
5355                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5355                     ; 1648 {
5356                     .text:	section	.text,new
5357  0000               _TIM1_CCxNCmd:
5359  0000 89            	pushw	x
5360       00000000      OFST:	set	0
5363                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5365                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5367                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
5369  0001 9e            	ld	a,xh
5370  0002 4d            	tnz	a
5371  0003 2610          	jrne	L5072
5372                     ; 1656     if (NewState != DISABLE)
5374  0005 9f            	ld	a,xl
5375  0006 4d            	tnz	a
5376  0007 2706          	jreq	L7072
5377                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5379  0009 7214525c      	bset	21084,#2
5381  000d 2029          	jra	L3172
5382  000f               L7072:
5383                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
5385  000f 7215525c      	bres	21084,#2
5386  0013 2023          	jra	L3172
5387  0015               L5072:
5388                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
5390  0015 7b01          	ld	a,(OFST+1,sp)
5391  0017 4a            	dec	a
5392  0018 2610          	jrne	L5172
5393                     ; 1668     if (NewState != DISABLE)
5395  001a 7b02          	ld	a,(OFST+2,sp)
5396  001c 2706          	jreq	L7172
5397                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5399  001e 721c525c      	bset	21084,#6
5401  0022 2014          	jra	L3172
5402  0024               L7172:
5403                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
5405  0024 721d525c      	bres	21084,#6
5406  0028 200e          	jra	L3172
5407  002a               L5172:
5408                     ; 1680     if (NewState != DISABLE)
5410  002a 7b02          	ld	a,(OFST+2,sp)
5411  002c 2706          	jreq	L5272
5412                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5414  002e 7214525d      	bset	21085,#2
5416  0032 2004          	jra	L3172
5417  0034               L5272:
5418                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
5420  0034 7215525d      	bres	21085,#2
5421  0038               L3172:
5422                     ; 1689 }
5425  0038 85            	popw	x
5426  0039 81            	ret	
5471                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5471                     ; 1713 {
5472                     .text:	section	.text,new
5473  0000               _TIM1_SelectOCxM:
5475  0000 89            	pushw	x
5476       00000000      OFST:	set	0
5479                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5481                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5483                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
5485  0001 9e            	ld	a,xh
5486  0002 4d            	tnz	a
5487  0003 2610          	jrne	L3572
5488                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5490  0005 7211525c      	bres	21084,#0
5491                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
5491                     ; 1725                             | (uint8_t)TIM1_OCMode);
5493  0009 c65258        	ld	a,21080
5494  000c a48f          	and	a,#143
5495  000e 1a02          	or	a,(OFST+2,sp)
5496  0010 c75258        	ld	21080,a
5498  0013 2038          	jra	L5572
5499  0015               L3572:
5500                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
5502  0015 7b01          	ld	a,(OFST+1,sp)
5503  0017 a101          	cp	a,#1
5504  0019 2610          	jrne	L7572
5505                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5507  001b 7219525c      	bres	21084,#4
5508                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5508                     ; 1734                             | (uint8_t)TIM1_OCMode);
5510  001f c65259        	ld	a,21081
5511  0022 a48f          	and	a,#143
5512  0024 1a02          	or	a,(OFST+2,sp)
5513  0026 c75259        	ld	21081,a
5515  0029 2022          	jra	L5572
5516  002b               L7572:
5517                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
5519  002b a102          	cp	a,#2
5520  002d 2610          	jrne	L3672
5521                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5523  002f 7211525d      	bres	21085,#0
5524                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
5524                     ; 1743                             | (uint8_t)TIM1_OCMode);
5526  0033 c6525a        	ld	a,21082
5527  0036 a48f          	and	a,#143
5528  0038 1a02          	or	a,(OFST+2,sp)
5529  003a c7525a        	ld	21082,a
5531  003d 200e          	jra	L5572
5532  003f               L3672:
5533                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5535  003f 7219525d      	bres	21085,#4
5536                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5536                     ; 1752                             | (uint8_t)TIM1_OCMode);
5538  0043 c6525b        	ld	a,21083
5539  0046 a48f          	and	a,#143
5540  0048 1a02          	or	a,(OFST+2,sp)
5541  004a c7525b        	ld	21083,a
5542  004d               L5572:
5543                     ; 1754 }
5546  004d 85            	popw	x
5547  004e 81            	ret	
5581                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
5581                     ; 1763 {
5582                     .text:	section	.text,new
5583  0000               _TIM1_SetCounter:
5587                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
5589  0000 9e            	ld	a,xh
5590  0001 c7525e        	ld	21086,a
5591                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
5593  0004 9f            	ld	a,xl
5594  0005 c7525f        	ld	21087,a
5595                     ; 1767 }
5598  0008 81            	ret	
5632                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
5632                     ; 1776 {
5633                     .text:	section	.text,new
5634  0000               _TIM1_SetAutoreload:
5638                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
5640  0000 9e            	ld	a,xh
5641  0001 c75262        	ld	21090,a
5642                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
5644  0004 9f            	ld	a,xl
5645  0005 c75263        	ld	21091,a
5646                     ; 1780  }
5649  0008 81            	ret	
5683                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
5683                     ; 1789 {
5684                     .text:	section	.text,new
5685  0000               _TIM1_SetCompare1:
5689                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
5691  0000 9e            	ld	a,xh
5692  0001 c75265        	ld	21093,a
5693                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
5695  0004 9f            	ld	a,xl
5696  0005 c75266        	ld	21094,a
5697                     ; 1793 }
5700  0008 81            	ret	
5734                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
5734                     ; 1802 {
5735                     .text:	section	.text,new
5736  0000               _TIM1_SetCompare2:
5740                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
5742  0000 9e            	ld	a,xh
5743  0001 c75267        	ld	21095,a
5744                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
5746  0004 9f            	ld	a,xl
5747  0005 c75268        	ld	21096,a
5748                     ; 1806 }
5751  0008 81            	ret	
5785                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
5785                     ; 1815 {
5786                     .text:	section	.text,new
5787  0000               _TIM1_SetCompare3:
5791                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
5793  0000 9e            	ld	a,xh
5794  0001 c75269        	ld	21097,a
5795                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
5797  0004 9f            	ld	a,xl
5798  0005 c7526a        	ld	21098,a
5799                     ; 1819 }
5802  0008 81            	ret	
5836                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
5836                     ; 1828 {
5837                     .text:	section	.text,new
5838  0000               _TIM1_SetCompare4:
5842                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
5844  0000 9e            	ld	a,xh
5845  0001 c7526b        	ld	21099,a
5846                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
5848  0004 9f            	ld	a,xl
5849  0005 c7526c        	ld	21100,a
5850                     ; 1832 }
5853  0008 81            	ret	
5889                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5889                     ; 1845 {
5890                     .text:	section	.text,new
5891  0000               _TIM1_SetIC1Prescaler:
5893  0000 88            	push	a
5894       00000000      OFST:	set	0
5897                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5899                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
5899                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
5901  0001 c65258        	ld	a,21080
5902  0004 a4f3          	and	a,#243
5903  0006 1a01          	or	a,(OFST+1,sp)
5904  0008 c75258        	ld	21080,a
5905                     ; 1852 }
5908  000b 84            	pop	a
5909  000c 81            	ret	
5945                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5945                     ; 1865 {
5946                     .text:	section	.text,new
5947  0000               _TIM1_SetIC2Prescaler:
5949  0000 88            	push	a
5950       00000000      OFST:	set	0
5953                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
5955                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
5955                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
5957  0001 c65259        	ld	a,21081
5958  0004 a4f3          	and	a,#243
5959  0006 1a01          	or	a,(OFST+1,sp)
5960  0008 c75259        	ld	21081,a
5961                     ; 1873 }
5964  000b 84            	pop	a
5965  000c 81            	ret	
6001                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
6001                     ; 1886 {
6002                     .text:	section	.text,new
6003  0000               _TIM1_SetIC3Prescaler:
6005  0000 88            	push	a
6006       00000000      OFST:	set	0
6009                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
6011                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
6011                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
6013  0001 c6525a        	ld	a,21082
6014  0004 a4f3          	and	a,#243
6015  0006 1a01          	or	a,(OFST+1,sp)
6016  0008 c7525a        	ld	21082,a
6017                     ; 1894 }
6020  000b 84            	pop	a
6021  000c 81            	ret	
6057                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6057                     ; 1907 {
6058                     .text:	section	.text,new
6059  0000               _TIM1_SetIC4Prescaler:
6061  0000 88            	push	a
6062       00000000      OFST:	set	0
6065                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
6067                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
6067                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
6069  0001 c6525b        	ld	a,21083
6070  0004 a4f3          	and	a,#243
6071  0006 1a01          	or	a,(OFST+1,sp)
6072  0008 c7525b        	ld	21083,a
6073                     ; 1915 }
6076  000b 84            	pop	a
6077  000c 81            	ret	
6129                     ; 1922 uint16_t TIM1_GetCapture1(void)
6129                     ; 1923 {
6130                     .text:	section	.text,new
6131  0000               _TIM1_GetCapture1:
6133  0000 5204          	subw	sp,#4
6134       00000004      OFST:	set	4
6137                     ; 1926   uint16_t tmpccr1 = 0;
6139                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
6143                     ; 1929   tmpccr1h = TIM1->CCR1H;
6145  0002 c65265        	ld	a,21093
6146  0005 6b02          	ld	(OFST-2,sp),a
6148                     ; 1930   tmpccr1l = TIM1->CCR1L;
6150  0007 c65266        	ld	a,21094
6151  000a 6b01          	ld	(OFST-3,sp),a
6153                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
6155  000c 5f            	clrw	x
6156  000d 97            	ld	xl,a
6157  000e 1f03          	ldw	(OFST-1,sp),x
6159                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6161  0010 5f            	clrw	x
6162  0011 7b02          	ld	a,(OFST-2,sp)
6163  0013 97            	ld	xl,a
6164  0014 7b04          	ld	a,(OFST+0,sp)
6165  0016 01            	rrwa	x,a
6166  0017 1a03          	or	a,(OFST-1,sp)
6167  0019 01            	rrwa	x,a
6169                     ; 1935   return (uint16_t)tmpccr1;
6173  001a 5b04          	addw	sp,#4
6174  001c 81            	ret	
6226                     ; 1943 uint16_t TIM1_GetCapture2(void)
6226                     ; 1944 {
6227                     .text:	section	.text,new
6228  0000               _TIM1_GetCapture2:
6230  0000 5204          	subw	sp,#4
6231       00000004      OFST:	set	4
6234                     ; 1947   uint16_t tmpccr2 = 0;
6236                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
6240                     ; 1950   tmpccr2h = TIM1->CCR2H;
6242  0002 c65267        	ld	a,21095
6243  0005 6b02          	ld	(OFST-2,sp),a
6245                     ; 1951   tmpccr2l = TIM1->CCR2L;
6247  0007 c65268        	ld	a,21096
6248  000a 6b01          	ld	(OFST-3,sp),a
6250                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
6252  000c 5f            	clrw	x
6253  000d 97            	ld	xl,a
6254  000e 1f03          	ldw	(OFST-1,sp),x
6256                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6258  0010 5f            	clrw	x
6259  0011 7b02          	ld	a,(OFST-2,sp)
6260  0013 97            	ld	xl,a
6261  0014 7b04          	ld	a,(OFST+0,sp)
6262  0016 01            	rrwa	x,a
6263  0017 1a03          	or	a,(OFST-1,sp)
6264  0019 01            	rrwa	x,a
6266                     ; 1956   return (uint16_t)tmpccr2;
6270  001a 5b04          	addw	sp,#4
6271  001c 81            	ret	
6323                     ; 1964 uint16_t TIM1_GetCapture3(void)
6323                     ; 1965 {
6324                     .text:	section	.text,new
6325  0000               _TIM1_GetCapture3:
6327  0000 5204          	subw	sp,#4
6328       00000004      OFST:	set	4
6331                     ; 1967   uint16_t tmpccr3 = 0;
6333                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
6337                     ; 1970   tmpccr3h = TIM1->CCR3H;
6339  0002 c65269        	ld	a,21097
6340  0005 6b02          	ld	(OFST-2,sp),a
6342                     ; 1971   tmpccr3l = TIM1->CCR3L;
6344  0007 c6526a        	ld	a,21098
6345  000a 6b01          	ld	(OFST-3,sp),a
6347                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
6349  000c 5f            	clrw	x
6350  000d 97            	ld	xl,a
6351  000e 1f03          	ldw	(OFST-1,sp),x
6353                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
6355  0010 5f            	clrw	x
6356  0011 7b02          	ld	a,(OFST-2,sp)
6357  0013 97            	ld	xl,a
6358  0014 7b04          	ld	a,(OFST+0,sp)
6359  0016 01            	rrwa	x,a
6360  0017 1a03          	or	a,(OFST-1,sp)
6361  0019 01            	rrwa	x,a
6363                     ; 1976   return (uint16_t)tmpccr3;
6367  001a 5b04          	addw	sp,#4
6368  001c 81            	ret	
6420                     ; 1984 uint16_t TIM1_GetCapture4(void)
6420                     ; 1985 {
6421                     .text:	section	.text,new
6422  0000               _TIM1_GetCapture4:
6424  0000 5204          	subw	sp,#4
6425       00000004      OFST:	set	4
6428                     ; 1987   uint16_t tmpccr4 = 0;
6430                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
6434                     ; 1990   tmpccr4h = TIM1->CCR4H;
6436  0002 c6526b        	ld	a,21099
6437  0005 6b02          	ld	(OFST-2,sp),a
6439                     ; 1991   tmpccr4l = TIM1->CCR4L;
6441  0007 c6526c        	ld	a,21100
6442  000a 6b01          	ld	(OFST-3,sp),a
6444                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
6446  000c 5f            	clrw	x
6447  000d 97            	ld	xl,a
6448  000e 1f03          	ldw	(OFST-1,sp),x
6450                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
6452  0010 5f            	clrw	x
6453  0011 7b02          	ld	a,(OFST-2,sp)
6454  0013 97            	ld	xl,a
6455  0014 7b04          	ld	a,(OFST+0,sp)
6456  0016 01            	rrwa	x,a
6457  0017 1a03          	or	a,(OFST-1,sp)
6458  0019 01            	rrwa	x,a
6460                     ; 1996   return (uint16_t)tmpccr4;
6464  001a 5b04          	addw	sp,#4
6465  001c 81            	ret	
6499                     ; 2004 uint16_t TIM1_GetCounter(void)
6499                     ; 2005 {
6500                     .text:	section	.text,new
6501  0000               _TIM1_GetCounter:
6503  0000 89            	pushw	x
6504       00000002      OFST:	set	2
6507                     ; 2006   uint16_t tmpcntr = 0;
6509                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
6511  0001 c6525e        	ld	a,21086
6512  0004 97            	ld	xl,a
6513  0005 4f            	clr	a
6514  0006 02            	rlwa	x,a
6515  0007 1f01          	ldw	(OFST-1,sp),x
6517                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
6519  0009 c6525f        	ld	a,21087
6520  000c 5f            	clrw	x
6521  000d 97            	ld	xl,a
6522  000e 01            	rrwa	x,a
6523  000f 1a02          	or	a,(OFST+0,sp)
6524  0011 01            	rrwa	x,a
6525  0012 1a01          	or	a,(OFST-1,sp)
6526  0014 01            	rrwa	x,a
6529  0015 5b02          	addw	sp,#2
6530  0017 81            	ret	
6564                     ; 2019 uint16_t TIM1_GetPrescaler(void)
6564                     ; 2020 {
6565                     .text:	section	.text,new
6566  0000               _TIM1_GetPrescaler:
6568  0000 89            	pushw	x
6569       00000002      OFST:	set	2
6572                     ; 2021   uint16_t temp = 0;
6574                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
6576  0001 c65260        	ld	a,21088
6577  0004 97            	ld	xl,a
6578  0005 4f            	clr	a
6579  0006 02            	rlwa	x,a
6580  0007 1f01          	ldw	(OFST-1,sp),x
6582                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
6584  0009 c65261        	ld	a,21089
6585  000c 5f            	clrw	x
6586  000d 97            	ld	xl,a
6587  000e 01            	rrwa	x,a
6588  000f 1a02          	or	a,(OFST+0,sp)
6589  0011 01            	rrwa	x,a
6590  0012 1a01          	or	a,(OFST-1,sp)
6591  0014 01            	rrwa	x,a
6594  0015 5b02          	addw	sp,#2
6595  0017 81            	ret	
6769                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6769                     ; 2048 {
6770                     .text:	section	.text,new
6771  0000               _TIM1_GetFlagStatus:
6773  0000 89            	pushw	x
6774  0001 89            	pushw	x
6775       00000002      OFST:	set	2
6778                     ; 2049   FlagStatus bitstatus = RESET;
6780                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
6784                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6786                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
6788  0002 9f            	ld	a,xl
6789  0003 c45255        	and	a,21077
6790  0006 6b01          	ld	(OFST-1,sp),a
6792                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
6794  0008 7b03          	ld	a,(OFST+1,sp)
6795  000a 6b02          	ld	(OFST+0,sp),a
6797                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
6799  000c c45256        	and	a,21078
6800  000f 1a01          	or	a,(OFST-1,sp)
6801  0011 2702          	jreq	L5643
6802                     ; 2060     bitstatus = SET;
6804  0013 a601          	ld	a,#1
6807  0015               L5643:
6808                     ; 2064     bitstatus = RESET;
6811                     ; 2066   return (FlagStatus)(bitstatus);
6815  0015 5b04          	addw	sp,#4
6816  0017 81            	ret	
6851                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6851                     ; 2088 {
6852                     .text:	section	.text,new
6853  0000               _TIM1_ClearFlag:
6855  0000 89            	pushw	x
6856       00000000      OFST:	set	0
6859                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6861                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
6863  0001 9f            	ld	a,xl
6864  0002 43            	cpl	a
6865  0003 c75255        	ld	21077,a
6866                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
6866                     ; 2095                         (uint8_t)0x1E);
6868  0006 7b01          	ld	a,(OFST+1,sp)
6869  0008 43            	cpl	a
6870  0009 a41e          	and	a,#30
6871  000b c75256        	ld	21078,a
6872                     ; 2096 }
6875  000e 85            	popw	x
6876  000f 81            	ret	
6940                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
6940                     ; 2113 {
6941                     .text:	section	.text,new
6942  0000               _TIM1_GetITStatus:
6944  0000 88            	push	a
6945  0001 89            	pushw	x
6946       00000002      OFST:	set	2
6949                     ; 2114   ITStatus bitstatus = RESET;
6951                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
6955                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
6957                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
6959  0002 c45255        	and	a,21077
6960  0005 6b01          	ld	(OFST-1,sp),a
6962                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
6964  0007 c65254        	ld	a,21076
6965  000a 1403          	and	a,(OFST+1,sp)
6966  000c 6b02          	ld	(OFST+0,sp),a
6968                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
6970  000e 7b01          	ld	a,(OFST-1,sp)
6971  0010 2708          	jreq	L1453
6973  0012 7b02          	ld	a,(OFST+0,sp)
6974  0014 2704          	jreq	L1453
6975                     ; 2126     bitstatus = SET;
6977  0016 a601          	ld	a,#1
6980  0018 2001          	jra	L3453
6981  001a               L1453:
6982                     ; 2130     bitstatus = RESET;
6984  001a 4f            	clr	a
6986  001b               L3453:
6987                     ; 2132   return (ITStatus)(bitstatus);
6991  001b 5b03          	addw	sp,#3
6992  001d 81            	ret	
7028                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
7028                     ; 2150 {
7029                     .text:	section	.text,new
7030  0000               _TIM1_ClearITPendingBit:
7034                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
7036                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
7038  0000 43            	cpl	a
7039  0001 c75255        	ld	21077,a
7040                     ; 2156 }
7043  0004 81            	ret	
7095                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
7095                     ; 2175                        uint8_t TIM1_ICSelection,
7095                     ; 2176                        uint8_t TIM1_ICFilter)
7095                     ; 2177 {
7096                     .text:	section	.text,new
7097  0000               L3_TI1_Config:
7099  0000 89            	pushw	x
7100  0001 88            	push	a
7101       00000001      OFST:	set	1
7104                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7106  0002 7211525c      	bres	21084,#0
7107                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
7107                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7109  0006 7b06          	ld	a,(OFST+5,sp)
7110  0008 97            	ld	xl,a
7111  0009 a610          	ld	a,#16
7112  000b 42            	mul	x,a
7113  000c 9f            	ld	a,xl
7114  000d 1a03          	or	a,(OFST+2,sp)
7115  000f 6b01          	ld	(OFST+0,sp),a
7117  0011 c65258        	ld	a,21080
7118  0014 a40c          	and	a,#12
7119  0016 1a01          	or	a,(OFST+0,sp)
7120  0018 c75258        	ld	21080,a
7121                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7123  001b 7b02          	ld	a,(OFST+1,sp)
7124  001d 2706          	jreq	L1163
7125                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7127  001f 7212525c      	bset	21084,#1
7129  0023 2004          	jra	L3163
7130  0025               L1163:
7131                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7133  0025 7213525c      	bres	21084,#1
7134  0029               L3163:
7135                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7137  0029 7210525c      	bset	21084,#0
7138                     ; 2197 }
7141  002d 5b03          	addw	sp,#3
7142  002f 81            	ret	
7194                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
7194                     ; 2216                        uint8_t TIM1_ICSelection,
7194                     ; 2217                        uint8_t TIM1_ICFilter)
7194                     ; 2218 {
7195                     .text:	section	.text,new
7196  0000               L5_TI2_Config:
7198  0000 89            	pushw	x
7199  0001 88            	push	a
7200       00000001      OFST:	set	1
7203                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7205  0002 7219525c      	bres	21084,#4
7206                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
7206                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7208  0006 7b06          	ld	a,(OFST+5,sp)
7209  0008 97            	ld	xl,a
7210  0009 a610          	ld	a,#16
7211  000b 42            	mul	x,a
7212  000c 9f            	ld	a,xl
7213  000d 1a03          	or	a,(OFST+2,sp)
7214  000f 6b01          	ld	(OFST+0,sp),a
7216  0011 c65259        	ld	a,21081
7217  0014 a40c          	and	a,#12
7218  0016 1a01          	or	a,(OFST+0,sp)
7219  0018 c75259        	ld	21081,a
7220                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7222  001b 7b02          	ld	a,(OFST+1,sp)
7223  001d 2706          	jreq	L3463
7224                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7226  001f 721a525c      	bset	21084,#5
7228  0023 2004          	jra	L5463
7229  0025               L3463:
7230                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7232  0025 721b525c      	bres	21084,#5
7233  0029               L5463:
7234                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7236  0029 7218525c      	bset	21084,#4
7237                     ; 2236 }
7240  002d 5b03          	addw	sp,#3
7241  002f 81            	ret	
7293                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
7293                     ; 2255                        uint8_t TIM1_ICSelection,
7293                     ; 2256                        uint8_t TIM1_ICFilter)
7293                     ; 2257 {
7294                     .text:	section	.text,new
7295  0000               L7_TI3_Config:
7297  0000 89            	pushw	x
7298  0001 88            	push	a
7299       00000001      OFST:	set	1
7302                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7304  0002 7211525d      	bres	21085,#0
7305                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
7305                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7307  0006 7b06          	ld	a,(OFST+5,sp)
7308  0008 97            	ld	xl,a
7309  0009 a610          	ld	a,#16
7310  000b 42            	mul	x,a
7311  000c 9f            	ld	a,xl
7312  000d 1a03          	or	a,(OFST+2,sp)
7313  000f 6b01          	ld	(OFST+0,sp),a
7315  0011 c6525a        	ld	a,21082
7316  0014 a40c          	and	a,#12
7317  0016 1a01          	or	a,(OFST+0,sp)
7318  0018 c7525a        	ld	21082,a
7319                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7321  001b 7b02          	ld	a,(OFST+1,sp)
7322  001d 2706          	jreq	L5763
7323                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
7325  001f 7212525d      	bset	21085,#1
7327  0023 2004          	jra	L7763
7328  0025               L5763:
7329                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7331  0025 7213525d      	bres	21085,#1
7332  0029               L7763:
7333                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7335  0029 7210525d      	bset	21085,#0
7336                     ; 2276 }
7339  002d 5b03          	addw	sp,#3
7340  002f 81            	ret	
7392                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
7392                     ; 2295                        uint8_t TIM1_ICSelection,
7392                     ; 2296                        uint8_t TIM1_ICFilter)
7392                     ; 2297 {
7393                     .text:	section	.text,new
7394  0000               L11_TI4_Config:
7396  0000 89            	pushw	x
7397  0001 88            	push	a
7398       00000001      OFST:	set	1
7401                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7403  0002 7219525d      	bres	21085,#4
7404                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
7404                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7406  0006 7b06          	ld	a,(OFST+5,sp)
7407  0008 97            	ld	xl,a
7408  0009 a610          	ld	a,#16
7409  000b 42            	mul	x,a
7410  000c 9f            	ld	a,xl
7411  000d 1a03          	or	a,(OFST+2,sp)
7412  000f 6b01          	ld	(OFST+0,sp),a
7414  0011 c6525b        	ld	a,21083
7415  0014 a40c          	and	a,#12
7416  0016 1a01          	or	a,(OFST+0,sp)
7417  0018 c7525b        	ld	21083,a
7418                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7420  001b 7b02          	ld	a,(OFST+1,sp)
7421  001d 2706          	jreq	L7273
7422                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
7424  001f 721a525d      	bset	21085,#5
7426  0023 2004          	jra	L1373
7427  0025               L7273:
7428                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
7430  0025 721b525d      	bres	21085,#5
7431  0029               L1373:
7432                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7434  0029 7218525d      	bset	21085,#4
7435                     ; 2317 }
7438  002d 5b03          	addw	sp,#3
7439  002f 81            	ret	
7452                     	xdef	_TIM1_ClearITPendingBit
7453                     	xdef	_TIM1_GetITStatus
7454                     	xdef	_TIM1_ClearFlag
7455                     	xdef	_TIM1_GetFlagStatus
7456                     	xdef	_TIM1_GetPrescaler
7457                     	xdef	_TIM1_GetCounter
7458                     	xdef	_TIM1_GetCapture4
7459                     	xdef	_TIM1_GetCapture3
7460                     	xdef	_TIM1_GetCapture2
7461                     	xdef	_TIM1_GetCapture1
7462                     	xdef	_TIM1_SetIC4Prescaler
7463                     	xdef	_TIM1_SetIC3Prescaler
7464                     	xdef	_TIM1_SetIC2Prescaler
7465                     	xdef	_TIM1_SetIC1Prescaler
7466                     	xdef	_TIM1_SetCompare4
7467                     	xdef	_TIM1_SetCompare3
7468                     	xdef	_TIM1_SetCompare2
7469                     	xdef	_TIM1_SetCompare1
7470                     	xdef	_TIM1_SetAutoreload
7471                     	xdef	_TIM1_SetCounter
7472                     	xdef	_TIM1_SelectOCxM
7473                     	xdef	_TIM1_CCxNCmd
7474                     	xdef	_TIM1_CCxCmd
7475                     	xdef	_TIM1_OC4PolarityConfig
7476                     	xdef	_TIM1_OC3NPolarityConfig
7477                     	xdef	_TIM1_OC3PolarityConfig
7478                     	xdef	_TIM1_OC2NPolarityConfig
7479                     	xdef	_TIM1_OC2PolarityConfig
7480                     	xdef	_TIM1_OC1NPolarityConfig
7481                     	xdef	_TIM1_OC1PolarityConfig
7482                     	xdef	_TIM1_GenerateEvent
7483                     	xdef	_TIM1_OC4FastConfig
7484                     	xdef	_TIM1_OC3FastConfig
7485                     	xdef	_TIM1_OC2FastConfig
7486                     	xdef	_TIM1_OC1FastConfig
7487                     	xdef	_TIM1_OC4PreloadConfig
7488                     	xdef	_TIM1_OC3PreloadConfig
7489                     	xdef	_TIM1_OC2PreloadConfig
7490                     	xdef	_TIM1_OC1PreloadConfig
7491                     	xdef	_TIM1_CCPreloadControl
7492                     	xdef	_TIM1_SelectCOM
7493                     	xdef	_TIM1_ARRPreloadConfig
7494                     	xdef	_TIM1_ForcedOC4Config
7495                     	xdef	_TIM1_ForcedOC3Config
7496                     	xdef	_TIM1_ForcedOC2Config
7497                     	xdef	_TIM1_ForcedOC1Config
7498                     	xdef	_TIM1_CounterModeConfig
7499                     	xdef	_TIM1_PrescalerConfig
7500                     	xdef	_TIM1_EncoderInterfaceConfig
7501                     	xdef	_TIM1_SelectMasterSlaveMode
7502                     	xdef	_TIM1_SelectSlaveMode
7503                     	xdef	_TIM1_SelectOutputTrigger
7504                     	xdef	_TIM1_SelectOnePulseMode
7505                     	xdef	_TIM1_SelectHallSensor
7506                     	xdef	_TIM1_UpdateRequestConfig
7507                     	xdef	_TIM1_UpdateDisableConfig
7508                     	xdef	_TIM1_SelectInputTrigger
7509                     	xdef	_TIM1_TIxExternalClockConfig
7510                     	xdef	_TIM1_ETRConfig
7511                     	xdef	_TIM1_ETRClockMode2Config
7512                     	xdef	_TIM1_ETRClockMode1Config
7513                     	xdef	_TIM1_InternalClockConfig
7514                     	xdef	_TIM1_ITConfig
7515                     	xdef	_TIM1_CtrlPWMOutputs
7516                     	xdef	_TIM1_Cmd
7517                     	xdef	_TIM1_PWMIConfig
7518                     	xdef	_TIM1_ICInit
7519                     	xdef	_TIM1_BDTRConfig
7520                     	xdef	_TIM1_OC4Init
7521                     	xdef	_TIM1_OC3Init
7522                     	xdef	_TIM1_OC2Init
7523                     	xdef	_TIM1_OC1Init
7524                     	xdef	_TIM1_TimeBaseInit
7525                     	xdef	_TIM1_DeInit
7544                     	end

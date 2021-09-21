   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  21  0002               L5_flagUartRXNE:
  22  0002 00            	dc.b	0
  88                     ; 58 void TIM1_DeInit(void)
  88                     ; 59 {
  90                     .text:	section	.text,new
  91  0000               _TIM1_DeInit:
  95                     ; 60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  97  0000 725f5250      	clr	21072
  98                     ; 61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
 100  0004 725f5251      	clr	21073
 101                     ; 62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
 103  0008 725f5252      	clr	21074
 104                     ; 63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
 106  000c 725f5253      	clr	21075
 107                     ; 64   TIM1->IER  = TIM1_IER_RESET_VALUE;
 109  0010 725f5254      	clr	21076
 110                     ; 65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
 112  0014 725f5256      	clr	21078
 113                     ; 67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
 115  0018 725f525c      	clr	21084
 116                     ; 68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
 118  001c 725f525d      	clr	21085
 119                     ; 70   TIM1->CCMR1 = 0x01;
 121  0020 35015258      	mov	21080,#1
 122                     ; 71   TIM1->CCMR2 = 0x01;
 124  0024 35015259      	mov	21081,#1
 125                     ; 72   TIM1->CCMR3 = 0x01;
 127  0028 3501525a      	mov	21082,#1
 128                     ; 73   TIM1->CCMR4 = 0x01;
 130  002c 3501525b      	mov	21083,#1
 131                     ; 75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
 133  0030 725f525c      	clr	21084
 134                     ; 76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
 136  0034 725f525d      	clr	21085
 137                     ; 77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
 139  0038 725f5258      	clr	21080
 140                     ; 78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
 142  003c 725f5259      	clr	21081
 143                     ; 79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 145  0040 725f525a      	clr	21082
 146                     ; 80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 148  0044 725f525b      	clr	21083
 149                     ; 81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 151  0048 725f525e      	clr	21086
 152                     ; 82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 154  004c 725f525f      	clr	21087
 155                     ; 83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 157  0050 725f5260      	clr	21088
 158                     ; 84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 160  0054 725f5261      	clr	21089
 161                     ; 85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 163  0058 35ff5262      	mov	21090,#255
 164                     ; 86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 166  005c 35ff5263      	mov	21091,#255
 167                     ; 87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 169  0060 725f5265      	clr	21093
 170                     ; 88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 172  0064 725f5266      	clr	21094
 173                     ; 89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 175  0068 725f5267      	clr	21095
 176                     ; 90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 178  006c 725f5268      	clr	21096
 179                     ; 91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 181  0070 725f5269      	clr	21097
 182                     ; 92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 184  0074 725f526a      	clr	21098
 185                     ; 93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 187  0078 725f526b      	clr	21099
 188                     ; 94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 190  007c 725f526c      	clr	21100
 191                     ; 95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 193  0080 725f526f      	clr	21103
 194                     ; 96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 196  0084 35015257      	mov	21079,#1
 197                     ; 97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 199  0088 725f526e      	clr	21102
 200                     ; 98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 202  008c 725f526d      	clr	21101
 203                     ; 99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 205  0090 725f5264      	clr	21092
 206                     ; 100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 208  0094 725f5255      	clr	21077
 209                     ; 101 }
 212  0098 81            	ret	
 321                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 321                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 321                     ; 113                        uint16_t TIM1_Period,
 321                     ; 114                        uint8_t TIM1_RepetitionCounter)
 321                     ; 115 {
 322                     .text:	section	.text,new
 323  0000               _TIM1_TimeBaseInit:
 325       fffffffe      OFST: set -2
 328                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 330                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 332  0000 7b04          	ld	a,(OFST+6,sp)
 333  0002 c75262        	ld	21090,a
 334                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 336  0005 7b05          	ld	a,(OFST+7,sp)
 337  0007 c75263        	ld	21091,a
 338                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 340  000a 9e            	ld	a,xh
 341  000b c75260        	ld	21088,a
 342                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 344  000e 9f            	ld	a,xl
 345  000f c75261        	ld	21089,a
 346                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 346                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 348  0012 c65250        	ld	a,21072
 349  0015 a48f          	and	a,#143
 350  0017 1a03          	or	a,(OFST+5,sp)
 351  0019 c75250        	ld	21072,a
 352                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 354  001c 7b06          	ld	a,(OFST+8,sp)
 355  001e c75264        	ld	21092,a
 356                     ; 133 }
 359  0021 81            	ret	
 644                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 644                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 644                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 644                     ; 157                   uint16_t TIM1_Pulse,
 644                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 644                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 644                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 644                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 644                     ; 162 {
 645                     .text:	section	.text,new
 646  0000               _TIM1_OC1Init:
 648  0000 89            	pushw	x
 649  0001 5203          	subw	sp,#3
 650       00000003      OFST:	set	3
 653                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 655                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 657                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 659                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 661                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 663                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 665                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 667                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 667                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 669  0003 c6525c        	ld	a,21084
 670  0006 a4f0          	and	a,#240
 671  0008 c7525c        	ld	21084,a
 672                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 672                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 672                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 672                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 674  000b 7b0c          	ld	a,(OFST+9,sp)
 675  000d a408          	and	a,#8
 676  000f 6b03          	ld	(OFST+0,sp),a
 678  0011 7b0b          	ld	a,(OFST+8,sp)
 679  0013 a402          	and	a,#2
 680  0015 1a03          	or	a,(OFST+0,sp)
 681  0017 6b02          	ld	(OFST-1,sp),a
 683  0019 7b08          	ld	a,(OFST+5,sp)
 684  001b a404          	and	a,#4
 685  001d 6b01          	ld	(OFST-2,sp),a
 687  001f 9f            	ld	a,xl
 688  0020 a401          	and	a,#1
 689  0022 1a01          	or	a,(OFST-2,sp)
 690  0024 1a02          	or	a,(OFST-1,sp)
 691  0026 ca525c        	or	a,21084
 692  0029 c7525c        	ld	21084,a
 693                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 693                     ; 185                           (uint8_t)TIM1_OCMode);
 695  002c c65258        	ld	a,21080
 696  002f a48f          	and	a,#143
 697  0031 1a04          	or	a,(OFST+1,sp)
 698  0033 c75258        	ld	21080,a
 699                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 701  0036 c6526f        	ld	a,21103
 702  0039 a4fc          	and	a,#252
 703  003b c7526f        	ld	21103,a
 704                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 704                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 706  003e 7b0e          	ld	a,(OFST+11,sp)
 707  0040 a402          	and	a,#2
 708  0042 6b03          	ld	(OFST+0,sp),a
 710  0044 7b0d          	ld	a,(OFST+10,sp)
 711  0046 a401          	and	a,#1
 712  0048 1a03          	or	a,(OFST+0,sp)
 713  004a ca526f        	or	a,21103
 714  004d c7526f        	ld	21103,a
 715                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 717  0050 7b09          	ld	a,(OFST+6,sp)
 718  0052 c75265        	ld	21093,a
 719                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 721  0055 7b0a          	ld	a,(OFST+7,sp)
 722  0057 c75266        	ld	21094,a
 723                     ; 196 }
 726  005a 5b05          	addw	sp,#5
 727  005c 81            	ret	
 831                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 831                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 831                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 831                     ; 220                   uint16_t TIM1_Pulse,
 831                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 831                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 831                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 831                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 831                     ; 225 {
 832                     .text:	section	.text,new
 833  0000               _TIM1_OC2Init:
 835  0000 89            	pushw	x
 836  0001 5203          	subw	sp,#3
 837       00000003      OFST:	set	3
 840                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 842                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 844                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 846                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 848                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 850                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 852                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 854                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 854                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 856  0003 c6525c        	ld	a,21084
 857  0006 a40f          	and	a,#15
 858  0008 c7525c        	ld	21084,a
 859                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 859                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 859                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 859                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 861  000b 7b0c          	ld	a,(OFST+9,sp)
 862  000d a480          	and	a,#128
 863  000f 6b03          	ld	(OFST+0,sp),a
 865  0011 7b0b          	ld	a,(OFST+8,sp)
 866  0013 a420          	and	a,#32
 867  0015 1a03          	or	a,(OFST+0,sp)
 868  0017 6b02          	ld	(OFST-1,sp),a
 870  0019 7b08          	ld	a,(OFST+5,sp)
 871  001b a440          	and	a,#64
 872  001d 6b01          	ld	(OFST-2,sp),a
 874  001f 9f            	ld	a,xl
 875  0020 a410          	and	a,#16
 876  0022 1a01          	or	a,(OFST-2,sp)
 877  0024 1a02          	or	a,(OFST-1,sp)
 878  0026 ca525c        	or	a,21084
 879  0029 c7525c        	ld	21084,a
 880                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 880                     ; 249                           (uint8_t)TIM1_OCMode);
 882  002c c65259        	ld	a,21081
 883  002f a48f          	and	a,#143
 884  0031 1a04          	or	a,(OFST+1,sp)
 885  0033 c75259        	ld	21081,a
 886                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 888  0036 c6526f        	ld	a,21103
 889  0039 a4f3          	and	a,#243
 890  003b c7526f        	ld	21103,a
 891                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 891                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 893  003e 7b0e          	ld	a,(OFST+11,sp)
 894  0040 a408          	and	a,#8
 895  0042 6b03          	ld	(OFST+0,sp),a
 897  0044 7b0d          	ld	a,(OFST+10,sp)
 898  0046 a404          	and	a,#4
 899  0048 1a03          	or	a,(OFST+0,sp)
 900  004a ca526f        	or	a,21103
 901  004d c7526f        	ld	21103,a
 902                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 904  0050 7b09          	ld	a,(OFST+6,sp)
 905  0052 c75267        	ld	21095,a
 906                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 908  0055 7b0a          	ld	a,(OFST+7,sp)
 909  0057 c75268        	ld	21096,a
 910                     ; 260 }
 913  005a 5b05          	addw	sp,#5
 914  005c 81            	ret	
1018                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1018                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
1018                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1018                     ; 284                   uint16_t TIM1_Pulse,
1018                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1018                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1018                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1018                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1018                     ; 289 {
1019                     .text:	section	.text,new
1020  0000               _TIM1_OC3Init:
1022  0000 89            	pushw	x
1023  0001 5203          	subw	sp,#3
1024       00000003      OFST:	set	3
1027                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1029                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1031                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
1033                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1035                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1037                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1039                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1041                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
1041                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1043  0003 c6525d        	ld	a,21085
1044  0006 a4f0          	and	a,#240
1045  0008 c7525d        	ld	21085,a
1046                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
1046                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
1046                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
1046                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
1048  000b 7b0c          	ld	a,(OFST+9,sp)
1049  000d a408          	and	a,#8
1050  000f 6b03          	ld	(OFST+0,sp),a
1052  0011 7b0b          	ld	a,(OFST+8,sp)
1053  0013 a402          	and	a,#2
1054  0015 1a03          	or	a,(OFST+0,sp)
1055  0017 6b02          	ld	(OFST-1,sp),a
1057  0019 7b08          	ld	a,(OFST+5,sp)
1058  001b a404          	and	a,#4
1059  001d 6b01          	ld	(OFST-2,sp),a
1061  001f 9f            	ld	a,xl
1062  0020 a401          	and	a,#1
1063  0022 1a01          	or	a,(OFST-2,sp)
1064  0024 1a02          	or	a,(OFST-1,sp)
1065  0026 ca525d        	or	a,21085
1066  0029 c7525d        	ld	21085,a
1067                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1067                     ; 312                           (uint8_t)TIM1_OCMode);
1069  002c c6525a        	ld	a,21082
1070  002f a48f          	and	a,#143
1071  0031 1a04          	or	a,(OFST+1,sp)
1072  0033 c7525a        	ld	21082,a
1073                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1075  0036 c6526f        	ld	a,21103
1076  0039 a4cf          	and	a,#207
1077  003b c7526f        	ld	21103,a
1078                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1078                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1080  003e 7b0e          	ld	a,(OFST+11,sp)
1081  0040 a420          	and	a,#32
1082  0042 6b03          	ld	(OFST+0,sp),a
1084  0044 7b0d          	ld	a,(OFST+10,sp)
1085  0046 a410          	and	a,#16
1086  0048 1a03          	or	a,(OFST+0,sp)
1087  004a ca526f        	or	a,21103
1088  004d c7526f        	ld	21103,a
1089                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1091  0050 7b09          	ld	a,(OFST+6,sp)
1092  0052 c75269        	ld	21097,a
1093                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1095  0055 7b0a          	ld	a,(OFST+7,sp)
1096  0057 c7526a        	ld	21098,a
1097                     ; 323 }
1100  005a 5b05          	addw	sp,#5
1101  005c 81            	ret	
1175                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1175                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
1175                     ; 340                   uint16_t TIM1_Pulse,
1175                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1175                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1175                     ; 343 {
1176                     .text:	section	.text,new
1177  0000               _TIM1_OC4Init:
1179  0000 89            	pushw	x
1180  0001 88            	push	a
1181       00000001      OFST:	set	1
1184                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1186                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1188                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1190                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1192                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1194  0002 c6525d        	ld	a,21085
1195  0005 a4cf          	and	a,#207
1196  0007 c7525d        	ld	21085,a
1197                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1197                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1199  000a 7b08          	ld	a,(OFST+7,sp)
1200  000c a420          	and	a,#32
1201  000e 6b01          	ld	(OFST+0,sp),a
1203  0010 9f            	ld	a,xl
1204  0011 a410          	and	a,#16
1205  0013 1a01          	or	a,(OFST+0,sp)
1206  0015 ca525d        	or	a,21085
1207  0018 c7525d        	ld	21085,a
1208                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1208                     ; 358                           TIM1_OCMode);
1210  001b c6525b        	ld	a,21083
1211  001e a48f          	and	a,#143
1212  0020 1a02          	or	a,(OFST+1,sp)
1213  0022 c7525b        	ld	21083,a
1214                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1216  0025 7b09          	ld	a,(OFST+8,sp)
1217  0027 270a          	jreq	L164
1218                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1220  0029 c6526f        	ld	a,21103
1221  002c aadf          	or	a,#223
1222  002e c7526f        	ld	21103,a
1224  0031 2004          	jra	L364
1225  0033               L164:
1226                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1228  0033 721d526f      	bres	21103,#6
1229  0037               L364:
1230                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1232  0037 7b06          	ld	a,(OFST+5,sp)
1233  0039 c7526b        	ld	21099,a
1234                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1236  003c 7b07          	ld	a,(OFST+6,sp)
1237  003e c7526c        	ld	21100,a
1238                     ; 373 }
1241  0041 5b03          	addw	sp,#3
1242  0043 81            	ret	
1447                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1447                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1447                     ; 390                      uint8_t TIM1_DeadTime,
1447                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
1447                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1447                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1447                     ; 394 {
1448                     .text:	section	.text,new
1449  0000               _TIM1_BDTRConfig:
1451  0000 89            	pushw	x
1452  0001 88            	push	a
1453       00000001      OFST:	set	1
1456                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1458                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1460                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1462                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1464                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1466                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1468  0002 7b06          	ld	a,(OFST+5,sp)
1469  0004 c7526e        	ld	21102,a
1470                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1470                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1470                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
1472  0007 7b07          	ld	a,(OFST+6,sp)
1473  0009 1a08          	or	a,(OFST+7,sp)
1474  000b 1a09          	or	a,(OFST+8,sp)
1475  000d 6b01          	ld	(OFST+0,sp),a
1477  000f 9f            	ld	a,xl
1478  0010 1a02          	or	a,(OFST+1,sp)
1479  0012 1a01          	or	a,(OFST+0,sp)
1480  0014 c7526d        	ld	21101,a
1481                     ; 409 }
1484  0017 5b03          	addw	sp,#3
1485  0019 81            	ret	
1687                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1687                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1687                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1687                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1687                     ; 427                  uint8_t TIM1_ICFilter)
1687                     ; 428 {
1688                     .text:	section	.text,new
1689  0000               _TIM1_ICInit:
1691  0000 89            	pushw	x
1692       00000000      OFST:	set	0
1695                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1697                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1699                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1701                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1703                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1705                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
1707  0001 9e            	ld	a,xh
1708  0002 4d            	tnz	a
1709  0003 2614          	jrne	L317
1710                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
1710                     ; 440                (uint8_t)TIM1_ICSelection,
1710                     ; 441                (uint8_t)TIM1_ICFilter);
1712  0005 7b07          	ld	a,(OFST+7,sp)
1713  0007 88            	push	a
1714  0008 7b06          	ld	a,(OFST+6,sp)
1715  000a 97            	ld	xl,a
1716  000b 7b03          	ld	a,(OFST+3,sp)
1717  000d 95            	ld	xh,a
1718  000e cd0000        	call	L72_TI1_Config
1720  0011 84            	pop	a
1721                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1723  0012 7b06          	ld	a,(OFST+6,sp)
1724  0014 cd0000        	call	_TIM1_SetIC1Prescaler
1727  0017 2044          	jra	L517
1728  0019               L317:
1729                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
1731  0019 7b01          	ld	a,(OFST+1,sp)
1732  001b a101          	cp	a,#1
1733  001d 2614          	jrne	L717
1734                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
1734                     ; 449                (uint8_t)TIM1_ICSelection,
1734                     ; 450                (uint8_t)TIM1_ICFilter);
1736  001f 7b07          	ld	a,(OFST+7,sp)
1737  0021 88            	push	a
1738  0022 7b06          	ld	a,(OFST+6,sp)
1739  0024 97            	ld	xl,a
1740  0025 7b03          	ld	a,(OFST+3,sp)
1741  0027 95            	ld	xh,a
1742  0028 cd0000        	call	L13_TI2_Config
1744  002b 84            	pop	a
1745                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1747  002c 7b06          	ld	a,(OFST+6,sp)
1748  002e cd0000        	call	_TIM1_SetIC2Prescaler
1751  0031 202a          	jra	L517
1752  0033               L717:
1753                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
1755  0033 a102          	cp	a,#2
1756  0035 2614          	jrne	L327
1757                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
1757                     ; 458                (uint8_t)TIM1_ICSelection,
1757                     ; 459                (uint8_t)TIM1_ICFilter);
1759  0037 7b07          	ld	a,(OFST+7,sp)
1760  0039 88            	push	a
1761  003a 7b06          	ld	a,(OFST+6,sp)
1762  003c 97            	ld	xl,a
1763  003d 7b03          	ld	a,(OFST+3,sp)
1764  003f 95            	ld	xh,a
1765  0040 cd0000        	call	L33_TI3_Config
1767  0043 84            	pop	a
1768                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1770  0044 7b06          	ld	a,(OFST+6,sp)
1771  0046 cd0000        	call	_TIM1_SetIC3Prescaler
1774  0049 2012          	jra	L517
1775  004b               L327:
1776                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
1776                     ; 467                (uint8_t)TIM1_ICSelection,
1776                     ; 468                (uint8_t)TIM1_ICFilter);
1778  004b 7b07          	ld	a,(OFST+7,sp)
1779  004d 88            	push	a
1780  004e 7b06          	ld	a,(OFST+6,sp)
1781  0050 97            	ld	xl,a
1782  0051 7b03          	ld	a,(OFST+3,sp)
1783  0053 95            	ld	xh,a
1784  0054 cd0000        	call	L53_TI4_Config
1786  0057 84            	pop	a
1787                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1789  0058 7b06          	ld	a,(OFST+6,sp)
1790  005a cd0000        	call	_TIM1_SetIC4Prescaler
1792  005d               L517:
1793                     ; 472 }
1796  005d 85            	popw	x
1797  005e 81            	ret	
1893                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1893                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1893                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1893                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1893                     ; 492                      uint8_t TIM1_ICFilter)
1893                     ; 493 {
1894                     .text:	section	.text,new
1895  0000               _TIM1_PWMIConfig:
1897  0000 89            	pushw	x
1898  0001 89            	pushw	x
1899       00000002      OFST:	set	2
1902                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
1904                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
1906                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1908                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1910                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1912                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1914                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1916  0002 9f            	ld	a,xl
1917  0003 4a            	dec	a
1918  0004 2702          	jreq	L577
1919                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
1921  0006 a601          	ld	a,#1
1923  0008               L577:
1924                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
1926  0008 6b01          	ld	(OFST-1,sp),a
1928                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1930  000a 7b07          	ld	a,(OFST+5,sp)
1931  000c 4a            	dec	a
1932  000d 2604          	jrne	L1001
1933                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
1935  000f a602          	ld	a,#2
1937  0011 2002          	jra	L3001
1938  0013               L1001:
1939                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
1941  0013 a601          	ld	a,#1
1942  0015               L3001:
1943  0015 6b02          	ld	(OFST+0,sp),a
1945                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
1947  0017 7b03          	ld	a,(OFST+1,sp)
1948  0019 2626          	jrne	L5001
1949                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1949                     ; 527                (uint8_t)TIM1_ICFilter);
1951  001b 7b09          	ld	a,(OFST+7,sp)
1952  001d 88            	push	a
1953  001e 7b08          	ld	a,(OFST+6,sp)
1954  0020 97            	ld	xl,a
1955  0021 7b05          	ld	a,(OFST+3,sp)
1956  0023 95            	ld	xh,a
1957  0024 cd0000        	call	L72_TI1_Config
1959  0027 84            	pop	a
1960                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1962  0028 7b08          	ld	a,(OFST+6,sp)
1963  002a cd0000        	call	_TIM1_SetIC1Prescaler
1965                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1967  002d 7b09          	ld	a,(OFST+7,sp)
1968  002f 88            	push	a
1969  0030 7b03          	ld	a,(OFST+1,sp)
1970  0032 97            	ld	xl,a
1971  0033 7b02          	ld	a,(OFST+0,sp)
1972  0035 95            	ld	xh,a
1973  0036 cd0000        	call	L13_TI2_Config
1975  0039 84            	pop	a
1976                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1978  003a 7b08          	ld	a,(OFST+6,sp)
1979  003c cd0000        	call	_TIM1_SetIC2Prescaler
1982  003f 2024          	jra	L7001
1983  0041               L5001:
1984                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1984                     ; 542                (uint8_t)TIM1_ICFilter);
1986  0041 7b09          	ld	a,(OFST+7,sp)
1987  0043 88            	push	a
1988  0044 7b08          	ld	a,(OFST+6,sp)
1989  0046 97            	ld	xl,a
1990  0047 7b05          	ld	a,(OFST+3,sp)
1991  0049 95            	ld	xh,a
1992  004a cd0000        	call	L13_TI2_Config
1994  004d 84            	pop	a
1995                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1997  004e 7b08          	ld	a,(OFST+6,sp)
1998  0050 cd0000        	call	_TIM1_SetIC2Prescaler
2000                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
2002  0053 7b09          	ld	a,(OFST+7,sp)
2003  0055 88            	push	a
2004  0056 7b03          	ld	a,(OFST+1,sp)
2005  0058 97            	ld	xl,a
2006  0059 7b02          	ld	a,(OFST+0,sp)
2007  005b 95            	ld	xh,a
2008  005c cd0000        	call	L72_TI1_Config
2010  005f 84            	pop	a
2011                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2013  0060 7b08          	ld	a,(OFST+6,sp)
2014  0062 cd0000        	call	_TIM1_SetIC1Prescaler
2016  0065               L7001:
2017                     ; 553 }
2020  0065 5b04          	addw	sp,#4
2021  0067 81            	ret	
2076                     ; 561 void TIM1_Cmd(FunctionalState NewState)
2076                     ; 562 {
2077                     .text:	section	.text,new
2078  0000               _TIM1_Cmd:
2082                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2084                     ; 567   if (NewState != DISABLE)
2086  0000 4d            	tnz	a
2087  0001 2705          	jreq	L7301
2088                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
2090  0003 72105250      	bset	21072,#0
2093  0007 81            	ret	
2094  0008               L7301:
2095                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2097  0008 72115250      	bres	21072,#0
2098                     ; 575 }
2101  000c 81            	ret	
2137                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2137                     ; 584 {
2138                     .text:	section	.text,new
2139  0000               _TIM1_CtrlPWMOutputs:
2143                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2145                     ; 590   if (NewState != DISABLE)
2147  0000 4d            	tnz	a
2148  0001 2705          	jreq	L1601
2149                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
2151  0003 721e526d      	bset	21101,#7
2154  0007 81            	ret	
2155  0008               L1601:
2156                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2158  0008 721f526d      	bres	21101,#7
2159                     ; 598 }
2162  000c 81            	ret	
2269                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2269                     ; 618 {
2270                     .text:	section	.text,new
2271  0000               _TIM1_ITConfig:
2273  0000 89            	pushw	x
2274       00000000      OFST:	set	0
2277                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
2279                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2281                     ; 623   if (NewState != DISABLE)
2283  0001 9f            	ld	a,xl
2284  0002 4d            	tnz	a
2285  0003 2706          	jreq	L3311
2286                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
2288  0005 9e            	ld	a,xh
2289  0006 ca5254        	or	a,21076
2291  0009 2006          	jra	L5311
2292  000b               L3311:
2293                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2295  000b 7b01          	ld	a,(OFST+1,sp)
2296  000d 43            	cpl	a
2297  000e c45254        	and	a,21076
2298  0011               L5311:
2299  0011 c75254        	ld	21076,a
2300                     ; 633 }
2303  0014 85            	popw	x
2304  0015 81            	ret	
2328                     ; 640 void TIM1_InternalClockConfig(void)
2328                     ; 641 {
2329                     .text:	section	.text,new
2330  0000               _TIM1_InternalClockConfig:
2334                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2336  0000 c65252        	ld	a,21074
2337  0003 a4f8          	and	a,#248
2338  0005 c75252        	ld	21074,a
2339                     ; 644 }
2342  0008 81            	ret	
2459                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2459                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2459                     ; 664                               uint8_t ExtTRGFilter)
2459                     ; 665 {
2460                     .text:	section	.text,new
2461  0000               _TIM1_ETRClockMode1Config:
2463  0000 89            	pushw	x
2464       00000000      OFST:	set	0
2467                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2469                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2471                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2473  0001 7b05          	ld	a,(OFST+5,sp)
2474  0003 88            	push	a
2475  0004 7b02          	ld	a,(OFST+2,sp)
2476  0006 95            	ld	xh,a
2477  0007 cd0000        	call	_TIM1_ETRConfig
2479  000a 84            	pop	a
2480                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
2480                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2482  000b c65252        	ld	a,21074
2483  000e aa77          	or	a,#119
2484  0010 c75252        	ld	21074,a
2485                     ; 676 }
2488  0013 85            	popw	x
2489  0014 81            	ret	
2547                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2547                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2547                     ; 696                               uint8_t ExtTRGFilter)
2547                     ; 697 {
2548                     .text:	section	.text,new
2549  0000               _TIM1_ETRClockMode2Config:
2551  0000 89            	pushw	x
2552       00000000      OFST:	set	0
2555                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2557                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2559                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2561  0001 7b05          	ld	a,(OFST+5,sp)
2562  0003 88            	push	a
2563  0004 7b02          	ld	a,(OFST+2,sp)
2564  0006 95            	ld	xh,a
2565  0007 cd0000        	call	_TIM1_ETRConfig
2567  000a 721c5253      	bset	21075,#6
2568                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
2570                     ; 707 }
2573  000e 5b03          	addw	sp,#3
2574  0010 81            	ret	
2630                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2630                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2630                     ; 727                     uint8_t ExtTRGFilter)
2630                     ; 728 {
2631                     .text:	section	.text,new
2632  0000               _TIM1_ETRConfig:
2634  0000 89            	pushw	x
2635       00000000      OFST:	set	0
2638                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
2640                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
2640                     ; 733                          (uint8_t)ExtTRGFilter );
2642  0001 9f            	ld	a,xl
2643  0002 1a01          	or	a,(OFST+1,sp)
2644  0004 1a05          	or	a,(OFST+5,sp)
2645  0006 ca5253        	or	a,21075
2646  0009 c75253        	ld	21075,a
2647                     ; 734 }
2650  000c 85            	popw	x
2651  000d 81            	ret	
2740                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2740                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2740                     ; 753                                  uint8_t ICFilter)
2740                     ; 754 {
2741                     .text:	section	.text,new
2742  0000               _TIM1_TIxExternalClockConfig:
2744  0000 89            	pushw	x
2745       00000000      OFST:	set	0
2748                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2750                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2752                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2754                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2756  0001 9e            	ld	a,xh
2757  0002 a160          	cp	a,#96
2758  0004 260d          	jrne	L5331
2759                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2761  0006 7b05          	ld	a,(OFST+5,sp)
2762  0008 88            	push	a
2763  0009 9f            	ld	a,xl
2764  000a ae0001        	ldw	x,#1
2765  000d 95            	ld	xh,a
2766  000e cd0000        	call	L13_TI2_Config
2769  0011 200c          	jra	L7331
2770  0013               L5331:
2771                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2773  0013 7b05          	ld	a,(OFST+5,sp)
2774  0015 88            	push	a
2775  0016 7b03          	ld	a,(OFST+3,sp)
2776  0018 ae0001        	ldw	x,#1
2777  001b 95            	ld	xh,a
2778  001c cd0000        	call	L72_TI1_Config
2780  001f               L7331:
2781  001f 84            	pop	a
2782                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
2784  0020 7b01          	ld	a,(OFST+1,sp)
2785  0022 cd0000        	call	_TIM1_SelectInputTrigger
2787                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
2789  0025 c65252        	ld	a,21074
2790  0028 aa07          	or	a,#7
2791  002a c75252        	ld	21074,a
2792                     ; 775 }
2795  002d 85            	popw	x
2796  002e 81            	ret	
2881                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2881                     ; 788 {
2882                     .text:	section	.text,new
2883  0000               _TIM1_SelectInputTrigger:
2885  0000 88            	push	a
2886       00000000      OFST:	set	0
2889                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2891                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
2893  0001 c65252        	ld	a,21074
2894  0004 a48f          	and	a,#143
2895  0006 1a01          	or	a,(OFST+1,sp)
2896  0008 c75252        	ld	21074,a
2897                     ; 794 }
2900  000b 84            	pop	a
2901  000c 81            	ret	
2937                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2937                     ; 804 {
2938                     .text:	section	.text,new
2939  0000               _TIM1_UpdateDisableConfig:
2943                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2945                     ; 809   if (NewState != DISABLE)
2947  0000 4d            	tnz	a
2948  0001 2705          	jreq	L5141
2949                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
2951  0003 72125250      	bset	21072,#1
2954  0007 81            	ret	
2955  0008               L5141:
2956                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
2958  0008 72135250      	bres	21072,#1
2959                     ; 817 }
2962  000c 81            	ret	
3020                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
3020                     ; 828 {
3021                     .text:	section	.text,new
3022  0000               _TIM1_UpdateRequestConfig:
3026                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
3028                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
3030  0000 4d            	tnz	a
3031  0001 2705          	jreq	L7441
3032                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
3034  0003 72145250      	bset	21072,#2
3037  0007 81            	ret	
3038  0008               L7441:
3039                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
3041  0008 72155250      	bres	21072,#2
3042                     ; 841 }
3045  000c 81            	ret	
3081                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
3081                     ; 850 {
3082                     .text:	section	.text,new
3083  0000               _TIM1_SelectHallSensor:
3087                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3089                     ; 855   if (NewState != DISABLE)
3091  0000 4d            	tnz	a
3092  0001 2705          	jreq	L1741
3093                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
3095  0003 721e5251      	bset	21073,#7
3098  0007 81            	ret	
3099  0008               L1741:
3100                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3102  0008 721f5251      	bres	21073,#7
3103                     ; 863 }
3106  000c 81            	ret	
3163                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3163                     ; 874 {
3164                     .text:	section	.text,new
3165  0000               _TIM1_SelectOnePulseMode:
3169                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3171                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3173  0000 4d            	tnz	a
3174  0001 2705          	jreq	L3251
3175                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
3177  0003 72165250      	bset	21072,#3
3180  0007 81            	ret	
3181  0008               L3251:
3182                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3184  0008 72175250      	bres	21072,#3
3185                     ; 888 }
3188  000c 81            	ret	
3286                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3286                     ; 904 {
3287                     .text:	section	.text,new
3288  0000               _TIM1_SelectOutputTrigger:
3290  0000 88            	push	a
3291       00000000      OFST:	set	0
3294                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3296                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
3296                     ; 910                         (uint8_t) TIM1_TRGOSource);
3298  0001 c65251        	ld	a,21073
3299  0004 a48f          	and	a,#143
3300  0006 1a01          	or	a,(OFST+1,sp)
3301  0008 c75251        	ld	21073,a
3302                     ; 911 }
3305  000b 84            	pop	a
3306  000c 81            	ret	
3380                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3380                     ; 924 {
3381                     .text:	section	.text,new
3382  0000               _TIM1_SelectSlaveMode:
3384  0000 88            	push	a
3385       00000000      OFST:	set	0
3388                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3390                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
3390                     ; 930                          (uint8_t)TIM1_SlaveMode);
3392  0001 c65252        	ld	a,21074
3393  0004 a4f8          	and	a,#248
3394  0006 1a01          	or	a,(OFST+1,sp)
3395  0008 c75252        	ld	21074,a
3396                     ; 931 }
3399  000b 84            	pop	a
3400  000c 81            	ret	
3436                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3436                     ; 940 {
3437                     .text:	section	.text,new
3438  0000               _TIM1_SelectMasterSlaveMode:
3442                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3444                     ; 945   if (NewState != DISABLE)
3446  0000 4d            	tnz	a
3447  0001 2705          	jreq	L7361
3448                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
3450  0003 721e5252      	bset	21074,#7
3453  0007 81            	ret	
3454  0008               L7361:
3455                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
3457  0008 721f5252      	bres	21074,#7
3458                     ; 953 }
3461  000c 81            	ret	
3547                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3547                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3547                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3547                     ; 978 {
3548                     .text:	section	.text,new
3549  0000               _TIM1_EncoderInterfaceConfig:
3551  0000 89            	pushw	x
3552       00000000      OFST:	set	0
3555                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3557                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3559                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3561                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3563  0001 9f            	ld	a,xl
3564  0002 4d            	tnz	a
3565  0003 2706          	jreq	L3071
3566                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3568  0005 7212525c      	bset	21084,#1
3570  0009 2004          	jra	L5071
3571  000b               L3071:
3572                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3574  000b 7213525c      	bres	21084,#1
3575  000f               L5071:
3576                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3578  000f 7b05          	ld	a,(OFST+5,sp)
3579  0011 2706          	jreq	L7071
3580                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3582  0013 721a525c      	bset	21084,#5
3584  0017 2004          	jra	L1171
3585  0019               L7071:
3586                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3588  0019 721b525c      	bres	21084,#5
3589  001d               L1171:
3590                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
3590                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
3592  001d c65252        	ld	a,21074
3593  0020 a4f0          	and	a,#240
3594  0022 1a01          	or	a,(OFST+1,sp)
3595  0024 c75252        	ld	21074,a
3596                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
3596                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
3598  0027 c65258        	ld	a,21080
3599  002a a4fc          	and	a,#252
3600  002c aa01          	or	a,#1
3601  002e c75258        	ld	21080,a
3602                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
3602                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
3604  0031 c65259        	ld	a,21081
3605  0034 a4fc          	and	a,#252
3606  0036 aa01          	or	a,#1
3607  0038 c75259        	ld	21081,a
3608                     ; 1011 }
3611  003b 85            	popw	x
3612  003c 81            	ret	
3679                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
3679                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3679                     ; 1025 {
3680                     .text:	section	.text,new
3681  0000               _TIM1_PrescalerConfig:
3683       fffffffe      OFST: set -2
3686                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3688                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
3690  0000 9e            	ld	a,xh
3691  0001 c75260        	ld	21088,a
3692                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
3694  0004 9f            	ld	a,xl
3695  0005 c75261        	ld	21089,a
3696                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
3698  0008 7b03          	ld	a,(OFST+5,sp)
3699  000a c75257        	ld	21079,a
3700                     ; 1035 }
3703  000d 81            	ret	
3739                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3739                     ; 1049 {
3740                     .text:	section	.text,new
3741  0000               _TIM1_CounterModeConfig:
3743  0000 88            	push	a
3744       00000000      OFST:	set	0
3747                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3749                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
3749                     ; 1056                         | (uint8_t)TIM1_CounterMode);
3751  0001 c65250        	ld	a,21072
3752  0004 a48f          	and	a,#143
3753  0006 1a01          	or	a,(OFST+1,sp)
3754  0008 c75250        	ld	21072,a
3755                     ; 1057 }
3758  000b 84            	pop	a
3759  000c 81            	ret	
3817                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3817                     ; 1068 {
3818                     .text:	section	.text,new
3819  0000               _TIM1_ForcedOC1Config:
3821  0000 88            	push	a
3822       00000000      OFST:	set	0
3825                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3827                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
3827                     ; 1074                            (uint8_t)TIM1_ForcedAction);
3829  0001 c65258        	ld	a,21080
3830  0004 a48f          	and	a,#143
3831  0006 1a01          	or	a,(OFST+1,sp)
3832  0008 c75258        	ld	21080,a
3833                     ; 1075 }
3836  000b 84            	pop	a
3837  000c 81            	ret	
3873                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3873                     ; 1086 {
3874                     .text:	section	.text,new
3875  0000               _TIM1_ForcedOC2Config:
3877  0000 88            	push	a
3878       00000000      OFST:	set	0
3881                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3883                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
3883                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
3885  0001 c65259        	ld	a,21081
3886  0004 a48f          	and	a,#143
3887  0006 1a01          	or	a,(OFST+1,sp)
3888  0008 c75259        	ld	21081,a
3889                     ; 1093 }
3892  000b 84            	pop	a
3893  000c 81            	ret	
3929                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3929                     ; 1105 {
3930                     .text:	section	.text,new
3931  0000               _TIM1_ForcedOC3Config:
3933  0000 88            	push	a
3934       00000000      OFST:	set	0
3937                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3939                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
3939                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
3941  0001 c6525a        	ld	a,21082
3942  0004 a48f          	and	a,#143
3943  0006 1a01          	or	a,(OFST+1,sp)
3944  0008 c7525a        	ld	21082,a
3945                     ; 1112 }
3948  000b 84            	pop	a
3949  000c 81            	ret	
3985                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3985                     ; 1124 {
3986                     .text:	section	.text,new
3987  0000               _TIM1_ForcedOC4Config:
3989  0000 88            	push	a
3990       00000000      OFST:	set	0
3993                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3995                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
3995                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
3997  0001 c6525b        	ld	a,21083
3998  0004 a48f          	and	a,#143
3999  0006 1a01          	or	a,(OFST+1,sp)
4000  0008 c7525b        	ld	21083,a
4001                     ; 1131 }
4004  000b 84            	pop	a
4005  000c 81            	ret	
4041                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
4041                     ; 1140 {
4042                     .text:	section	.text,new
4043  0000               _TIM1_ARRPreloadConfig:
4047                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4049                     ; 1145   if (NewState != DISABLE)
4051  0000 4d            	tnz	a
4052  0001 2705          	jreq	L1012
4053                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
4055  0003 721e5250      	bset	21072,#7
4058  0007 81            	ret	
4059  0008               L1012:
4060                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
4062  0008 721f5250      	bres	21072,#7
4063                     ; 1153 }
4066  000c 81            	ret	
4101                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
4101                     ; 1162 {
4102                     .text:	section	.text,new
4103  0000               _TIM1_SelectCOM:
4107                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4109                     ; 1167   if (NewState != DISABLE)
4111  0000 4d            	tnz	a
4112  0001 2705          	jreq	L3212
4113                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
4115  0003 72145251      	bset	21073,#2
4118  0007 81            	ret	
4119  0008               L3212:
4120                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
4122  0008 72155251      	bres	21073,#2
4123                     ; 1175 }
4126  000c 81            	ret	
4162                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
4162                     ; 1184 {
4163                     .text:	section	.text,new
4164  0000               _TIM1_CCPreloadControl:
4168                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4170                     ; 1189   if (NewState != DISABLE)
4172  0000 4d            	tnz	a
4173  0001 2705          	jreq	L5412
4174                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
4176  0003 72105251      	bset	21073,#0
4179  0007 81            	ret	
4180  0008               L5412:
4181                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4183  0008 72115251      	bres	21073,#0
4184                     ; 1197 }
4187  000c 81            	ret	
4223                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4223                     ; 1206 {
4224                     .text:	section	.text,new
4225  0000               _TIM1_OC1PreloadConfig:
4229                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4231                     ; 1211   if (NewState != DISABLE)
4233  0000 4d            	tnz	a
4234  0001 2705          	jreq	L7612
4235                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4237  0003 72165258      	bset	21080,#3
4240  0007 81            	ret	
4241  0008               L7612:
4242                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4244  0008 72175258      	bres	21080,#3
4245                     ; 1219 }
4248  000c 81            	ret	
4284                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4284                     ; 1228 {
4285                     .text:	section	.text,new
4286  0000               _TIM1_OC2PreloadConfig:
4290                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4292                     ; 1233   if (NewState != DISABLE)
4294  0000 4d            	tnz	a
4295  0001 2705          	jreq	L1122
4296                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4298  0003 72165259      	bset	21081,#3
4301  0007 81            	ret	
4302  0008               L1122:
4303                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4305  0008 72175259      	bres	21081,#3
4306                     ; 1241 }
4309  000c 81            	ret	
4345                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4345                     ; 1250 {
4346                     .text:	section	.text,new
4347  0000               _TIM1_OC3PreloadConfig:
4351                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4353                     ; 1255   if (NewState != DISABLE)
4355  0000 4d            	tnz	a
4356  0001 2705          	jreq	L3322
4357                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4359  0003 7216525a      	bset	21082,#3
4362  0007 81            	ret	
4363  0008               L3322:
4364                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4366  0008 7217525a      	bres	21082,#3
4367                     ; 1263 }
4370  000c 81            	ret	
4406                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4406                     ; 1272 {
4407                     .text:	section	.text,new
4408  0000               _TIM1_OC4PreloadConfig:
4412                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4414                     ; 1277   if (NewState != DISABLE)
4416  0000 4d            	tnz	a
4417  0001 2705          	jreq	L5522
4418                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4420  0003 7216525b      	bset	21083,#3
4423  0007 81            	ret	
4424  0008               L5522:
4425                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4427  0008 7217525b      	bres	21083,#3
4428                     ; 1285 }
4431  000c 81            	ret	
4466                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
4466                     ; 1294 {
4467                     .text:	section	.text,new
4468  0000               _TIM1_OC1FastConfig:
4472                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4474                     ; 1299   if (NewState != DISABLE)
4476  0000 4d            	tnz	a
4477  0001 2705          	jreq	L7722
4478                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4480  0003 72145258      	bset	21080,#2
4483  0007 81            	ret	
4484  0008               L7722:
4485                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4487  0008 72155258      	bres	21080,#2
4488                     ; 1307 }
4491  000c 81            	ret	
4526                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
4526                     ; 1316 {
4527                     .text:	section	.text,new
4528  0000               _TIM1_OC2FastConfig:
4532                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4534                     ; 1321   if (NewState != DISABLE)
4536  0000 4d            	tnz	a
4537  0001 2705          	jreq	L1232
4538                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4540  0003 72145259      	bset	21081,#2
4543  0007 81            	ret	
4544  0008               L1232:
4545                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4547  0008 72155259      	bres	21081,#2
4548                     ; 1329 }
4551  000c 81            	ret	
4586                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
4586                     ; 1338 {
4587                     .text:	section	.text,new
4588  0000               _TIM1_OC3FastConfig:
4592                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4594                     ; 1343   if (NewState != DISABLE)
4596  0000 4d            	tnz	a
4597  0001 2705          	jreq	L3432
4598                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4600  0003 7214525a      	bset	21082,#2
4603  0007 81            	ret	
4604  0008               L3432:
4605                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4607  0008 7215525a      	bres	21082,#2
4608                     ; 1351 }
4611  000c 81            	ret	
4646                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
4646                     ; 1360 {
4647                     .text:	section	.text,new
4648  0000               _TIM1_OC4FastConfig:
4652                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4654                     ; 1365   if (NewState != DISABLE)
4656  0000 4d            	tnz	a
4657  0001 2705          	jreq	L5632
4658                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4660  0003 7214525b      	bset	21083,#2
4663  0007 81            	ret	
4664  0008               L5632:
4665                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4667  0008 7215525b      	bres	21083,#2
4668                     ; 1373 }
4671  000c 81            	ret	
4776                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4776                     ; 1390 {
4777                     .text:	section	.text,new
4778  0000               _TIM1_GenerateEvent:
4782                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4784                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
4786  0000 c75257        	ld	21079,a
4787                     ; 1396 }
4790  0003 81            	ret	
4826                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4826                     ; 1407 {
4827                     .text:	section	.text,new
4828  0000               _TIM1_OC1PolarityConfig:
4832                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4834                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4836  0000 4d            	tnz	a
4837  0001 2705          	jreq	L1542
4838                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4840  0003 7212525c      	bset	21084,#1
4843  0007 81            	ret	
4844  0008               L1542:
4845                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4847  0008 7213525c      	bres	21084,#1
4848                     ; 1420 }
4851  000c 81            	ret	
4887                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4887                     ; 1431 {
4888                     .text:	section	.text,new
4889  0000               _TIM1_OC1NPolarityConfig:
4893                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4895                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4897  0000 4d            	tnz	a
4898  0001 2705          	jreq	L3742
4899                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4901  0003 7216525c      	bset	21084,#3
4904  0007 81            	ret	
4905  0008               L3742:
4906                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
4908  0008 7217525c      	bres	21084,#3
4909                     ; 1444 }
4912  000c 81            	ret	
4948                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4948                     ; 1455 {
4949                     .text:	section	.text,new
4950  0000               _TIM1_OC2PolarityConfig:
4954                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4956                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4958  0000 4d            	tnz	a
4959  0001 2705          	jreq	L5152
4960                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4962  0003 721a525c      	bset	21084,#5
4965  0007 81            	ret	
4966  0008               L5152:
4967                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4969  0008 721b525c      	bres	21084,#5
4970                     ; 1468 }
4973  000c 81            	ret	
5009                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5009                     ; 1479 {
5010                     .text:	section	.text,new
5011  0000               _TIM1_OC2NPolarityConfig:
5015                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5017                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5019  0000 4d            	tnz	a
5020  0001 2705          	jreq	L7352
5021                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
5023  0003 721e525c      	bset	21084,#7
5026  0007 81            	ret	
5027  0008               L7352:
5028                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
5030  0008 721f525c      	bres	21084,#7
5031                     ; 1492 }
5034  000c 81            	ret	
5070                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5070                     ; 1503 {
5071                     .text:	section	.text,new
5072  0000               _TIM1_OC3PolarityConfig:
5076                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5078                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5080  0000 4d            	tnz	a
5081  0001 2705          	jreq	L1652
5082                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
5084  0003 7212525d      	bset	21085,#1
5087  0007 81            	ret	
5088  0008               L1652:
5089                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
5091  0008 7213525d      	bres	21085,#1
5092                     ; 1516 }
5095  000c 81            	ret	
5131                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5131                     ; 1528 {
5132                     .text:	section	.text,new
5133  0000               _TIM1_OC3NPolarityConfig:
5137                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5139                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5141  0000 4d            	tnz	a
5142  0001 2705          	jreq	L3062
5143                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5145  0003 7216525d      	bset	21085,#3
5148  0007 81            	ret	
5149  0008               L3062:
5150                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5152  0008 7217525d      	bres	21085,#3
5153                     ; 1541 }
5156  000c 81            	ret	
5192                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5192                     ; 1552 {
5193                     .text:	section	.text,new
5194  0000               _TIM1_OC4PolarityConfig:
5198                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5200                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5202  0000 4d            	tnz	a
5203  0001 2705          	jreq	L5262
5204                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
5206  0003 721a525d      	bset	21085,#5
5209  0007 81            	ret	
5210  0008               L5262:
5211                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
5213  0008 721b525d      	bres	21085,#5
5214                     ; 1565 }
5217  000c 81            	ret	
5262                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5262                     ; 1580 {
5263                     .text:	section	.text,new
5264  0000               _TIM1_CCxCmd:
5266  0000 89            	pushw	x
5267       00000000      OFST:	set	0
5270                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5272                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5274                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
5276  0001 9e            	ld	a,xh
5277  0002 4d            	tnz	a
5278  0003 2610          	jrne	L3562
5279                     ; 1588     if (NewState != DISABLE)
5281  0005 9f            	ld	a,xl
5282  0006 4d            	tnz	a
5283  0007 2706          	jreq	L5562
5284                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
5286  0009 7210525c      	bset	21084,#0
5288  000d 203e          	jra	L1662
5289  000f               L5562:
5290                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5292  000f 7211525c      	bres	21084,#0
5293  0013 2038          	jra	L1662
5294  0015               L3562:
5295                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
5297  0015 7b01          	ld	a,(OFST+1,sp)
5298  0017 a101          	cp	a,#1
5299  0019 2610          	jrne	L3662
5300                     ; 1601     if (NewState != DISABLE)
5302  001b 7b02          	ld	a,(OFST+2,sp)
5303  001d 2706          	jreq	L5662
5304                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
5306  001f 7218525c      	bset	21084,#4
5308  0023 2028          	jra	L1662
5309  0025               L5662:
5310                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5312  0025 7219525c      	bres	21084,#4
5313  0029 2022          	jra	L1662
5314  002b               L3662:
5315                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
5317  002b a102          	cp	a,#2
5318  002d 2610          	jrne	L3762
5319                     ; 1613     if (NewState != DISABLE)
5321  002f 7b02          	ld	a,(OFST+2,sp)
5322  0031 2706          	jreq	L5762
5323                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
5325  0033 7210525d      	bset	21085,#0
5327  0037 2014          	jra	L1662
5328  0039               L5762:
5329                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5331  0039 7211525d      	bres	21085,#0
5332  003d 200e          	jra	L1662
5333  003f               L3762:
5334                     ; 1625     if (NewState != DISABLE)
5336  003f 7b02          	ld	a,(OFST+2,sp)
5337  0041 2706          	jreq	L3072
5338                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
5340  0043 7218525d      	bset	21085,#4
5342  0047 2004          	jra	L1662
5343  0049               L3072:
5344                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5346  0049 7219525d      	bres	21085,#4
5347  004d               L1662:
5348                     ; 1634 }
5351  004d 85            	popw	x
5352  004e 81            	ret	
5397                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5397                     ; 1648 {
5398                     .text:	section	.text,new
5399  0000               _TIM1_CCxNCmd:
5401  0000 89            	pushw	x
5402       00000000      OFST:	set	0
5405                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5407                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5409                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
5411  0001 9e            	ld	a,xh
5412  0002 4d            	tnz	a
5413  0003 2610          	jrne	L1372
5414                     ; 1656     if (NewState != DISABLE)
5416  0005 9f            	ld	a,xl
5417  0006 4d            	tnz	a
5418  0007 2706          	jreq	L3372
5419                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5421  0009 7214525c      	bset	21084,#2
5423  000d 2029          	jra	L7372
5424  000f               L3372:
5425                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
5427  000f 7215525c      	bres	21084,#2
5428  0013 2023          	jra	L7372
5429  0015               L1372:
5430                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
5432  0015 7b01          	ld	a,(OFST+1,sp)
5433  0017 4a            	dec	a
5434  0018 2610          	jrne	L1472
5435                     ; 1668     if (NewState != DISABLE)
5437  001a 7b02          	ld	a,(OFST+2,sp)
5438  001c 2706          	jreq	L3472
5439                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5441  001e 721c525c      	bset	21084,#6
5443  0022 2014          	jra	L7372
5444  0024               L3472:
5445                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
5447  0024 721d525c      	bres	21084,#6
5448  0028 200e          	jra	L7372
5449  002a               L1472:
5450                     ; 1680     if (NewState != DISABLE)
5452  002a 7b02          	ld	a,(OFST+2,sp)
5453  002c 2706          	jreq	L1572
5454                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5456  002e 7214525d      	bset	21085,#2
5458  0032 2004          	jra	L7372
5459  0034               L1572:
5460                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
5462  0034 7215525d      	bres	21085,#2
5463  0038               L7372:
5464                     ; 1689 }
5467  0038 85            	popw	x
5468  0039 81            	ret	
5513                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5513                     ; 1713 {
5514                     .text:	section	.text,new
5515  0000               _TIM1_SelectOCxM:
5517  0000 89            	pushw	x
5518       00000000      OFST:	set	0
5521                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5523                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5525                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
5527  0001 9e            	ld	a,xh
5528  0002 4d            	tnz	a
5529  0003 2610          	jrne	L7772
5530                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5532  0005 7211525c      	bres	21084,#0
5533                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
5533                     ; 1725                             | (uint8_t)TIM1_OCMode);
5535  0009 c65258        	ld	a,21080
5536  000c a48f          	and	a,#143
5537  000e 1a02          	or	a,(OFST+2,sp)
5538  0010 c75258        	ld	21080,a
5540  0013 2038          	jra	L1003
5541  0015               L7772:
5542                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
5544  0015 7b01          	ld	a,(OFST+1,sp)
5545  0017 a101          	cp	a,#1
5546  0019 2610          	jrne	L3003
5547                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5549  001b 7219525c      	bres	21084,#4
5550                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5550                     ; 1734                             | (uint8_t)TIM1_OCMode);
5552  001f c65259        	ld	a,21081
5553  0022 a48f          	and	a,#143
5554  0024 1a02          	or	a,(OFST+2,sp)
5555  0026 c75259        	ld	21081,a
5557  0029 2022          	jra	L1003
5558  002b               L3003:
5559                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
5561  002b a102          	cp	a,#2
5562  002d 2610          	jrne	L7003
5563                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5565  002f 7211525d      	bres	21085,#0
5566                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
5566                     ; 1743                             | (uint8_t)TIM1_OCMode);
5568  0033 c6525a        	ld	a,21082
5569  0036 a48f          	and	a,#143
5570  0038 1a02          	or	a,(OFST+2,sp)
5571  003a c7525a        	ld	21082,a
5573  003d 200e          	jra	L1003
5574  003f               L7003:
5575                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5577  003f 7219525d      	bres	21085,#4
5578                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5578                     ; 1752                             | (uint8_t)TIM1_OCMode);
5580  0043 c6525b        	ld	a,21083
5581  0046 a48f          	and	a,#143
5582  0048 1a02          	or	a,(OFST+2,sp)
5583  004a c7525b        	ld	21083,a
5584  004d               L1003:
5585                     ; 1754 }
5588  004d 85            	popw	x
5589  004e 81            	ret	
5623                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
5623                     ; 1763 {
5624                     .text:	section	.text,new
5625  0000               _TIM1_SetCounter:
5629                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
5631  0000 9e            	ld	a,xh
5632  0001 c7525e        	ld	21086,a
5633                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
5635  0004 9f            	ld	a,xl
5636  0005 c7525f        	ld	21087,a
5637                     ; 1767 }
5640  0008 81            	ret	
5674                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
5674                     ; 1776 {
5675                     .text:	section	.text,new
5676  0000               _TIM1_SetAutoreload:
5680                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
5682  0000 9e            	ld	a,xh
5683  0001 c75262        	ld	21090,a
5684                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
5686  0004 9f            	ld	a,xl
5687  0005 c75263        	ld	21091,a
5688                     ; 1780  }
5691  0008 81            	ret	
5725                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
5725                     ; 1789 {
5726                     .text:	section	.text,new
5727  0000               _TIM1_SetCompare1:
5731                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
5733  0000 9e            	ld	a,xh
5734  0001 c75265        	ld	21093,a
5735                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
5737  0004 9f            	ld	a,xl
5738  0005 c75266        	ld	21094,a
5739                     ; 1793 }
5742  0008 81            	ret	
5776                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
5776                     ; 1802 {
5777                     .text:	section	.text,new
5778  0000               _TIM1_SetCompare2:
5782                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
5784  0000 9e            	ld	a,xh
5785  0001 c75267        	ld	21095,a
5786                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
5788  0004 9f            	ld	a,xl
5789  0005 c75268        	ld	21096,a
5790                     ; 1806 }
5793  0008 81            	ret	
5827                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
5827                     ; 1815 {
5828                     .text:	section	.text,new
5829  0000               _TIM1_SetCompare3:
5833                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
5835  0000 9e            	ld	a,xh
5836  0001 c75269        	ld	21097,a
5837                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
5839  0004 9f            	ld	a,xl
5840  0005 c7526a        	ld	21098,a
5841                     ; 1819 }
5844  0008 81            	ret	
5878                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
5878                     ; 1828 {
5879                     .text:	section	.text,new
5880  0000               _TIM1_SetCompare4:
5884                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
5886  0000 9e            	ld	a,xh
5887  0001 c7526b        	ld	21099,a
5888                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
5890  0004 9f            	ld	a,xl
5891  0005 c7526c        	ld	21100,a
5892                     ; 1832 }
5895  0008 81            	ret	
5931                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5931                     ; 1845 {
5932                     .text:	section	.text,new
5933  0000               _TIM1_SetIC1Prescaler:
5935  0000 88            	push	a
5936       00000000      OFST:	set	0
5939                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5941                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
5941                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
5943  0001 c65258        	ld	a,21080
5944  0004 a4f3          	and	a,#243
5945  0006 1a01          	or	a,(OFST+1,sp)
5946  0008 c75258        	ld	21080,a
5947                     ; 1852 }
5950  000b 84            	pop	a
5951  000c 81            	ret	
5987                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5987                     ; 1865 {
5988                     .text:	section	.text,new
5989  0000               _TIM1_SetIC2Prescaler:
5991  0000 88            	push	a
5992       00000000      OFST:	set	0
5995                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
5997                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
5997                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
5999  0001 c65259        	ld	a,21081
6000  0004 a4f3          	and	a,#243
6001  0006 1a01          	or	a,(OFST+1,sp)
6002  0008 c75259        	ld	21081,a
6003                     ; 1873 }
6006  000b 84            	pop	a
6007  000c 81            	ret	
6043                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
6043                     ; 1886 {
6044                     .text:	section	.text,new
6045  0000               _TIM1_SetIC3Prescaler:
6047  0000 88            	push	a
6048       00000000      OFST:	set	0
6051                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
6053                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
6053                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
6055  0001 c6525a        	ld	a,21082
6056  0004 a4f3          	and	a,#243
6057  0006 1a01          	or	a,(OFST+1,sp)
6058  0008 c7525a        	ld	21082,a
6059                     ; 1894 }
6062  000b 84            	pop	a
6063  000c 81            	ret	
6099                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6099                     ; 1907 {
6100                     .text:	section	.text,new
6101  0000               _TIM1_SetIC4Prescaler:
6103  0000 88            	push	a
6104       00000000      OFST:	set	0
6107                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
6109                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
6109                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
6111  0001 c6525b        	ld	a,21083
6112  0004 a4f3          	and	a,#243
6113  0006 1a01          	or	a,(OFST+1,sp)
6114  0008 c7525b        	ld	21083,a
6115                     ; 1915 }
6118  000b 84            	pop	a
6119  000c 81            	ret	
6171                     ; 1922 uint16_t TIM1_GetCapture1(void)
6171                     ; 1923 {
6172                     .text:	section	.text,new
6173  0000               _TIM1_GetCapture1:
6175  0000 5204          	subw	sp,#4
6176       00000004      OFST:	set	4
6179                     ; 1926   uint16_t tmpccr1 = 0;
6181                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
6185                     ; 1929   tmpccr1h = TIM1->CCR1H;
6187  0002 c65265        	ld	a,21093
6188  0005 6b02          	ld	(OFST-2,sp),a
6190                     ; 1930   tmpccr1l = TIM1->CCR1L;
6192  0007 c65266        	ld	a,21094
6193  000a 6b01          	ld	(OFST-3,sp),a
6195                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
6197  000c 5f            	clrw	x
6198  000d 97            	ld	xl,a
6199  000e 1f03          	ldw	(OFST-1,sp),x
6201                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6203  0010 5f            	clrw	x
6204  0011 7b02          	ld	a,(OFST-2,sp)
6205  0013 97            	ld	xl,a
6206  0014 7b04          	ld	a,(OFST+0,sp)
6207  0016 01            	rrwa	x,a
6208  0017 1a03          	or	a,(OFST-1,sp)
6209  0019 01            	rrwa	x,a
6211                     ; 1935   return (uint16_t)tmpccr1;
6215  001a 5b04          	addw	sp,#4
6216  001c 81            	ret	
6268                     ; 1943 uint16_t TIM1_GetCapture2(void)
6268                     ; 1944 {
6269                     .text:	section	.text,new
6270  0000               _TIM1_GetCapture2:
6272  0000 5204          	subw	sp,#4
6273       00000004      OFST:	set	4
6276                     ; 1947   uint16_t tmpccr2 = 0;
6278                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
6282                     ; 1950   tmpccr2h = TIM1->CCR2H;
6284  0002 c65267        	ld	a,21095
6285  0005 6b02          	ld	(OFST-2,sp),a
6287                     ; 1951   tmpccr2l = TIM1->CCR2L;
6289  0007 c65268        	ld	a,21096
6290  000a 6b01          	ld	(OFST-3,sp),a
6292                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
6294  000c 5f            	clrw	x
6295  000d 97            	ld	xl,a
6296  000e 1f03          	ldw	(OFST-1,sp),x
6298                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6300  0010 5f            	clrw	x
6301  0011 7b02          	ld	a,(OFST-2,sp)
6302  0013 97            	ld	xl,a
6303  0014 7b04          	ld	a,(OFST+0,sp)
6304  0016 01            	rrwa	x,a
6305  0017 1a03          	or	a,(OFST-1,sp)
6306  0019 01            	rrwa	x,a
6308                     ; 1956   return (uint16_t)tmpccr2;
6312  001a 5b04          	addw	sp,#4
6313  001c 81            	ret	
6365                     ; 1964 uint16_t TIM1_GetCapture3(void)
6365                     ; 1965 {
6366                     .text:	section	.text,new
6367  0000               _TIM1_GetCapture3:
6369  0000 5204          	subw	sp,#4
6370       00000004      OFST:	set	4
6373                     ; 1967   uint16_t tmpccr3 = 0;
6375                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
6379                     ; 1970   tmpccr3h = TIM1->CCR3H;
6381  0002 c65269        	ld	a,21097
6382  0005 6b02          	ld	(OFST-2,sp),a
6384                     ; 1971   tmpccr3l = TIM1->CCR3L;
6386  0007 c6526a        	ld	a,21098
6387  000a 6b01          	ld	(OFST-3,sp),a
6389                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
6391  000c 5f            	clrw	x
6392  000d 97            	ld	xl,a
6393  000e 1f03          	ldw	(OFST-1,sp),x
6395                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
6397  0010 5f            	clrw	x
6398  0011 7b02          	ld	a,(OFST-2,sp)
6399  0013 97            	ld	xl,a
6400  0014 7b04          	ld	a,(OFST+0,sp)
6401  0016 01            	rrwa	x,a
6402  0017 1a03          	or	a,(OFST-1,sp)
6403  0019 01            	rrwa	x,a
6405                     ; 1976   return (uint16_t)tmpccr3;
6409  001a 5b04          	addw	sp,#4
6410  001c 81            	ret	
6462                     ; 1984 uint16_t TIM1_GetCapture4(void)
6462                     ; 1985 {
6463                     .text:	section	.text,new
6464  0000               _TIM1_GetCapture4:
6466  0000 5204          	subw	sp,#4
6467       00000004      OFST:	set	4
6470                     ; 1987   uint16_t tmpccr4 = 0;
6472                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
6476                     ; 1990   tmpccr4h = TIM1->CCR4H;
6478  0002 c6526b        	ld	a,21099
6479  0005 6b02          	ld	(OFST-2,sp),a
6481                     ; 1991   tmpccr4l = TIM1->CCR4L;
6483  0007 c6526c        	ld	a,21100
6484  000a 6b01          	ld	(OFST-3,sp),a
6486                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
6488  000c 5f            	clrw	x
6489  000d 97            	ld	xl,a
6490  000e 1f03          	ldw	(OFST-1,sp),x
6492                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
6494  0010 5f            	clrw	x
6495  0011 7b02          	ld	a,(OFST-2,sp)
6496  0013 97            	ld	xl,a
6497  0014 7b04          	ld	a,(OFST+0,sp)
6498  0016 01            	rrwa	x,a
6499  0017 1a03          	or	a,(OFST-1,sp)
6500  0019 01            	rrwa	x,a
6502                     ; 1996   return (uint16_t)tmpccr4;
6506  001a 5b04          	addw	sp,#4
6507  001c 81            	ret	
6541                     ; 2004 uint16_t TIM1_GetCounter(void)
6541                     ; 2005 {
6542                     .text:	section	.text,new
6543  0000               _TIM1_GetCounter:
6545  0000 89            	pushw	x
6546       00000002      OFST:	set	2
6549                     ; 2006   uint16_t tmpcntr = 0;
6551                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
6553  0001 c6525e        	ld	a,21086
6554  0004 97            	ld	xl,a
6555  0005 4f            	clr	a
6556  0006 02            	rlwa	x,a
6557  0007 1f01          	ldw	(OFST-1,sp),x
6559                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
6561  0009 c6525f        	ld	a,21087
6562  000c 5f            	clrw	x
6563  000d 97            	ld	xl,a
6564  000e 01            	rrwa	x,a
6565  000f 1a02          	or	a,(OFST+0,sp)
6566  0011 01            	rrwa	x,a
6567  0012 1a01          	or	a,(OFST-1,sp)
6568  0014 01            	rrwa	x,a
6571  0015 5b02          	addw	sp,#2
6572  0017 81            	ret	
6606                     ; 2019 uint16_t TIM1_GetPrescaler(void)
6606                     ; 2020 {
6607                     .text:	section	.text,new
6608  0000               _TIM1_GetPrescaler:
6610  0000 89            	pushw	x
6611       00000002      OFST:	set	2
6614                     ; 2021   uint16_t temp = 0;
6616                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
6618  0001 c65260        	ld	a,21088
6619  0004 97            	ld	xl,a
6620  0005 4f            	clr	a
6621  0006 02            	rlwa	x,a
6622  0007 1f01          	ldw	(OFST-1,sp),x
6624                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
6626  0009 c65261        	ld	a,21089
6627  000c 5f            	clrw	x
6628  000d 97            	ld	xl,a
6629  000e 01            	rrwa	x,a
6630  000f 1a02          	or	a,(OFST+0,sp)
6631  0011 01            	rrwa	x,a
6632  0012 1a01          	or	a,(OFST-1,sp)
6633  0014 01            	rrwa	x,a
6636  0015 5b02          	addw	sp,#2
6637  0017 81            	ret	
6811                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6811                     ; 2048 {
6812                     .text:	section	.text,new
6813  0000               _TIM1_GetFlagStatus:
6815  0000 89            	pushw	x
6816  0001 89            	pushw	x
6817       00000002      OFST:	set	2
6820                     ; 2049   FlagStatus bitstatus = RESET;
6822                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
6826                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6828                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
6830  0002 9f            	ld	a,xl
6831  0003 c45255        	and	a,21077
6832  0006 6b01          	ld	(OFST-1,sp),a
6834                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
6836  0008 7b03          	ld	a,(OFST+1,sp)
6837  000a 6b02          	ld	(OFST+0,sp),a
6839                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
6841  000c c45256        	and	a,21078
6842  000f 1a01          	or	a,(OFST-1,sp)
6843  0011 2702          	jreq	L1153
6844                     ; 2060     bitstatus = SET;
6846  0013 a601          	ld	a,#1
6849  0015               L1153:
6850                     ; 2064     bitstatus = RESET;
6853                     ; 2066   return (FlagStatus)(bitstatus);
6857  0015 5b04          	addw	sp,#4
6858  0017 81            	ret	
6893                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6893                     ; 2088 {
6894                     .text:	section	.text,new
6895  0000               _TIM1_ClearFlag:
6897  0000 89            	pushw	x
6898       00000000      OFST:	set	0
6901                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6903                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
6905  0001 9f            	ld	a,xl
6906  0002 43            	cpl	a
6907  0003 c75255        	ld	21077,a
6908                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
6908                     ; 2095                         (uint8_t)0x1E);
6910  0006 7b01          	ld	a,(OFST+1,sp)
6911  0008 43            	cpl	a
6912  0009 a41e          	and	a,#30
6913  000b c75256        	ld	21078,a
6914                     ; 2096 }
6917  000e 85            	popw	x
6918  000f 81            	ret	
6982                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
6982                     ; 2113 {
6983                     .text:	section	.text,new
6984  0000               _TIM1_GetITStatus:
6986  0000 88            	push	a
6987  0001 89            	pushw	x
6988       00000002      OFST:	set	2
6991                     ; 2114   ITStatus bitstatus = RESET;
6993                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
6997                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
6999                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
7001  0002 c45255        	and	a,21077
7002  0005 6b01          	ld	(OFST-1,sp),a
7004                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
7006  0007 c65254        	ld	a,21076
7007  000a 1403          	and	a,(OFST+1,sp)
7008  000c 6b02          	ld	(OFST+0,sp),a
7010                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
7012  000e 7b01          	ld	a,(OFST-1,sp)
7013  0010 2708          	jreq	L5653
7015  0012 7b02          	ld	a,(OFST+0,sp)
7016  0014 2704          	jreq	L5653
7017                     ; 2126     bitstatus = SET;
7019  0016 a601          	ld	a,#1
7022  0018 2001          	jra	L7653
7023  001a               L5653:
7024                     ; 2130     bitstatus = RESET;
7026  001a 4f            	clr	a
7028  001b               L7653:
7029                     ; 2132   return (ITStatus)(bitstatus);
7033  001b 5b03          	addw	sp,#3
7034  001d 81            	ret	
7070                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
7070                     ; 2150 {
7071                     .text:	section	.text,new
7072  0000               _TIM1_ClearITPendingBit:
7076                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
7078                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
7080  0000 43            	cpl	a
7081  0001 c75255        	ld	21077,a
7082                     ; 2156 }
7085  0004 81            	ret	
7137                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
7137                     ; 2175                        uint8_t TIM1_ICSelection,
7137                     ; 2176                        uint8_t TIM1_ICFilter)
7137                     ; 2177 {
7138                     .text:	section	.text,new
7139  0000               L72_TI1_Config:
7141  0000 89            	pushw	x
7142  0001 88            	push	a
7143       00000001      OFST:	set	1
7146                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7148  0002 7211525c      	bres	21084,#0
7149                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
7149                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7151  0006 7b06          	ld	a,(OFST+5,sp)
7152  0008 97            	ld	xl,a
7153  0009 a610          	ld	a,#16
7154  000b 42            	mul	x,a
7155  000c 9f            	ld	a,xl
7156  000d 1a03          	or	a,(OFST+2,sp)
7157  000f 6b01          	ld	(OFST+0,sp),a
7159  0011 c65258        	ld	a,21080
7160  0014 a40c          	and	a,#12
7161  0016 1a01          	or	a,(OFST+0,sp)
7162  0018 c75258        	ld	21080,a
7163                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7165  001b 7b02          	ld	a,(OFST+1,sp)
7166  001d 2706          	jreq	L5363
7167                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7169  001f 7212525c      	bset	21084,#1
7171  0023 2004          	jra	L7363
7172  0025               L5363:
7173                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7175  0025 7213525c      	bres	21084,#1
7176  0029               L7363:
7177                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7179  0029 7210525c      	bset	21084,#0
7180                     ; 2197 }
7183  002d 5b03          	addw	sp,#3
7184  002f 81            	ret	
7236                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
7236                     ; 2216                        uint8_t TIM1_ICSelection,
7236                     ; 2217                        uint8_t TIM1_ICFilter)
7236                     ; 2218 {
7237                     .text:	section	.text,new
7238  0000               L13_TI2_Config:
7240  0000 89            	pushw	x
7241  0001 88            	push	a
7242       00000001      OFST:	set	1
7245                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7247  0002 7219525c      	bres	21084,#4
7248                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
7248                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7250  0006 7b06          	ld	a,(OFST+5,sp)
7251  0008 97            	ld	xl,a
7252  0009 a610          	ld	a,#16
7253  000b 42            	mul	x,a
7254  000c 9f            	ld	a,xl
7255  000d 1a03          	or	a,(OFST+2,sp)
7256  000f 6b01          	ld	(OFST+0,sp),a
7258  0011 c65259        	ld	a,21081
7259  0014 a40c          	and	a,#12
7260  0016 1a01          	or	a,(OFST+0,sp)
7261  0018 c75259        	ld	21081,a
7262                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7264  001b 7b02          	ld	a,(OFST+1,sp)
7265  001d 2706          	jreq	L7663
7266                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7268  001f 721a525c      	bset	21084,#5
7270  0023 2004          	jra	L1763
7271  0025               L7663:
7272                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7274  0025 721b525c      	bres	21084,#5
7275  0029               L1763:
7276                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7278  0029 7218525c      	bset	21084,#4
7279                     ; 2236 }
7282  002d 5b03          	addw	sp,#3
7283  002f 81            	ret	
7335                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
7335                     ; 2255                        uint8_t TIM1_ICSelection,
7335                     ; 2256                        uint8_t TIM1_ICFilter)
7335                     ; 2257 {
7336                     .text:	section	.text,new
7337  0000               L33_TI3_Config:
7339  0000 89            	pushw	x
7340  0001 88            	push	a
7341       00000001      OFST:	set	1
7344                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7346  0002 7211525d      	bres	21085,#0
7347                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
7347                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7349  0006 7b06          	ld	a,(OFST+5,sp)
7350  0008 97            	ld	xl,a
7351  0009 a610          	ld	a,#16
7352  000b 42            	mul	x,a
7353  000c 9f            	ld	a,xl
7354  000d 1a03          	or	a,(OFST+2,sp)
7355  000f 6b01          	ld	(OFST+0,sp),a
7357  0011 c6525a        	ld	a,21082
7358  0014 a40c          	and	a,#12
7359  0016 1a01          	or	a,(OFST+0,sp)
7360  0018 c7525a        	ld	21082,a
7361                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7363  001b 7b02          	ld	a,(OFST+1,sp)
7364  001d 2706          	jreq	L1273
7365                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
7367  001f 7212525d      	bset	21085,#1
7369  0023 2004          	jra	L3273
7370  0025               L1273:
7371                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7373  0025 7213525d      	bres	21085,#1
7374  0029               L3273:
7375                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7377  0029 7210525d      	bset	21085,#0
7378                     ; 2276 }
7381  002d 5b03          	addw	sp,#3
7382  002f 81            	ret	
7434                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
7434                     ; 2295                        uint8_t TIM1_ICSelection,
7434                     ; 2296                        uint8_t TIM1_ICFilter)
7434                     ; 2297 {
7435                     .text:	section	.text,new
7436  0000               L53_TI4_Config:
7438  0000 89            	pushw	x
7439  0001 88            	push	a
7440       00000001      OFST:	set	1
7443                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7445  0002 7219525d      	bres	21085,#4
7446                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
7446                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7448  0006 7b06          	ld	a,(OFST+5,sp)
7449  0008 97            	ld	xl,a
7450  0009 a610          	ld	a,#16
7451  000b 42            	mul	x,a
7452  000c 9f            	ld	a,xl
7453  000d 1a03          	or	a,(OFST+2,sp)
7454  000f 6b01          	ld	(OFST+0,sp),a
7456  0011 c6525b        	ld	a,21083
7457  0014 a40c          	and	a,#12
7458  0016 1a01          	or	a,(OFST+0,sp)
7459  0018 c7525b        	ld	21083,a
7460                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7462  001b 7b02          	ld	a,(OFST+1,sp)
7463  001d 2706          	jreq	L3573
7464                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
7466  001f 721a525d      	bset	21085,#5
7468  0023 2004          	jra	L5573
7469  0025               L3573:
7470                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
7472  0025 721b525d      	bres	21085,#5
7473  0029               L5573:
7474                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7476  0029 7218525d      	bset	21085,#4
7477                     ; 2317 }
7480  002d 5b03          	addw	sp,#3
7481  002f 81            	ret	
7494                     	xdef	_TIM1_ClearITPendingBit
7495                     	xdef	_TIM1_GetITStatus
7496                     	xdef	_TIM1_ClearFlag
7497                     	xdef	_TIM1_GetFlagStatus
7498                     	xdef	_TIM1_GetPrescaler
7499                     	xdef	_TIM1_GetCounter
7500                     	xdef	_TIM1_GetCapture4
7501                     	xdef	_TIM1_GetCapture3
7502                     	xdef	_TIM1_GetCapture2
7503                     	xdef	_TIM1_GetCapture1
7504                     	xdef	_TIM1_SetIC4Prescaler
7505                     	xdef	_TIM1_SetIC3Prescaler
7506                     	xdef	_TIM1_SetIC2Prescaler
7507                     	xdef	_TIM1_SetIC1Prescaler
7508                     	xdef	_TIM1_SetCompare4
7509                     	xdef	_TIM1_SetCompare3
7510                     	xdef	_TIM1_SetCompare2
7511                     	xdef	_TIM1_SetCompare1
7512                     	xdef	_TIM1_SetAutoreload
7513                     	xdef	_TIM1_SetCounter
7514                     	xdef	_TIM1_SelectOCxM
7515                     	xdef	_TIM1_CCxNCmd
7516                     	xdef	_TIM1_CCxCmd
7517                     	xdef	_TIM1_OC4PolarityConfig
7518                     	xdef	_TIM1_OC3NPolarityConfig
7519                     	xdef	_TIM1_OC3PolarityConfig
7520                     	xdef	_TIM1_OC2NPolarityConfig
7521                     	xdef	_TIM1_OC2PolarityConfig
7522                     	xdef	_TIM1_OC1NPolarityConfig
7523                     	xdef	_TIM1_OC1PolarityConfig
7524                     	xdef	_TIM1_GenerateEvent
7525                     	xdef	_TIM1_OC4FastConfig
7526                     	xdef	_TIM1_OC3FastConfig
7527                     	xdef	_TIM1_OC2FastConfig
7528                     	xdef	_TIM1_OC1FastConfig
7529                     	xdef	_TIM1_OC4PreloadConfig
7530                     	xdef	_TIM1_OC3PreloadConfig
7531                     	xdef	_TIM1_OC2PreloadConfig
7532                     	xdef	_TIM1_OC1PreloadConfig
7533                     	xdef	_TIM1_CCPreloadControl
7534                     	xdef	_TIM1_SelectCOM
7535                     	xdef	_TIM1_ARRPreloadConfig
7536                     	xdef	_TIM1_ForcedOC4Config
7537                     	xdef	_TIM1_ForcedOC3Config
7538                     	xdef	_TIM1_ForcedOC2Config
7539                     	xdef	_TIM1_ForcedOC1Config
7540                     	xdef	_TIM1_CounterModeConfig
7541                     	xdef	_TIM1_PrescalerConfig
7542                     	xdef	_TIM1_EncoderInterfaceConfig
7543                     	xdef	_TIM1_SelectMasterSlaveMode
7544                     	xdef	_TIM1_SelectSlaveMode
7545                     	xdef	_TIM1_SelectOutputTrigger
7546                     	xdef	_TIM1_SelectOnePulseMode
7547                     	xdef	_TIM1_SelectHallSensor
7548                     	xdef	_TIM1_UpdateRequestConfig
7549                     	xdef	_TIM1_UpdateDisableConfig
7550                     	xdef	_TIM1_SelectInputTrigger
7551                     	xdef	_TIM1_TIxExternalClockConfig
7552                     	xdef	_TIM1_ETRConfig
7553                     	xdef	_TIM1_ETRClockMode2Config
7554                     	xdef	_TIM1_ETRClockMode1Config
7555                     	xdef	_TIM1_InternalClockConfig
7556                     	xdef	_TIM1_ITConfig
7557                     	xdef	_TIM1_CtrlPWMOutputs
7558                     	xdef	_TIM1_Cmd
7559                     	xdef	_TIM1_PWMIConfig
7560                     	xdef	_TIM1_ICInit
7561                     	xdef	_TIM1_BDTRConfig
7562                     	xdef	_TIM1_OC4Init
7563                     	xdef	_TIM1_OC3Init
7564                     	xdef	_TIM1_OC2Init
7565                     	xdef	_TIM1_OC1Init
7566                     	xdef	_TIM1_TimeBaseInit
7567                     	xdef	_TIM1_DeInit
7586                     	end

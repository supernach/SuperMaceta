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
  99                     ; 58 void TIM1_DeInit(void)
  99                     ; 59 {
 101                     .text:	section	.text,new
 102  0000               _TIM1_DeInit:
 106                     ; 60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
 108  0000 725f5250      	clr	21072
 109                     ; 61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
 111  0004 725f5251      	clr	21073
 112                     ; 62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
 114  0008 725f5252      	clr	21074
 115                     ; 63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
 117  000c 725f5253      	clr	21075
 118                     ; 64   TIM1->IER  = TIM1_IER_RESET_VALUE;
 120  0010 725f5254      	clr	21076
 121                     ; 65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
 123  0014 725f5256      	clr	21078
 124                     ; 67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
 126  0018 725f525c      	clr	21084
 127                     ; 68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
 129  001c 725f525d      	clr	21085
 130                     ; 70   TIM1->CCMR1 = 0x01;
 132  0020 35015258      	mov	21080,#1
 133                     ; 71   TIM1->CCMR2 = 0x01;
 135  0024 35015259      	mov	21081,#1
 136                     ; 72   TIM1->CCMR3 = 0x01;
 138  0028 3501525a      	mov	21082,#1
 139                     ; 73   TIM1->CCMR4 = 0x01;
 141  002c 3501525b      	mov	21083,#1
 142                     ; 75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
 144  0030 725f525c      	clr	21084
 145                     ; 76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
 147  0034 725f525d      	clr	21085
 148                     ; 77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
 150  0038 725f5258      	clr	21080
 151                     ; 78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
 153  003c 725f5259      	clr	21081
 154                     ; 79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 156  0040 725f525a      	clr	21082
 157                     ; 80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 159  0044 725f525b      	clr	21083
 160                     ; 81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 162  0048 725f525e      	clr	21086
 163                     ; 82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 165  004c 725f525f      	clr	21087
 166                     ; 83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 168  0050 725f5260      	clr	21088
 169                     ; 84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 171  0054 725f5261      	clr	21089
 172                     ; 85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 174  0058 35ff5262      	mov	21090,#255
 175                     ; 86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 177  005c 35ff5263      	mov	21091,#255
 178                     ; 87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 180  0060 725f5265      	clr	21093
 181                     ; 88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 183  0064 725f5266      	clr	21094
 184                     ; 89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 186  0068 725f5267      	clr	21095
 187                     ; 90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 189  006c 725f5268      	clr	21096
 190                     ; 91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 192  0070 725f5269      	clr	21097
 193                     ; 92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 195  0074 725f526a      	clr	21098
 196                     ; 93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 198  0078 725f526b      	clr	21099
 199                     ; 94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 201  007c 725f526c      	clr	21100
 202                     ; 95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 204  0080 725f526f      	clr	21103
 205                     ; 96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 207  0084 35015257      	mov	21079,#1
 208                     ; 97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 210  0088 725f526e      	clr	21102
 211                     ; 98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 213  008c 725f526d      	clr	21101
 214                     ; 99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 216  0090 725f5264      	clr	21092
 217                     ; 100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 219  0094 725f5255      	clr	21077
 220                     ; 101 }
 223  0098 81            	ret	
 332                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 332                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 332                     ; 113                        uint16_t TIM1_Period,
 332                     ; 114                        uint8_t TIM1_RepetitionCounter)
 332                     ; 115 {
 333                     .text:	section	.text,new
 334  0000               _TIM1_TimeBaseInit:
 336       fffffffe      OFST: set -2
 339                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 341                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 343  0000 7b04          	ld	a,(OFST+6,sp)
 344  0002 c75262        	ld	21090,a
 345                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 347  0005 7b05          	ld	a,(OFST+7,sp)
 348  0007 c75263        	ld	21091,a
 349                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 351  000a 9e            	ld	a,xh
 352  000b c75260        	ld	21088,a
 353                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 355  000e 9f            	ld	a,xl
 356  000f c75261        	ld	21089,a
 357                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 357                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 359  0012 c65250        	ld	a,21072
 360  0015 a48f          	and	a,#143
 361  0017 1a03          	or	a,(OFST+5,sp)
 362  0019 c75250        	ld	21072,a
 363                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 365  001c 7b06          	ld	a,(OFST+8,sp)
 366  001e c75264        	ld	21092,a
 367                     ; 133 }
 370  0021 81            	ret	
 655                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 655                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 655                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 655                     ; 157                   uint16_t TIM1_Pulse,
 655                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 655                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 655                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 655                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 655                     ; 162 {
 656                     .text:	section	.text,new
 657  0000               _TIM1_OC1Init:
 659  0000 89            	pushw	x
 660  0001 5203          	subw	sp,#3
 661       00000003      OFST:	set	3
 664                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 666                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 668                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 670                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 672                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 674                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 676                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 678                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 678                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 680  0003 c6525c        	ld	a,21084
 681  0006 a4f0          	and	a,#240
 682  0008 c7525c        	ld	21084,a
 683                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 683                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 683                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 683                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 685  000b 7b0c          	ld	a,(OFST+9,sp)
 686  000d a408          	and	a,#8
 687  000f 6b03          	ld	(OFST+0,sp),a
 689  0011 7b0b          	ld	a,(OFST+8,sp)
 690  0013 a402          	and	a,#2
 691  0015 1a03          	or	a,(OFST+0,sp)
 692  0017 6b02          	ld	(OFST-1,sp),a
 694  0019 7b08          	ld	a,(OFST+5,sp)
 695  001b a404          	and	a,#4
 696  001d 6b01          	ld	(OFST-2,sp),a
 698  001f 9f            	ld	a,xl
 699  0020 a401          	and	a,#1
 700  0022 1a01          	or	a,(OFST-2,sp)
 701  0024 1a02          	or	a,(OFST-1,sp)
 702  0026 ca525c        	or	a,21084
 703  0029 c7525c        	ld	21084,a
 704                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 704                     ; 185                           (uint8_t)TIM1_OCMode);
 706  002c c65258        	ld	a,21080
 707  002f a48f          	and	a,#143
 708  0031 1a04          	or	a,(OFST+1,sp)
 709  0033 c75258        	ld	21080,a
 710                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 712  0036 c6526f        	ld	a,21103
 713  0039 a4fc          	and	a,#252
 714  003b c7526f        	ld	21103,a
 715                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 715                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 717  003e 7b0e          	ld	a,(OFST+11,sp)
 718  0040 a402          	and	a,#2
 719  0042 6b03          	ld	(OFST+0,sp),a
 721  0044 7b0d          	ld	a,(OFST+10,sp)
 722  0046 a401          	and	a,#1
 723  0048 1a03          	or	a,(OFST+0,sp)
 724  004a ca526f        	or	a,21103
 725  004d c7526f        	ld	21103,a
 726                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 728  0050 7b09          	ld	a,(OFST+6,sp)
 729  0052 c75265        	ld	21093,a
 730                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 732  0055 7b0a          	ld	a,(OFST+7,sp)
 733  0057 c75266        	ld	21094,a
 734                     ; 196 }
 737  005a 5b05          	addw	sp,#5
 738  005c 81            	ret	
 842                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 842                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 842                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 842                     ; 220                   uint16_t TIM1_Pulse,
 842                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 842                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 842                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 842                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 842                     ; 225 {
 843                     .text:	section	.text,new
 844  0000               _TIM1_OC2Init:
 846  0000 89            	pushw	x
 847  0001 5203          	subw	sp,#3
 848       00000003      OFST:	set	3
 851                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 853                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 855                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 857                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 859                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 861                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 863                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 865                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 865                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 867  0003 c6525c        	ld	a,21084
 868  0006 a40f          	and	a,#15
 869  0008 c7525c        	ld	21084,a
 870                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 870                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 870                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 870                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 872  000b 7b0c          	ld	a,(OFST+9,sp)
 873  000d a480          	and	a,#128
 874  000f 6b03          	ld	(OFST+0,sp),a
 876  0011 7b0b          	ld	a,(OFST+8,sp)
 877  0013 a420          	and	a,#32
 878  0015 1a03          	or	a,(OFST+0,sp)
 879  0017 6b02          	ld	(OFST-1,sp),a
 881  0019 7b08          	ld	a,(OFST+5,sp)
 882  001b a440          	and	a,#64
 883  001d 6b01          	ld	(OFST-2,sp),a
 885  001f 9f            	ld	a,xl
 886  0020 a410          	and	a,#16
 887  0022 1a01          	or	a,(OFST-2,sp)
 888  0024 1a02          	or	a,(OFST-1,sp)
 889  0026 ca525c        	or	a,21084
 890  0029 c7525c        	ld	21084,a
 891                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 891                     ; 249                           (uint8_t)TIM1_OCMode);
 893  002c c65259        	ld	a,21081
 894  002f a48f          	and	a,#143
 895  0031 1a04          	or	a,(OFST+1,sp)
 896  0033 c75259        	ld	21081,a
 897                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 899  0036 c6526f        	ld	a,21103
 900  0039 a4f3          	and	a,#243
 901  003b c7526f        	ld	21103,a
 902                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 902                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 904  003e 7b0e          	ld	a,(OFST+11,sp)
 905  0040 a408          	and	a,#8
 906  0042 6b03          	ld	(OFST+0,sp),a
 908  0044 7b0d          	ld	a,(OFST+10,sp)
 909  0046 a404          	and	a,#4
 910  0048 1a03          	or	a,(OFST+0,sp)
 911  004a ca526f        	or	a,21103
 912  004d c7526f        	ld	21103,a
 913                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 915  0050 7b09          	ld	a,(OFST+6,sp)
 916  0052 c75267        	ld	21095,a
 917                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 919  0055 7b0a          	ld	a,(OFST+7,sp)
 920  0057 c75268        	ld	21096,a
 921                     ; 260 }
 924  005a 5b05          	addw	sp,#5
 925  005c 81            	ret	
1029                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1029                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
1029                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1029                     ; 284                   uint16_t TIM1_Pulse,
1029                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1029                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1029                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1029                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1029                     ; 289 {
1030                     .text:	section	.text,new
1031  0000               _TIM1_OC3Init:
1033  0000 89            	pushw	x
1034  0001 5203          	subw	sp,#3
1035       00000003      OFST:	set	3
1038                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1040                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1042                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
1044                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1046                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1048                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1050                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1052                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
1052                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1054  0003 c6525d        	ld	a,21085
1055  0006 a4f0          	and	a,#240
1056  0008 c7525d        	ld	21085,a
1057                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
1057                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
1057                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
1057                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
1059  000b 7b0c          	ld	a,(OFST+9,sp)
1060  000d a408          	and	a,#8
1061  000f 6b03          	ld	(OFST+0,sp),a
1063  0011 7b0b          	ld	a,(OFST+8,sp)
1064  0013 a402          	and	a,#2
1065  0015 1a03          	or	a,(OFST+0,sp)
1066  0017 6b02          	ld	(OFST-1,sp),a
1068  0019 7b08          	ld	a,(OFST+5,sp)
1069  001b a404          	and	a,#4
1070  001d 6b01          	ld	(OFST-2,sp),a
1072  001f 9f            	ld	a,xl
1073  0020 a401          	and	a,#1
1074  0022 1a01          	or	a,(OFST-2,sp)
1075  0024 1a02          	or	a,(OFST-1,sp)
1076  0026 ca525d        	or	a,21085
1077  0029 c7525d        	ld	21085,a
1078                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1078                     ; 312                           (uint8_t)TIM1_OCMode);
1080  002c c6525a        	ld	a,21082
1081  002f a48f          	and	a,#143
1082  0031 1a04          	or	a,(OFST+1,sp)
1083  0033 c7525a        	ld	21082,a
1084                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1086  0036 c6526f        	ld	a,21103
1087  0039 a4cf          	and	a,#207
1088  003b c7526f        	ld	21103,a
1089                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1089                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1091  003e 7b0e          	ld	a,(OFST+11,sp)
1092  0040 a420          	and	a,#32
1093  0042 6b03          	ld	(OFST+0,sp),a
1095  0044 7b0d          	ld	a,(OFST+10,sp)
1096  0046 a410          	and	a,#16
1097  0048 1a03          	or	a,(OFST+0,sp)
1098  004a ca526f        	or	a,21103
1099  004d c7526f        	ld	21103,a
1100                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1102  0050 7b09          	ld	a,(OFST+6,sp)
1103  0052 c75269        	ld	21097,a
1104                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1106  0055 7b0a          	ld	a,(OFST+7,sp)
1107  0057 c7526a        	ld	21098,a
1108                     ; 323 }
1111  005a 5b05          	addw	sp,#5
1112  005c 81            	ret	
1186                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1186                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
1186                     ; 340                   uint16_t TIM1_Pulse,
1186                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1186                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1186                     ; 343 {
1187                     .text:	section	.text,new
1188  0000               _TIM1_OC4Init:
1190  0000 89            	pushw	x
1191  0001 88            	push	a
1192       00000001      OFST:	set	1
1195                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1197                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1199                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1201                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1203                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1205  0002 c6525d        	ld	a,21085
1206  0005 a4cf          	and	a,#207
1207  0007 c7525d        	ld	21085,a
1208                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1208                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1210  000a 7b08          	ld	a,(OFST+7,sp)
1211  000c a420          	and	a,#32
1212  000e 6b01          	ld	(OFST+0,sp),a
1214  0010 9f            	ld	a,xl
1215  0011 a410          	and	a,#16
1216  0013 1a01          	or	a,(OFST+0,sp)
1217  0015 ca525d        	or	a,21085
1218  0018 c7525d        	ld	21085,a
1219                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1219                     ; 358                           TIM1_OCMode);
1221  001b c6525b        	ld	a,21083
1222  001e a48f          	and	a,#143
1223  0020 1a02          	or	a,(OFST+1,sp)
1224  0022 c7525b        	ld	21083,a
1225                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1227  0025 7b09          	ld	a,(OFST+8,sp)
1228  0027 270a          	jreq	L174
1229                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1231  0029 c6526f        	ld	a,21103
1232  002c aadf          	or	a,#223
1233  002e c7526f        	ld	21103,a
1235  0031 2004          	jra	L374
1236  0033               L174:
1237                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1239  0033 721d526f      	bres	21103,#6
1240  0037               L374:
1241                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1243  0037 7b06          	ld	a,(OFST+5,sp)
1244  0039 c7526b        	ld	21099,a
1245                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1247  003c 7b07          	ld	a,(OFST+6,sp)
1248  003e c7526c        	ld	21100,a
1249                     ; 373 }
1252  0041 5b03          	addw	sp,#3
1253  0043 81            	ret	
1458                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1458                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1458                     ; 390                      uint8_t TIM1_DeadTime,
1458                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
1458                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1458                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1458                     ; 394 {
1459                     .text:	section	.text,new
1460  0000               _TIM1_BDTRConfig:
1462  0000 89            	pushw	x
1463  0001 88            	push	a
1464       00000001      OFST:	set	1
1467                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1469                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1471                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1473                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1475                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1477                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1479  0002 7b06          	ld	a,(OFST+5,sp)
1480  0004 c7526e        	ld	21102,a
1481                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1481                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1481                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
1483  0007 7b07          	ld	a,(OFST+6,sp)
1484  0009 1a08          	or	a,(OFST+7,sp)
1485  000b 1a09          	or	a,(OFST+8,sp)
1486  000d 6b01          	ld	(OFST+0,sp),a
1488  000f 9f            	ld	a,xl
1489  0010 1a02          	or	a,(OFST+1,sp)
1490  0012 1a01          	or	a,(OFST+0,sp)
1491  0014 c7526d        	ld	21101,a
1492                     ; 409 }
1495  0017 5b03          	addw	sp,#3
1496  0019 81            	ret	
1698                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1698                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1698                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1698                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1698                     ; 427                  uint8_t TIM1_ICFilter)
1698                     ; 428 {
1699                     .text:	section	.text,new
1700  0000               _TIM1_ICInit:
1702  0000 89            	pushw	x
1703       00000000      OFST:	set	0
1706                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1708                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1710                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1712                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1714                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1716                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
1718  0001 9e            	ld	a,xh
1719  0002 4d            	tnz	a
1720  0003 2614          	jrne	L327
1721                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
1721                     ; 440                (uint8_t)TIM1_ICSelection,
1721                     ; 441                (uint8_t)TIM1_ICFilter);
1723  0005 7b07          	ld	a,(OFST+7,sp)
1724  0007 88            	push	a
1725  0008 7b06          	ld	a,(OFST+6,sp)
1726  000a 97            	ld	xl,a
1727  000b 7b03          	ld	a,(OFST+3,sp)
1728  000d 95            	ld	xh,a
1729  000e cd0000        	call	L73_TI1_Config
1731  0011 84            	pop	a
1732                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1734  0012 7b06          	ld	a,(OFST+6,sp)
1735  0014 cd0000        	call	_TIM1_SetIC1Prescaler
1738  0017 2044          	jra	L527
1739  0019               L327:
1740                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
1742  0019 7b01          	ld	a,(OFST+1,sp)
1743  001b a101          	cp	a,#1
1744  001d 2614          	jrne	L727
1745                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
1745                     ; 449                (uint8_t)TIM1_ICSelection,
1745                     ; 450                (uint8_t)TIM1_ICFilter);
1747  001f 7b07          	ld	a,(OFST+7,sp)
1748  0021 88            	push	a
1749  0022 7b06          	ld	a,(OFST+6,sp)
1750  0024 97            	ld	xl,a
1751  0025 7b03          	ld	a,(OFST+3,sp)
1752  0027 95            	ld	xh,a
1753  0028 cd0000        	call	L14_TI2_Config
1755  002b 84            	pop	a
1756                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1758  002c 7b06          	ld	a,(OFST+6,sp)
1759  002e cd0000        	call	_TIM1_SetIC2Prescaler
1762  0031 202a          	jra	L527
1763  0033               L727:
1764                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
1766  0033 a102          	cp	a,#2
1767  0035 2614          	jrne	L337
1768                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
1768                     ; 458                (uint8_t)TIM1_ICSelection,
1768                     ; 459                (uint8_t)TIM1_ICFilter);
1770  0037 7b07          	ld	a,(OFST+7,sp)
1771  0039 88            	push	a
1772  003a 7b06          	ld	a,(OFST+6,sp)
1773  003c 97            	ld	xl,a
1774  003d 7b03          	ld	a,(OFST+3,sp)
1775  003f 95            	ld	xh,a
1776  0040 cd0000        	call	L34_TI3_Config
1778  0043 84            	pop	a
1779                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1781  0044 7b06          	ld	a,(OFST+6,sp)
1782  0046 cd0000        	call	_TIM1_SetIC3Prescaler
1785  0049 2012          	jra	L527
1786  004b               L337:
1787                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
1787                     ; 467                (uint8_t)TIM1_ICSelection,
1787                     ; 468                (uint8_t)TIM1_ICFilter);
1789  004b 7b07          	ld	a,(OFST+7,sp)
1790  004d 88            	push	a
1791  004e 7b06          	ld	a,(OFST+6,sp)
1792  0050 97            	ld	xl,a
1793  0051 7b03          	ld	a,(OFST+3,sp)
1794  0053 95            	ld	xh,a
1795  0054 cd0000        	call	L54_TI4_Config
1797  0057 84            	pop	a
1798                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1800  0058 7b06          	ld	a,(OFST+6,sp)
1801  005a cd0000        	call	_TIM1_SetIC4Prescaler
1803  005d               L527:
1804                     ; 472 }
1807  005d 85            	popw	x
1808  005e 81            	ret	
1904                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1904                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1904                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1904                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1904                     ; 492                      uint8_t TIM1_ICFilter)
1904                     ; 493 {
1905                     .text:	section	.text,new
1906  0000               _TIM1_PWMIConfig:
1908  0000 89            	pushw	x
1909  0001 89            	pushw	x
1910       00000002      OFST:	set	2
1913                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
1915                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
1917                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1919                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1921                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1923                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1925                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1927  0002 9f            	ld	a,xl
1928  0003 4a            	dec	a
1929  0004 2702          	jreq	L5001
1930                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
1932  0006 a601          	ld	a,#1
1934  0008               L5001:
1935                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
1937  0008 6b01          	ld	(OFST-1,sp),a
1939                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1941  000a 7b07          	ld	a,(OFST+5,sp)
1942  000c 4a            	dec	a
1943  000d 2604          	jrne	L1101
1944                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
1946  000f a602          	ld	a,#2
1948  0011 2002          	jra	L3101
1949  0013               L1101:
1950                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
1952  0013 a601          	ld	a,#1
1953  0015               L3101:
1954  0015 6b02          	ld	(OFST+0,sp),a
1956                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
1958  0017 7b03          	ld	a,(OFST+1,sp)
1959  0019 2626          	jrne	L5101
1960                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1960                     ; 527                (uint8_t)TIM1_ICFilter);
1962  001b 7b09          	ld	a,(OFST+7,sp)
1963  001d 88            	push	a
1964  001e 7b08          	ld	a,(OFST+6,sp)
1965  0020 97            	ld	xl,a
1966  0021 7b05          	ld	a,(OFST+3,sp)
1967  0023 95            	ld	xh,a
1968  0024 cd0000        	call	L73_TI1_Config
1970  0027 84            	pop	a
1971                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1973  0028 7b08          	ld	a,(OFST+6,sp)
1974  002a cd0000        	call	_TIM1_SetIC1Prescaler
1976                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1978  002d 7b09          	ld	a,(OFST+7,sp)
1979  002f 88            	push	a
1980  0030 7b03          	ld	a,(OFST+1,sp)
1981  0032 97            	ld	xl,a
1982  0033 7b02          	ld	a,(OFST+0,sp)
1983  0035 95            	ld	xh,a
1984  0036 cd0000        	call	L14_TI2_Config
1986  0039 84            	pop	a
1987                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1989  003a 7b08          	ld	a,(OFST+6,sp)
1990  003c cd0000        	call	_TIM1_SetIC2Prescaler
1993  003f 2024          	jra	L7101
1994  0041               L5101:
1995                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1995                     ; 542                (uint8_t)TIM1_ICFilter);
1997  0041 7b09          	ld	a,(OFST+7,sp)
1998  0043 88            	push	a
1999  0044 7b08          	ld	a,(OFST+6,sp)
2000  0046 97            	ld	xl,a
2001  0047 7b05          	ld	a,(OFST+3,sp)
2002  0049 95            	ld	xh,a
2003  004a cd0000        	call	L14_TI2_Config
2005  004d 84            	pop	a
2006                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2008  004e 7b08          	ld	a,(OFST+6,sp)
2009  0050 cd0000        	call	_TIM1_SetIC2Prescaler
2011                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
2013  0053 7b09          	ld	a,(OFST+7,sp)
2014  0055 88            	push	a
2015  0056 7b03          	ld	a,(OFST+1,sp)
2016  0058 97            	ld	xl,a
2017  0059 7b02          	ld	a,(OFST+0,sp)
2018  005b 95            	ld	xh,a
2019  005c cd0000        	call	L73_TI1_Config
2021  005f 84            	pop	a
2022                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2024  0060 7b08          	ld	a,(OFST+6,sp)
2025  0062 cd0000        	call	_TIM1_SetIC1Prescaler
2027  0065               L7101:
2028                     ; 553 }
2031  0065 5b04          	addw	sp,#4
2032  0067 81            	ret	
2087                     ; 561 void TIM1_Cmd(FunctionalState NewState)
2087                     ; 562 {
2088                     .text:	section	.text,new
2089  0000               _TIM1_Cmd:
2093                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2095                     ; 567   if (NewState != DISABLE)
2097  0000 4d            	tnz	a
2098  0001 2705          	jreq	L7401
2099                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
2101  0003 72105250      	bset	21072,#0
2104  0007 81            	ret	
2105  0008               L7401:
2106                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2108  0008 72115250      	bres	21072,#0
2109                     ; 575 }
2112  000c 81            	ret	
2148                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2148                     ; 584 {
2149                     .text:	section	.text,new
2150  0000               _TIM1_CtrlPWMOutputs:
2154                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2156                     ; 590   if (NewState != DISABLE)
2158  0000 4d            	tnz	a
2159  0001 2705          	jreq	L1701
2160                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
2162  0003 721e526d      	bset	21101,#7
2165  0007 81            	ret	
2166  0008               L1701:
2167                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2169  0008 721f526d      	bres	21101,#7
2170                     ; 598 }
2173  000c 81            	ret	
2280                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2280                     ; 618 {
2281                     .text:	section	.text,new
2282  0000               _TIM1_ITConfig:
2284  0000 89            	pushw	x
2285       00000000      OFST:	set	0
2288                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
2290                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2292                     ; 623   if (NewState != DISABLE)
2294  0001 9f            	ld	a,xl
2295  0002 4d            	tnz	a
2296  0003 2706          	jreq	L3411
2297                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
2299  0005 9e            	ld	a,xh
2300  0006 ca5254        	or	a,21076
2302  0009 2006          	jra	L5411
2303  000b               L3411:
2304                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2306  000b 7b01          	ld	a,(OFST+1,sp)
2307  000d 43            	cpl	a
2308  000e c45254        	and	a,21076
2309  0011               L5411:
2310  0011 c75254        	ld	21076,a
2311                     ; 633 }
2314  0014 85            	popw	x
2315  0015 81            	ret	
2339                     ; 640 void TIM1_InternalClockConfig(void)
2339                     ; 641 {
2340                     .text:	section	.text,new
2341  0000               _TIM1_InternalClockConfig:
2345                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2347  0000 c65252        	ld	a,21074
2348  0003 a4f8          	and	a,#248
2349  0005 c75252        	ld	21074,a
2350                     ; 644 }
2353  0008 81            	ret	
2470                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2470                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2470                     ; 664                               uint8_t ExtTRGFilter)
2470                     ; 665 {
2471                     .text:	section	.text,new
2472  0000               _TIM1_ETRClockMode1Config:
2474  0000 89            	pushw	x
2475       00000000      OFST:	set	0
2478                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2480                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2482                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2484  0001 7b05          	ld	a,(OFST+5,sp)
2485  0003 88            	push	a
2486  0004 7b02          	ld	a,(OFST+2,sp)
2487  0006 95            	ld	xh,a
2488  0007 cd0000        	call	_TIM1_ETRConfig
2490  000a 84            	pop	a
2491                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
2491                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2493  000b c65252        	ld	a,21074
2494  000e aa77          	or	a,#119
2495  0010 c75252        	ld	21074,a
2496                     ; 676 }
2499  0013 85            	popw	x
2500  0014 81            	ret	
2558                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2558                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2558                     ; 696                               uint8_t ExtTRGFilter)
2558                     ; 697 {
2559                     .text:	section	.text,new
2560  0000               _TIM1_ETRClockMode2Config:
2562  0000 89            	pushw	x
2563       00000000      OFST:	set	0
2566                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2568                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2570                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2572  0001 7b05          	ld	a,(OFST+5,sp)
2573  0003 88            	push	a
2574  0004 7b02          	ld	a,(OFST+2,sp)
2575  0006 95            	ld	xh,a
2576  0007 cd0000        	call	_TIM1_ETRConfig
2578  000a 721c5253      	bset	21075,#6
2579                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
2581                     ; 707 }
2584  000e 5b03          	addw	sp,#3
2585  0010 81            	ret	
2641                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2641                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2641                     ; 727                     uint8_t ExtTRGFilter)
2641                     ; 728 {
2642                     .text:	section	.text,new
2643  0000               _TIM1_ETRConfig:
2645  0000 89            	pushw	x
2646       00000000      OFST:	set	0
2649                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
2651                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
2651                     ; 733                          (uint8_t)ExtTRGFilter );
2653  0001 9f            	ld	a,xl
2654  0002 1a01          	or	a,(OFST+1,sp)
2655  0004 1a05          	or	a,(OFST+5,sp)
2656  0006 ca5253        	or	a,21075
2657  0009 c75253        	ld	21075,a
2658                     ; 734 }
2661  000c 85            	popw	x
2662  000d 81            	ret	
2751                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2751                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2751                     ; 753                                  uint8_t ICFilter)
2751                     ; 754 {
2752                     .text:	section	.text,new
2753  0000               _TIM1_TIxExternalClockConfig:
2755  0000 89            	pushw	x
2756       00000000      OFST:	set	0
2759                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2761                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2763                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2765                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2767  0001 9e            	ld	a,xh
2768  0002 a160          	cp	a,#96
2769  0004 260d          	jrne	L5431
2770                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2772  0006 7b05          	ld	a,(OFST+5,sp)
2773  0008 88            	push	a
2774  0009 9f            	ld	a,xl
2775  000a ae0001        	ldw	x,#1
2776  000d 95            	ld	xh,a
2777  000e cd0000        	call	L14_TI2_Config
2780  0011 200c          	jra	L7431
2781  0013               L5431:
2782                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2784  0013 7b05          	ld	a,(OFST+5,sp)
2785  0015 88            	push	a
2786  0016 7b03          	ld	a,(OFST+3,sp)
2787  0018 ae0001        	ldw	x,#1
2788  001b 95            	ld	xh,a
2789  001c cd0000        	call	L73_TI1_Config
2791  001f               L7431:
2792  001f 84            	pop	a
2793                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
2795  0020 7b01          	ld	a,(OFST+1,sp)
2796  0022 cd0000        	call	_TIM1_SelectInputTrigger
2798                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
2800  0025 c65252        	ld	a,21074
2801  0028 aa07          	or	a,#7
2802  002a c75252        	ld	21074,a
2803                     ; 775 }
2806  002d 85            	popw	x
2807  002e 81            	ret	
2892                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2892                     ; 788 {
2893                     .text:	section	.text,new
2894  0000               _TIM1_SelectInputTrigger:
2896  0000 88            	push	a
2897       00000000      OFST:	set	0
2900                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2902                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
2904  0001 c65252        	ld	a,21074
2905  0004 a48f          	and	a,#143
2906  0006 1a01          	or	a,(OFST+1,sp)
2907  0008 c75252        	ld	21074,a
2908                     ; 794 }
2911  000b 84            	pop	a
2912  000c 81            	ret	
2948                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2948                     ; 804 {
2949                     .text:	section	.text,new
2950  0000               _TIM1_UpdateDisableConfig:
2954                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2956                     ; 809   if (NewState != DISABLE)
2958  0000 4d            	tnz	a
2959  0001 2705          	jreq	L5241
2960                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
2962  0003 72125250      	bset	21072,#1
2965  0007 81            	ret	
2966  0008               L5241:
2967                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
2969  0008 72135250      	bres	21072,#1
2970                     ; 817 }
2973  000c 81            	ret	
3031                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
3031                     ; 828 {
3032                     .text:	section	.text,new
3033  0000               _TIM1_UpdateRequestConfig:
3037                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
3039                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
3041  0000 4d            	tnz	a
3042  0001 2705          	jreq	L7541
3043                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
3045  0003 72145250      	bset	21072,#2
3048  0007 81            	ret	
3049  0008               L7541:
3050                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
3052  0008 72155250      	bres	21072,#2
3053                     ; 841 }
3056  000c 81            	ret	
3092                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
3092                     ; 850 {
3093                     .text:	section	.text,new
3094  0000               _TIM1_SelectHallSensor:
3098                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3100                     ; 855   if (NewState != DISABLE)
3102  0000 4d            	tnz	a
3103  0001 2705          	jreq	L1051
3104                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
3106  0003 721e5251      	bset	21073,#7
3109  0007 81            	ret	
3110  0008               L1051:
3111                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3113  0008 721f5251      	bres	21073,#7
3114                     ; 863 }
3117  000c 81            	ret	
3174                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3174                     ; 874 {
3175                     .text:	section	.text,new
3176  0000               _TIM1_SelectOnePulseMode:
3180                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3182                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3184  0000 4d            	tnz	a
3185  0001 2705          	jreq	L3351
3186                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
3188  0003 72165250      	bset	21072,#3
3191  0007 81            	ret	
3192  0008               L3351:
3193                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3195  0008 72175250      	bres	21072,#3
3196                     ; 888 }
3199  000c 81            	ret	
3297                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3297                     ; 904 {
3298                     .text:	section	.text,new
3299  0000               _TIM1_SelectOutputTrigger:
3301  0000 88            	push	a
3302       00000000      OFST:	set	0
3305                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3307                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
3307                     ; 910                         (uint8_t) TIM1_TRGOSource);
3309  0001 c65251        	ld	a,21073
3310  0004 a48f          	and	a,#143
3311  0006 1a01          	or	a,(OFST+1,sp)
3312  0008 c75251        	ld	21073,a
3313                     ; 911 }
3316  000b 84            	pop	a
3317  000c 81            	ret	
3391                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3391                     ; 924 {
3392                     .text:	section	.text,new
3393  0000               _TIM1_SelectSlaveMode:
3395  0000 88            	push	a
3396       00000000      OFST:	set	0
3399                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3401                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
3401                     ; 930                          (uint8_t)TIM1_SlaveMode);
3403  0001 c65252        	ld	a,21074
3404  0004 a4f8          	and	a,#248
3405  0006 1a01          	or	a,(OFST+1,sp)
3406  0008 c75252        	ld	21074,a
3407                     ; 931 }
3410  000b 84            	pop	a
3411  000c 81            	ret	
3447                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3447                     ; 940 {
3448                     .text:	section	.text,new
3449  0000               _TIM1_SelectMasterSlaveMode:
3453                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3455                     ; 945   if (NewState != DISABLE)
3457  0000 4d            	tnz	a
3458  0001 2705          	jreq	L7461
3459                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
3461  0003 721e5252      	bset	21074,#7
3464  0007 81            	ret	
3465  0008               L7461:
3466                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
3468  0008 721f5252      	bres	21074,#7
3469                     ; 953 }
3472  000c 81            	ret	
3558                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3558                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3558                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3558                     ; 978 {
3559                     .text:	section	.text,new
3560  0000               _TIM1_EncoderInterfaceConfig:
3562  0000 89            	pushw	x
3563       00000000      OFST:	set	0
3566                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3568                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3570                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3572                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3574  0001 9f            	ld	a,xl
3575  0002 4d            	tnz	a
3576  0003 2706          	jreq	L3171
3577                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3579  0005 7212525c      	bset	21084,#1
3581  0009 2004          	jra	L5171
3582  000b               L3171:
3583                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3585  000b 7213525c      	bres	21084,#1
3586  000f               L5171:
3587                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3589  000f 7b05          	ld	a,(OFST+5,sp)
3590  0011 2706          	jreq	L7171
3591                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3593  0013 721a525c      	bset	21084,#5
3595  0017 2004          	jra	L1271
3596  0019               L7171:
3597                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3599  0019 721b525c      	bres	21084,#5
3600  001d               L1271:
3601                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
3601                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
3603  001d c65252        	ld	a,21074
3604  0020 a4f0          	and	a,#240
3605  0022 1a01          	or	a,(OFST+1,sp)
3606  0024 c75252        	ld	21074,a
3607                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
3607                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
3609  0027 c65258        	ld	a,21080
3610  002a a4fc          	and	a,#252
3611  002c aa01          	or	a,#1
3612  002e c75258        	ld	21080,a
3613                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
3613                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
3615  0031 c65259        	ld	a,21081
3616  0034 a4fc          	and	a,#252
3617  0036 aa01          	or	a,#1
3618  0038 c75259        	ld	21081,a
3619                     ; 1011 }
3622  003b 85            	popw	x
3623  003c 81            	ret	
3690                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
3690                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3690                     ; 1025 {
3691                     .text:	section	.text,new
3692  0000               _TIM1_PrescalerConfig:
3694       fffffffe      OFST: set -2
3697                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3699                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
3701  0000 9e            	ld	a,xh
3702  0001 c75260        	ld	21088,a
3703                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
3705  0004 9f            	ld	a,xl
3706  0005 c75261        	ld	21089,a
3707                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
3709  0008 7b03          	ld	a,(OFST+5,sp)
3710  000a c75257        	ld	21079,a
3711                     ; 1035 }
3714  000d 81            	ret	
3750                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3750                     ; 1049 {
3751                     .text:	section	.text,new
3752  0000               _TIM1_CounterModeConfig:
3754  0000 88            	push	a
3755       00000000      OFST:	set	0
3758                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3760                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
3760                     ; 1056                         | (uint8_t)TIM1_CounterMode);
3762  0001 c65250        	ld	a,21072
3763  0004 a48f          	and	a,#143
3764  0006 1a01          	or	a,(OFST+1,sp)
3765  0008 c75250        	ld	21072,a
3766                     ; 1057 }
3769  000b 84            	pop	a
3770  000c 81            	ret	
3828                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3828                     ; 1068 {
3829                     .text:	section	.text,new
3830  0000               _TIM1_ForcedOC1Config:
3832  0000 88            	push	a
3833       00000000      OFST:	set	0
3836                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3838                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
3838                     ; 1074                            (uint8_t)TIM1_ForcedAction);
3840  0001 c65258        	ld	a,21080
3841  0004 a48f          	and	a,#143
3842  0006 1a01          	or	a,(OFST+1,sp)
3843  0008 c75258        	ld	21080,a
3844                     ; 1075 }
3847  000b 84            	pop	a
3848  000c 81            	ret	
3884                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3884                     ; 1086 {
3885                     .text:	section	.text,new
3886  0000               _TIM1_ForcedOC2Config:
3888  0000 88            	push	a
3889       00000000      OFST:	set	0
3892                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3894                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
3894                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
3896  0001 c65259        	ld	a,21081
3897  0004 a48f          	and	a,#143
3898  0006 1a01          	or	a,(OFST+1,sp)
3899  0008 c75259        	ld	21081,a
3900                     ; 1093 }
3903  000b 84            	pop	a
3904  000c 81            	ret	
3940                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3940                     ; 1105 {
3941                     .text:	section	.text,new
3942  0000               _TIM1_ForcedOC3Config:
3944  0000 88            	push	a
3945       00000000      OFST:	set	0
3948                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3950                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
3950                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
3952  0001 c6525a        	ld	a,21082
3953  0004 a48f          	and	a,#143
3954  0006 1a01          	or	a,(OFST+1,sp)
3955  0008 c7525a        	ld	21082,a
3956                     ; 1112 }
3959  000b 84            	pop	a
3960  000c 81            	ret	
3996                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3996                     ; 1124 {
3997                     .text:	section	.text,new
3998  0000               _TIM1_ForcedOC4Config:
4000  0000 88            	push	a
4001       00000000      OFST:	set	0
4004                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
4006                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
4006                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
4008  0001 c6525b        	ld	a,21083
4009  0004 a48f          	and	a,#143
4010  0006 1a01          	or	a,(OFST+1,sp)
4011  0008 c7525b        	ld	21083,a
4012                     ; 1131 }
4015  000b 84            	pop	a
4016  000c 81            	ret	
4052                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
4052                     ; 1140 {
4053                     .text:	section	.text,new
4054  0000               _TIM1_ARRPreloadConfig:
4058                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4060                     ; 1145   if (NewState != DISABLE)
4062  0000 4d            	tnz	a
4063  0001 2705          	jreq	L1112
4064                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
4066  0003 721e5250      	bset	21072,#7
4069  0007 81            	ret	
4070  0008               L1112:
4071                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
4073  0008 721f5250      	bres	21072,#7
4074                     ; 1153 }
4077  000c 81            	ret	
4112                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
4112                     ; 1162 {
4113                     .text:	section	.text,new
4114  0000               _TIM1_SelectCOM:
4118                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4120                     ; 1167   if (NewState != DISABLE)
4122  0000 4d            	tnz	a
4123  0001 2705          	jreq	L3312
4124                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
4126  0003 72145251      	bset	21073,#2
4129  0007 81            	ret	
4130  0008               L3312:
4131                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
4133  0008 72155251      	bres	21073,#2
4134                     ; 1175 }
4137  000c 81            	ret	
4173                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
4173                     ; 1184 {
4174                     .text:	section	.text,new
4175  0000               _TIM1_CCPreloadControl:
4179                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4181                     ; 1189   if (NewState != DISABLE)
4183  0000 4d            	tnz	a
4184  0001 2705          	jreq	L5512
4185                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
4187  0003 72105251      	bset	21073,#0
4190  0007 81            	ret	
4191  0008               L5512:
4192                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4194  0008 72115251      	bres	21073,#0
4195                     ; 1197 }
4198  000c 81            	ret	
4234                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4234                     ; 1206 {
4235                     .text:	section	.text,new
4236  0000               _TIM1_OC1PreloadConfig:
4240                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4242                     ; 1211   if (NewState != DISABLE)
4244  0000 4d            	tnz	a
4245  0001 2705          	jreq	L7712
4246                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4248  0003 72165258      	bset	21080,#3
4251  0007 81            	ret	
4252  0008               L7712:
4253                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4255  0008 72175258      	bres	21080,#3
4256                     ; 1219 }
4259  000c 81            	ret	
4295                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4295                     ; 1228 {
4296                     .text:	section	.text,new
4297  0000               _TIM1_OC2PreloadConfig:
4301                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4303                     ; 1233   if (NewState != DISABLE)
4305  0000 4d            	tnz	a
4306  0001 2705          	jreq	L1222
4307                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4309  0003 72165259      	bset	21081,#3
4312  0007 81            	ret	
4313  0008               L1222:
4314                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4316  0008 72175259      	bres	21081,#3
4317                     ; 1241 }
4320  000c 81            	ret	
4356                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4356                     ; 1250 {
4357                     .text:	section	.text,new
4358  0000               _TIM1_OC3PreloadConfig:
4362                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4364                     ; 1255   if (NewState != DISABLE)
4366  0000 4d            	tnz	a
4367  0001 2705          	jreq	L3422
4368                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4370  0003 7216525a      	bset	21082,#3
4373  0007 81            	ret	
4374  0008               L3422:
4375                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4377  0008 7217525a      	bres	21082,#3
4378                     ; 1263 }
4381  000c 81            	ret	
4417                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4417                     ; 1272 {
4418                     .text:	section	.text,new
4419  0000               _TIM1_OC4PreloadConfig:
4423                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4425                     ; 1277   if (NewState != DISABLE)
4427  0000 4d            	tnz	a
4428  0001 2705          	jreq	L5622
4429                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4431  0003 7216525b      	bset	21083,#3
4434  0007 81            	ret	
4435  0008               L5622:
4436                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4438  0008 7217525b      	bres	21083,#3
4439                     ; 1285 }
4442  000c 81            	ret	
4477                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
4477                     ; 1294 {
4478                     .text:	section	.text,new
4479  0000               _TIM1_OC1FastConfig:
4483                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4485                     ; 1299   if (NewState != DISABLE)
4487  0000 4d            	tnz	a
4488  0001 2705          	jreq	L7032
4489                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4491  0003 72145258      	bset	21080,#2
4494  0007 81            	ret	
4495  0008               L7032:
4496                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4498  0008 72155258      	bres	21080,#2
4499                     ; 1307 }
4502  000c 81            	ret	
4537                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
4537                     ; 1316 {
4538                     .text:	section	.text,new
4539  0000               _TIM1_OC2FastConfig:
4543                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4545                     ; 1321   if (NewState != DISABLE)
4547  0000 4d            	tnz	a
4548  0001 2705          	jreq	L1332
4549                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4551  0003 72145259      	bset	21081,#2
4554  0007 81            	ret	
4555  0008               L1332:
4556                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4558  0008 72155259      	bres	21081,#2
4559                     ; 1329 }
4562  000c 81            	ret	
4597                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
4597                     ; 1338 {
4598                     .text:	section	.text,new
4599  0000               _TIM1_OC3FastConfig:
4603                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4605                     ; 1343   if (NewState != DISABLE)
4607  0000 4d            	tnz	a
4608  0001 2705          	jreq	L3532
4609                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4611  0003 7214525a      	bset	21082,#2
4614  0007 81            	ret	
4615  0008               L3532:
4616                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4618  0008 7215525a      	bres	21082,#2
4619                     ; 1351 }
4622  000c 81            	ret	
4657                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
4657                     ; 1360 {
4658                     .text:	section	.text,new
4659  0000               _TIM1_OC4FastConfig:
4663                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4665                     ; 1365   if (NewState != DISABLE)
4667  0000 4d            	tnz	a
4668  0001 2705          	jreq	L5732
4669                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4671  0003 7214525b      	bset	21083,#2
4674  0007 81            	ret	
4675  0008               L5732:
4676                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4678  0008 7215525b      	bres	21083,#2
4679                     ; 1373 }
4682  000c 81            	ret	
4787                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4787                     ; 1390 {
4788                     .text:	section	.text,new
4789  0000               _TIM1_GenerateEvent:
4793                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4795                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
4797  0000 c75257        	ld	21079,a
4798                     ; 1396 }
4801  0003 81            	ret	
4837                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4837                     ; 1407 {
4838                     .text:	section	.text,new
4839  0000               _TIM1_OC1PolarityConfig:
4843                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4845                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4847  0000 4d            	tnz	a
4848  0001 2705          	jreq	L1642
4849                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4851  0003 7212525c      	bset	21084,#1
4854  0007 81            	ret	
4855  0008               L1642:
4856                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4858  0008 7213525c      	bres	21084,#1
4859                     ; 1420 }
4862  000c 81            	ret	
4898                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4898                     ; 1431 {
4899                     .text:	section	.text,new
4900  0000               _TIM1_OC1NPolarityConfig:
4904                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4906                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4908  0000 4d            	tnz	a
4909  0001 2705          	jreq	L3052
4910                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4912  0003 7216525c      	bset	21084,#3
4915  0007 81            	ret	
4916  0008               L3052:
4917                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
4919  0008 7217525c      	bres	21084,#3
4920                     ; 1444 }
4923  000c 81            	ret	
4959                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4959                     ; 1455 {
4960                     .text:	section	.text,new
4961  0000               _TIM1_OC2PolarityConfig:
4965                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4967                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4969  0000 4d            	tnz	a
4970  0001 2705          	jreq	L5252
4971                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4973  0003 721a525c      	bset	21084,#5
4976  0007 81            	ret	
4977  0008               L5252:
4978                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4980  0008 721b525c      	bres	21084,#5
4981                     ; 1468 }
4984  000c 81            	ret	
5020                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5020                     ; 1479 {
5021                     .text:	section	.text,new
5022  0000               _TIM1_OC2NPolarityConfig:
5026                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5028                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5030  0000 4d            	tnz	a
5031  0001 2705          	jreq	L7452
5032                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
5034  0003 721e525c      	bset	21084,#7
5037  0007 81            	ret	
5038  0008               L7452:
5039                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
5041  0008 721f525c      	bres	21084,#7
5042                     ; 1492 }
5045  000c 81            	ret	
5081                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5081                     ; 1503 {
5082                     .text:	section	.text,new
5083  0000               _TIM1_OC3PolarityConfig:
5087                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5089                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5091  0000 4d            	tnz	a
5092  0001 2705          	jreq	L1752
5093                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
5095  0003 7212525d      	bset	21085,#1
5098  0007 81            	ret	
5099  0008               L1752:
5100                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
5102  0008 7213525d      	bres	21085,#1
5103                     ; 1516 }
5106  000c 81            	ret	
5142                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5142                     ; 1528 {
5143                     .text:	section	.text,new
5144  0000               _TIM1_OC3NPolarityConfig:
5148                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5150                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5152  0000 4d            	tnz	a
5153  0001 2705          	jreq	L3162
5154                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5156  0003 7216525d      	bset	21085,#3
5159  0007 81            	ret	
5160  0008               L3162:
5161                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5163  0008 7217525d      	bres	21085,#3
5164                     ; 1541 }
5167  000c 81            	ret	
5203                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5203                     ; 1552 {
5204                     .text:	section	.text,new
5205  0000               _TIM1_OC4PolarityConfig:
5209                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5211                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5213  0000 4d            	tnz	a
5214  0001 2705          	jreq	L5362
5215                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
5217  0003 721a525d      	bset	21085,#5
5220  0007 81            	ret	
5221  0008               L5362:
5222                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
5224  0008 721b525d      	bres	21085,#5
5225                     ; 1565 }
5228  000c 81            	ret	
5273                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5273                     ; 1580 {
5274                     .text:	section	.text,new
5275  0000               _TIM1_CCxCmd:
5277  0000 89            	pushw	x
5278       00000000      OFST:	set	0
5281                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5283                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5285                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
5287  0001 9e            	ld	a,xh
5288  0002 4d            	tnz	a
5289  0003 2610          	jrne	L3662
5290                     ; 1588     if (NewState != DISABLE)
5292  0005 9f            	ld	a,xl
5293  0006 4d            	tnz	a
5294  0007 2706          	jreq	L5662
5295                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
5297  0009 7210525c      	bset	21084,#0
5299  000d 203e          	jra	L1762
5300  000f               L5662:
5301                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5303  000f 7211525c      	bres	21084,#0
5304  0013 2038          	jra	L1762
5305  0015               L3662:
5306                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
5308  0015 7b01          	ld	a,(OFST+1,sp)
5309  0017 a101          	cp	a,#1
5310  0019 2610          	jrne	L3762
5311                     ; 1601     if (NewState != DISABLE)
5313  001b 7b02          	ld	a,(OFST+2,sp)
5314  001d 2706          	jreq	L5762
5315                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
5317  001f 7218525c      	bset	21084,#4
5319  0023 2028          	jra	L1762
5320  0025               L5762:
5321                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5323  0025 7219525c      	bres	21084,#4
5324  0029 2022          	jra	L1762
5325  002b               L3762:
5326                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
5328  002b a102          	cp	a,#2
5329  002d 2610          	jrne	L3072
5330                     ; 1613     if (NewState != DISABLE)
5332  002f 7b02          	ld	a,(OFST+2,sp)
5333  0031 2706          	jreq	L5072
5334                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
5336  0033 7210525d      	bset	21085,#0
5338  0037 2014          	jra	L1762
5339  0039               L5072:
5340                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5342  0039 7211525d      	bres	21085,#0
5343  003d 200e          	jra	L1762
5344  003f               L3072:
5345                     ; 1625     if (NewState != DISABLE)
5347  003f 7b02          	ld	a,(OFST+2,sp)
5348  0041 2706          	jreq	L3172
5349                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
5351  0043 7218525d      	bset	21085,#4
5353  0047 2004          	jra	L1762
5354  0049               L3172:
5355                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5357  0049 7219525d      	bres	21085,#4
5358  004d               L1762:
5359                     ; 1634 }
5362  004d 85            	popw	x
5363  004e 81            	ret	
5408                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5408                     ; 1648 {
5409                     .text:	section	.text,new
5410  0000               _TIM1_CCxNCmd:
5412  0000 89            	pushw	x
5413       00000000      OFST:	set	0
5416                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5418                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5420                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
5422  0001 9e            	ld	a,xh
5423  0002 4d            	tnz	a
5424  0003 2610          	jrne	L1472
5425                     ; 1656     if (NewState != DISABLE)
5427  0005 9f            	ld	a,xl
5428  0006 4d            	tnz	a
5429  0007 2706          	jreq	L3472
5430                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5432  0009 7214525c      	bset	21084,#2
5434  000d 2029          	jra	L7472
5435  000f               L3472:
5436                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
5438  000f 7215525c      	bres	21084,#2
5439  0013 2023          	jra	L7472
5440  0015               L1472:
5441                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
5443  0015 7b01          	ld	a,(OFST+1,sp)
5444  0017 4a            	dec	a
5445  0018 2610          	jrne	L1572
5446                     ; 1668     if (NewState != DISABLE)
5448  001a 7b02          	ld	a,(OFST+2,sp)
5449  001c 2706          	jreq	L3572
5450                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5452  001e 721c525c      	bset	21084,#6
5454  0022 2014          	jra	L7472
5455  0024               L3572:
5456                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
5458  0024 721d525c      	bres	21084,#6
5459  0028 200e          	jra	L7472
5460  002a               L1572:
5461                     ; 1680     if (NewState != DISABLE)
5463  002a 7b02          	ld	a,(OFST+2,sp)
5464  002c 2706          	jreq	L1672
5465                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5467  002e 7214525d      	bset	21085,#2
5469  0032 2004          	jra	L7472
5470  0034               L1672:
5471                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
5473  0034 7215525d      	bres	21085,#2
5474  0038               L7472:
5475                     ; 1689 }
5478  0038 85            	popw	x
5479  0039 81            	ret	
5524                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5524                     ; 1713 {
5525                     .text:	section	.text,new
5526  0000               _TIM1_SelectOCxM:
5528  0000 89            	pushw	x
5529       00000000      OFST:	set	0
5532                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5534                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5536                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
5538  0001 9e            	ld	a,xh
5539  0002 4d            	tnz	a
5540  0003 2610          	jrne	L7003
5541                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5543  0005 7211525c      	bres	21084,#0
5544                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
5544                     ; 1725                             | (uint8_t)TIM1_OCMode);
5546  0009 c65258        	ld	a,21080
5547  000c a48f          	and	a,#143
5548  000e 1a02          	or	a,(OFST+2,sp)
5549  0010 c75258        	ld	21080,a
5551  0013 2038          	jra	L1103
5552  0015               L7003:
5553                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
5555  0015 7b01          	ld	a,(OFST+1,sp)
5556  0017 a101          	cp	a,#1
5557  0019 2610          	jrne	L3103
5558                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5560  001b 7219525c      	bres	21084,#4
5561                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5561                     ; 1734                             | (uint8_t)TIM1_OCMode);
5563  001f c65259        	ld	a,21081
5564  0022 a48f          	and	a,#143
5565  0024 1a02          	or	a,(OFST+2,sp)
5566  0026 c75259        	ld	21081,a
5568  0029 2022          	jra	L1103
5569  002b               L3103:
5570                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
5572  002b a102          	cp	a,#2
5573  002d 2610          	jrne	L7103
5574                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5576  002f 7211525d      	bres	21085,#0
5577                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
5577                     ; 1743                             | (uint8_t)TIM1_OCMode);
5579  0033 c6525a        	ld	a,21082
5580  0036 a48f          	and	a,#143
5581  0038 1a02          	or	a,(OFST+2,sp)
5582  003a c7525a        	ld	21082,a
5584  003d 200e          	jra	L1103
5585  003f               L7103:
5586                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5588  003f 7219525d      	bres	21085,#4
5589                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5589                     ; 1752                             | (uint8_t)TIM1_OCMode);
5591  0043 c6525b        	ld	a,21083
5592  0046 a48f          	and	a,#143
5593  0048 1a02          	or	a,(OFST+2,sp)
5594  004a c7525b        	ld	21083,a
5595  004d               L1103:
5596                     ; 1754 }
5599  004d 85            	popw	x
5600  004e 81            	ret	
5634                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
5634                     ; 1763 {
5635                     .text:	section	.text,new
5636  0000               _TIM1_SetCounter:
5640                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
5642  0000 9e            	ld	a,xh
5643  0001 c7525e        	ld	21086,a
5644                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
5646  0004 9f            	ld	a,xl
5647  0005 c7525f        	ld	21087,a
5648                     ; 1767 }
5651  0008 81            	ret	
5685                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
5685                     ; 1776 {
5686                     .text:	section	.text,new
5687  0000               _TIM1_SetAutoreload:
5691                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
5693  0000 9e            	ld	a,xh
5694  0001 c75262        	ld	21090,a
5695                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
5697  0004 9f            	ld	a,xl
5698  0005 c75263        	ld	21091,a
5699                     ; 1780  }
5702  0008 81            	ret	
5736                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
5736                     ; 1789 {
5737                     .text:	section	.text,new
5738  0000               _TIM1_SetCompare1:
5742                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
5744  0000 9e            	ld	a,xh
5745  0001 c75265        	ld	21093,a
5746                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
5748  0004 9f            	ld	a,xl
5749  0005 c75266        	ld	21094,a
5750                     ; 1793 }
5753  0008 81            	ret	
5787                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
5787                     ; 1802 {
5788                     .text:	section	.text,new
5789  0000               _TIM1_SetCompare2:
5793                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
5795  0000 9e            	ld	a,xh
5796  0001 c75267        	ld	21095,a
5797                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
5799  0004 9f            	ld	a,xl
5800  0005 c75268        	ld	21096,a
5801                     ; 1806 }
5804  0008 81            	ret	
5838                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
5838                     ; 1815 {
5839                     .text:	section	.text,new
5840  0000               _TIM1_SetCompare3:
5844                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
5846  0000 9e            	ld	a,xh
5847  0001 c75269        	ld	21097,a
5848                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
5850  0004 9f            	ld	a,xl
5851  0005 c7526a        	ld	21098,a
5852                     ; 1819 }
5855  0008 81            	ret	
5889                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
5889                     ; 1828 {
5890                     .text:	section	.text,new
5891  0000               _TIM1_SetCompare4:
5895                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
5897  0000 9e            	ld	a,xh
5898  0001 c7526b        	ld	21099,a
5899                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
5901  0004 9f            	ld	a,xl
5902  0005 c7526c        	ld	21100,a
5903                     ; 1832 }
5906  0008 81            	ret	
5942                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5942                     ; 1845 {
5943                     .text:	section	.text,new
5944  0000               _TIM1_SetIC1Prescaler:
5946  0000 88            	push	a
5947       00000000      OFST:	set	0
5950                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5952                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
5952                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
5954  0001 c65258        	ld	a,21080
5955  0004 a4f3          	and	a,#243
5956  0006 1a01          	or	a,(OFST+1,sp)
5957  0008 c75258        	ld	21080,a
5958                     ; 1852 }
5961  000b 84            	pop	a
5962  000c 81            	ret	
5998                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5998                     ; 1865 {
5999                     .text:	section	.text,new
6000  0000               _TIM1_SetIC2Prescaler:
6002  0000 88            	push	a
6003       00000000      OFST:	set	0
6006                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
6008                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
6008                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
6010  0001 c65259        	ld	a,21081
6011  0004 a4f3          	and	a,#243
6012  0006 1a01          	or	a,(OFST+1,sp)
6013  0008 c75259        	ld	21081,a
6014                     ; 1873 }
6017  000b 84            	pop	a
6018  000c 81            	ret	
6054                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
6054                     ; 1886 {
6055                     .text:	section	.text,new
6056  0000               _TIM1_SetIC3Prescaler:
6058  0000 88            	push	a
6059       00000000      OFST:	set	0
6062                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
6064                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
6064                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
6066  0001 c6525a        	ld	a,21082
6067  0004 a4f3          	and	a,#243
6068  0006 1a01          	or	a,(OFST+1,sp)
6069  0008 c7525a        	ld	21082,a
6070                     ; 1894 }
6073  000b 84            	pop	a
6074  000c 81            	ret	
6110                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6110                     ; 1907 {
6111                     .text:	section	.text,new
6112  0000               _TIM1_SetIC4Prescaler:
6114  0000 88            	push	a
6115       00000000      OFST:	set	0
6118                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
6120                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
6120                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
6122  0001 c6525b        	ld	a,21083
6123  0004 a4f3          	and	a,#243
6124  0006 1a01          	or	a,(OFST+1,sp)
6125  0008 c7525b        	ld	21083,a
6126                     ; 1915 }
6129  000b 84            	pop	a
6130  000c 81            	ret	
6182                     ; 1922 uint16_t TIM1_GetCapture1(void)
6182                     ; 1923 {
6183                     .text:	section	.text,new
6184  0000               _TIM1_GetCapture1:
6186  0000 5204          	subw	sp,#4
6187       00000004      OFST:	set	4
6190                     ; 1926   uint16_t tmpccr1 = 0;
6192                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
6196                     ; 1929   tmpccr1h = TIM1->CCR1H;
6198  0002 c65265        	ld	a,21093
6199  0005 6b02          	ld	(OFST-2,sp),a
6201                     ; 1930   tmpccr1l = TIM1->CCR1L;
6203  0007 c65266        	ld	a,21094
6204  000a 6b01          	ld	(OFST-3,sp),a
6206                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
6208  000c 5f            	clrw	x
6209  000d 97            	ld	xl,a
6210  000e 1f03          	ldw	(OFST-1,sp),x
6212                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6214  0010 5f            	clrw	x
6215  0011 7b02          	ld	a,(OFST-2,sp)
6216  0013 97            	ld	xl,a
6217  0014 7b04          	ld	a,(OFST+0,sp)
6218  0016 01            	rrwa	x,a
6219  0017 1a03          	or	a,(OFST-1,sp)
6220  0019 01            	rrwa	x,a
6222                     ; 1935   return (uint16_t)tmpccr1;
6226  001a 5b04          	addw	sp,#4
6227  001c 81            	ret	
6279                     ; 1943 uint16_t TIM1_GetCapture2(void)
6279                     ; 1944 {
6280                     .text:	section	.text,new
6281  0000               _TIM1_GetCapture2:
6283  0000 5204          	subw	sp,#4
6284       00000004      OFST:	set	4
6287                     ; 1947   uint16_t tmpccr2 = 0;
6289                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
6293                     ; 1950   tmpccr2h = TIM1->CCR2H;
6295  0002 c65267        	ld	a,21095
6296  0005 6b02          	ld	(OFST-2,sp),a
6298                     ; 1951   tmpccr2l = TIM1->CCR2L;
6300  0007 c65268        	ld	a,21096
6301  000a 6b01          	ld	(OFST-3,sp),a
6303                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
6305  000c 5f            	clrw	x
6306  000d 97            	ld	xl,a
6307  000e 1f03          	ldw	(OFST-1,sp),x
6309                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6311  0010 5f            	clrw	x
6312  0011 7b02          	ld	a,(OFST-2,sp)
6313  0013 97            	ld	xl,a
6314  0014 7b04          	ld	a,(OFST+0,sp)
6315  0016 01            	rrwa	x,a
6316  0017 1a03          	or	a,(OFST-1,sp)
6317  0019 01            	rrwa	x,a
6319                     ; 1956   return (uint16_t)tmpccr2;
6323  001a 5b04          	addw	sp,#4
6324  001c 81            	ret	
6376                     ; 1964 uint16_t TIM1_GetCapture3(void)
6376                     ; 1965 {
6377                     .text:	section	.text,new
6378  0000               _TIM1_GetCapture3:
6380  0000 5204          	subw	sp,#4
6381       00000004      OFST:	set	4
6384                     ; 1967   uint16_t tmpccr3 = 0;
6386                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
6390                     ; 1970   tmpccr3h = TIM1->CCR3H;
6392  0002 c65269        	ld	a,21097
6393  0005 6b02          	ld	(OFST-2,sp),a
6395                     ; 1971   tmpccr3l = TIM1->CCR3L;
6397  0007 c6526a        	ld	a,21098
6398  000a 6b01          	ld	(OFST-3,sp),a
6400                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
6402  000c 5f            	clrw	x
6403  000d 97            	ld	xl,a
6404  000e 1f03          	ldw	(OFST-1,sp),x
6406                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
6408  0010 5f            	clrw	x
6409  0011 7b02          	ld	a,(OFST-2,sp)
6410  0013 97            	ld	xl,a
6411  0014 7b04          	ld	a,(OFST+0,sp)
6412  0016 01            	rrwa	x,a
6413  0017 1a03          	or	a,(OFST-1,sp)
6414  0019 01            	rrwa	x,a
6416                     ; 1976   return (uint16_t)tmpccr3;
6420  001a 5b04          	addw	sp,#4
6421  001c 81            	ret	
6473                     ; 1984 uint16_t TIM1_GetCapture4(void)
6473                     ; 1985 {
6474                     .text:	section	.text,new
6475  0000               _TIM1_GetCapture4:
6477  0000 5204          	subw	sp,#4
6478       00000004      OFST:	set	4
6481                     ; 1987   uint16_t tmpccr4 = 0;
6483                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
6487                     ; 1990   tmpccr4h = TIM1->CCR4H;
6489  0002 c6526b        	ld	a,21099
6490  0005 6b02          	ld	(OFST-2,sp),a
6492                     ; 1991   tmpccr4l = TIM1->CCR4L;
6494  0007 c6526c        	ld	a,21100
6495  000a 6b01          	ld	(OFST-3,sp),a
6497                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
6499  000c 5f            	clrw	x
6500  000d 97            	ld	xl,a
6501  000e 1f03          	ldw	(OFST-1,sp),x
6503                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
6505  0010 5f            	clrw	x
6506  0011 7b02          	ld	a,(OFST-2,sp)
6507  0013 97            	ld	xl,a
6508  0014 7b04          	ld	a,(OFST+0,sp)
6509  0016 01            	rrwa	x,a
6510  0017 1a03          	or	a,(OFST-1,sp)
6511  0019 01            	rrwa	x,a
6513                     ; 1996   return (uint16_t)tmpccr4;
6517  001a 5b04          	addw	sp,#4
6518  001c 81            	ret	
6552                     ; 2004 uint16_t TIM1_GetCounter(void)
6552                     ; 2005 {
6553                     .text:	section	.text,new
6554  0000               _TIM1_GetCounter:
6556  0000 89            	pushw	x
6557       00000002      OFST:	set	2
6560                     ; 2006   uint16_t tmpcntr = 0;
6562                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
6564  0001 c6525e        	ld	a,21086
6565  0004 97            	ld	xl,a
6566  0005 4f            	clr	a
6567  0006 02            	rlwa	x,a
6568  0007 1f01          	ldw	(OFST-1,sp),x
6570                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
6572  0009 c6525f        	ld	a,21087
6573  000c 5f            	clrw	x
6574  000d 97            	ld	xl,a
6575  000e 01            	rrwa	x,a
6576  000f 1a02          	or	a,(OFST+0,sp)
6577  0011 01            	rrwa	x,a
6578  0012 1a01          	or	a,(OFST-1,sp)
6579  0014 01            	rrwa	x,a
6582  0015 5b02          	addw	sp,#2
6583  0017 81            	ret	
6617                     ; 2019 uint16_t TIM1_GetPrescaler(void)
6617                     ; 2020 {
6618                     .text:	section	.text,new
6619  0000               _TIM1_GetPrescaler:
6621  0000 89            	pushw	x
6622       00000002      OFST:	set	2
6625                     ; 2021   uint16_t temp = 0;
6627                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
6629  0001 c65260        	ld	a,21088
6630  0004 97            	ld	xl,a
6631  0005 4f            	clr	a
6632  0006 02            	rlwa	x,a
6633  0007 1f01          	ldw	(OFST-1,sp),x
6635                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
6637  0009 c65261        	ld	a,21089
6638  000c 5f            	clrw	x
6639  000d 97            	ld	xl,a
6640  000e 01            	rrwa	x,a
6641  000f 1a02          	or	a,(OFST+0,sp)
6642  0011 01            	rrwa	x,a
6643  0012 1a01          	or	a,(OFST-1,sp)
6644  0014 01            	rrwa	x,a
6647  0015 5b02          	addw	sp,#2
6648  0017 81            	ret	
6822                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6822                     ; 2048 {
6823                     .text:	section	.text,new
6824  0000               _TIM1_GetFlagStatus:
6826  0000 89            	pushw	x
6827  0001 89            	pushw	x
6828       00000002      OFST:	set	2
6831                     ; 2049   FlagStatus bitstatus = RESET;
6833                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
6837                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6839                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
6841  0002 9f            	ld	a,xl
6842  0003 c45255        	and	a,21077
6843  0006 6b01          	ld	(OFST-1,sp),a
6845                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
6847  0008 7b03          	ld	a,(OFST+1,sp)
6848  000a 6b02          	ld	(OFST+0,sp),a
6850                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
6852  000c c45256        	and	a,21078
6853  000f 1a01          	or	a,(OFST-1,sp)
6854  0011 2702          	jreq	L1253
6855                     ; 2060     bitstatus = SET;
6857  0013 a601          	ld	a,#1
6860  0015               L1253:
6861                     ; 2064     bitstatus = RESET;
6864                     ; 2066   return (FlagStatus)(bitstatus);
6868  0015 5b04          	addw	sp,#4
6869  0017 81            	ret	
6904                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6904                     ; 2088 {
6905                     .text:	section	.text,new
6906  0000               _TIM1_ClearFlag:
6908  0000 89            	pushw	x
6909       00000000      OFST:	set	0
6912                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6914                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
6916  0001 9f            	ld	a,xl
6917  0002 43            	cpl	a
6918  0003 c75255        	ld	21077,a
6919                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
6919                     ; 2095                         (uint8_t)0x1E);
6921  0006 7b01          	ld	a,(OFST+1,sp)
6922  0008 43            	cpl	a
6923  0009 a41e          	and	a,#30
6924  000b c75256        	ld	21078,a
6925                     ; 2096 }
6928  000e 85            	popw	x
6929  000f 81            	ret	
6993                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
6993                     ; 2113 {
6994                     .text:	section	.text,new
6995  0000               _TIM1_GetITStatus:
6997  0000 88            	push	a
6998  0001 89            	pushw	x
6999       00000002      OFST:	set	2
7002                     ; 2114   ITStatus bitstatus = RESET;
7004                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
7008                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
7010                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
7012  0002 c45255        	and	a,21077
7013  0005 6b01          	ld	(OFST-1,sp),a
7015                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
7017  0007 c65254        	ld	a,21076
7018  000a 1403          	and	a,(OFST+1,sp)
7019  000c 6b02          	ld	(OFST+0,sp),a
7021                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
7023  000e 7b01          	ld	a,(OFST-1,sp)
7024  0010 2708          	jreq	L5753
7026  0012 7b02          	ld	a,(OFST+0,sp)
7027  0014 2704          	jreq	L5753
7028                     ; 2126     bitstatus = SET;
7030  0016 a601          	ld	a,#1
7033  0018 2001          	jra	L7753
7034  001a               L5753:
7035                     ; 2130     bitstatus = RESET;
7037  001a 4f            	clr	a
7039  001b               L7753:
7040                     ; 2132   return (ITStatus)(bitstatus);
7044  001b 5b03          	addw	sp,#3
7045  001d 81            	ret	
7081                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
7081                     ; 2150 {
7082                     .text:	section	.text,new
7083  0000               _TIM1_ClearITPendingBit:
7087                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
7089                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
7091  0000 43            	cpl	a
7092  0001 c75255        	ld	21077,a
7093                     ; 2156 }
7096  0004 81            	ret	
7148                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
7148                     ; 2175                        uint8_t TIM1_ICSelection,
7148                     ; 2176                        uint8_t TIM1_ICFilter)
7148                     ; 2177 {
7149                     .text:	section	.text,new
7150  0000               L73_TI1_Config:
7152  0000 89            	pushw	x
7153  0001 88            	push	a
7154       00000001      OFST:	set	1
7157                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7159  0002 7211525c      	bres	21084,#0
7160                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
7160                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7162  0006 7b06          	ld	a,(OFST+5,sp)
7163  0008 97            	ld	xl,a
7164  0009 a610          	ld	a,#16
7165  000b 42            	mul	x,a
7166  000c 9f            	ld	a,xl
7167  000d 1a03          	or	a,(OFST+2,sp)
7168  000f 6b01          	ld	(OFST+0,sp),a
7170  0011 c65258        	ld	a,21080
7171  0014 a40c          	and	a,#12
7172  0016 1a01          	or	a,(OFST+0,sp)
7173  0018 c75258        	ld	21080,a
7174                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7176  001b 7b02          	ld	a,(OFST+1,sp)
7177  001d 2706          	jreq	L5463
7178                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7180  001f 7212525c      	bset	21084,#1
7182  0023 2004          	jra	L7463
7183  0025               L5463:
7184                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7186  0025 7213525c      	bres	21084,#1
7187  0029               L7463:
7188                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7190  0029 7210525c      	bset	21084,#0
7191                     ; 2197 }
7194  002d 5b03          	addw	sp,#3
7195  002f 81            	ret	
7247                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
7247                     ; 2216                        uint8_t TIM1_ICSelection,
7247                     ; 2217                        uint8_t TIM1_ICFilter)
7247                     ; 2218 {
7248                     .text:	section	.text,new
7249  0000               L14_TI2_Config:
7251  0000 89            	pushw	x
7252  0001 88            	push	a
7253       00000001      OFST:	set	1
7256                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7258  0002 7219525c      	bres	21084,#4
7259                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
7259                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7261  0006 7b06          	ld	a,(OFST+5,sp)
7262  0008 97            	ld	xl,a
7263  0009 a610          	ld	a,#16
7264  000b 42            	mul	x,a
7265  000c 9f            	ld	a,xl
7266  000d 1a03          	or	a,(OFST+2,sp)
7267  000f 6b01          	ld	(OFST+0,sp),a
7269  0011 c65259        	ld	a,21081
7270  0014 a40c          	and	a,#12
7271  0016 1a01          	or	a,(OFST+0,sp)
7272  0018 c75259        	ld	21081,a
7273                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7275  001b 7b02          	ld	a,(OFST+1,sp)
7276  001d 2706          	jreq	L7763
7277                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7279  001f 721a525c      	bset	21084,#5
7281  0023 2004          	jra	L1073
7282  0025               L7763:
7283                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7285  0025 721b525c      	bres	21084,#5
7286  0029               L1073:
7287                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7289  0029 7218525c      	bset	21084,#4
7290                     ; 2236 }
7293  002d 5b03          	addw	sp,#3
7294  002f 81            	ret	
7346                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
7346                     ; 2255                        uint8_t TIM1_ICSelection,
7346                     ; 2256                        uint8_t TIM1_ICFilter)
7346                     ; 2257 {
7347                     .text:	section	.text,new
7348  0000               L34_TI3_Config:
7350  0000 89            	pushw	x
7351  0001 88            	push	a
7352       00000001      OFST:	set	1
7355                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7357  0002 7211525d      	bres	21085,#0
7358                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
7358                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7360  0006 7b06          	ld	a,(OFST+5,sp)
7361  0008 97            	ld	xl,a
7362  0009 a610          	ld	a,#16
7363  000b 42            	mul	x,a
7364  000c 9f            	ld	a,xl
7365  000d 1a03          	or	a,(OFST+2,sp)
7366  000f 6b01          	ld	(OFST+0,sp),a
7368  0011 c6525a        	ld	a,21082
7369  0014 a40c          	and	a,#12
7370  0016 1a01          	or	a,(OFST+0,sp)
7371  0018 c7525a        	ld	21082,a
7372                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7374  001b 7b02          	ld	a,(OFST+1,sp)
7375  001d 2706          	jreq	L1373
7376                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
7378  001f 7212525d      	bset	21085,#1
7380  0023 2004          	jra	L3373
7381  0025               L1373:
7382                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7384  0025 7213525d      	bres	21085,#1
7385  0029               L3373:
7386                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7388  0029 7210525d      	bset	21085,#0
7389                     ; 2276 }
7392  002d 5b03          	addw	sp,#3
7393  002f 81            	ret	
7445                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
7445                     ; 2295                        uint8_t TIM1_ICSelection,
7445                     ; 2296                        uint8_t TIM1_ICFilter)
7445                     ; 2297 {
7446                     .text:	section	.text,new
7447  0000               L54_TI4_Config:
7449  0000 89            	pushw	x
7450  0001 88            	push	a
7451       00000001      OFST:	set	1
7454                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7456  0002 7219525d      	bres	21085,#4
7457                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
7457                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7459  0006 7b06          	ld	a,(OFST+5,sp)
7460  0008 97            	ld	xl,a
7461  0009 a610          	ld	a,#16
7462  000b 42            	mul	x,a
7463  000c 9f            	ld	a,xl
7464  000d 1a03          	or	a,(OFST+2,sp)
7465  000f 6b01          	ld	(OFST+0,sp),a
7467  0011 c6525b        	ld	a,21083
7468  0014 a40c          	and	a,#12
7469  0016 1a01          	or	a,(OFST+0,sp)
7470  0018 c7525b        	ld	21083,a
7471                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7473  001b 7b02          	ld	a,(OFST+1,sp)
7474  001d 2706          	jreq	L3673
7475                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
7477  001f 721a525d      	bset	21085,#5
7479  0023 2004          	jra	L5673
7480  0025               L3673:
7481                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
7483  0025 721b525d      	bres	21085,#5
7484  0029               L5673:
7485                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7487  0029 7218525d      	bset	21085,#4
7488                     ; 2317 }
7491  002d 5b03          	addw	sp,#3
7492  002f 81            	ret	
7505                     	xdef	_TIM1_ClearITPendingBit
7506                     	xdef	_TIM1_GetITStatus
7507                     	xdef	_TIM1_ClearFlag
7508                     	xdef	_TIM1_GetFlagStatus
7509                     	xdef	_TIM1_GetPrescaler
7510                     	xdef	_TIM1_GetCounter
7511                     	xdef	_TIM1_GetCapture4
7512                     	xdef	_TIM1_GetCapture3
7513                     	xdef	_TIM1_GetCapture2
7514                     	xdef	_TIM1_GetCapture1
7515                     	xdef	_TIM1_SetIC4Prescaler
7516                     	xdef	_TIM1_SetIC3Prescaler
7517                     	xdef	_TIM1_SetIC2Prescaler
7518                     	xdef	_TIM1_SetIC1Prescaler
7519                     	xdef	_TIM1_SetCompare4
7520                     	xdef	_TIM1_SetCompare3
7521                     	xdef	_TIM1_SetCompare2
7522                     	xdef	_TIM1_SetCompare1
7523                     	xdef	_TIM1_SetAutoreload
7524                     	xdef	_TIM1_SetCounter
7525                     	xdef	_TIM1_SelectOCxM
7526                     	xdef	_TIM1_CCxNCmd
7527                     	xdef	_TIM1_CCxCmd
7528                     	xdef	_TIM1_OC4PolarityConfig
7529                     	xdef	_TIM1_OC3NPolarityConfig
7530                     	xdef	_TIM1_OC3PolarityConfig
7531                     	xdef	_TIM1_OC2NPolarityConfig
7532                     	xdef	_TIM1_OC2PolarityConfig
7533                     	xdef	_TIM1_OC1NPolarityConfig
7534                     	xdef	_TIM1_OC1PolarityConfig
7535                     	xdef	_TIM1_GenerateEvent
7536                     	xdef	_TIM1_OC4FastConfig
7537                     	xdef	_TIM1_OC3FastConfig
7538                     	xdef	_TIM1_OC2FastConfig
7539                     	xdef	_TIM1_OC1FastConfig
7540                     	xdef	_TIM1_OC4PreloadConfig
7541                     	xdef	_TIM1_OC3PreloadConfig
7542                     	xdef	_TIM1_OC2PreloadConfig
7543                     	xdef	_TIM1_OC1PreloadConfig
7544                     	xdef	_TIM1_CCPreloadControl
7545                     	xdef	_TIM1_SelectCOM
7546                     	xdef	_TIM1_ARRPreloadConfig
7547                     	xdef	_TIM1_ForcedOC4Config
7548                     	xdef	_TIM1_ForcedOC3Config
7549                     	xdef	_TIM1_ForcedOC2Config
7550                     	xdef	_TIM1_ForcedOC1Config
7551                     	xdef	_TIM1_CounterModeConfig
7552                     	xdef	_TIM1_PrescalerConfig
7553                     	xdef	_TIM1_EncoderInterfaceConfig
7554                     	xdef	_TIM1_SelectMasterSlaveMode
7555                     	xdef	_TIM1_SelectSlaveMode
7556                     	xdef	_TIM1_SelectOutputTrigger
7557                     	xdef	_TIM1_SelectOnePulseMode
7558                     	xdef	_TIM1_SelectHallSensor
7559                     	xdef	_TIM1_UpdateRequestConfig
7560                     	xdef	_TIM1_UpdateDisableConfig
7561                     	xdef	_TIM1_SelectInputTrigger
7562                     	xdef	_TIM1_TIxExternalClockConfig
7563                     	xdef	_TIM1_ETRConfig
7564                     	xdef	_TIM1_ETRClockMode2Config
7565                     	xdef	_TIM1_ETRClockMode1Config
7566                     	xdef	_TIM1_InternalClockConfig
7567                     	xdef	_TIM1_ITConfig
7568                     	xdef	_TIM1_CtrlPWMOutputs
7569                     	xdef	_TIM1_Cmd
7570                     	xdef	_TIM1_PWMIConfig
7571                     	xdef	_TIM1_ICInit
7572                     	xdef	_TIM1_BDTRConfig
7573                     	xdef	_TIM1_OC4Init
7574                     	xdef	_TIM1_OC3Init
7575                     	xdef	_TIM1_OC2Init
7576                     	xdef	_TIM1_OC1Init
7577                     	xdef	_TIM1_TimeBaseInit
7578                     	xdef	_TIM1_DeInit
7597                     	end

   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  77                     ; 58 void TIM1_DeInit(void)
  77                     ; 59 {
  79                     .text:	section	.text,new
  80  0000               _TIM1_DeInit:
  84                     ; 60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  86  0000 725f5250      	clr	21072
  87                     ; 61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  89  0004 725f5251      	clr	21073
  90                     ; 62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  92  0008 725f5252      	clr	21074
  93                     ; 63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  95  000c 725f5253      	clr	21075
  96                     ; 64   TIM1->IER  = TIM1_IER_RESET_VALUE;
  98  0010 725f5254      	clr	21076
  99                     ; 65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
 101  0014 725f5256      	clr	21078
 102                     ; 67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
 104  0018 725f525c      	clr	21084
 105                     ; 68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
 107  001c 725f525d      	clr	21085
 108                     ; 70   TIM1->CCMR1 = 0x01;
 110  0020 35015258      	mov	21080,#1
 111                     ; 71   TIM1->CCMR2 = 0x01;
 113  0024 35015259      	mov	21081,#1
 114                     ; 72   TIM1->CCMR3 = 0x01;
 116  0028 3501525a      	mov	21082,#1
 117                     ; 73   TIM1->CCMR4 = 0x01;
 119  002c 3501525b      	mov	21083,#1
 120                     ; 75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
 122  0030 725f525c      	clr	21084
 123                     ; 76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
 125  0034 725f525d      	clr	21085
 126                     ; 77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
 128  0038 725f5258      	clr	21080
 129                     ; 78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
 131  003c 725f5259      	clr	21081
 132                     ; 79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 134  0040 725f525a      	clr	21082
 135                     ; 80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 137  0044 725f525b      	clr	21083
 138                     ; 81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 140  0048 725f525e      	clr	21086
 141                     ; 82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 143  004c 725f525f      	clr	21087
 144                     ; 83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 146  0050 725f5260      	clr	21088
 147                     ; 84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 149  0054 725f5261      	clr	21089
 150                     ; 85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 152  0058 35ff5262      	mov	21090,#255
 153                     ; 86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 155  005c 35ff5263      	mov	21091,#255
 156                     ; 87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 158  0060 725f5265      	clr	21093
 159                     ; 88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 161  0064 725f5266      	clr	21094
 162                     ; 89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 164  0068 725f5267      	clr	21095
 165                     ; 90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 167  006c 725f5268      	clr	21096
 168                     ; 91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 170  0070 725f5269      	clr	21097
 171                     ; 92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 173  0074 725f526a      	clr	21098
 174                     ; 93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 176  0078 725f526b      	clr	21099
 177                     ; 94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 179  007c 725f526c      	clr	21100
 180                     ; 95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 182  0080 725f526f      	clr	21103
 183                     ; 96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 185  0084 35015257      	mov	21079,#1
 186                     ; 97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 188  0088 725f526e      	clr	21102
 189                     ; 98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 191  008c 725f526d      	clr	21101
 192                     ; 99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 194  0090 725f5264      	clr	21092
 195                     ; 100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 197  0094 725f5255      	clr	21077
 198                     ; 101 }
 201  0098 81            	ret	
 310                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 310                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 310                     ; 113                        uint16_t TIM1_Period,
 310                     ; 114                        uint8_t TIM1_RepetitionCounter)
 310                     ; 115 {
 311                     .text:	section	.text,new
 312  0000               _TIM1_TimeBaseInit:
 314       fffffffe      OFST: set -2
 317                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 319                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 321  0000 7b04          	ld	a,(OFST+6,sp)
 322  0002 c75262        	ld	21090,a
 323                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 325  0005 7b05          	ld	a,(OFST+7,sp)
 326  0007 c75263        	ld	21091,a
 327                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 329  000a 9e            	ld	a,xh
 330  000b c75260        	ld	21088,a
 331                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 333  000e 9f            	ld	a,xl
 334  000f c75261        	ld	21089,a
 335                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 335                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 337  0012 c65250        	ld	a,21072
 338  0015 a48f          	and	a,#143
 339  0017 1a03          	or	a,(OFST+5,sp)
 340  0019 c75250        	ld	21072,a
 341                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 343  001c 7b06          	ld	a,(OFST+8,sp)
 344  001e c75264        	ld	21092,a
 345                     ; 133 }
 348  0021 81            	ret	
 633                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 633                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 633                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 633                     ; 157                   uint16_t TIM1_Pulse,
 633                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 633                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 633                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 633                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 633                     ; 162 {
 634                     .text:	section	.text,new
 635  0000               _TIM1_OC1Init:
 637  0000 89            	pushw	x
 638  0001 5203          	subw	sp,#3
 639       00000003      OFST:	set	3
 642                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 644                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 646                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 648                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 650                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 652                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 654                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 656                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 656                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 658  0003 c6525c        	ld	a,21084
 659  0006 a4f0          	and	a,#240
 660  0008 c7525c        	ld	21084,a
 661                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 661                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 661                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 661                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 663  000b 7b0c          	ld	a,(OFST+9,sp)
 664  000d a408          	and	a,#8
 665  000f 6b03          	ld	(OFST+0,sp),a
 667  0011 7b0b          	ld	a,(OFST+8,sp)
 668  0013 a402          	and	a,#2
 669  0015 1a03          	or	a,(OFST+0,sp)
 670  0017 6b02          	ld	(OFST-1,sp),a
 672  0019 7b08          	ld	a,(OFST+5,sp)
 673  001b a404          	and	a,#4
 674  001d 6b01          	ld	(OFST-2,sp),a
 676  001f 9f            	ld	a,xl
 677  0020 a401          	and	a,#1
 678  0022 1a01          	or	a,(OFST-2,sp)
 679  0024 1a02          	or	a,(OFST-1,sp)
 680  0026 ca525c        	or	a,21084
 681  0029 c7525c        	ld	21084,a
 682                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 682                     ; 185                           (uint8_t)TIM1_OCMode);
 684  002c c65258        	ld	a,21080
 685  002f a48f          	and	a,#143
 686  0031 1a04          	or	a,(OFST+1,sp)
 687  0033 c75258        	ld	21080,a
 688                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 690  0036 c6526f        	ld	a,21103
 691  0039 a4fc          	and	a,#252
 692  003b c7526f        	ld	21103,a
 693                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 693                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 695  003e 7b0e          	ld	a,(OFST+11,sp)
 696  0040 a402          	and	a,#2
 697  0042 6b03          	ld	(OFST+0,sp),a
 699  0044 7b0d          	ld	a,(OFST+10,sp)
 700  0046 a401          	and	a,#1
 701  0048 1a03          	or	a,(OFST+0,sp)
 702  004a ca526f        	or	a,21103
 703  004d c7526f        	ld	21103,a
 704                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 706  0050 7b09          	ld	a,(OFST+6,sp)
 707  0052 c75265        	ld	21093,a
 708                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 710  0055 7b0a          	ld	a,(OFST+7,sp)
 711  0057 c75266        	ld	21094,a
 712                     ; 196 }
 715  005a 5b05          	addw	sp,#5
 716  005c 81            	ret	
 820                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 820                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 820                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 820                     ; 220                   uint16_t TIM1_Pulse,
 820                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 820                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 820                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 820                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 820                     ; 225 {
 821                     .text:	section	.text,new
 822  0000               _TIM1_OC2Init:
 824  0000 89            	pushw	x
 825  0001 5203          	subw	sp,#3
 826       00000003      OFST:	set	3
 829                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 831                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 833                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 835                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 837                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 839                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 841                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 843                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 843                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 845  0003 c6525c        	ld	a,21084
 846  0006 a40f          	and	a,#15
 847  0008 c7525c        	ld	21084,a
 848                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 848                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 848                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 848                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 850  000b 7b0c          	ld	a,(OFST+9,sp)
 851  000d a480          	and	a,#128
 852  000f 6b03          	ld	(OFST+0,sp),a
 854  0011 7b0b          	ld	a,(OFST+8,sp)
 855  0013 a420          	and	a,#32
 856  0015 1a03          	or	a,(OFST+0,sp)
 857  0017 6b02          	ld	(OFST-1,sp),a
 859  0019 7b08          	ld	a,(OFST+5,sp)
 860  001b a440          	and	a,#64
 861  001d 6b01          	ld	(OFST-2,sp),a
 863  001f 9f            	ld	a,xl
 864  0020 a410          	and	a,#16
 865  0022 1a01          	or	a,(OFST-2,sp)
 866  0024 1a02          	or	a,(OFST-1,sp)
 867  0026 ca525c        	or	a,21084
 868  0029 c7525c        	ld	21084,a
 869                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 869                     ; 249                           (uint8_t)TIM1_OCMode);
 871  002c c65259        	ld	a,21081
 872  002f a48f          	and	a,#143
 873  0031 1a04          	or	a,(OFST+1,sp)
 874  0033 c75259        	ld	21081,a
 875                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 877  0036 c6526f        	ld	a,21103
 878  0039 a4f3          	and	a,#243
 879  003b c7526f        	ld	21103,a
 880                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 880                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 882  003e 7b0e          	ld	a,(OFST+11,sp)
 883  0040 a408          	and	a,#8
 884  0042 6b03          	ld	(OFST+0,sp),a
 886  0044 7b0d          	ld	a,(OFST+10,sp)
 887  0046 a404          	and	a,#4
 888  0048 1a03          	or	a,(OFST+0,sp)
 889  004a ca526f        	or	a,21103
 890  004d c7526f        	ld	21103,a
 891                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 893  0050 7b09          	ld	a,(OFST+6,sp)
 894  0052 c75267        	ld	21095,a
 895                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 897  0055 7b0a          	ld	a,(OFST+7,sp)
 898  0057 c75268        	ld	21096,a
 899                     ; 260 }
 902  005a 5b05          	addw	sp,#5
 903  005c 81            	ret	
1007                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1007                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
1007                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1007                     ; 284                   uint16_t TIM1_Pulse,
1007                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1007                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1007                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1007                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1007                     ; 289 {
1008                     .text:	section	.text,new
1009  0000               _TIM1_OC3Init:
1011  0000 89            	pushw	x
1012  0001 5203          	subw	sp,#3
1013       00000003      OFST:	set	3
1016                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1018                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1020                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
1022                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1024                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1026                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1028                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1030                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
1030                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1032  0003 c6525d        	ld	a,21085
1033  0006 a4f0          	and	a,#240
1034  0008 c7525d        	ld	21085,a
1035                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
1035                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
1035                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
1035                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
1037  000b 7b0c          	ld	a,(OFST+9,sp)
1038  000d a408          	and	a,#8
1039  000f 6b03          	ld	(OFST+0,sp),a
1041  0011 7b0b          	ld	a,(OFST+8,sp)
1042  0013 a402          	and	a,#2
1043  0015 1a03          	or	a,(OFST+0,sp)
1044  0017 6b02          	ld	(OFST-1,sp),a
1046  0019 7b08          	ld	a,(OFST+5,sp)
1047  001b a404          	and	a,#4
1048  001d 6b01          	ld	(OFST-2,sp),a
1050  001f 9f            	ld	a,xl
1051  0020 a401          	and	a,#1
1052  0022 1a01          	or	a,(OFST-2,sp)
1053  0024 1a02          	or	a,(OFST-1,sp)
1054  0026 ca525d        	or	a,21085
1055  0029 c7525d        	ld	21085,a
1056                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1056                     ; 312                           (uint8_t)TIM1_OCMode);
1058  002c c6525a        	ld	a,21082
1059  002f a48f          	and	a,#143
1060  0031 1a04          	or	a,(OFST+1,sp)
1061  0033 c7525a        	ld	21082,a
1062                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1064  0036 c6526f        	ld	a,21103
1065  0039 a4cf          	and	a,#207
1066  003b c7526f        	ld	21103,a
1067                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1067                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1069  003e 7b0e          	ld	a,(OFST+11,sp)
1070  0040 a420          	and	a,#32
1071  0042 6b03          	ld	(OFST+0,sp),a
1073  0044 7b0d          	ld	a,(OFST+10,sp)
1074  0046 a410          	and	a,#16
1075  0048 1a03          	or	a,(OFST+0,sp)
1076  004a ca526f        	or	a,21103
1077  004d c7526f        	ld	21103,a
1078                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1080  0050 7b09          	ld	a,(OFST+6,sp)
1081  0052 c75269        	ld	21097,a
1082                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1084  0055 7b0a          	ld	a,(OFST+7,sp)
1085  0057 c7526a        	ld	21098,a
1086                     ; 323 }
1089  005a 5b05          	addw	sp,#5
1090  005c 81            	ret	
1164                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1164                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
1164                     ; 340                   uint16_t TIM1_Pulse,
1164                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1164                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1164                     ; 343 {
1165                     .text:	section	.text,new
1166  0000               _TIM1_OC4Init:
1168  0000 89            	pushw	x
1169  0001 88            	push	a
1170       00000001      OFST:	set	1
1173                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1175                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1177                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1179                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1181                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1183  0002 c6525d        	ld	a,21085
1184  0005 a4cf          	and	a,#207
1185  0007 c7525d        	ld	21085,a
1186                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1186                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1188  000a 7b08          	ld	a,(OFST+7,sp)
1189  000c a420          	and	a,#32
1190  000e 6b01          	ld	(OFST+0,sp),a
1192  0010 9f            	ld	a,xl
1193  0011 a410          	and	a,#16
1194  0013 1a01          	or	a,(OFST+0,sp)
1195  0015 ca525d        	or	a,21085
1196  0018 c7525d        	ld	21085,a
1197                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1197                     ; 358                           TIM1_OCMode);
1199  001b c6525b        	ld	a,21083
1200  001e a48f          	and	a,#143
1201  0020 1a02          	or	a,(OFST+1,sp)
1202  0022 c7525b        	ld	21083,a
1203                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1205  0025 7b09          	ld	a,(OFST+8,sp)
1206  0027 270a          	jreq	L354
1207                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1209  0029 c6526f        	ld	a,21103
1210  002c aadf          	or	a,#223
1211  002e c7526f        	ld	21103,a
1213  0031 2004          	jra	L554
1214  0033               L354:
1215                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1217  0033 721d526f      	bres	21103,#6
1218  0037               L554:
1219                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1221  0037 7b06          	ld	a,(OFST+5,sp)
1222  0039 c7526b        	ld	21099,a
1223                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1225  003c 7b07          	ld	a,(OFST+6,sp)
1226  003e c7526c        	ld	21100,a
1227                     ; 373 }
1230  0041 5b03          	addw	sp,#3
1231  0043 81            	ret	
1436                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1436                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1436                     ; 390                      uint8_t TIM1_DeadTime,
1436                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
1436                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1436                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1436                     ; 394 {
1437                     .text:	section	.text,new
1438  0000               _TIM1_BDTRConfig:
1440  0000 89            	pushw	x
1441  0001 88            	push	a
1442       00000001      OFST:	set	1
1445                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1447                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1449                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1451                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1453                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1455                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1457  0002 7b06          	ld	a,(OFST+5,sp)
1458  0004 c7526e        	ld	21102,a
1459                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1459                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1459                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
1461  0007 7b07          	ld	a,(OFST+6,sp)
1462  0009 1a08          	or	a,(OFST+7,sp)
1463  000b 1a09          	or	a,(OFST+8,sp)
1464  000d 6b01          	ld	(OFST+0,sp),a
1466  000f 9f            	ld	a,xl
1467  0010 1a02          	or	a,(OFST+1,sp)
1468  0012 1a01          	or	a,(OFST+0,sp)
1469  0014 c7526d        	ld	21101,a
1470                     ; 409 }
1473  0017 5b03          	addw	sp,#3
1474  0019 81            	ret	
1676                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1676                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1676                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1676                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1676                     ; 427                  uint8_t TIM1_ICFilter)
1676                     ; 428 {
1677                     .text:	section	.text,new
1678  0000               _TIM1_ICInit:
1680  0000 89            	pushw	x
1681       00000000      OFST:	set	0
1684                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1686                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1688                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1690                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1692                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1694                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
1696  0001 9e            	ld	a,xh
1697  0002 4d            	tnz	a
1698  0003 2614          	jrne	L507
1699                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
1699                     ; 440                (uint8_t)TIM1_ICSelection,
1699                     ; 441                (uint8_t)TIM1_ICFilter);
1701  0005 7b07          	ld	a,(OFST+7,sp)
1702  0007 88            	push	a
1703  0008 7b06          	ld	a,(OFST+6,sp)
1704  000a 97            	ld	xl,a
1705  000b 7b03          	ld	a,(OFST+3,sp)
1706  000d 95            	ld	xh,a
1707  000e cd0000        	call	L12_TI1_Config
1709  0011 84            	pop	a
1710                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1712  0012 7b06          	ld	a,(OFST+6,sp)
1713  0014 cd0000        	call	_TIM1_SetIC1Prescaler
1716  0017 2044          	jra	L707
1717  0019               L507:
1718                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
1720  0019 7b01          	ld	a,(OFST+1,sp)
1721  001b a101          	cp	a,#1
1722  001d 2614          	jrne	L117
1723                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
1723                     ; 449                (uint8_t)TIM1_ICSelection,
1723                     ; 450                (uint8_t)TIM1_ICFilter);
1725  001f 7b07          	ld	a,(OFST+7,sp)
1726  0021 88            	push	a
1727  0022 7b06          	ld	a,(OFST+6,sp)
1728  0024 97            	ld	xl,a
1729  0025 7b03          	ld	a,(OFST+3,sp)
1730  0027 95            	ld	xh,a
1731  0028 cd0000        	call	L32_TI2_Config
1733  002b 84            	pop	a
1734                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1736  002c 7b06          	ld	a,(OFST+6,sp)
1737  002e cd0000        	call	_TIM1_SetIC2Prescaler
1740  0031 202a          	jra	L707
1741  0033               L117:
1742                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
1744  0033 a102          	cp	a,#2
1745  0035 2614          	jrne	L517
1746                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
1746                     ; 458                (uint8_t)TIM1_ICSelection,
1746                     ; 459                (uint8_t)TIM1_ICFilter);
1748  0037 7b07          	ld	a,(OFST+7,sp)
1749  0039 88            	push	a
1750  003a 7b06          	ld	a,(OFST+6,sp)
1751  003c 97            	ld	xl,a
1752  003d 7b03          	ld	a,(OFST+3,sp)
1753  003f 95            	ld	xh,a
1754  0040 cd0000        	call	L52_TI3_Config
1756  0043 84            	pop	a
1757                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1759  0044 7b06          	ld	a,(OFST+6,sp)
1760  0046 cd0000        	call	_TIM1_SetIC3Prescaler
1763  0049 2012          	jra	L707
1764  004b               L517:
1765                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
1765                     ; 467                (uint8_t)TIM1_ICSelection,
1765                     ; 468                (uint8_t)TIM1_ICFilter);
1767  004b 7b07          	ld	a,(OFST+7,sp)
1768  004d 88            	push	a
1769  004e 7b06          	ld	a,(OFST+6,sp)
1770  0050 97            	ld	xl,a
1771  0051 7b03          	ld	a,(OFST+3,sp)
1772  0053 95            	ld	xh,a
1773  0054 cd0000        	call	L72_TI4_Config
1775  0057 84            	pop	a
1776                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1778  0058 7b06          	ld	a,(OFST+6,sp)
1779  005a cd0000        	call	_TIM1_SetIC4Prescaler
1781  005d               L707:
1782                     ; 472 }
1785  005d 85            	popw	x
1786  005e 81            	ret	
1882                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1882                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1882                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1882                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1882                     ; 492                      uint8_t TIM1_ICFilter)
1882                     ; 493 {
1883                     .text:	section	.text,new
1884  0000               _TIM1_PWMIConfig:
1886  0000 89            	pushw	x
1887  0001 89            	pushw	x
1888       00000002      OFST:	set	2
1891                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
1893                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
1895                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1897                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1899                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1901                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1903                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1905  0002 9f            	ld	a,xl
1906  0003 4a            	dec	a
1907  0004 2702          	jreq	L767
1908                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
1910  0006 a601          	ld	a,#1
1912  0008               L767:
1913                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
1915  0008 6b01          	ld	(OFST-1,sp),a
1917                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1919  000a 7b07          	ld	a,(OFST+5,sp)
1920  000c 4a            	dec	a
1921  000d 2604          	jrne	L377
1922                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
1924  000f a602          	ld	a,#2
1926  0011 2002          	jra	L577
1927  0013               L377:
1928                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
1930  0013 a601          	ld	a,#1
1931  0015               L577:
1932  0015 6b02          	ld	(OFST+0,sp),a
1934                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
1936  0017 7b03          	ld	a,(OFST+1,sp)
1937  0019 2626          	jrne	L777
1938                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1938                     ; 527                (uint8_t)TIM1_ICFilter);
1940  001b 7b09          	ld	a,(OFST+7,sp)
1941  001d 88            	push	a
1942  001e 7b08          	ld	a,(OFST+6,sp)
1943  0020 97            	ld	xl,a
1944  0021 7b05          	ld	a,(OFST+3,sp)
1945  0023 95            	ld	xh,a
1946  0024 cd0000        	call	L12_TI1_Config
1948  0027 84            	pop	a
1949                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1951  0028 7b08          	ld	a,(OFST+6,sp)
1952  002a cd0000        	call	_TIM1_SetIC1Prescaler
1954                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1956  002d 7b09          	ld	a,(OFST+7,sp)
1957  002f 88            	push	a
1958  0030 7b03          	ld	a,(OFST+1,sp)
1959  0032 97            	ld	xl,a
1960  0033 7b02          	ld	a,(OFST+0,sp)
1961  0035 95            	ld	xh,a
1962  0036 cd0000        	call	L32_TI2_Config
1964  0039 84            	pop	a
1965                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1967  003a 7b08          	ld	a,(OFST+6,sp)
1968  003c cd0000        	call	_TIM1_SetIC2Prescaler
1971  003f 2024          	jra	L1001
1972  0041               L777:
1973                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1973                     ; 542                (uint8_t)TIM1_ICFilter);
1975  0041 7b09          	ld	a,(OFST+7,sp)
1976  0043 88            	push	a
1977  0044 7b08          	ld	a,(OFST+6,sp)
1978  0046 97            	ld	xl,a
1979  0047 7b05          	ld	a,(OFST+3,sp)
1980  0049 95            	ld	xh,a
1981  004a cd0000        	call	L32_TI2_Config
1983  004d 84            	pop	a
1984                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1986  004e 7b08          	ld	a,(OFST+6,sp)
1987  0050 cd0000        	call	_TIM1_SetIC2Prescaler
1989                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1991  0053 7b09          	ld	a,(OFST+7,sp)
1992  0055 88            	push	a
1993  0056 7b03          	ld	a,(OFST+1,sp)
1994  0058 97            	ld	xl,a
1995  0059 7b02          	ld	a,(OFST+0,sp)
1996  005b 95            	ld	xh,a
1997  005c cd0000        	call	L12_TI1_Config
1999  005f 84            	pop	a
2000                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2002  0060 7b08          	ld	a,(OFST+6,sp)
2003  0062 cd0000        	call	_TIM1_SetIC1Prescaler
2005  0065               L1001:
2006                     ; 553 }
2009  0065 5b04          	addw	sp,#4
2010  0067 81            	ret	
2065                     ; 561 void TIM1_Cmd(FunctionalState NewState)
2065                     ; 562 {
2066                     .text:	section	.text,new
2067  0000               _TIM1_Cmd:
2071                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2073                     ; 567   if (NewState != DISABLE)
2075  0000 4d            	tnz	a
2076  0001 2705          	jreq	L1301
2077                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
2079  0003 72105250      	bset	21072,#0
2082  0007 81            	ret	
2083  0008               L1301:
2084                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2086  0008 72115250      	bres	21072,#0
2087                     ; 575 }
2090  000c 81            	ret	
2126                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2126                     ; 584 {
2127                     .text:	section	.text,new
2128  0000               _TIM1_CtrlPWMOutputs:
2132                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2134                     ; 590   if (NewState != DISABLE)
2136  0000 4d            	tnz	a
2137  0001 2705          	jreq	L3501
2138                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
2140  0003 721e526d      	bset	21101,#7
2143  0007 81            	ret	
2144  0008               L3501:
2145                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2147  0008 721f526d      	bres	21101,#7
2148                     ; 598 }
2151  000c 81            	ret	
2258                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2258                     ; 618 {
2259                     .text:	section	.text,new
2260  0000               _TIM1_ITConfig:
2262  0000 89            	pushw	x
2263       00000000      OFST:	set	0
2266                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
2268                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2270                     ; 623   if (NewState != DISABLE)
2272  0001 9f            	ld	a,xl
2273  0002 4d            	tnz	a
2274  0003 2706          	jreq	L5211
2275                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
2277  0005 9e            	ld	a,xh
2278  0006 ca5254        	or	a,21076
2280  0009 2006          	jra	L7211
2281  000b               L5211:
2282                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2284  000b 7b01          	ld	a,(OFST+1,sp)
2285  000d 43            	cpl	a
2286  000e c45254        	and	a,21076
2287  0011               L7211:
2288  0011 c75254        	ld	21076,a
2289                     ; 633 }
2292  0014 85            	popw	x
2293  0015 81            	ret	
2317                     ; 640 void TIM1_InternalClockConfig(void)
2317                     ; 641 {
2318                     .text:	section	.text,new
2319  0000               _TIM1_InternalClockConfig:
2323                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2325  0000 c65252        	ld	a,21074
2326  0003 a4f8          	and	a,#248
2327  0005 c75252        	ld	21074,a
2328                     ; 644 }
2331  0008 81            	ret	
2448                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2448                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2448                     ; 664                               uint8_t ExtTRGFilter)
2448                     ; 665 {
2449                     .text:	section	.text,new
2450  0000               _TIM1_ETRClockMode1Config:
2452  0000 89            	pushw	x
2453       00000000      OFST:	set	0
2456                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2458                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2460                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2462  0001 7b05          	ld	a,(OFST+5,sp)
2463  0003 88            	push	a
2464  0004 7b02          	ld	a,(OFST+2,sp)
2465  0006 95            	ld	xh,a
2466  0007 cd0000        	call	_TIM1_ETRConfig
2468  000a 84            	pop	a
2469                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
2469                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2471  000b c65252        	ld	a,21074
2472  000e aa77          	or	a,#119
2473  0010 c75252        	ld	21074,a
2474                     ; 676 }
2477  0013 85            	popw	x
2478  0014 81            	ret	
2536                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2536                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2536                     ; 696                               uint8_t ExtTRGFilter)
2536                     ; 697 {
2537                     .text:	section	.text,new
2538  0000               _TIM1_ETRClockMode2Config:
2540  0000 89            	pushw	x
2541       00000000      OFST:	set	0
2544                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2546                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2548                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2550  0001 7b05          	ld	a,(OFST+5,sp)
2551  0003 88            	push	a
2552  0004 7b02          	ld	a,(OFST+2,sp)
2553  0006 95            	ld	xh,a
2554  0007 cd0000        	call	_TIM1_ETRConfig
2556  000a 721c5253      	bset	21075,#6
2557                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
2559                     ; 707 }
2562  000e 5b03          	addw	sp,#3
2563  0010 81            	ret	
2619                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2619                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2619                     ; 727                     uint8_t ExtTRGFilter)
2619                     ; 728 {
2620                     .text:	section	.text,new
2621  0000               _TIM1_ETRConfig:
2623  0000 89            	pushw	x
2624       00000000      OFST:	set	0
2627                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
2629                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
2629                     ; 733                          (uint8_t)ExtTRGFilter );
2631  0001 9f            	ld	a,xl
2632  0002 1a01          	or	a,(OFST+1,sp)
2633  0004 1a05          	or	a,(OFST+5,sp)
2634  0006 ca5253        	or	a,21075
2635  0009 c75253        	ld	21075,a
2636                     ; 734 }
2639  000c 85            	popw	x
2640  000d 81            	ret	
2729                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2729                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2729                     ; 753                                  uint8_t ICFilter)
2729                     ; 754 {
2730                     .text:	section	.text,new
2731  0000               _TIM1_TIxExternalClockConfig:
2733  0000 89            	pushw	x
2734       00000000      OFST:	set	0
2737                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2739                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2741                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2743                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2745  0001 9e            	ld	a,xh
2746  0002 a160          	cp	a,#96
2747  0004 260d          	jrne	L7231
2748                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2750  0006 7b05          	ld	a,(OFST+5,sp)
2751  0008 88            	push	a
2752  0009 9f            	ld	a,xl
2753  000a ae0001        	ldw	x,#1
2754  000d 95            	ld	xh,a
2755  000e cd0000        	call	L32_TI2_Config
2758  0011 200c          	jra	L1331
2759  0013               L7231:
2760                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2762  0013 7b05          	ld	a,(OFST+5,sp)
2763  0015 88            	push	a
2764  0016 7b03          	ld	a,(OFST+3,sp)
2765  0018 ae0001        	ldw	x,#1
2766  001b 95            	ld	xh,a
2767  001c cd0000        	call	L12_TI1_Config
2769  001f               L1331:
2770  001f 84            	pop	a
2771                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
2773  0020 7b01          	ld	a,(OFST+1,sp)
2774  0022 cd0000        	call	_TIM1_SelectInputTrigger
2776                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
2778  0025 c65252        	ld	a,21074
2779  0028 aa07          	or	a,#7
2780  002a c75252        	ld	21074,a
2781                     ; 775 }
2784  002d 85            	popw	x
2785  002e 81            	ret	
2870                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2870                     ; 788 {
2871                     .text:	section	.text,new
2872  0000               _TIM1_SelectInputTrigger:
2874  0000 88            	push	a
2875       00000000      OFST:	set	0
2878                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2880                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
2882  0001 c65252        	ld	a,21074
2883  0004 a48f          	and	a,#143
2884  0006 1a01          	or	a,(OFST+1,sp)
2885  0008 c75252        	ld	21074,a
2886                     ; 794 }
2889  000b 84            	pop	a
2890  000c 81            	ret	
2926                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2926                     ; 804 {
2927                     .text:	section	.text,new
2928  0000               _TIM1_UpdateDisableConfig:
2932                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2934                     ; 809   if (NewState != DISABLE)
2936  0000 4d            	tnz	a
2937  0001 2705          	jreq	L7041
2938                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
2940  0003 72125250      	bset	21072,#1
2943  0007 81            	ret	
2944  0008               L7041:
2945                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
2947  0008 72135250      	bres	21072,#1
2948                     ; 817 }
2951  000c 81            	ret	
3009                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
3009                     ; 828 {
3010                     .text:	section	.text,new
3011  0000               _TIM1_UpdateRequestConfig:
3015                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
3017                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
3019  0000 4d            	tnz	a
3020  0001 2705          	jreq	L1441
3021                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
3023  0003 72145250      	bset	21072,#2
3026  0007 81            	ret	
3027  0008               L1441:
3028                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
3030  0008 72155250      	bres	21072,#2
3031                     ; 841 }
3034  000c 81            	ret	
3070                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
3070                     ; 850 {
3071                     .text:	section	.text,new
3072  0000               _TIM1_SelectHallSensor:
3076                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3078                     ; 855   if (NewState != DISABLE)
3080  0000 4d            	tnz	a
3081  0001 2705          	jreq	L3641
3082                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
3084  0003 721e5251      	bset	21073,#7
3087  0007 81            	ret	
3088  0008               L3641:
3089                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3091  0008 721f5251      	bres	21073,#7
3092                     ; 863 }
3095  000c 81            	ret	
3152                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3152                     ; 874 {
3153                     .text:	section	.text,new
3154  0000               _TIM1_SelectOnePulseMode:
3158                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3160                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3162  0000 4d            	tnz	a
3163  0001 2705          	jreq	L5151
3164                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
3166  0003 72165250      	bset	21072,#3
3169  0007 81            	ret	
3170  0008               L5151:
3171                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3173  0008 72175250      	bres	21072,#3
3174                     ; 888 }
3177  000c 81            	ret	
3275                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3275                     ; 904 {
3276                     .text:	section	.text,new
3277  0000               _TIM1_SelectOutputTrigger:
3279  0000 88            	push	a
3280       00000000      OFST:	set	0
3283                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3285                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
3285                     ; 910                         (uint8_t) TIM1_TRGOSource);
3287  0001 c65251        	ld	a,21073
3288  0004 a48f          	and	a,#143
3289  0006 1a01          	or	a,(OFST+1,sp)
3290  0008 c75251        	ld	21073,a
3291                     ; 911 }
3294  000b 84            	pop	a
3295  000c 81            	ret	
3369                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3369                     ; 924 {
3370                     .text:	section	.text,new
3371  0000               _TIM1_SelectSlaveMode:
3373  0000 88            	push	a
3374       00000000      OFST:	set	0
3377                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3379                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
3379                     ; 930                          (uint8_t)TIM1_SlaveMode);
3381  0001 c65252        	ld	a,21074
3382  0004 a4f8          	and	a,#248
3383  0006 1a01          	or	a,(OFST+1,sp)
3384  0008 c75252        	ld	21074,a
3385                     ; 931 }
3388  000b 84            	pop	a
3389  000c 81            	ret	
3425                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3425                     ; 940 {
3426                     .text:	section	.text,new
3427  0000               _TIM1_SelectMasterSlaveMode:
3431                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3433                     ; 945   if (NewState != DISABLE)
3435  0000 4d            	tnz	a
3436  0001 2705          	jreq	L1361
3437                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
3439  0003 721e5252      	bset	21074,#7
3442  0007 81            	ret	
3443  0008               L1361:
3444                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
3446  0008 721f5252      	bres	21074,#7
3447                     ; 953 }
3450  000c 81            	ret	
3536                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3536                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3536                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3536                     ; 978 {
3537                     .text:	section	.text,new
3538  0000               _TIM1_EncoderInterfaceConfig:
3540  0000 89            	pushw	x
3541       00000000      OFST:	set	0
3544                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3546                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3548                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3550                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3552  0001 9f            	ld	a,xl
3553  0002 4d            	tnz	a
3554  0003 2706          	jreq	L5761
3555                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3557  0005 7212525c      	bset	21084,#1
3559  0009 2004          	jra	L7761
3560  000b               L5761:
3561                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3563  000b 7213525c      	bres	21084,#1
3564  000f               L7761:
3565                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3567  000f 7b05          	ld	a,(OFST+5,sp)
3568  0011 2706          	jreq	L1071
3569                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3571  0013 721a525c      	bset	21084,#5
3573  0017 2004          	jra	L3071
3574  0019               L1071:
3575                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3577  0019 721b525c      	bres	21084,#5
3578  001d               L3071:
3579                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
3579                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
3581  001d c65252        	ld	a,21074
3582  0020 a4f0          	and	a,#240
3583  0022 1a01          	or	a,(OFST+1,sp)
3584  0024 c75252        	ld	21074,a
3585                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
3585                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
3587  0027 c65258        	ld	a,21080
3588  002a a4fc          	and	a,#252
3589  002c aa01          	or	a,#1
3590  002e c75258        	ld	21080,a
3591                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
3591                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
3593  0031 c65259        	ld	a,21081
3594  0034 a4fc          	and	a,#252
3595  0036 aa01          	or	a,#1
3596  0038 c75259        	ld	21081,a
3597                     ; 1011 }
3600  003b 85            	popw	x
3601  003c 81            	ret	
3668                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
3668                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3668                     ; 1025 {
3669                     .text:	section	.text,new
3670  0000               _TIM1_PrescalerConfig:
3672       fffffffe      OFST: set -2
3675                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3677                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
3679  0000 9e            	ld	a,xh
3680  0001 c75260        	ld	21088,a
3681                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
3683  0004 9f            	ld	a,xl
3684  0005 c75261        	ld	21089,a
3685                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
3687  0008 7b03          	ld	a,(OFST+5,sp)
3688  000a c75257        	ld	21079,a
3689                     ; 1035 }
3692  000d 81            	ret	
3728                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3728                     ; 1049 {
3729                     .text:	section	.text,new
3730  0000               _TIM1_CounterModeConfig:
3732  0000 88            	push	a
3733       00000000      OFST:	set	0
3736                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3738                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
3738                     ; 1056                         | (uint8_t)TIM1_CounterMode);
3740  0001 c65250        	ld	a,21072
3741  0004 a48f          	and	a,#143
3742  0006 1a01          	or	a,(OFST+1,sp)
3743  0008 c75250        	ld	21072,a
3744                     ; 1057 }
3747  000b 84            	pop	a
3748  000c 81            	ret	
3806                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3806                     ; 1068 {
3807                     .text:	section	.text,new
3808  0000               _TIM1_ForcedOC1Config:
3810  0000 88            	push	a
3811       00000000      OFST:	set	0
3814                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3816                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
3816                     ; 1074                            (uint8_t)TIM1_ForcedAction);
3818  0001 c65258        	ld	a,21080
3819  0004 a48f          	and	a,#143
3820  0006 1a01          	or	a,(OFST+1,sp)
3821  0008 c75258        	ld	21080,a
3822                     ; 1075 }
3825  000b 84            	pop	a
3826  000c 81            	ret	
3862                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3862                     ; 1086 {
3863                     .text:	section	.text,new
3864  0000               _TIM1_ForcedOC2Config:
3866  0000 88            	push	a
3867       00000000      OFST:	set	0
3870                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3872                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
3872                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
3874  0001 c65259        	ld	a,21081
3875  0004 a48f          	and	a,#143
3876  0006 1a01          	or	a,(OFST+1,sp)
3877  0008 c75259        	ld	21081,a
3878                     ; 1093 }
3881  000b 84            	pop	a
3882  000c 81            	ret	
3918                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3918                     ; 1105 {
3919                     .text:	section	.text,new
3920  0000               _TIM1_ForcedOC3Config:
3922  0000 88            	push	a
3923       00000000      OFST:	set	0
3926                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3928                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
3928                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
3930  0001 c6525a        	ld	a,21082
3931  0004 a48f          	and	a,#143
3932  0006 1a01          	or	a,(OFST+1,sp)
3933  0008 c7525a        	ld	21082,a
3934                     ; 1112 }
3937  000b 84            	pop	a
3938  000c 81            	ret	
3974                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3974                     ; 1124 {
3975                     .text:	section	.text,new
3976  0000               _TIM1_ForcedOC4Config:
3978  0000 88            	push	a
3979       00000000      OFST:	set	0
3982                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3984                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
3984                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
3986  0001 c6525b        	ld	a,21083
3987  0004 a48f          	and	a,#143
3988  0006 1a01          	or	a,(OFST+1,sp)
3989  0008 c7525b        	ld	21083,a
3990                     ; 1131 }
3993  000b 84            	pop	a
3994  000c 81            	ret	
4030                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
4030                     ; 1140 {
4031                     .text:	section	.text,new
4032  0000               _TIM1_ARRPreloadConfig:
4036                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4038                     ; 1145   if (NewState != DISABLE)
4040  0000 4d            	tnz	a
4041  0001 2705          	jreq	L3702
4042                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
4044  0003 721e5250      	bset	21072,#7
4047  0007 81            	ret	
4048  0008               L3702:
4049                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
4051  0008 721f5250      	bres	21072,#7
4052                     ; 1153 }
4055  000c 81            	ret	
4090                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
4090                     ; 1162 {
4091                     .text:	section	.text,new
4092  0000               _TIM1_SelectCOM:
4096                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4098                     ; 1167   if (NewState != DISABLE)
4100  0000 4d            	tnz	a
4101  0001 2705          	jreq	L5112
4102                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
4104  0003 72145251      	bset	21073,#2
4107  0007 81            	ret	
4108  0008               L5112:
4109                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
4111  0008 72155251      	bres	21073,#2
4112                     ; 1175 }
4115  000c 81            	ret	
4151                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
4151                     ; 1184 {
4152                     .text:	section	.text,new
4153  0000               _TIM1_CCPreloadControl:
4157                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4159                     ; 1189   if (NewState != DISABLE)
4161  0000 4d            	tnz	a
4162  0001 2705          	jreq	L7312
4163                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
4165  0003 72105251      	bset	21073,#0
4168  0007 81            	ret	
4169  0008               L7312:
4170                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4172  0008 72115251      	bres	21073,#0
4173                     ; 1197 }
4176  000c 81            	ret	
4212                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4212                     ; 1206 {
4213                     .text:	section	.text,new
4214  0000               _TIM1_OC1PreloadConfig:
4218                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4220                     ; 1211   if (NewState != DISABLE)
4222  0000 4d            	tnz	a
4223  0001 2705          	jreq	L1612
4224                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4226  0003 72165258      	bset	21080,#3
4229  0007 81            	ret	
4230  0008               L1612:
4231                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4233  0008 72175258      	bres	21080,#3
4234                     ; 1219 }
4237  000c 81            	ret	
4273                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4273                     ; 1228 {
4274                     .text:	section	.text,new
4275  0000               _TIM1_OC2PreloadConfig:
4279                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4281                     ; 1233   if (NewState != DISABLE)
4283  0000 4d            	tnz	a
4284  0001 2705          	jreq	L3022
4285                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4287  0003 72165259      	bset	21081,#3
4290  0007 81            	ret	
4291  0008               L3022:
4292                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4294  0008 72175259      	bres	21081,#3
4295                     ; 1241 }
4298  000c 81            	ret	
4334                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4334                     ; 1250 {
4335                     .text:	section	.text,new
4336  0000               _TIM1_OC3PreloadConfig:
4340                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4342                     ; 1255   if (NewState != DISABLE)
4344  0000 4d            	tnz	a
4345  0001 2705          	jreq	L5222
4346                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4348  0003 7216525a      	bset	21082,#3
4351  0007 81            	ret	
4352  0008               L5222:
4353                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4355  0008 7217525a      	bres	21082,#3
4356                     ; 1263 }
4359  000c 81            	ret	
4395                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4395                     ; 1272 {
4396                     .text:	section	.text,new
4397  0000               _TIM1_OC4PreloadConfig:
4401                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4403                     ; 1277   if (NewState != DISABLE)
4405  0000 4d            	tnz	a
4406  0001 2705          	jreq	L7422
4407                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4409  0003 7216525b      	bset	21083,#3
4412  0007 81            	ret	
4413  0008               L7422:
4414                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4416  0008 7217525b      	bres	21083,#3
4417                     ; 1285 }
4420  000c 81            	ret	
4455                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
4455                     ; 1294 {
4456                     .text:	section	.text,new
4457  0000               _TIM1_OC1FastConfig:
4461                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4463                     ; 1299   if (NewState != DISABLE)
4465  0000 4d            	tnz	a
4466  0001 2705          	jreq	L1722
4467                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4469  0003 72145258      	bset	21080,#2
4472  0007 81            	ret	
4473  0008               L1722:
4474                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4476  0008 72155258      	bres	21080,#2
4477                     ; 1307 }
4480  000c 81            	ret	
4515                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
4515                     ; 1316 {
4516                     .text:	section	.text,new
4517  0000               _TIM1_OC2FastConfig:
4521                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4523                     ; 1321   if (NewState != DISABLE)
4525  0000 4d            	tnz	a
4526  0001 2705          	jreq	L3132
4527                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4529  0003 72145259      	bset	21081,#2
4532  0007 81            	ret	
4533  0008               L3132:
4534                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4536  0008 72155259      	bres	21081,#2
4537                     ; 1329 }
4540  000c 81            	ret	
4575                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
4575                     ; 1338 {
4576                     .text:	section	.text,new
4577  0000               _TIM1_OC3FastConfig:
4581                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4583                     ; 1343   if (NewState != DISABLE)
4585  0000 4d            	tnz	a
4586  0001 2705          	jreq	L5332
4587                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4589  0003 7214525a      	bset	21082,#2
4592  0007 81            	ret	
4593  0008               L5332:
4594                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4596  0008 7215525a      	bres	21082,#2
4597                     ; 1351 }
4600  000c 81            	ret	
4635                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
4635                     ; 1360 {
4636                     .text:	section	.text,new
4637  0000               _TIM1_OC4FastConfig:
4641                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4643                     ; 1365   if (NewState != DISABLE)
4645  0000 4d            	tnz	a
4646  0001 2705          	jreq	L7532
4647                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4649  0003 7214525b      	bset	21083,#2
4652  0007 81            	ret	
4653  0008               L7532:
4654                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4656  0008 7215525b      	bres	21083,#2
4657                     ; 1373 }
4660  000c 81            	ret	
4765                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4765                     ; 1390 {
4766                     .text:	section	.text,new
4767  0000               _TIM1_GenerateEvent:
4771                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4773                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
4775  0000 c75257        	ld	21079,a
4776                     ; 1396 }
4779  0003 81            	ret	
4815                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4815                     ; 1407 {
4816                     .text:	section	.text,new
4817  0000               _TIM1_OC1PolarityConfig:
4821                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4823                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4825  0000 4d            	tnz	a
4826  0001 2705          	jreq	L3442
4827                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4829  0003 7212525c      	bset	21084,#1
4832  0007 81            	ret	
4833  0008               L3442:
4834                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4836  0008 7213525c      	bres	21084,#1
4837                     ; 1420 }
4840  000c 81            	ret	
4876                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4876                     ; 1431 {
4877                     .text:	section	.text,new
4878  0000               _TIM1_OC1NPolarityConfig:
4882                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4884                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4886  0000 4d            	tnz	a
4887  0001 2705          	jreq	L5642
4888                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4890  0003 7216525c      	bset	21084,#3
4893  0007 81            	ret	
4894  0008               L5642:
4895                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
4897  0008 7217525c      	bres	21084,#3
4898                     ; 1444 }
4901  000c 81            	ret	
4937                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4937                     ; 1455 {
4938                     .text:	section	.text,new
4939  0000               _TIM1_OC2PolarityConfig:
4943                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4945                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4947  0000 4d            	tnz	a
4948  0001 2705          	jreq	L7052
4949                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4951  0003 721a525c      	bset	21084,#5
4954  0007 81            	ret	
4955  0008               L7052:
4956                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4958  0008 721b525c      	bres	21084,#5
4959                     ; 1468 }
4962  000c 81            	ret	
4998                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4998                     ; 1479 {
4999                     .text:	section	.text,new
5000  0000               _TIM1_OC2NPolarityConfig:
5004                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5006                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5008  0000 4d            	tnz	a
5009  0001 2705          	jreq	L1352
5010                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
5012  0003 721e525c      	bset	21084,#7
5015  0007 81            	ret	
5016  0008               L1352:
5017                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
5019  0008 721f525c      	bres	21084,#7
5020                     ; 1492 }
5023  000c 81            	ret	
5059                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5059                     ; 1503 {
5060                     .text:	section	.text,new
5061  0000               _TIM1_OC3PolarityConfig:
5065                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5067                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5069  0000 4d            	tnz	a
5070  0001 2705          	jreq	L3552
5071                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
5073  0003 7212525d      	bset	21085,#1
5076  0007 81            	ret	
5077  0008               L3552:
5078                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
5080  0008 7213525d      	bres	21085,#1
5081                     ; 1516 }
5084  000c 81            	ret	
5120                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5120                     ; 1528 {
5121                     .text:	section	.text,new
5122  0000               _TIM1_OC3NPolarityConfig:
5126                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5128                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5130  0000 4d            	tnz	a
5131  0001 2705          	jreq	L5752
5132                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5134  0003 7216525d      	bset	21085,#3
5137  0007 81            	ret	
5138  0008               L5752:
5139                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5141  0008 7217525d      	bres	21085,#3
5142                     ; 1541 }
5145  000c 81            	ret	
5181                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5181                     ; 1552 {
5182                     .text:	section	.text,new
5183  0000               _TIM1_OC4PolarityConfig:
5187                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5189                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5191  0000 4d            	tnz	a
5192  0001 2705          	jreq	L7162
5193                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
5195  0003 721a525d      	bset	21085,#5
5198  0007 81            	ret	
5199  0008               L7162:
5200                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
5202  0008 721b525d      	bres	21085,#5
5203                     ; 1565 }
5206  000c 81            	ret	
5251                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5251                     ; 1580 {
5252                     .text:	section	.text,new
5253  0000               _TIM1_CCxCmd:
5255  0000 89            	pushw	x
5256       00000000      OFST:	set	0
5259                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5261                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5263                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
5265  0001 9e            	ld	a,xh
5266  0002 4d            	tnz	a
5267  0003 2610          	jrne	L5462
5268                     ; 1588     if (NewState != DISABLE)
5270  0005 9f            	ld	a,xl
5271  0006 4d            	tnz	a
5272  0007 2706          	jreq	L7462
5273                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
5275  0009 7210525c      	bset	21084,#0
5277  000d 203e          	jra	L3562
5278  000f               L7462:
5279                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5281  000f 7211525c      	bres	21084,#0
5282  0013 2038          	jra	L3562
5283  0015               L5462:
5284                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
5286  0015 7b01          	ld	a,(OFST+1,sp)
5287  0017 a101          	cp	a,#1
5288  0019 2610          	jrne	L5562
5289                     ; 1601     if (NewState != DISABLE)
5291  001b 7b02          	ld	a,(OFST+2,sp)
5292  001d 2706          	jreq	L7562
5293                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
5295  001f 7218525c      	bset	21084,#4
5297  0023 2028          	jra	L3562
5298  0025               L7562:
5299                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5301  0025 7219525c      	bres	21084,#4
5302  0029 2022          	jra	L3562
5303  002b               L5562:
5304                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
5306  002b a102          	cp	a,#2
5307  002d 2610          	jrne	L5662
5308                     ; 1613     if (NewState != DISABLE)
5310  002f 7b02          	ld	a,(OFST+2,sp)
5311  0031 2706          	jreq	L7662
5312                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
5314  0033 7210525d      	bset	21085,#0
5316  0037 2014          	jra	L3562
5317  0039               L7662:
5318                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5320  0039 7211525d      	bres	21085,#0
5321  003d 200e          	jra	L3562
5322  003f               L5662:
5323                     ; 1625     if (NewState != DISABLE)
5325  003f 7b02          	ld	a,(OFST+2,sp)
5326  0041 2706          	jreq	L5762
5327                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
5329  0043 7218525d      	bset	21085,#4
5331  0047 2004          	jra	L3562
5332  0049               L5762:
5333                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5335  0049 7219525d      	bres	21085,#4
5336  004d               L3562:
5337                     ; 1634 }
5340  004d 85            	popw	x
5341  004e 81            	ret	
5386                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5386                     ; 1648 {
5387                     .text:	section	.text,new
5388  0000               _TIM1_CCxNCmd:
5390  0000 89            	pushw	x
5391       00000000      OFST:	set	0
5394                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5396                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5398                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
5400  0001 9e            	ld	a,xh
5401  0002 4d            	tnz	a
5402  0003 2610          	jrne	L3272
5403                     ; 1656     if (NewState != DISABLE)
5405  0005 9f            	ld	a,xl
5406  0006 4d            	tnz	a
5407  0007 2706          	jreq	L5272
5408                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5410  0009 7214525c      	bset	21084,#2
5412  000d 2029          	jra	L1372
5413  000f               L5272:
5414                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
5416  000f 7215525c      	bres	21084,#2
5417  0013 2023          	jra	L1372
5418  0015               L3272:
5419                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
5421  0015 7b01          	ld	a,(OFST+1,sp)
5422  0017 4a            	dec	a
5423  0018 2610          	jrne	L3372
5424                     ; 1668     if (NewState != DISABLE)
5426  001a 7b02          	ld	a,(OFST+2,sp)
5427  001c 2706          	jreq	L5372
5428                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5430  001e 721c525c      	bset	21084,#6
5432  0022 2014          	jra	L1372
5433  0024               L5372:
5434                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
5436  0024 721d525c      	bres	21084,#6
5437  0028 200e          	jra	L1372
5438  002a               L3372:
5439                     ; 1680     if (NewState != DISABLE)
5441  002a 7b02          	ld	a,(OFST+2,sp)
5442  002c 2706          	jreq	L3472
5443                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5445  002e 7214525d      	bset	21085,#2
5447  0032 2004          	jra	L1372
5448  0034               L3472:
5449                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
5451  0034 7215525d      	bres	21085,#2
5452  0038               L1372:
5453                     ; 1689 }
5456  0038 85            	popw	x
5457  0039 81            	ret	
5502                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5502                     ; 1713 {
5503                     .text:	section	.text,new
5504  0000               _TIM1_SelectOCxM:
5506  0000 89            	pushw	x
5507       00000000      OFST:	set	0
5510                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5512                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5514                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
5516  0001 9e            	ld	a,xh
5517  0002 4d            	tnz	a
5518  0003 2610          	jrne	L1772
5519                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5521  0005 7211525c      	bres	21084,#0
5522                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
5522                     ; 1725                             | (uint8_t)TIM1_OCMode);
5524  0009 c65258        	ld	a,21080
5525  000c a48f          	and	a,#143
5526  000e 1a02          	or	a,(OFST+2,sp)
5527  0010 c75258        	ld	21080,a
5529  0013 2038          	jra	L3772
5530  0015               L1772:
5531                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
5533  0015 7b01          	ld	a,(OFST+1,sp)
5534  0017 a101          	cp	a,#1
5535  0019 2610          	jrne	L5772
5536                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5538  001b 7219525c      	bres	21084,#4
5539                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5539                     ; 1734                             | (uint8_t)TIM1_OCMode);
5541  001f c65259        	ld	a,21081
5542  0022 a48f          	and	a,#143
5543  0024 1a02          	or	a,(OFST+2,sp)
5544  0026 c75259        	ld	21081,a
5546  0029 2022          	jra	L3772
5547  002b               L5772:
5548                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
5550  002b a102          	cp	a,#2
5551  002d 2610          	jrne	L1003
5552                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5554  002f 7211525d      	bres	21085,#0
5555                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
5555                     ; 1743                             | (uint8_t)TIM1_OCMode);
5557  0033 c6525a        	ld	a,21082
5558  0036 a48f          	and	a,#143
5559  0038 1a02          	or	a,(OFST+2,sp)
5560  003a c7525a        	ld	21082,a
5562  003d 200e          	jra	L3772
5563  003f               L1003:
5564                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5566  003f 7219525d      	bres	21085,#4
5567                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5567                     ; 1752                             | (uint8_t)TIM1_OCMode);
5569  0043 c6525b        	ld	a,21083
5570  0046 a48f          	and	a,#143
5571  0048 1a02          	or	a,(OFST+2,sp)
5572  004a c7525b        	ld	21083,a
5573  004d               L3772:
5574                     ; 1754 }
5577  004d 85            	popw	x
5578  004e 81            	ret	
5612                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
5612                     ; 1763 {
5613                     .text:	section	.text,new
5614  0000               _TIM1_SetCounter:
5618                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
5620  0000 9e            	ld	a,xh
5621  0001 c7525e        	ld	21086,a
5622                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
5624  0004 9f            	ld	a,xl
5625  0005 c7525f        	ld	21087,a
5626                     ; 1767 }
5629  0008 81            	ret	
5663                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
5663                     ; 1776 {
5664                     .text:	section	.text,new
5665  0000               _TIM1_SetAutoreload:
5669                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
5671  0000 9e            	ld	a,xh
5672  0001 c75262        	ld	21090,a
5673                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
5675  0004 9f            	ld	a,xl
5676  0005 c75263        	ld	21091,a
5677                     ; 1780  }
5680  0008 81            	ret	
5714                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
5714                     ; 1789 {
5715                     .text:	section	.text,new
5716  0000               _TIM1_SetCompare1:
5720                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
5722  0000 9e            	ld	a,xh
5723  0001 c75265        	ld	21093,a
5724                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
5726  0004 9f            	ld	a,xl
5727  0005 c75266        	ld	21094,a
5728                     ; 1793 }
5731  0008 81            	ret	
5765                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
5765                     ; 1802 {
5766                     .text:	section	.text,new
5767  0000               _TIM1_SetCompare2:
5771                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
5773  0000 9e            	ld	a,xh
5774  0001 c75267        	ld	21095,a
5775                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
5777  0004 9f            	ld	a,xl
5778  0005 c75268        	ld	21096,a
5779                     ; 1806 }
5782  0008 81            	ret	
5816                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
5816                     ; 1815 {
5817                     .text:	section	.text,new
5818  0000               _TIM1_SetCompare3:
5822                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
5824  0000 9e            	ld	a,xh
5825  0001 c75269        	ld	21097,a
5826                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
5828  0004 9f            	ld	a,xl
5829  0005 c7526a        	ld	21098,a
5830                     ; 1819 }
5833  0008 81            	ret	
5867                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
5867                     ; 1828 {
5868                     .text:	section	.text,new
5869  0000               _TIM1_SetCompare4:
5873                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
5875  0000 9e            	ld	a,xh
5876  0001 c7526b        	ld	21099,a
5877                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
5879  0004 9f            	ld	a,xl
5880  0005 c7526c        	ld	21100,a
5881                     ; 1832 }
5884  0008 81            	ret	
5920                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5920                     ; 1845 {
5921                     .text:	section	.text,new
5922  0000               _TIM1_SetIC1Prescaler:
5924  0000 88            	push	a
5925       00000000      OFST:	set	0
5928                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5930                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
5930                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
5932  0001 c65258        	ld	a,21080
5933  0004 a4f3          	and	a,#243
5934  0006 1a01          	or	a,(OFST+1,sp)
5935  0008 c75258        	ld	21080,a
5936                     ; 1852 }
5939  000b 84            	pop	a
5940  000c 81            	ret	
5976                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5976                     ; 1865 {
5977                     .text:	section	.text,new
5978  0000               _TIM1_SetIC2Prescaler:
5980  0000 88            	push	a
5981       00000000      OFST:	set	0
5984                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
5986                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
5986                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
5988  0001 c65259        	ld	a,21081
5989  0004 a4f3          	and	a,#243
5990  0006 1a01          	or	a,(OFST+1,sp)
5991  0008 c75259        	ld	21081,a
5992                     ; 1873 }
5995  000b 84            	pop	a
5996  000c 81            	ret	
6032                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
6032                     ; 1886 {
6033                     .text:	section	.text,new
6034  0000               _TIM1_SetIC3Prescaler:
6036  0000 88            	push	a
6037       00000000      OFST:	set	0
6040                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
6042                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
6042                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
6044  0001 c6525a        	ld	a,21082
6045  0004 a4f3          	and	a,#243
6046  0006 1a01          	or	a,(OFST+1,sp)
6047  0008 c7525a        	ld	21082,a
6048                     ; 1894 }
6051  000b 84            	pop	a
6052  000c 81            	ret	
6088                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6088                     ; 1907 {
6089                     .text:	section	.text,new
6090  0000               _TIM1_SetIC4Prescaler:
6092  0000 88            	push	a
6093       00000000      OFST:	set	0
6096                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
6098                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
6098                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
6100  0001 c6525b        	ld	a,21083
6101  0004 a4f3          	and	a,#243
6102  0006 1a01          	or	a,(OFST+1,sp)
6103  0008 c7525b        	ld	21083,a
6104                     ; 1915 }
6107  000b 84            	pop	a
6108  000c 81            	ret	
6160                     ; 1922 uint16_t TIM1_GetCapture1(void)
6160                     ; 1923 {
6161                     .text:	section	.text,new
6162  0000               _TIM1_GetCapture1:
6164  0000 5204          	subw	sp,#4
6165       00000004      OFST:	set	4
6168                     ; 1926   uint16_t tmpccr1 = 0;
6170                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
6174                     ; 1929   tmpccr1h = TIM1->CCR1H;
6176  0002 c65265        	ld	a,21093
6177  0005 6b02          	ld	(OFST-2,sp),a
6179                     ; 1930   tmpccr1l = TIM1->CCR1L;
6181  0007 c65266        	ld	a,21094
6182  000a 6b01          	ld	(OFST-3,sp),a
6184                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
6186  000c 5f            	clrw	x
6187  000d 97            	ld	xl,a
6188  000e 1f03          	ldw	(OFST-1,sp),x
6190                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6192  0010 5f            	clrw	x
6193  0011 7b02          	ld	a,(OFST-2,sp)
6194  0013 97            	ld	xl,a
6195  0014 7b04          	ld	a,(OFST+0,sp)
6196  0016 01            	rrwa	x,a
6197  0017 1a03          	or	a,(OFST-1,sp)
6198  0019 01            	rrwa	x,a
6200                     ; 1935   return (uint16_t)tmpccr1;
6204  001a 5b04          	addw	sp,#4
6205  001c 81            	ret	
6257                     ; 1943 uint16_t TIM1_GetCapture2(void)
6257                     ; 1944 {
6258                     .text:	section	.text,new
6259  0000               _TIM1_GetCapture2:
6261  0000 5204          	subw	sp,#4
6262       00000004      OFST:	set	4
6265                     ; 1947   uint16_t tmpccr2 = 0;
6267                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
6271                     ; 1950   tmpccr2h = TIM1->CCR2H;
6273  0002 c65267        	ld	a,21095
6274  0005 6b02          	ld	(OFST-2,sp),a
6276                     ; 1951   tmpccr2l = TIM1->CCR2L;
6278  0007 c65268        	ld	a,21096
6279  000a 6b01          	ld	(OFST-3,sp),a
6281                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
6283  000c 5f            	clrw	x
6284  000d 97            	ld	xl,a
6285  000e 1f03          	ldw	(OFST-1,sp),x
6287                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6289  0010 5f            	clrw	x
6290  0011 7b02          	ld	a,(OFST-2,sp)
6291  0013 97            	ld	xl,a
6292  0014 7b04          	ld	a,(OFST+0,sp)
6293  0016 01            	rrwa	x,a
6294  0017 1a03          	or	a,(OFST-1,sp)
6295  0019 01            	rrwa	x,a
6297                     ; 1956   return (uint16_t)tmpccr2;
6301  001a 5b04          	addw	sp,#4
6302  001c 81            	ret	
6354                     ; 1964 uint16_t TIM1_GetCapture3(void)
6354                     ; 1965 {
6355                     .text:	section	.text,new
6356  0000               _TIM1_GetCapture3:
6358  0000 5204          	subw	sp,#4
6359       00000004      OFST:	set	4
6362                     ; 1967   uint16_t tmpccr3 = 0;
6364                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
6368                     ; 1970   tmpccr3h = TIM1->CCR3H;
6370  0002 c65269        	ld	a,21097
6371  0005 6b02          	ld	(OFST-2,sp),a
6373                     ; 1971   tmpccr3l = TIM1->CCR3L;
6375  0007 c6526a        	ld	a,21098
6376  000a 6b01          	ld	(OFST-3,sp),a
6378                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
6380  000c 5f            	clrw	x
6381  000d 97            	ld	xl,a
6382  000e 1f03          	ldw	(OFST-1,sp),x
6384                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
6386  0010 5f            	clrw	x
6387  0011 7b02          	ld	a,(OFST-2,sp)
6388  0013 97            	ld	xl,a
6389  0014 7b04          	ld	a,(OFST+0,sp)
6390  0016 01            	rrwa	x,a
6391  0017 1a03          	or	a,(OFST-1,sp)
6392  0019 01            	rrwa	x,a
6394                     ; 1976   return (uint16_t)tmpccr3;
6398  001a 5b04          	addw	sp,#4
6399  001c 81            	ret	
6451                     ; 1984 uint16_t TIM1_GetCapture4(void)
6451                     ; 1985 {
6452                     .text:	section	.text,new
6453  0000               _TIM1_GetCapture4:
6455  0000 5204          	subw	sp,#4
6456       00000004      OFST:	set	4
6459                     ; 1987   uint16_t tmpccr4 = 0;
6461                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
6465                     ; 1990   tmpccr4h = TIM1->CCR4H;
6467  0002 c6526b        	ld	a,21099
6468  0005 6b02          	ld	(OFST-2,sp),a
6470                     ; 1991   tmpccr4l = TIM1->CCR4L;
6472  0007 c6526c        	ld	a,21100
6473  000a 6b01          	ld	(OFST-3,sp),a
6475                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
6477  000c 5f            	clrw	x
6478  000d 97            	ld	xl,a
6479  000e 1f03          	ldw	(OFST-1,sp),x
6481                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
6483  0010 5f            	clrw	x
6484  0011 7b02          	ld	a,(OFST-2,sp)
6485  0013 97            	ld	xl,a
6486  0014 7b04          	ld	a,(OFST+0,sp)
6487  0016 01            	rrwa	x,a
6488  0017 1a03          	or	a,(OFST-1,sp)
6489  0019 01            	rrwa	x,a
6491                     ; 1996   return (uint16_t)tmpccr4;
6495  001a 5b04          	addw	sp,#4
6496  001c 81            	ret	
6530                     ; 2004 uint16_t TIM1_GetCounter(void)
6530                     ; 2005 {
6531                     .text:	section	.text,new
6532  0000               _TIM1_GetCounter:
6534  0000 89            	pushw	x
6535       00000002      OFST:	set	2
6538                     ; 2006   uint16_t tmpcntr = 0;
6540                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
6542  0001 c6525e        	ld	a,21086
6543  0004 97            	ld	xl,a
6544  0005 4f            	clr	a
6545  0006 02            	rlwa	x,a
6546  0007 1f01          	ldw	(OFST-1,sp),x
6548                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
6550  0009 c6525f        	ld	a,21087
6551  000c 5f            	clrw	x
6552  000d 97            	ld	xl,a
6553  000e 01            	rrwa	x,a
6554  000f 1a02          	or	a,(OFST+0,sp)
6555  0011 01            	rrwa	x,a
6556  0012 1a01          	or	a,(OFST-1,sp)
6557  0014 01            	rrwa	x,a
6560  0015 5b02          	addw	sp,#2
6561  0017 81            	ret	
6595                     ; 2019 uint16_t TIM1_GetPrescaler(void)
6595                     ; 2020 {
6596                     .text:	section	.text,new
6597  0000               _TIM1_GetPrescaler:
6599  0000 89            	pushw	x
6600       00000002      OFST:	set	2
6603                     ; 2021   uint16_t temp = 0;
6605                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
6607  0001 c65260        	ld	a,21088
6608  0004 97            	ld	xl,a
6609  0005 4f            	clr	a
6610  0006 02            	rlwa	x,a
6611  0007 1f01          	ldw	(OFST-1,sp),x
6613                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
6615  0009 c65261        	ld	a,21089
6616  000c 5f            	clrw	x
6617  000d 97            	ld	xl,a
6618  000e 01            	rrwa	x,a
6619  000f 1a02          	or	a,(OFST+0,sp)
6620  0011 01            	rrwa	x,a
6621  0012 1a01          	or	a,(OFST-1,sp)
6622  0014 01            	rrwa	x,a
6625  0015 5b02          	addw	sp,#2
6626  0017 81            	ret	
6800                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6800                     ; 2048 {
6801                     .text:	section	.text,new
6802  0000               _TIM1_GetFlagStatus:
6804  0000 89            	pushw	x
6805  0001 89            	pushw	x
6806       00000002      OFST:	set	2
6809                     ; 2049   FlagStatus bitstatus = RESET;
6811                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
6815                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6817                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
6819  0002 9f            	ld	a,xl
6820  0003 c45255        	and	a,21077
6821  0006 6b01          	ld	(OFST-1,sp),a
6823                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
6825  0008 7b03          	ld	a,(OFST+1,sp)
6826  000a 6b02          	ld	(OFST+0,sp),a
6828                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
6830  000c c45256        	and	a,21078
6831  000f 1a01          	or	a,(OFST-1,sp)
6832  0011 2702          	jreq	L3053
6833                     ; 2060     bitstatus = SET;
6835  0013 a601          	ld	a,#1
6838  0015               L3053:
6839                     ; 2064     bitstatus = RESET;
6842                     ; 2066   return (FlagStatus)(bitstatus);
6846  0015 5b04          	addw	sp,#4
6847  0017 81            	ret	
6882                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6882                     ; 2088 {
6883                     .text:	section	.text,new
6884  0000               _TIM1_ClearFlag:
6886  0000 89            	pushw	x
6887       00000000      OFST:	set	0
6890                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6892                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
6894  0001 9f            	ld	a,xl
6895  0002 43            	cpl	a
6896  0003 c75255        	ld	21077,a
6897                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
6897                     ; 2095                         (uint8_t)0x1E);
6899  0006 7b01          	ld	a,(OFST+1,sp)
6900  0008 43            	cpl	a
6901  0009 a41e          	and	a,#30
6902  000b c75256        	ld	21078,a
6903                     ; 2096 }
6906  000e 85            	popw	x
6907  000f 81            	ret	
6971                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
6971                     ; 2113 {
6972                     .text:	section	.text,new
6973  0000               _TIM1_GetITStatus:
6975  0000 88            	push	a
6976  0001 89            	pushw	x
6977       00000002      OFST:	set	2
6980                     ; 2114   ITStatus bitstatus = RESET;
6982                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
6986                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
6988                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
6990  0002 c45255        	and	a,21077
6991  0005 6b01          	ld	(OFST-1,sp),a
6993                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
6995  0007 c65254        	ld	a,21076
6996  000a 1403          	and	a,(OFST+1,sp)
6997  000c 6b02          	ld	(OFST+0,sp),a
6999                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
7001  000e 7b01          	ld	a,(OFST-1,sp)
7002  0010 2708          	jreq	L7553
7004  0012 7b02          	ld	a,(OFST+0,sp)
7005  0014 2704          	jreq	L7553
7006                     ; 2126     bitstatus = SET;
7008  0016 a601          	ld	a,#1
7011  0018 2001          	jra	L1653
7012  001a               L7553:
7013                     ; 2130     bitstatus = RESET;
7015  001a 4f            	clr	a
7017  001b               L1653:
7018                     ; 2132   return (ITStatus)(bitstatus);
7022  001b 5b03          	addw	sp,#3
7023  001d 81            	ret	
7059                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
7059                     ; 2150 {
7060                     .text:	section	.text,new
7061  0000               _TIM1_ClearITPendingBit:
7065                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
7067                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
7069  0000 43            	cpl	a
7070  0001 c75255        	ld	21077,a
7071                     ; 2156 }
7074  0004 81            	ret	
7126                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
7126                     ; 2175                        uint8_t TIM1_ICSelection,
7126                     ; 2176                        uint8_t TIM1_ICFilter)
7126                     ; 2177 {
7127                     .text:	section	.text,new
7128  0000               L12_TI1_Config:
7130  0000 89            	pushw	x
7131  0001 88            	push	a
7132       00000001      OFST:	set	1
7135                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7137  0002 7211525c      	bres	21084,#0
7138                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
7138                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7140  0006 7b06          	ld	a,(OFST+5,sp)
7141  0008 97            	ld	xl,a
7142  0009 a610          	ld	a,#16
7143  000b 42            	mul	x,a
7144  000c 9f            	ld	a,xl
7145  000d 1a03          	or	a,(OFST+2,sp)
7146  000f 6b01          	ld	(OFST+0,sp),a
7148  0011 c65258        	ld	a,21080
7149  0014 a40c          	and	a,#12
7150  0016 1a01          	or	a,(OFST+0,sp)
7151  0018 c75258        	ld	21080,a
7152                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7154  001b 7b02          	ld	a,(OFST+1,sp)
7155  001d 2706          	jreq	L7263
7156                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7158  001f 7212525c      	bset	21084,#1
7160  0023 2004          	jra	L1363
7161  0025               L7263:
7162                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7164  0025 7213525c      	bres	21084,#1
7165  0029               L1363:
7166                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7168  0029 7210525c      	bset	21084,#0
7169                     ; 2197 }
7172  002d 5b03          	addw	sp,#3
7173  002f 81            	ret	
7225                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
7225                     ; 2216                        uint8_t TIM1_ICSelection,
7225                     ; 2217                        uint8_t TIM1_ICFilter)
7225                     ; 2218 {
7226                     .text:	section	.text,new
7227  0000               L32_TI2_Config:
7229  0000 89            	pushw	x
7230  0001 88            	push	a
7231       00000001      OFST:	set	1
7234                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7236  0002 7219525c      	bres	21084,#4
7237                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
7237                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7239  0006 7b06          	ld	a,(OFST+5,sp)
7240  0008 97            	ld	xl,a
7241  0009 a610          	ld	a,#16
7242  000b 42            	mul	x,a
7243  000c 9f            	ld	a,xl
7244  000d 1a03          	or	a,(OFST+2,sp)
7245  000f 6b01          	ld	(OFST+0,sp),a
7247  0011 c65259        	ld	a,21081
7248  0014 a40c          	and	a,#12
7249  0016 1a01          	or	a,(OFST+0,sp)
7250  0018 c75259        	ld	21081,a
7251                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7253  001b 7b02          	ld	a,(OFST+1,sp)
7254  001d 2706          	jreq	L1663
7255                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7257  001f 721a525c      	bset	21084,#5
7259  0023 2004          	jra	L3663
7260  0025               L1663:
7261                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7263  0025 721b525c      	bres	21084,#5
7264  0029               L3663:
7265                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7267  0029 7218525c      	bset	21084,#4
7268                     ; 2236 }
7271  002d 5b03          	addw	sp,#3
7272  002f 81            	ret	
7324                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
7324                     ; 2255                        uint8_t TIM1_ICSelection,
7324                     ; 2256                        uint8_t TIM1_ICFilter)
7324                     ; 2257 {
7325                     .text:	section	.text,new
7326  0000               L52_TI3_Config:
7328  0000 89            	pushw	x
7329  0001 88            	push	a
7330       00000001      OFST:	set	1
7333                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7335  0002 7211525d      	bres	21085,#0
7336                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
7336                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7338  0006 7b06          	ld	a,(OFST+5,sp)
7339  0008 97            	ld	xl,a
7340  0009 a610          	ld	a,#16
7341  000b 42            	mul	x,a
7342  000c 9f            	ld	a,xl
7343  000d 1a03          	or	a,(OFST+2,sp)
7344  000f 6b01          	ld	(OFST+0,sp),a
7346  0011 c6525a        	ld	a,21082
7347  0014 a40c          	and	a,#12
7348  0016 1a01          	or	a,(OFST+0,sp)
7349  0018 c7525a        	ld	21082,a
7350                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7352  001b 7b02          	ld	a,(OFST+1,sp)
7353  001d 2706          	jreq	L3173
7354                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
7356  001f 7212525d      	bset	21085,#1
7358  0023 2004          	jra	L5173
7359  0025               L3173:
7360                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7362  0025 7213525d      	bres	21085,#1
7363  0029               L5173:
7364                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7366  0029 7210525d      	bset	21085,#0
7367                     ; 2276 }
7370  002d 5b03          	addw	sp,#3
7371  002f 81            	ret	
7423                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
7423                     ; 2295                        uint8_t TIM1_ICSelection,
7423                     ; 2296                        uint8_t TIM1_ICFilter)
7423                     ; 2297 {
7424                     .text:	section	.text,new
7425  0000               L72_TI4_Config:
7427  0000 89            	pushw	x
7428  0001 88            	push	a
7429       00000001      OFST:	set	1
7432                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7434  0002 7219525d      	bres	21085,#4
7435                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
7435                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7437  0006 7b06          	ld	a,(OFST+5,sp)
7438  0008 97            	ld	xl,a
7439  0009 a610          	ld	a,#16
7440  000b 42            	mul	x,a
7441  000c 9f            	ld	a,xl
7442  000d 1a03          	or	a,(OFST+2,sp)
7443  000f 6b01          	ld	(OFST+0,sp),a
7445  0011 c6525b        	ld	a,21083
7446  0014 a40c          	and	a,#12
7447  0016 1a01          	or	a,(OFST+0,sp)
7448  0018 c7525b        	ld	21083,a
7449                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7451  001b 7b02          	ld	a,(OFST+1,sp)
7452  001d 2706          	jreq	L5473
7453                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
7455  001f 721a525d      	bset	21085,#5
7457  0023 2004          	jra	L7473
7458  0025               L5473:
7459                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
7461  0025 721b525d      	bres	21085,#5
7462  0029               L7473:
7463                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7465  0029 7218525d      	bset	21085,#4
7466                     ; 2317 }
7469  002d 5b03          	addw	sp,#3
7470  002f 81            	ret	
7483                     	xdef	_TIM1_ClearITPendingBit
7484                     	xdef	_TIM1_GetITStatus
7485                     	xdef	_TIM1_ClearFlag
7486                     	xdef	_TIM1_GetFlagStatus
7487                     	xdef	_TIM1_GetPrescaler
7488                     	xdef	_TIM1_GetCounter
7489                     	xdef	_TIM1_GetCapture4
7490                     	xdef	_TIM1_GetCapture3
7491                     	xdef	_TIM1_GetCapture2
7492                     	xdef	_TIM1_GetCapture1
7493                     	xdef	_TIM1_SetIC4Prescaler
7494                     	xdef	_TIM1_SetIC3Prescaler
7495                     	xdef	_TIM1_SetIC2Prescaler
7496                     	xdef	_TIM1_SetIC1Prescaler
7497                     	xdef	_TIM1_SetCompare4
7498                     	xdef	_TIM1_SetCompare3
7499                     	xdef	_TIM1_SetCompare2
7500                     	xdef	_TIM1_SetCompare1
7501                     	xdef	_TIM1_SetAutoreload
7502                     	xdef	_TIM1_SetCounter
7503                     	xdef	_TIM1_SelectOCxM
7504                     	xdef	_TIM1_CCxNCmd
7505                     	xdef	_TIM1_CCxCmd
7506                     	xdef	_TIM1_OC4PolarityConfig
7507                     	xdef	_TIM1_OC3NPolarityConfig
7508                     	xdef	_TIM1_OC3PolarityConfig
7509                     	xdef	_TIM1_OC2NPolarityConfig
7510                     	xdef	_TIM1_OC2PolarityConfig
7511                     	xdef	_TIM1_OC1NPolarityConfig
7512                     	xdef	_TIM1_OC1PolarityConfig
7513                     	xdef	_TIM1_GenerateEvent
7514                     	xdef	_TIM1_OC4FastConfig
7515                     	xdef	_TIM1_OC3FastConfig
7516                     	xdef	_TIM1_OC2FastConfig
7517                     	xdef	_TIM1_OC1FastConfig
7518                     	xdef	_TIM1_OC4PreloadConfig
7519                     	xdef	_TIM1_OC3PreloadConfig
7520                     	xdef	_TIM1_OC2PreloadConfig
7521                     	xdef	_TIM1_OC1PreloadConfig
7522                     	xdef	_TIM1_CCPreloadControl
7523                     	xdef	_TIM1_SelectCOM
7524                     	xdef	_TIM1_ARRPreloadConfig
7525                     	xdef	_TIM1_ForcedOC4Config
7526                     	xdef	_TIM1_ForcedOC3Config
7527                     	xdef	_TIM1_ForcedOC2Config
7528                     	xdef	_TIM1_ForcedOC1Config
7529                     	xdef	_TIM1_CounterModeConfig
7530                     	xdef	_TIM1_PrescalerConfig
7531                     	xdef	_TIM1_EncoderInterfaceConfig
7532                     	xdef	_TIM1_SelectMasterSlaveMode
7533                     	xdef	_TIM1_SelectSlaveMode
7534                     	xdef	_TIM1_SelectOutputTrigger
7535                     	xdef	_TIM1_SelectOnePulseMode
7536                     	xdef	_TIM1_SelectHallSensor
7537                     	xdef	_TIM1_UpdateRequestConfig
7538                     	xdef	_TIM1_UpdateDisableConfig
7539                     	xdef	_TIM1_SelectInputTrigger
7540                     	xdef	_TIM1_TIxExternalClockConfig
7541                     	xdef	_TIM1_ETRConfig
7542                     	xdef	_TIM1_ETRClockMode2Config
7543                     	xdef	_TIM1_ETRClockMode1Config
7544                     	xdef	_TIM1_InternalClockConfig
7545                     	xdef	_TIM1_ITConfig
7546                     	xdef	_TIM1_CtrlPWMOutputs
7547                     	xdef	_TIM1_Cmd
7548                     	xdef	_TIM1_PWMIConfig
7549                     	xdef	_TIM1_ICInit
7550                     	xdef	_TIM1_BDTRConfig
7551                     	xdef	_TIM1_OC4Init
7552                     	xdef	_TIM1_OC3Init
7553                     	xdef	_TIM1_OC2Init
7554                     	xdef	_TIM1_OC1Init
7555                     	xdef	_TIM1_TimeBaseInit
7556                     	xdef	_TIM1_DeInit
7575                     	end

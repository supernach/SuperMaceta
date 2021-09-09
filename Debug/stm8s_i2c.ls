   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  46                     ; 67 void I2C_DeInit(void)
  46                     ; 68 {
  48                     .text:	section	.text,new
  49  0000               _I2C_DeInit:
  53                     ; 69   I2C->CR1 = I2C_CR1_RESET_VALUE;
  55  0000 725f5210      	clr	21008
  56                     ; 70   I2C->CR2 = I2C_CR2_RESET_VALUE;
  58  0004 725f5211      	clr	21009
  59                     ; 71   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  61  0008 725f5212      	clr	21010
  62                     ; 72   I2C->OARL = I2C_OARL_RESET_VALUE;
  64  000c 725f5213      	clr	21011
  65                     ; 73   I2C->OARH = I2C_OARH_RESET_VALUE;
  67  0010 725f5214      	clr	21012
  68                     ; 74   I2C->ITR = I2C_ITR_RESET_VALUE;
  70  0014 725f521a      	clr	21018
  71                     ; 75   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  73  0018 725f521b      	clr	21019
  74                     ; 76   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  76  001c 725f521c      	clr	21020
  77                     ; 77   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  79  0020 3502521d      	mov	21021,#2
  80                     ; 78 }
  83  0024 81            	ret	
 262                     .const:	section	.text
 263  0000               L01:
 264  0000 000186a1      	dc.l	100001
 265  0004               L21:
 266  0004 000f4240      	dc.l	1000000
 267                     ; 96 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 267                     ; 97               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 267                     ; 98               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 267                     ; 99 {
 268                     .text:	section	.text,new
 269  0000               _I2C_Init:
 271  0000 5209          	subw	sp,#9
 272       00000009      OFST:	set	9
 275                     ; 100   uint16_t result = 0x0004;
 277                     ; 101   uint16_t tmpval = 0;
 279                     ; 102   uint8_t tmpccrh = 0;
 281  0002 0f07          	clr	(OFST-2,sp)
 283                     ; 105   assert_param(IS_I2C_ACK_OK(Ack));
 285                     ; 106   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 287                     ; 107   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 289                     ; 108   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 291                     ; 109   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 293                     ; 110   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 295                     ; 115   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 297  0004 c65212        	ld	a,21010
 298  0007 a4c0          	and	a,#192
 299  0009 c75212        	ld	21010,a
 300                     ; 117   I2C->FREQR |= InputClockFrequencyMHz;
 302  000c c65212        	ld	a,21010
 303  000f 1a15          	or	a,(OFST+12,sp)
 304  0011 c75212        	ld	21010,a
 305                     ; 121   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 307  0014 72115210      	bres	21008,#0
 308                     ; 124   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 310  0018 c6521c        	ld	a,21020
 311  001b a430          	and	a,#48
 312  001d c7521c        	ld	21020,a
 313                     ; 125   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 315  0020 725f521b      	clr	21019
 316                     ; 128   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 318  0024 96            	ldw	x,sp
 319  0025 1c000c        	addw	x,#OFST+3
 320  0028 cd0000        	call	c_ltor
 322  002b ae0000        	ldw	x,#L01
 323  002e cd0000        	call	c_lcmp
 325  0031 257c          	jrult	L131
 326                     ; 131     tmpccrh = I2C_CCRH_FS;
 328  0033 a680          	ld	a,#128
 329  0035 6b07          	ld	(OFST-2,sp),a
 331                     ; 133     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 333  0037 96            	ldw	x,sp
 334  0038 0d12          	tnz	(OFST+9,sp)
 335  003a 262b          	jrne	L331
 336                     ; 136       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 338  003c 1c000c        	addw	x,#OFST+3
 339  003f cd0000        	call	c_ltor
 341  0042 a603          	ld	a,#3
 342  0044 cd0000        	call	c_smul
 344  0047 96            	ldw	x,sp
 345  0048 5c            	incw	x
 346  0049 cd0000        	call	c_rtol
 349  004c 7b15          	ld	a,(OFST+12,sp)
 350  004e b703          	ld	c_lreg+3,a
 351  0050 3f02          	clr	c_lreg+2
 352  0052 3f01          	clr	c_lreg+1
 353  0054 3f00          	clr	c_lreg
 354  0056 ae0004        	ldw	x,#L21
 355  0059 cd0000        	call	c_lmul
 357  005c 96            	ldw	x,sp
 358  005d 5c            	incw	x
 359  005e cd0000        	call	c_ludv
 361  0061 be02          	ldw	x,c_lreg+2
 362  0063 1f08          	ldw	(OFST-1,sp),x
 365  0065 202f          	jra	L531
 366  0067               L331:
 367                     ; 141       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 369  0067 1c000c        	addw	x,#OFST+3
 370  006a cd0000        	call	c_ltor
 372  006d a619          	ld	a,#25
 373  006f cd0000        	call	c_smul
 375  0072 96            	ldw	x,sp
 376  0073 5c            	incw	x
 377  0074 cd0000        	call	c_rtol
 380  0077 7b15          	ld	a,(OFST+12,sp)
 381  0079 b703          	ld	c_lreg+3,a
 382  007b 3f02          	clr	c_lreg+2
 383  007d 3f01          	clr	c_lreg+1
 384  007f 3f00          	clr	c_lreg
 385  0081 ae0004        	ldw	x,#L21
 386  0084 cd0000        	call	c_lmul
 388  0087 96            	ldw	x,sp
 389  0088 5c            	incw	x
 390  0089 cd0000        	call	c_ludv
 392  008c be02          	ldw	x,c_lreg+2
 393  008e 1f08          	ldw	(OFST-1,sp),x
 395                     ; 143       tmpccrh |= I2C_CCRH_DUTY;
 397  0090 7b07          	ld	a,(OFST-2,sp)
 398  0092 aa40          	or	a,#64
 399  0094 6b07          	ld	(OFST-2,sp),a
 401  0096               L531:
 402                     ; 147     if (result < (uint16_t)0x01)
 404  0096 1e08          	ldw	x,(OFST-1,sp)
 405  0098 2603          	jrne	L731
 406                     ; 150       result = (uint16_t)0x0001;
 408  009a 5c            	incw	x
 409  009b 1f08          	ldw	(OFST-1,sp),x
 411  009d               L731:
 412                     ; 156     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 414  009d 7b15          	ld	a,(OFST+12,sp)
 415  009f 97            	ld	xl,a
 416  00a0 a603          	ld	a,#3
 417  00a2 42            	mul	x,a
 418  00a3 a60a          	ld	a,#10
 419  00a5 cd0000        	call	c_sdivx
 421  00a8 5c            	incw	x
 422  00a9 1f05          	ldw	(OFST-4,sp),x
 424                     ; 157     I2C->TRISER = (uint8_t)tmpval;
 426  00ab 7b06          	ld	a,(OFST-3,sp)
 428  00ad 2038          	jra	L141
 429  00af               L131:
 430                     ; 164     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 432  00af 96            	ldw	x,sp
 433  00b0 1c000c        	addw	x,#OFST+3
 434  00b3 cd0000        	call	c_ltor
 436  00b6 3803          	sll	c_lreg+3
 437  00b8 3902          	rlc	c_lreg+2
 438  00ba 3901          	rlc	c_lreg+1
 439  00bc 96            	ldw	x,sp
 440  00bd 3900          	rlc	c_lreg
 441  00bf 5c            	incw	x
 442  00c0 cd0000        	call	c_rtol
 445  00c3 7b15          	ld	a,(OFST+12,sp)
 446  00c5 b703          	ld	c_lreg+3,a
 447  00c7 3f02          	clr	c_lreg+2
 448  00c9 3f01          	clr	c_lreg+1
 449  00cb 3f00          	clr	c_lreg
 450  00cd ae0004        	ldw	x,#L21
 451  00d0 cd0000        	call	c_lmul
 453  00d3 96            	ldw	x,sp
 454  00d4 5c            	incw	x
 455  00d5 cd0000        	call	c_ludv
 457  00d8 be02          	ldw	x,c_lreg+2
 459                     ; 167     if (result < (uint16_t)0x0004)
 461  00da a30004        	cpw	x,#4
 462  00dd 2403          	jruge	L341
 463                     ; 170       result = (uint16_t)0x0004;
 465  00df ae0004        	ldw	x,#4
 467  00e2               L341:
 468  00e2 1f08          	ldw	(OFST-1,sp),x
 469                     ; 176     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 471  00e4 7b15          	ld	a,(OFST+12,sp)
 472  00e6 4c            	inc	a
 473  00e7               L141:
 474  00e7 c7521d        	ld	21021,a
 475                     ; 181   I2C->CCRL = (uint8_t)result;
 477  00ea 7b09          	ld	a,(OFST+0,sp)
 478  00ec c7521b        	ld	21019,a
 479                     ; 182   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 481  00ef 7b08          	ld	a,(OFST-1,sp)
 482  00f1 a40f          	and	a,#15
 483  00f3 1a07          	or	a,(OFST-2,sp)
 484  00f5 c7521c        	ld	21020,a
 485                     ; 185   I2C->CR1 |= I2C_CR1_PE;
 487  00f8 72105210      	bset	21008,#0
 488                     ; 188   I2C_AcknowledgeConfig(Ack);
 490  00fc 7b13          	ld	a,(OFST+10,sp)
 491  00fe cd0000        	call	_I2C_AcknowledgeConfig
 493                     ; 191   I2C->OARL = (uint8_t)(OwnAddress);
 495  0101 7b11          	ld	a,(OFST+8,sp)
 496  0103 c75213        	ld	21011,a
 497                     ; 192   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 497                     ; 193                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 499  0106 1e10          	ldw	x,(OFST+7,sp)
 500  0108 4f            	clr	a
 501  0109 01            	rrwa	x,a
 502  010a 48            	sll	a
 503  010b 01            	rrwa	x,a
 504  010c 49            	rlc	a
 505  010d a406          	and	a,#6
 506  010f 6b04          	ld	(OFST-5,sp),a
 508  0111 7b14          	ld	a,(OFST+11,sp)
 509  0113 aa40          	or	a,#64
 510  0115 1a04          	or	a,(OFST-5,sp)
 511  0117 c75214        	ld	21012,a
 512                     ; 194 }
 515  011a 5b09          	addw	sp,#9
 516  011c 81            	ret	
 571                     ; 202 void I2C_Cmd(FunctionalState NewState)
 571                     ; 203 {
 572                     .text:	section	.text,new
 573  0000               _I2C_Cmd:
 577                     ; 205   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 579                     ; 207   if (NewState != DISABLE)
 581  0000 4d            	tnz	a
 582  0001 2705          	jreq	L371
 583                     ; 210     I2C->CR1 |= I2C_CR1_PE;
 585  0003 72105210      	bset	21008,#0
 588  0007 81            	ret	
 589  0008               L371:
 590                     ; 215     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 592  0008 72115210      	bres	21008,#0
 593                     ; 217 }
 596  000c 81            	ret	
 631                     ; 225 void I2C_GeneralCallCmd(FunctionalState NewState)
 631                     ; 226 {
 632                     .text:	section	.text,new
 633  0000               _I2C_GeneralCallCmd:
 637                     ; 228   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 639                     ; 230   if (NewState != DISABLE)
 641  0000 4d            	tnz	a
 642  0001 2705          	jreq	L512
 643                     ; 233     I2C->CR1 |= I2C_CR1_ENGC;
 645  0003 721c5210      	bset	21008,#6
 648  0007 81            	ret	
 649  0008               L512:
 650                     ; 238     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 652  0008 721d5210      	bres	21008,#6
 653                     ; 240 }
 656  000c 81            	ret	
 691                     ; 250 void I2C_GenerateSTART(FunctionalState NewState)
 691                     ; 251 {
 692                     .text:	section	.text,new
 693  0000               _I2C_GenerateSTART:
 697                     ; 253   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 699                     ; 255   if (NewState != DISABLE)
 701  0000 4d            	tnz	a
 702  0001 2705          	jreq	L732
 703                     ; 258     I2C->CR2 |= I2C_CR2_START;
 705  0003 72105211      	bset	21009,#0
 708  0007 81            	ret	
 709  0008               L732:
 710                     ; 263     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 712  0008 72115211      	bres	21009,#0
 713                     ; 265 }
 716  000c 81            	ret	
 751                     ; 273 void I2C_GenerateSTOP(FunctionalState NewState)
 751                     ; 274 {
 752                     .text:	section	.text,new
 753  0000               _I2C_GenerateSTOP:
 757                     ; 276   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 759                     ; 278   if (NewState != DISABLE)
 761  0000 4d            	tnz	a
 762  0001 2705          	jreq	L162
 763                     ; 281     I2C->CR2 |= I2C_CR2_STOP;
 765  0003 72125211      	bset	21009,#1
 768  0007 81            	ret	
 769  0008               L162:
 770                     ; 286     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 772  0008 72135211      	bres	21009,#1
 773                     ; 288 }
 776  000c 81            	ret	
 812                     ; 296 void I2C_SoftwareResetCmd(FunctionalState NewState)
 812                     ; 297 {
 813                     .text:	section	.text,new
 814  0000               _I2C_SoftwareResetCmd:
 818                     ; 299   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 820                     ; 301   if (NewState != DISABLE)
 822  0000 4d            	tnz	a
 823  0001 2705          	jreq	L303
 824                     ; 304     I2C->CR2 |= I2C_CR2_SWRST;
 826  0003 721e5211      	bset	21009,#7
 829  0007 81            	ret	
 830  0008               L303:
 831                     ; 309     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 833  0008 721f5211      	bres	21009,#7
 834                     ; 311 }
 837  000c 81            	ret	
 873                     ; 320 void I2C_StretchClockCmd(FunctionalState NewState)
 873                     ; 321 {
 874                     .text:	section	.text,new
 875  0000               _I2C_StretchClockCmd:
 879                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 881                     ; 325   if (NewState != DISABLE)
 883  0000 4d            	tnz	a
 884  0001 2705          	jreq	L523
 885                     ; 328     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 887  0003 721f5210      	bres	21008,#7
 890  0007 81            	ret	
 891  0008               L523:
 892                     ; 334     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 894  0008 721e5210      	bset	21008,#7
 895                     ; 336 }
 898  000c 81            	ret	
 934                     ; 345 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
 934                     ; 346 {
 935                     .text:	section	.text,new
 936  0000               _I2C_AcknowledgeConfig:
 938       00000000      OFST:	set	0
 941                     ; 348   assert_param(IS_I2C_ACK_OK(Ack));
 943                     ; 350   if (Ack == I2C_ACK_NONE)
 945  0000 4d            	tnz	a
 946  0001 2605          	jrne	L743
 947                     ; 353     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 949  0003 72155211      	bres	21009,#2
 952  0007 81            	ret	
 953  0008               L743:
 954                     ; 358     I2C->CR2 |= I2C_CR2_ACK;
 956  0008 72145211      	bset	21009,#2
 957                     ; 360     if (Ack == I2C_ACK_CURR)
 959  000c 4a            	dec	a
 960  000d 2605          	jrne	L353
 961                     ; 363       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
 963  000f 72175211      	bres	21009,#3
 966  0013 81            	ret	
 967  0014               L353:
 968                     ; 368       I2C->CR2 |= I2C_CR2_POS;
 970  0014 72165211      	bset	21009,#3
 971                     ; 371 }
 974  0018 81            	ret	
1046                     ; 381 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1046                     ; 382 {
1047                     .text:	section	.text,new
1048  0000               _I2C_ITConfig:
1050  0000 89            	pushw	x
1051       00000000      OFST:	set	0
1054                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1056                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1058                     ; 387   if (NewState != DISABLE)
1060  0001 9f            	ld	a,xl
1061  0002 4d            	tnz	a
1062  0003 2706          	jreq	L314
1063                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1065  0005 9e            	ld	a,xh
1066  0006 ca521a        	or	a,21018
1068  0009 2006          	jra	L514
1069  000b               L314:
1070                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1072  000b 7b01          	ld	a,(OFST+1,sp)
1073  000d 43            	cpl	a
1074  000e c4521a        	and	a,21018
1075  0011               L514:
1076  0011 c7521a        	ld	21018,a
1077                     ; 397 }
1080  0014 85            	popw	x
1081  0015 81            	ret	
1117                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1117                     ; 406 {
1118                     .text:	section	.text,new
1119  0000               _I2C_FastModeDutyCycleConfig:
1123                     ; 408   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1125                     ; 410   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1127  0000 a140          	cp	a,#64
1128  0002 2605          	jrne	L534
1129                     ; 413     I2C->CCRH |= I2C_CCRH_DUTY;
1131  0004 721c521c      	bset	21020,#6
1134  0008 81            	ret	
1135  0009               L534:
1136                     ; 418     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1138  0009 721d521c      	bres	21020,#6
1139                     ; 420 }
1142  000d 81            	ret	
1165                     ; 427 uint8_t I2C_ReceiveData(void)
1165                     ; 428 {
1166                     .text:	section	.text,new
1167  0000               _I2C_ReceiveData:
1171                     ; 430   return ((uint8_t)I2C->DR);
1173  0000 c65216        	ld	a,21014
1176  0003 81            	ret	
1241                     ; 440 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1241                     ; 441 {
1242                     .text:	section	.text,new
1243  0000               _I2C_Send7bitAddress:
1245  0000 89            	pushw	x
1246       00000000      OFST:	set	0
1249                     ; 443   assert_param(IS_I2C_ADDRESS_OK(Address));
1251                     ; 444   assert_param(IS_I2C_DIRECTION_OK(Direction));
1253                     ; 447   Address &= (uint8_t)0xFE;
1255  0001 7b01          	ld	a,(OFST+1,sp)
1256  0003 a4fe          	and	a,#254
1257  0005 6b01          	ld	(OFST+1,sp),a
1258                     ; 450   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1260  0007 1a02          	or	a,(OFST+2,sp)
1261  0009 c75216        	ld	21014,a
1262                     ; 451 }
1265  000c 85            	popw	x
1266  000d 81            	ret	
1300                     ; 458 void I2C_SendData(uint8_t Data)
1300                     ; 459 {
1301                     .text:	section	.text,new
1302  0000               _I2C_SendData:
1306                     ; 461   I2C->DR = Data;
1308  0000 c75216        	ld	21014,a
1309                     ; 462 }
1312  0003 81            	ret	
1536                     ; 578 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1536                     ; 579 {
1537                     .text:	section	.text,new
1538  0000               _I2C_CheckEvent:
1540  0000 89            	pushw	x
1541  0001 5206          	subw	sp,#6
1542       00000006      OFST:	set	6
1545                     ; 580   __IO uint16_t lastevent = 0x00;
1547  0003 5f            	clrw	x
1548  0004 1f04          	ldw	(OFST-2,sp),x
1550                     ; 581   uint8_t flag1 = 0x00 ;
1552                     ; 582   uint8_t flag2 = 0x00;
1554                     ; 583   ErrorStatus status = ERROR;
1556                     ; 586   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1558                     ; 588   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1560  0006 1e07          	ldw	x,(OFST+1,sp)
1561  0008 a30004        	cpw	x,#4
1562  000b 2609          	jrne	L136
1563                     ; 590     lastevent = I2C->SR2 & I2C_SR2_AF;
1565  000d c65218        	ld	a,21016
1566  0010 a404          	and	a,#4
1567  0012 5f            	clrw	x
1568  0013 97            	ld	xl,a
1570  0014 201a          	jra	L336
1571  0016               L136:
1572                     ; 594     flag1 = I2C->SR1;
1574  0016 c65217        	ld	a,21015
1575  0019 6b03          	ld	(OFST-3,sp),a
1577                     ; 595     flag2 = I2C->SR3;
1579  001b c65219        	ld	a,21017
1580  001e 6b06          	ld	(OFST+0,sp),a
1582                     ; 596     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1584  0020 5f            	clrw	x
1585  0021 7b03          	ld	a,(OFST-3,sp)
1586  0023 97            	ld	xl,a
1587  0024 1f01          	ldw	(OFST-5,sp),x
1589  0026 5f            	clrw	x
1590  0027 7b06          	ld	a,(OFST+0,sp)
1591  0029 97            	ld	xl,a
1592  002a 7b02          	ld	a,(OFST-4,sp)
1593  002c 01            	rrwa	x,a
1594  002d 1a01          	or	a,(OFST-5,sp)
1595  002f 01            	rrwa	x,a
1596  0030               L336:
1597  0030 1f04          	ldw	(OFST-2,sp),x
1599                     ; 599   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1601  0032 1e04          	ldw	x,(OFST-2,sp)
1602  0034 01            	rrwa	x,a
1603  0035 1408          	and	a,(OFST+2,sp)
1604  0037 01            	rrwa	x,a
1605  0038 1407          	and	a,(OFST+1,sp)
1606  003a 01            	rrwa	x,a
1607  003b 1307          	cpw	x,(OFST+1,sp)
1608  003d 2604          	jrne	L536
1609                     ; 602     status = SUCCESS;
1611  003f a601          	ld	a,#1
1614  0041 2001          	jra	L736
1615  0043               L536:
1616                     ; 607     status = ERROR;
1618  0043 4f            	clr	a
1620  0044               L736:
1621                     ; 611   return status;
1625  0044 5b08          	addw	sp,#8
1626  0046 81            	ret	
1679                     ; 628 I2C_Event_TypeDef I2C_GetLastEvent(void)
1679                     ; 629 {
1680                     .text:	section	.text,new
1681  0000               _I2C_GetLastEvent:
1683  0000 5206          	subw	sp,#6
1684       00000006      OFST:	set	6
1687                     ; 630   __IO uint16_t lastevent = 0;
1689  0002 5f            	clrw	x
1690  0003 1f05          	ldw	(OFST-1,sp),x
1692                     ; 631   uint16_t flag1 = 0;
1694                     ; 632   uint16_t flag2 = 0;
1696                     ; 634   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1698  0005 7205521805    	btjf	21016,#2,L766
1699                     ; 636     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1701  000a ae0004        	ldw	x,#4
1703  000d 2013          	jra	L176
1704  000f               L766:
1705                     ; 641     flag1 = I2C->SR1;
1707  000f c65217        	ld	a,21015
1708  0012 97            	ld	xl,a
1709  0013 1f01          	ldw	(OFST-5,sp),x
1711                     ; 642     flag2 = I2C->SR3;
1713  0015 c65219        	ld	a,21017
1714  0018 5f            	clrw	x
1715  0019 97            	ld	xl,a
1716  001a 1f03          	ldw	(OFST-3,sp),x
1718                     ; 645     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1720  001c 7b02          	ld	a,(OFST-4,sp)
1721  001e 01            	rrwa	x,a
1722  001f 1a01          	or	a,(OFST-5,sp)
1723  0021 01            	rrwa	x,a
1724  0022               L176:
1725  0022 1f05          	ldw	(OFST-1,sp),x
1727                     ; 648   return (I2C_Event_TypeDef)lastevent;
1729  0024 1e05          	ldw	x,(OFST-1,sp)
1732  0026 5b06          	addw	sp,#6
1733  0028 81            	ret	
1948                     ; 679 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
1948                     ; 680 {
1949                     .text:	section	.text,new
1950  0000               _I2C_GetFlagStatus:
1952  0000 89            	pushw	x
1953  0001 89            	pushw	x
1954       00000002      OFST:	set	2
1957                     ; 681   uint8_t tempreg = 0;
1959  0002 0f02          	clr	(OFST+0,sp)
1961                     ; 682   uint8_t regindex = 0;
1963                     ; 683   FlagStatus bitstatus = RESET;
1965                     ; 686   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
1967                     ; 689   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
1969  0004 9e            	ld	a,xh
1970  0005 6b01          	ld	(OFST-1,sp),a
1972                     ; 691   switch (regindex)
1975                     ; 708     default:
1975                     ; 709       break;
1976  0007 4a            	dec	a
1977  0008 2708          	jreq	L376
1978  000a 4a            	dec	a
1979  000b 270a          	jreq	L576
1980  000d 4a            	dec	a
1981  000e 270c          	jreq	L776
1982  0010 200f          	jra	L3101
1983  0012               L376:
1984                     ; 694     case 0x01:
1984                     ; 695       tempreg = (uint8_t)I2C->SR1;
1986  0012 c65217        	ld	a,21015
1987                     ; 696       break;
1989  0015 2008          	jp	LC001
1990  0017               L576:
1991                     ; 699     case 0x02:
1991                     ; 700       tempreg = (uint8_t)I2C->SR2;
1993  0017 c65218        	ld	a,21016
1994                     ; 701       break;
1996  001a 2003          	jp	LC001
1997  001c               L776:
1998                     ; 704     case 0x03:
1998                     ; 705       tempreg = (uint8_t)I2C->SR3;
2000  001c c65219        	ld	a,21017
2001  001f               LC001:
2002  001f 6b02          	ld	(OFST+0,sp),a
2004                     ; 706       break;
2006                     ; 708     default:
2006                     ; 709       break;
2008  0021               L3101:
2009                     ; 713   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
2011  0021 7b04          	ld	a,(OFST+2,sp)
2012  0023 1502          	bcp	a,(OFST+0,sp)
2013  0025 2704          	jreq	L5101
2014                     ; 716     bitstatus = SET;
2016  0027 a601          	ld	a,#1
2019  0029 2001          	jra	L7101
2020  002b               L5101:
2021                     ; 721     bitstatus = RESET;
2023  002b 4f            	clr	a
2025  002c               L7101:
2026                     ; 724   return bitstatus;
2030  002c 5b04          	addw	sp,#4
2031  002e 81            	ret	
2075                     ; 759 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2075                     ; 760 {
2076                     .text:	section	.text,new
2077  0000               _I2C_ClearFlag:
2079  0000 89            	pushw	x
2080       00000002      OFST:	set	2
2083                     ; 761   uint16_t flagpos = 0;
2085                     ; 763   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2087                     ; 766   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2089  0001 01            	rrwa	x,a
2090  0002 5f            	clrw	x
2091  0003 02            	rlwa	x,a
2092  0004 1f01          	ldw	(OFST-1,sp),x
2094                     ; 768   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2096  0006 7b02          	ld	a,(OFST+0,sp)
2097  0008 43            	cpl	a
2098  0009 c75218        	ld	21016,a
2099                     ; 769 }
2102  000c 85            	popw	x
2103  000d 81            	ret	
2269                     ; 791 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2269                     ; 792 {
2270                     .text:	section	.text,new
2271  0000               _I2C_GetITStatus:
2273  0000 89            	pushw	x
2274  0001 5204          	subw	sp,#4
2275       00000004      OFST:	set	4
2278                     ; 793   ITStatus bitstatus = RESET;
2280                     ; 794   __IO uint8_t enablestatus = 0;
2282  0003 0f03          	clr	(OFST-1,sp)
2284                     ; 795   uint16_t tempregister = 0;
2286                     ; 798     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2288                     ; 800   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2290  0005 9e            	ld	a,xh
2291  0006 a407          	and	a,#7
2292  0008 5f            	clrw	x
2293  0009 97            	ld	xl,a
2294  000a 1f01          	ldw	(OFST-3,sp),x
2296                     ; 803   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2298  000c c6521a        	ld	a,21018
2299  000f 1402          	and	a,(OFST-2,sp)
2300  0011 6b03          	ld	(OFST-1,sp),a
2302                     ; 805   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2304  0013 7b05          	ld	a,(OFST+1,sp)
2305  0015 a430          	and	a,#48
2306  0017 97            	ld	xl,a
2307  0018 4f            	clr	a
2308  0019 02            	rlwa	x,a
2309  001a a30100        	cpw	x,#256
2310  001d 260d          	jrne	L1311
2311                     ; 808     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2313  001f c65217        	ld	a,21015
2314  0022 1506          	bcp	a,(OFST+2,sp)
2315  0024 2715          	jreq	L1411
2317  0026 0d03          	tnz	(OFST-1,sp)
2318  0028 2711          	jreq	L1411
2319                     ; 811       bitstatus = SET;
2321  002a 200b          	jp	LC003
2322                     ; 816       bitstatus = RESET;
2323  002c               L1311:
2324                     ; 822     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2326  002c c65218        	ld	a,21016
2327  002f 1506          	bcp	a,(OFST+2,sp)
2328  0031 2708          	jreq	L1411
2330  0033 0d03          	tnz	(OFST-1,sp)
2331  0035 2704          	jreq	L1411
2332                     ; 825       bitstatus = SET;
2334  0037               LC003:
2336  0037 a601          	ld	a,#1
2339  0039 2001          	jra	L7311
2340  003b               L1411:
2341                     ; 830       bitstatus = RESET;
2344  003b 4f            	clr	a
2346  003c               L7311:
2347                     ; 834   return  bitstatus;
2351  003c 5b06          	addw	sp,#6
2352  003e 81            	ret	
2397                     ; 871 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2397                     ; 872 {
2398                     .text:	section	.text,new
2399  0000               _I2C_ClearITPendingBit:
2401  0000 89            	pushw	x
2402       00000002      OFST:	set	2
2405                     ; 873   uint16_t flagpos = 0;
2407                     ; 876   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2409                     ; 879   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2411  0001 01            	rrwa	x,a
2412  0002 5f            	clrw	x
2413  0003 02            	rlwa	x,a
2414  0004 1f01          	ldw	(OFST-1,sp),x
2416                     ; 882   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2418  0006 7b02          	ld	a,(OFST+0,sp)
2419  0008 43            	cpl	a
2420  0009 c75218        	ld	21016,a
2421                     ; 883 }
2424  000c 85            	popw	x
2425  000d 81            	ret	
2438                     	xdef	_I2C_ClearITPendingBit
2439                     	xdef	_I2C_GetITStatus
2440                     	xdef	_I2C_ClearFlag
2441                     	xdef	_I2C_GetFlagStatus
2442                     	xdef	_I2C_GetLastEvent
2443                     	xdef	_I2C_CheckEvent
2444                     	xdef	_I2C_SendData
2445                     	xdef	_I2C_Send7bitAddress
2446                     	xdef	_I2C_ReceiveData
2447                     	xdef	_I2C_ITConfig
2448                     	xdef	_I2C_FastModeDutyCycleConfig
2449                     	xdef	_I2C_AcknowledgeConfig
2450                     	xdef	_I2C_StretchClockCmd
2451                     	xdef	_I2C_SoftwareResetCmd
2452                     	xdef	_I2C_GenerateSTOP
2453                     	xdef	_I2C_GenerateSTART
2454                     	xdef	_I2C_GeneralCallCmd
2455                     	xdef	_I2C_Cmd
2456                     	xdef	_I2C_Init
2457                     	xdef	_I2C_DeInit
2458                     	xref.b	c_lreg
2459                     	xref.b	c_x
2478                     	xref	c_sdivx
2479                     	xref	c_ludv
2480                     	xref	c_rtol
2481                     	xref	c_smul
2482                     	xref	c_lmul
2483                     	xref	c_lcmp
2484                     	xref	c_ltor
2485                     	end

   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  46                     ; 49 void TIM4_DeInit(void)
  46                     ; 50 {
  48                     .text:	section	.text,new
  49  0000               _TIM4_DeInit:
  53                     ; 51   TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  55  0000 725f5340      	clr	21312
  56                     ; 52   TIM4->IER = TIM4_IER_RESET_VALUE;
  58  0004 725f5343      	clr	21315
  59                     ; 53   TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  61  0008 725f5346      	clr	21318
  62                     ; 54   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  64  000c 725f5347      	clr	21319
  65                     ; 55   TIM4->ARR = TIM4_ARR_RESET_VALUE;
  67  0010 35ff5348      	mov	21320,#255
  68                     ; 56   TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  70  0014 725f5344      	clr	21316
  71                     ; 57 }
  74  0018 81            	ret	
 180                     ; 65 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 180                     ; 66 {
 181                     .text:	section	.text,new
 182  0000               _TIM4_TimeBaseInit:
 186                     ; 68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 188                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 190  0000 9e            	ld	a,xh
 191  0001 c75347        	ld	21319,a
 192                     ; 72   TIM4->ARR = (uint8_t)(TIM4_Period);
 194  0004 9f            	ld	a,xl
 195  0005 c75348        	ld	21320,a
 196                     ; 73 }
 199  0008 81            	ret	
 254                     ; 81 void TIM4_Cmd(FunctionalState NewState)
 254                     ; 82 {
 255                     .text:	section	.text,new
 256  0000               _TIM4_Cmd:
 260                     ; 84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 262                     ; 87   if (NewState != DISABLE)
 264  0000 4d            	tnz	a
 265  0001 2705          	jreq	L511
 266                     ; 89     TIM4->CR1 |= TIM4_CR1_CEN;
 268  0003 72105340      	bset	21312,#0
 271  0007 81            	ret	
 272  0008               L511:
 273                     ; 93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 275  0008 72115340      	bres	21312,#0
 276                     ; 95 }
 279  000c 81            	ret	
 337                     ; 107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 337                     ; 108 {
 338                     .text:	section	.text,new
 339  0000               _TIM4_ITConfig:
 341  0000 89            	pushw	x
 342       00000000      OFST:	set	0
 345                     ; 110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 347                     ; 111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 349                     ; 113   if (NewState != DISABLE)
 351  0001 9f            	ld	a,xl
 352  0002 4d            	tnz	a
 353  0003 2706          	jreq	L151
 354                     ; 116     TIM4->IER |= (uint8_t)TIM4_IT;
 356  0005 9e            	ld	a,xh
 357  0006 ca5343        	or	a,21315
 359  0009 2006          	jra	L351
 360  000b               L151:
 361                     ; 121     TIM4->IER &= (uint8_t)(~TIM4_IT);
 363  000b 7b01          	ld	a,(OFST+1,sp)
 364  000d 43            	cpl	a
 365  000e c45343        	and	a,21315
 366  0011               L351:
 367  0011 c75343        	ld	21315,a
 368                     ; 123 }
 371  0014 85            	popw	x
 372  0015 81            	ret	
 408                     ; 131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 408                     ; 132 {
 409                     .text:	section	.text,new
 410  0000               _TIM4_UpdateDisableConfig:
 414                     ; 134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 416                     ; 137   if (NewState != DISABLE)
 418  0000 4d            	tnz	a
 419  0001 2705          	jreq	L371
 420                     ; 139     TIM4->CR1 |= TIM4_CR1_UDIS;
 422  0003 72125340      	bset	21312,#1
 425  0007 81            	ret	
 426  0008               L371:
 427                     ; 143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 429  0008 72135340      	bres	21312,#1
 430                     ; 145 }
 433  000c 81            	ret	
 491                     ; 155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 491                     ; 156 {
 492                     .text:	section	.text,new
 493  0000               _TIM4_UpdateRequestConfig:
 497                     ; 158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 499                     ; 161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 501  0000 4d            	tnz	a
 502  0001 2705          	jreq	L522
 503                     ; 163     TIM4->CR1 |= TIM4_CR1_URS;
 505  0003 72145340      	bset	21312,#2
 508  0007 81            	ret	
 509  0008               L522:
 510                     ; 167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 512  0008 72155340      	bres	21312,#2
 513                     ; 169 }
 516  000c 81            	ret	
 573                     ; 179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 573                     ; 180 {
 574                     .text:	section	.text,new
 575  0000               _TIM4_SelectOnePulseMode:
 579                     ; 182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 581                     ; 185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 583  0000 4d            	tnz	a
 584  0001 2705          	jreq	L752
 585                     ; 187     TIM4->CR1 |= TIM4_CR1_OPM;
 587  0003 72165340      	bset	21312,#3
 590  0007 81            	ret	
 591  0008               L752:
 592                     ; 191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 594  0008 72175340      	bres	21312,#3
 595                     ; 193 }
 598  000c 81            	ret	
 666                     ; 215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 666                     ; 216 {
 667                     .text:	section	.text,new
 668  0000               _TIM4_PrescalerConfig:
 672                     ; 218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 674                     ; 219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 676                     ; 222   TIM4->PSCR = (uint8_t)Prescaler;
 678  0000 9e            	ld	a,xh
 679  0001 c75347        	ld	21319,a
 680                     ; 225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 682  0004 9f            	ld	a,xl
 683  0005 c75345        	ld	21317,a
 684                     ; 226 }
 687  0008 81            	ret	
 723                     ; 234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 723                     ; 235 {
 724                     .text:	section	.text,new
 725  0000               _TIM4_ARRPreloadConfig:
 729                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 731                     ; 240   if (NewState != DISABLE)
 733  0000 4d            	tnz	a
 734  0001 2705          	jreq	L333
 735                     ; 242     TIM4->CR1 |= TIM4_CR1_ARPE;
 737  0003 721e5340      	bset	21312,#7
 740  0007 81            	ret	
 741  0008               L333:
 742                     ; 246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 744  0008 721f5340      	bres	21312,#7
 745                     ; 248 }
 748  000c 81            	ret	
 797                     ; 257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 797                     ; 258 {
 798                     .text:	section	.text,new
 799  0000               _TIM4_GenerateEvent:
 803                     ; 260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 805                     ; 263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
 807  0000 c75345        	ld	21317,a
 808                     ; 264 }
 811  0003 81            	ret	
 845                     ; 272 void TIM4_SetCounter(uint8_t Counter)
 845                     ; 273 {
 846                     .text:	section	.text,new
 847  0000               _TIM4_SetCounter:
 851                     ; 275   TIM4->CNTR = (uint8_t)(Counter);
 853  0000 c75346        	ld	21318,a
 854                     ; 276 }
 857  0003 81            	ret	
 891                     ; 284 void TIM4_SetAutoreload(uint8_t Autoreload)
 891                     ; 285 {
 892                     .text:	section	.text,new
 893  0000               _TIM4_SetAutoreload:
 897                     ; 287   TIM4->ARR = (uint8_t)(Autoreload);
 899  0000 c75348        	ld	21320,a
 900                     ; 288 }
 903  0003 81            	ret	
 926                     ; 295 uint8_t TIM4_GetCounter(void)
 926                     ; 296 {
 927                     .text:	section	.text,new
 928  0000               _TIM4_GetCounter:
 932                     ; 298   return (uint8_t)(TIM4->CNTR);
 934  0000 c65346        	ld	a,21318
 937  0003 81            	ret	
 961                     ; 306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 961                     ; 307 {
 962                     .text:	section	.text,new
 963  0000               _TIM4_GetPrescaler:
 967                     ; 309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 969  0000 c65347        	ld	a,21319
 972  0003 81            	ret	
1051                     ; 319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1051                     ; 320 {
1052                     .text:	section	.text,new
1053  0000               _TIM4_GetFlagStatus:
1055       00000001      OFST:	set	1
1058                     ; 321   FlagStatus bitstatus = RESET;
1060                     ; 324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1062                     ; 326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1064  0000 c45344        	and	a,21316
1065  0003 2702          	jreq	L774
1066                     ; 328     bitstatus = SET;
1068  0005 a601          	ld	a,#1
1071  0007               L774:
1072                     ; 332     bitstatus = RESET;
1075                     ; 334   return ((FlagStatus)bitstatus);
1079  0007 81            	ret	
1114                     ; 344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1114                     ; 345 {
1115                     .text:	section	.text,new
1116  0000               _TIM4_ClearFlag:
1120                     ; 347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1122                     ; 350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1124  0000 43            	cpl	a
1125  0001 c75344        	ld	21316,a
1126                     ; 351 }
1129  0004 81            	ret	
1193                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1193                     ; 361 {
1194                     .text:	section	.text,new
1195  0000               _TIM4_GetITStatus:
1197  0000 88            	push	a
1198  0001 89            	pushw	x
1199       00000002      OFST:	set	2
1202                     ; 362   ITStatus bitstatus = RESET;
1204                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1208                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1210                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1212  0002 c45344        	and	a,21316
1213  0005 6b01          	ld	(OFST-1,sp),a
1215                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1217  0007 c65343        	ld	a,21315
1218  000a 1403          	and	a,(OFST+1,sp)
1219  000c 6b02          	ld	(OFST+0,sp),a
1221                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1223  000e 7b01          	ld	a,(OFST-1,sp)
1224  0010 2708          	jreq	L355
1226  0012 7b02          	ld	a,(OFST+0,sp)
1227  0014 2704          	jreq	L355
1228                     ; 375     bitstatus = (ITStatus)SET;
1230  0016 a601          	ld	a,#1
1233  0018 2001          	jra	L555
1234  001a               L355:
1235                     ; 379     bitstatus = (ITStatus)RESET;
1237  001a 4f            	clr	a
1239  001b               L555:
1240                     ; 381   return ((ITStatus)bitstatus);
1244  001b 5b03          	addw	sp,#3
1245  001d 81            	ret	
1281                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1281                     ; 392 {
1282                     .text:	section	.text,new
1283  0000               _TIM4_ClearITPendingBit:
1287                     ; 394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1289                     ; 397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
1291  0000 43            	cpl	a
1292  0001 c75344        	ld	21316,a
1293                     ; 398 }
1296  0004 81            	ret	
1309                     	xdef	_TIM4_ClearITPendingBit
1310                     	xdef	_TIM4_GetITStatus
1311                     	xdef	_TIM4_ClearFlag
1312                     	xdef	_TIM4_GetFlagStatus
1313                     	xdef	_TIM4_GetPrescaler
1314                     	xdef	_TIM4_GetCounter
1315                     	xdef	_TIM4_SetAutoreload
1316                     	xdef	_TIM4_SetCounter
1317                     	xdef	_TIM4_GenerateEvent
1318                     	xdef	_TIM4_ARRPreloadConfig
1319                     	xdef	_TIM4_PrescalerConfig
1320                     	xdef	_TIM4_SelectOnePulseMode
1321                     	xdef	_TIM4_UpdateRequestConfig
1322                     	xdef	_TIM4_UpdateDisableConfig
1323                     	xdef	_TIM4_ITConfig
1324                     	xdef	_TIM4_Cmd
1325                     	xdef	_TIM4_TimeBaseInit
1326                     	xdef	_TIM4_DeInit
1345                     	end

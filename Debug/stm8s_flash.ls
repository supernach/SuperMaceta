   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
 109                     ; 87 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 109                     ; 88 {
 111                     .text:	section	.text,new
 112  0000               _FLASH_Unlock:
 116                     ; 90   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 118                     ; 93   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
 120  0000 a1fd          	cp	a,#253
 121  0002 2609          	jrne	L55
 122                     ; 95     FLASH->PUKR = FLASH_RASS_KEY1;
 124  0004 35565062      	mov	20578,#86
 125                     ; 96     FLASH->PUKR = FLASH_RASS_KEY2;
 127  0008 35ae5062      	mov	20578,#174
 130  000c 81            	ret	
 131  000d               L55:
 132                     ; 101     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 134  000d 35ae5064      	mov	20580,#174
 135                     ; 102     FLASH->DUKR = FLASH_RASS_KEY1;
 137  0011 35565064      	mov	20580,#86
 138                     ; 104 }
 141  0015 81            	ret	
 176                     ; 112 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 176                     ; 113 {
 177                     .text:	section	.text,new
 178  0000               _FLASH_Lock:
 182                     ; 115   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 184                     ; 118   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 186  0000 c4505f        	and	a,20575
 187  0003 c7505f        	ld	20575,a
 188                     ; 119 }
 191  0006 81            	ret	
 214                     ; 126 void FLASH_DeInit(void)
 214                     ; 127 {
 215                     .text:	section	.text,new
 216  0000               _FLASH_DeInit:
 220                     ; 128   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 222  0000 725f505a      	clr	20570
 223                     ; 129   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 225  0004 725f505b      	clr	20571
 226                     ; 130   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 228  0008 35ff505c      	mov	20572,#255
 229                     ; 131   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 231  000c 7217505f      	bres	20575,#3
 232                     ; 132   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 234  0010 7213505f      	bres	20575,#1
 235                     ; 133   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 237  0014 c6505f        	ld	a,20575
 238                     ; 134 }
 241  0017 81            	ret	
 296                     ; 142 void FLASH_ITConfig(FunctionalState NewState)
 296                     ; 143 {
 297                     .text:	section	.text,new
 298  0000               _FLASH_ITConfig:
 302                     ; 145   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 304                     ; 147   if(NewState != DISABLE)
 306  0000 4d            	tnz	a
 307  0001 2705          	jreq	L531
 308                     ; 149     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 310  0003 7212505a      	bset	20570,#1
 313  0007 81            	ret	
 314  0008               L531:
 315                     ; 153     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 317  0008 7213505a      	bres	20570,#1
 318                     ; 155 }
 321  000c 81            	ret	
 355                     ; 164 void FLASH_EraseByte(uint32_t Address)
 355                     ; 165 {
 356                     .text:	section	.text,new
 357  0000               _FLASH_EraseByte:
 359       00000000      OFST:	set	0
 362                     ; 167   assert_param(IS_FLASH_ADDRESS_OK(Address));
 364                     ; 170   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
 366  0000 1e05          	ldw	x,(OFST+5,sp)
 367  0002 7f            	clr	(x)
 368                     ; 171 }
 371  0003 81            	ret	
 414                     ; 181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 414                     ; 182 {
 415                     .text:	section	.text,new
 416  0000               _FLASH_ProgramByte:
 418       00000000      OFST:	set	0
 421                     ; 184   assert_param(IS_FLASH_ADDRESS_OK(Address));
 423                     ; 185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 425  0000 1e05          	ldw	x,(OFST+5,sp)
 426  0002 7b07          	ld	a,(OFST+7,sp)
 427  0004 f7            	ld	(x),a
 428                     ; 186 }
 431  0005 81            	ret	
 465                     ; 195 uint8_t FLASH_ReadByte(uint32_t Address)
 465                     ; 196 {
 466                     .text:	section	.text,new
 467  0000               _FLASH_ReadByte:
 469       00000000      OFST:	set	0
 472                     ; 198   assert_param(IS_FLASH_ADDRESS_OK(Address));
 474                     ; 201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 476  0000 1e05          	ldw	x,(OFST+5,sp)
 477  0002 f6            	ld	a,(x)
 480  0003 81            	ret	
 523                     ; 212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 523                     ; 213 {
 524                     .text:	section	.text,new
 525  0000               _FLASH_ProgramWord:
 527       00000000      OFST:	set	0
 530                     ; 215   assert_param(IS_FLASH_ADDRESS_OK(Address));
 532                     ; 218   FLASH->CR2 |= FLASH_CR2_WPRG;
 534  0000 721c505b      	bset	20571,#6
 535                     ; 219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 537  0004 721d505c      	bres	20572,#6
 538                     ; 222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
 540  0008 1e05          	ldw	x,(OFST+5,sp)
 541  000a 7b07          	ld	a,(OFST+7,sp)
 542  000c f7            	ld	(x),a
 543                     ; 224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
 545  000d 7b08          	ld	a,(OFST+8,sp)
 546  000f e701          	ld	(1,x),a
 547                     ; 226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
 549  0011 7b09          	ld	a,(OFST+9,sp)
 550  0013 e702          	ld	(2,x),a
 551                     ; 228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
 553  0015 7b0a          	ld	a,(OFST+10,sp)
 554  0017 e703          	ld	(3,x),a
 555                     ; 229 }
 558  0019 81            	ret	
 603                     ; 237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 603                     ; 238 {
 604                     .text:	section	.text,new
 605  0000               _FLASH_ProgramOptionByte:
 607  0000 89            	pushw	x
 608       00000000      OFST:	set	0
 611                     ; 240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 613                     ; 243   FLASH->CR2 |= FLASH_CR2_OPT;
 615  0001 721e505b      	bset	20571,#7
 616                     ; 244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 618  0005 721f505c      	bres	20572,#7
 619                     ; 247   if(Address == 0x4800)
 621  0009 a34800        	cpw	x,#18432
 622  000c 2605          	jrne	L362
 623                     ; 250     *((NEAR uint8_t*)Address) = Data;
 625  000e 7b05          	ld	a,(OFST+5,sp)
 626  0010 f7            	ld	(x),a
 628  0011 2006          	jra	L562
 629  0013               L362:
 630                     ; 255     *((NEAR uint8_t*)Address) = Data;
 632  0013 7b05          	ld	a,(OFST+5,sp)
 633  0015 f7            	ld	(x),a
 634                     ; 256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 636  0016 43            	cpl	a
 637  0017 e701          	ld	(1,x),a
 638  0019               L562:
 639                     ; 258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 641  0019 a6fd          	ld	a,#253
 642  001b cd0000        	call	_FLASH_WaitForLastOperation
 644                     ; 261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 646  001e 721f505b      	bres	20571,#7
 647                     ; 262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 649  0022 721e505c      	bset	20572,#7
 650                     ; 263 }
 653  0026 85            	popw	x
 654  0027 81            	ret	
 690                     ; 270 void FLASH_EraseOptionByte(uint16_t Address)
 690                     ; 271 {
 691                     .text:	section	.text,new
 692  0000               _FLASH_EraseOptionByte:
 694  0000 89            	pushw	x
 695       00000000      OFST:	set	0
 698                     ; 273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 700                     ; 276   FLASH->CR2 |= FLASH_CR2_OPT;
 702  0001 721e505b      	bset	20571,#7
 703                     ; 277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 705  0005 721f505c      	bres	20572,#7
 706                     ; 280   if(Address == 0x4800)
 708  0009 a34800        	cpw	x,#18432
 709  000c 2603          	jrne	L503
 710                     ; 283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 712  000e 7f            	clr	(x)
 714  000f 2005          	jra	L703
 715  0011               L503:
 716                     ; 288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 718  0011 7f            	clr	(x)
 719                     ; 289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 721  0012 a6ff          	ld	a,#255
 722  0014 e701          	ld	(1,x),a
 723  0016               L703:
 724                     ; 291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 726  0016 a6fd          	ld	a,#253
 727  0018 cd0000        	call	_FLASH_WaitForLastOperation
 729                     ; 294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 731  001b 721f505b      	bres	20571,#7
 732                     ; 295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 734  001f 721e505c      	bset	20572,#7
 735                     ; 296 }
 738  0023 85            	popw	x
 739  0024 81            	ret	
 802                     ; 303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
 802                     ; 304 {
 803                     .text:	section	.text,new
 804  0000               _FLASH_ReadOptionByte:
 806  0000 5204          	subw	sp,#4
 807       00000004      OFST:	set	4
 810                     ; 305   uint8_t value_optbyte, value_optbyte_complement = 0;
 812                     ; 306   uint16_t res_value = 0;
 814                     ; 309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 816                     ; 311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
 818  0002 f6            	ld	a,(x)
 819  0003 6b01          	ld	(OFST-3,sp),a
 821                     ; 312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
 823  0005 e601          	ld	a,(1,x)
 824  0007 6b02          	ld	(OFST-2,sp),a
 826                     ; 315   if(Address == 0x4800)	 
 828  0009 a34800        	cpw	x,#18432
 829  000c 2606          	jrne	L343
 830                     ; 317     res_value =	 value_optbyte;
 832  000e 7b01          	ld	a,(OFST-3,sp)
 833  0010 5f            	clrw	x
 834  0011 97            	ld	xl,a
 837  0012 201c          	jra	L543
 838  0014               L343:
 839                     ; 321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
 841  0014 43            	cpl	a
 842  0015 1101          	cp	a,(OFST-3,sp)
 843  0017 2614          	jrne	L743
 844                     ; 323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
 846  0019 7b01          	ld	a,(OFST-3,sp)
 847  001b 97            	ld	xl,a
 848  001c 4f            	clr	a
 849  001d 02            	rlwa	x,a
 850  001e 1f03          	ldw	(OFST-1,sp),x
 852                     ; 324       res_value = res_value | (uint16_t)value_optbyte_complement;
 854  0020 5f            	clrw	x
 855  0021 7b02          	ld	a,(OFST-2,sp)
 856  0023 97            	ld	xl,a
 857  0024 01            	rrwa	x,a
 858  0025 1a04          	or	a,(OFST+0,sp)
 859  0027 01            	rrwa	x,a
 860  0028 1a03          	or	a,(OFST-1,sp)
 861  002a 01            	rrwa	x,a
 864  002b 2003          	jra	L543
 865  002d               L743:
 866                     ; 328       res_value = FLASH_OPTIONBYTE_ERROR;
 868  002d ae5555        	ldw	x,#21845
 870  0030               L543:
 871                     ; 331   return(res_value);
 875  0030 5b04          	addw	sp,#4
 876  0032 81            	ret	
 950                     ; 340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
 950                     ; 341 {
 951                     .text:	section	.text,new
 952  0000               _FLASH_SetLowPowerMode:
 954  0000 88            	push	a
 955       00000000      OFST:	set	0
 958                     ; 343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
 960                     ; 346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
 962  0001 c6505a        	ld	a,20570
 963  0004 a4f3          	and	a,#243
 964  0006 c7505a        	ld	20570,a
 965                     ; 349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
 967  0009 c6505a        	ld	a,20570
 968  000c 1a01          	or	a,(OFST+1,sp)
 969  000e c7505a        	ld	20570,a
 970                     ; 350 }
 973  0011 84            	pop	a
 974  0012 81            	ret	
1032                     ; 358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1032                     ; 359 {
1033                     .text:	section	.text,new
1034  0000               _FLASH_SetProgrammingTime:
1038                     ; 361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1040                     ; 363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1042  0000 7211505a      	bres	20570,#0
1043                     ; 364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1045  0004 ca505a        	or	a,20570
1046  0007 c7505a        	ld	20570,a
1047                     ; 365 }
1050  000a 81            	ret	
1075                     ; 372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1075                     ; 373 {
1076                     .text:	section	.text,new
1077  0000               _FLASH_GetLowPowerMode:
1081                     ; 374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1083  0000 c6505a        	ld	a,20570
1084  0003 a40c          	and	a,#12
1087  0005 81            	ret	
1112                     ; 382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1112                     ; 383 {
1113                     .text:	section	.text,new
1114  0000               _FLASH_GetProgrammingTime:
1118                     ; 384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1120  0000 c6505a        	ld	a,20570
1121  0003 a401          	and	a,#1
1124  0005 81            	ret	
1158                     ; 392 uint32_t FLASH_GetBootSize(void)
1158                     ; 393 {
1159                     .text:	section	.text,new
1160  0000               _FLASH_GetBootSize:
1162  0000 5204          	subw	sp,#4
1163       00000004      OFST:	set	4
1166                     ; 394   uint32_t temp = 0;
1168                     ; 397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1170  0002 c6505d        	ld	a,20573
1171  0005 5f            	clrw	x
1172  0006 97            	ld	xl,a
1173  0007 90ae0200      	ldw	y,#512
1174  000b cd0000        	call	c_umul
1176  000e 96            	ldw	x,sp
1177  000f 5c            	incw	x
1178  0010 cd0000        	call	c_rtol
1181                     ; 400   if(FLASH->FPR == 0xFF)
1183  0013 c6505d        	ld	a,20573
1184  0016 4c            	inc	a
1185  0017 260d          	jrne	L174
1186                     ; 402     temp += 512;
1188  0019 ae0200        	ldw	x,#512
1189  001c bf02          	ldw	c_lreg+2,x
1190  001e 5f            	clrw	x
1191  001f bf00          	ldw	c_lreg,x
1192  0021 96            	ldw	x,sp
1193  0022 5c            	incw	x
1194  0023 cd0000        	call	c_lgadd
1197  0026               L174:
1198                     ; 406   return(temp);
1200  0026 96            	ldw	x,sp
1201  0027 5c            	incw	x
1202  0028 cd0000        	call	c_ltor
1206  002b 5b04          	addw	sp,#4
1207  002d 81            	ret	
1309                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1309                     ; 418 {
1310                     .text:	section	.text,new
1311  0000               _FLASH_GetFlagStatus:
1313       00000001      OFST:	set	1
1316                     ; 419   FlagStatus status = RESET;
1318                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1320                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1322  0000 c4505f        	and	a,20575
1323  0003 2702          	jreq	L145
1324                     ; 426     status = SET; /* FLASH_FLAG is set */
1326  0005 a601          	ld	a,#1
1329  0007               L145:
1330                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
1333                     ; 434   return status;
1337  0007 81            	ret	
1422                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1422                     ; 550 {
1423                     .text:	section	.text,new
1424  0000               _FLASH_WaitForLastOperation:
1426  0000 5203          	subw	sp,#3
1427       00000003      OFST:	set	3
1430                     ; 551   uint8_t flagstatus = 0x00;
1432  0002 0f03          	clr	(OFST+0,sp)
1434                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
1436  0004 aeffff        	ldw	x,#65535
1437                     ; 576   UNUSED(FLASH_MemType);
1440  0007 2008          	jra	L706
1441  0009               L506:
1442                     ; 579     flagstatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
1444  0009 c6505f        	ld	a,20575
1445  000c a405          	and	a,#5
1446  000e 6b03          	ld	(OFST+0,sp),a
1448                     ; 580     timeout--;
1450  0010 5a            	decw	x
1451  0011               L706:
1452  0011 1f01          	ldw	(OFST-2,sp),x
1454                     ; 577   while((flagstatus == 0x00) && (timeout != 0x00))
1456  0013 7b03          	ld	a,(OFST+0,sp)
1457  0015 2604          	jrne	L316
1459  0017 1e01          	ldw	x,(OFST-2,sp)
1460  0019 26ee          	jrne	L506
1461  001b               L316:
1462                     ; 584   if(timeout == 0x00 )
1464  001b 1e01          	ldw	x,(OFST-2,sp)
1465  001d 2602          	jrne	L516
1466                     ; 586     flagstatus = FLASH_STATUS_TIMEOUT;
1468  001f a602          	ld	a,#2
1470  0021               L516:
1471                     ; 589   return((FLASH_Status_TypeDef)flagstatus);
1475  0021 5b03          	addw	sp,#3
1476  0023 81            	ret	
1539                     ; 599 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1539                     ; 600 {
1540                     .text:	section	.text,new
1541  0000               _FLASH_EraseBlock:
1543  0000 89            	pushw	x
1544  0001 5206          	subw	sp,#6
1545       00000006      OFST:	set	6
1548                     ; 601   uint32_t startaddress = 0;
1550                     ; 611   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1552                     ; 612   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1554  0003 7b0b          	ld	a,(OFST+5,sp)
1555  0005 a1fd          	cp	a,#253
1556  0007 2605          	jrne	L156
1557                     ; 614     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1559                     ; 615     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1561  0009 ae8000        	ldw	x,#32768
1563  000c 2003          	jra	L356
1564  000e               L156:
1565                     ; 619     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1567                     ; 620     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1569  000e ae4000        	ldw	x,#16384
1570  0011               L356:
1571  0011 1f05          	ldw	(OFST-1,sp),x
1572  0013 5f            	clrw	x
1573  0014 1f03          	ldw	(OFST-3,sp),x
1575                     ; 628     pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1577  0016 a640          	ld	a,#64
1578  0018 1e07          	ldw	x,(OFST+1,sp)
1579  001a cd0000        	call	c_cmulx
1581  001d 96            	ldw	x,sp
1582  001e 1c0003        	addw	x,#OFST-3
1583  0021 cd0000        	call	c_ladd
1585  0024 be02          	ldw	x,c_lreg+2
1586  0026 1f01          	ldw	(OFST-5,sp),x
1588                     ; 632   FLASH->CR2 |= FLASH_CR2_ERASE;
1590  0028 721a505b      	bset	20571,#5
1591                     ; 633   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1593  002c 721b505c      	bres	20572,#5
1594                     ; 637     *pwFlash = (uint32_t)0;
1596  0030 4f            	clr	a
1597  0031 e703          	ld	(3,x),a
1598  0033 e702          	ld	(2,x),a
1599  0035 e701          	ld	(1,x),a
1600  0037 f7            	ld	(x),a
1601                     ; 645 }
1604  0038 5b08          	addw	sp,#8
1605  003a 81            	ret	
1709                     ; 656 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
1709                     ; 657                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1709                     ; 658 {
1710                     .text:	section	.text,new
1711  0000               _FLASH_ProgramBlock:
1713  0000 89            	pushw	x
1714  0001 5206          	subw	sp,#6
1715       00000006      OFST:	set	6
1718                     ; 659   uint16_t Count = 0;
1720                     ; 660   uint32_t startaddress = 0;
1722                     ; 663   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1724                     ; 664   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
1726                     ; 665   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1728  0003 7b0b          	ld	a,(OFST+5,sp)
1729  0005 a1fd          	cp	a,#253
1730  0007 2605          	jrne	L727
1731                     ; 667     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1733                     ; 668     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1735  0009 ae8000        	ldw	x,#32768
1737  000c 2003          	jra	L137
1738  000e               L727:
1739                     ; 672     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1741                     ; 673     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1743  000e ae4000        	ldw	x,#16384
1744  0011               L137:
1745  0011 1f03          	ldw	(OFST-3,sp),x
1746  0013 5f            	clrw	x
1747  0014 1f01          	ldw	(OFST-5,sp),x
1749                     ; 677   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1751  0016 a640          	ld	a,#64
1752  0018 1e07          	ldw	x,(OFST+1,sp)
1753  001a cd0000        	call	c_cmulx
1755  001d 96            	ldw	x,sp
1756  001e 5c            	incw	x
1757  001f cd0000        	call	c_lgadd
1760                     ; 680   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
1762  0022 7b0c          	ld	a,(OFST+6,sp)
1763  0024 260a          	jrne	L337
1764                     ; 683     FLASH->CR2 |= FLASH_CR2_PRG;
1766  0026 7210505b      	bset	20571,#0
1767                     ; 684     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
1769  002a 7211505c      	bres	20572,#0
1771  002e 2008          	jra	L537
1772  0030               L337:
1773                     ; 689     FLASH->CR2 |= FLASH_CR2_FPRG;
1775  0030 7218505b      	bset	20571,#4
1776                     ; 690     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
1778  0034 7219505c      	bres	20572,#4
1779  0038               L537:
1780                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1782  0038 5f            	clrw	x
1783  0039 1f05          	ldw	(OFST-1,sp),x
1785  003b               L737:
1786                     ; 696     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1788  003b 1e0d          	ldw	x,(OFST+7,sp)
1789  003d 72fb05        	addw	x,(OFST-1,sp)
1790  0040 f6            	ld	a,(x)
1791  0041 1e03          	ldw	x,(OFST-3,sp)
1792  0043 72fb05        	addw	x,(OFST-1,sp)
1793  0046 f7            	ld	(x),a
1794                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1796  0047 1e05          	ldw	x,(OFST-1,sp)
1797  0049 5c            	incw	x
1798  004a 1f05          	ldw	(OFST-1,sp),x
1802  004c a30040        	cpw	x,#64
1803  004f 25ea          	jrult	L737
1804                     ; 698 }
1807  0051 5b08          	addw	sp,#8
1808  0053 81            	ret	
1821                     	xdef	_FLASH_WaitForLastOperation
1822                     	xdef	_FLASH_ProgramBlock
1823                     	xdef	_FLASH_EraseBlock
1824                     	xdef	_FLASH_GetFlagStatus
1825                     	xdef	_FLASH_GetBootSize
1826                     	xdef	_FLASH_GetProgrammingTime
1827                     	xdef	_FLASH_GetLowPowerMode
1828                     	xdef	_FLASH_SetProgrammingTime
1829                     	xdef	_FLASH_SetLowPowerMode
1830                     	xdef	_FLASH_EraseOptionByte
1831                     	xdef	_FLASH_ProgramOptionByte
1832                     	xdef	_FLASH_ReadOptionByte
1833                     	xdef	_FLASH_ProgramWord
1834                     	xdef	_FLASH_ReadByte
1835                     	xdef	_FLASH_ProgramByte
1836                     	xdef	_FLASH_EraseByte
1837                     	xdef	_FLASH_ITConfig
1838                     	xdef	_FLASH_DeInit
1839                     	xdef	_FLASH_Lock
1840                     	xdef	_FLASH_Unlock
1841                     	xref.b	c_lreg
1842                     	xref.b	c_x
1843                     	xref.b	c_y
1862                     	xref	c_ladd
1863                     	xref	c_cmulx
1864                     	xref	c_ltor
1865                     	xref	c_lgadd
1866                     	xref	c_rtol
1867                     	xref	c_umul
1868                     	end

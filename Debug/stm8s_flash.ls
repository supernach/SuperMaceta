   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  78                     ; 87 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  78                     ; 88 {
  80                     .text:	section	.text,new
  81  0000               _FLASH_Unlock:
  85                     ; 90   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  87                     ; 93   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
  89  0000 a1fd          	cp	a,#253
  90  0002 2609          	jrne	L73
  91                     ; 95     FLASH->PUKR = FLASH_RASS_KEY1;
  93  0004 35565062      	mov	20578,#86
  94                     ; 96     FLASH->PUKR = FLASH_RASS_KEY2;
  96  0008 35ae5062      	mov	20578,#174
  99  000c 81            	ret	
 100  000d               L73:
 101                     ; 101     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 103  000d 35ae5064      	mov	20580,#174
 104                     ; 102     FLASH->DUKR = FLASH_RASS_KEY1;
 106  0011 35565064      	mov	20580,#86
 107                     ; 104 }
 110  0015 81            	ret	
 145                     ; 112 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 145                     ; 113 {
 146                     .text:	section	.text,new
 147  0000               _FLASH_Lock:
 151                     ; 115   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 153                     ; 118   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 155  0000 c4505f        	and	a,20575
 156  0003 c7505f        	ld	20575,a
 157                     ; 119 }
 160  0006 81            	ret	
 183                     ; 126 void FLASH_DeInit(void)
 183                     ; 127 {
 184                     .text:	section	.text,new
 185  0000               _FLASH_DeInit:
 189                     ; 128   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 191  0000 725f505a      	clr	20570
 192                     ; 129   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 194  0004 725f505b      	clr	20571
 195                     ; 130   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 197  0008 35ff505c      	mov	20572,#255
 198                     ; 131   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 200  000c 7217505f      	bres	20575,#3
 201                     ; 132   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 203  0010 7213505f      	bres	20575,#1
 204                     ; 133   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 206  0014 c6505f        	ld	a,20575
 207                     ; 134 }
 210  0017 81            	ret	
 265                     ; 142 void FLASH_ITConfig(FunctionalState NewState)
 265                     ; 143 {
 266                     .text:	section	.text,new
 267  0000               _FLASH_ITConfig:
 271                     ; 145   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 273                     ; 147   if(NewState != DISABLE)
 275  0000 4d            	tnz	a
 276  0001 2705          	jreq	L711
 277                     ; 149     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 279  0003 7212505a      	bset	20570,#1
 282  0007 81            	ret	
 283  0008               L711:
 284                     ; 153     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 286  0008 7213505a      	bres	20570,#1
 287                     ; 155 }
 290  000c 81            	ret	
 324                     ; 164 void FLASH_EraseByte(uint32_t Address)
 324                     ; 165 {
 325                     .text:	section	.text,new
 326  0000               _FLASH_EraseByte:
 328       00000000      OFST:	set	0
 331                     ; 167   assert_param(IS_FLASH_ADDRESS_OK(Address));
 333                     ; 170   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
 335  0000 1e05          	ldw	x,(OFST+5,sp)
 336  0002 7f            	clr	(x)
 337                     ; 171 }
 340  0003 81            	ret	
 383                     ; 181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 383                     ; 182 {
 384                     .text:	section	.text,new
 385  0000               _FLASH_ProgramByte:
 387       00000000      OFST:	set	0
 390                     ; 184   assert_param(IS_FLASH_ADDRESS_OK(Address));
 392                     ; 185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 394  0000 1e05          	ldw	x,(OFST+5,sp)
 395  0002 7b07          	ld	a,(OFST+7,sp)
 396  0004 f7            	ld	(x),a
 397                     ; 186 }
 400  0005 81            	ret	
 434                     ; 195 uint8_t FLASH_ReadByte(uint32_t Address)
 434                     ; 196 {
 435                     .text:	section	.text,new
 436  0000               _FLASH_ReadByte:
 438       00000000      OFST:	set	0
 441                     ; 198   assert_param(IS_FLASH_ADDRESS_OK(Address));
 443                     ; 201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 445  0000 1e05          	ldw	x,(OFST+5,sp)
 446  0002 f6            	ld	a,(x)
 449  0003 81            	ret	
 492                     ; 212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 492                     ; 213 {
 493                     .text:	section	.text,new
 494  0000               _FLASH_ProgramWord:
 496       00000000      OFST:	set	0
 499                     ; 215   assert_param(IS_FLASH_ADDRESS_OK(Address));
 501                     ; 218   FLASH->CR2 |= FLASH_CR2_WPRG;
 503  0000 721c505b      	bset	20571,#6
 504                     ; 219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 506  0004 721d505c      	bres	20572,#6
 507                     ; 222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
 509  0008 1e05          	ldw	x,(OFST+5,sp)
 510  000a 7b07          	ld	a,(OFST+7,sp)
 511  000c f7            	ld	(x),a
 512                     ; 224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
 514  000d 7b08          	ld	a,(OFST+8,sp)
 515  000f e701          	ld	(1,x),a
 516                     ; 226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
 518  0011 7b09          	ld	a,(OFST+9,sp)
 519  0013 e702          	ld	(2,x),a
 520                     ; 228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
 522  0015 7b0a          	ld	a,(OFST+10,sp)
 523  0017 e703          	ld	(3,x),a
 524                     ; 229 }
 527  0019 81            	ret	
 572                     ; 237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 572                     ; 238 {
 573                     .text:	section	.text,new
 574  0000               _FLASH_ProgramOptionByte:
 576  0000 89            	pushw	x
 577       00000000      OFST:	set	0
 580                     ; 240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 582                     ; 243   FLASH->CR2 |= FLASH_CR2_OPT;
 584  0001 721e505b      	bset	20571,#7
 585                     ; 244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 587  0005 721f505c      	bres	20572,#7
 588                     ; 247   if(Address == 0x4800)
 590  0009 a34800        	cpw	x,#18432
 591  000c 2605          	jrne	L542
 592                     ; 250     *((NEAR uint8_t*)Address) = Data;
 594  000e 7b05          	ld	a,(OFST+5,sp)
 595  0010 f7            	ld	(x),a
 597  0011 2006          	jra	L742
 598  0013               L542:
 599                     ; 255     *((NEAR uint8_t*)Address) = Data;
 601  0013 7b05          	ld	a,(OFST+5,sp)
 602  0015 f7            	ld	(x),a
 603                     ; 256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 605  0016 43            	cpl	a
 606  0017 e701          	ld	(1,x),a
 607  0019               L742:
 608                     ; 258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 610  0019 a6fd          	ld	a,#253
 611  001b cd0000        	call	_FLASH_WaitForLastOperation
 613                     ; 261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 615  001e 721f505b      	bres	20571,#7
 616                     ; 262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 618  0022 721e505c      	bset	20572,#7
 619                     ; 263 }
 622  0026 85            	popw	x
 623  0027 81            	ret	
 659                     ; 270 void FLASH_EraseOptionByte(uint16_t Address)
 659                     ; 271 {
 660                     .text:	section	.text,new
 661  0000               _FLASH_EraseOptionByte:
 663  0000 89            	pushw	x
 664       00000000      OFST:	set	0
 667                     ; 273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 669                     ; 276   FLASH->CR2 |= FLASH_CR2_OPT;
 671  0001 721e505b      	bset	20571,#7
 672                     ; 277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 674  0005 721f505c      	bres	20572,#7
 675                     ; 280   if(Address == 0x4800)
 677  0009 a34800        	cpw	x,#18432
 678  000c 2603          	jrne	L762
 679                     ; 283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 681  000e 7f            	clr	(x)
 683  000f 2005          	jra	L172
 684  0011               L762:
 685                     ; 288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 687  0011 7f            	clr	(x)
 688                     ; 289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 690  0012 a6ff          	ld	a,#255
 691  0014 e701          	ld	(1,x),a
 692  0016               L172:
 693                     ; 291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 695  0016 a6fd          	ld	a,#253
 696  0018 cd0000        	call	_FLASH_WaitForLastOperation
 698                     ; 294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 700  001b 721f505b      	bres	20571,#7
 701                     ; 295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 703  001f 721e505c      	bset	20572,#7
 704                     ; 296 }
 707  0023 85            	popw	x
 708  0024 81            	ret	
 771                     ; 303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
 771                     ; 304 {
 772                     .text:	section	.text,new
 773  0000               _FLASH_ReadOptionByte:
 775  0000 5204          	subw	sp,#4
 776       00000004      OFST:	set	4
 779                     ; 305   uint8_t value_optbyte, value_optbyte_complement = 0;
 781                     ; 306   uint16_t res_value = 0;
 783                     ; 309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 785                     ; 311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
 787  0002 f6            	ld	a,(x)
 788  0003 6b01          	ld	(OFST-3,sp),a
 790                     ; 312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
 792  0005 e601          	ld	a,(1,x)
 793  0007 6b02          	ld	(OFST-2,sp),a
 795                     ; 315   if(Address == 0x4800)	 
 797  0009 a34800        	cpw	x,#18432
 798  000c 2606          	jrne	L523
 799                     ; 317     res_value =	 value_optbyte;
 801  000e 7b01          	ld	a,(OFST-3,sp)
 802  0010 5f            	clrw	x
 803  0011 97            	ld	xl,a
 806  0012 201c          	jra	L723
 807  0014               L523:
 808                     ; 321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
 810  0014 43            	cpl	a
 811  0015 1101          	cp	a,(OFST-3,sp)
 812  0017 2614          	jrne	L133
 813                     ; 323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
 815  0019 7b01          	ld	a,(OFST-3,sp)
 816  001b 97            	ld	xl,a
 817  001c 4f            	clr	a
 818  001d 02            	rlwa	x,a
 819  001e 1f03          	ldw	(OFST-1,sp),x
 821                     ; 324       res_value = res_value | (uint16_t)value_optbyte_complement;
 823  0020 5f            	clrw	x
 824  0021 7b02          	ld	a,(OFST-2,sp)
 825  0023 97            	ld	xl,a
 826  0024 01            	rrwa	x,a
 827  0025 1a04          	or	a,(OFST+0,sp)
 828  0027 01            	rrwa	x,a
 829  0028 1a03          	or	a,(OFST-1,sp)
 830  002a 01            	rrwa	x,a
 833  002b 2003          	jra	L723
 834  002d               L133:
 835                     ; 328       res_value = FLASH_OPTIONBYTE_ERROR;
 837  002d ae5555        	ldw	x,#21845
 839  0030               L723:
 840                     ; 331   return(res_value);
 844  0030 5b04          	addw	sp,#4
 845  0032 81            	ret	
 919                     ; 340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
 919                     ; 341 {
 920                     .text:	section	.text,new
 921  0000               _FLASH_SetLowPowerMode:
 923  0000 88            	push	a
 924       00000000      OFST:	set	0
 927                     ; 343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
 929                     ; 346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
 931  0001 c6505a        	ld	a,20570
 932  0004 a4f3          	and	a,#243
 933  0006 c7505a        	ld	20570,a
 934                     ; 349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
 936  0009 c6505a        	ld	a,20570
 937  000c 1a01          	or	a,(OFST+1,sp)
 938  000e c7505a        	ld	20570,a
 939                     ; 350 }
 942  0011 84            	pop	a
 943  0012 81            	ret	
1001                     ; 358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1001                     ; 359 {
1002                     .text:	section	.text,new
1003  0000               _FLASH_SetProgrammingTime:
1007                     ; 361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1009                     ; 363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1011  0000 7211505a      	bres	20570,#0
1012                     ; 364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1014  0004 ca505a        	or	a,20570
1015  0007 c7505a        	ld	20570,a
1016                     ; 365 }
1019  000a 81            	ret	
1044                     ; 372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1044                     ; 373 {
1045                     .text:	section	.text,new
1046  0000               _FLASH_GetLowPowerMode:
1050                     ; 374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1052  0000 c6505a        	ld	a,20570
1053  0003 a40c          	and	a,#12
1056  0005 81            	ret	
1081                     ; 382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1081                     ; 383 {
1082                     .text:	section	.text,new
1083  0000               _FLASH_GetProgrammingTime:
1087                     ; 384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1089  0000 c6505a        	ld	a,20570
1090  0003 a401          	and	a,#1
1093  0005 81            	ret	
1127                     ; 392 uint32_t FLASH_GetBootSize(void)
1127                     ; 393 {
1128                     .text:	section	.text,new
1129  0000               _FLASH_GetBootSize:
1131  0000 5204          	subw	sp,#4
1132       00000004      OFST:	set	4
1135                     ; 394   uint32_t temp = 0;
1137                     ; 397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1139  0002 c6505d        	ld	a,20573
1140  0005 5f            	clrw	x
1141  0006 97            	ld	xl,a
1142  0007 90ae0200      	ldw	y,#512
1143  000b cd0000        	call	c_umul
1145  000e 96            	ldw	x,sp
1146  000f 5c            	incw	x
1147  0010 cd0000        	call	c_rtol
1150                     ; 400   if(FLASH->FPR == 0xFF)
1152  0013 c6505d        	ld	a,20573
1153  0016 4c            	inc	a
1154  0017 260d          	jrne	L354
1155                     ; 402     temp += 512;
1157  0019 ae0200        	ldw	x,#512
1158  001c bf02          	ldw	c_lreg+2,x
1159  001e 5f            	clrw	x
1160  001f bf00          	ldw	c_lreg,x
1161  0021 96            	ldw	x,sp
1162  0022 5c            	incw	x
1163  0023 cd0000        	call	c_lgadd
1166  0026               L354:
1167                     ; 406   return(temp);
1169  0026 96            	ldw	x,sp
1170  0027 5c            	incw	x
1171  0028 cd0000        	call	c_ltor
1175  002b 5b04          	addw	sp,#4
1176  002d 81            	ret	
1278                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1278                     ; 418 {
1279                     .text:	section	.text,new
1280  0000               _FLASH_GetFlagStatus:
1282       00000001      OFST:	set	1
1285                     ; 419   FlagStatus status = RESET;
1287                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1289                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1291  0000 c4505f        	and	a,20575
1292  0003 2702          	jreq	L325
1293                     ; 426     status = SET; /* FLASH_FLAG is set */
1295  0005 a601          	ld	a,#1
1298  0007               L325:
1299                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
1302                     ; 434   return status;
1306  0007 81            	ret	
1391                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1391                     ; 550 {
1392                     .text:	section	.text,new
1393  0000               _FLASH_WaitForLastOperation:
1395  0000 5203          	subw	sp,#3
1396       00000003      OFST:	set	3
1399                     ; 551   uint8_t flagstatus = 0x00;
1401  0002 0f03          	clr	(OFST+0,sp)
1403                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
1405  0004 aeffff        	ldw	x,#65535
1406                     ; 576   UNUSED(FLASH_MemType);
1409  0007 2008          	jra	L175
1410  0009               L765:
1411                     ; 579     flagstatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
1413  0009 c6505f        	ld	a,20575
1414  000c a405          	and	a,#5
1415  000e 6b03          	ld	(OFST+0,sp),a
1417                     ; 580     timeout--;
1419  0010 5a            	decw	x
1420  0011               L175:
1421  0011 1f01          	ldw	(OFST-2,sp),x
1423                     ; 577   while((flagstatus == 0x00) && (timeout != 0x00))
1425  0013 7b03          	ld	a,(OFST+0,sp)
1426  0015 2604          	jrne	L575
1428  0017 1e01          	ldw	x,(OFST-2,sp)
1429  0019 26ee          	jrne	L765
1430  001b               L575:
1431                     ; 584   if(timeout == 0x00 )
1433  001b 1e01          	ldw	x,(OFST-2,sp)
1434  001d 2602          	jrne	L775
1435                     ; 586     flagstatus = FLASH_STATUS_TIMEOUT;
1437  001f a602          	ld	a,#2
1439  0021               L775:
1440                     ; 589   return((FLASH_Status_TypeDef)flagstatus);
1444  0021 5b03          	addw	sp,#3
1445  0023 81            	ret	
1508                     ; 599 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1508                     ; 600 {
1509                     .text:	section	.text,new
1510  0000               _FLASH_EraseBlock:
1512  0000 89            	pushw	x
1513  0001 5206          	subw	sp,#6
1514       00000006      OFST:	set	6
1517                     ; 601   uint32_t startaddress = 0;
1519                     ; 611   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1521                     ; 612   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1523  0003 7b0b          	ld	a,(OFST+5,sp)
1524  0005 a1fd          	cp	a,#253
1525  0007 2605          	jrne	L336
1526                     ; 614     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1528                     ; 615     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1530  0009 ae8000        	ldw	x,#32768
1532  000c 2003          	jra	L536
1533  000e               L336:
1534                     ; 619     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1536                     ; 620     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1538  000e ae4000        	ldw	x,#16384
1539  0011               L536:
1540  0011 1f05          	ldw	(OFST-1,sp),x
1541  0013 5f            	clrw	x
1542  0014 1f03          	ldw	(OFST-3,sp),x
1544                     ; 628     pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1546  0016 a640          	ld	a,#64
1547  0018 1e07          	ldw	x,(OFST+1,sp)
1548  001a cd0000        	call	c_cmulx
1550  001d 96            	ldw	x,sp
1551  001e 1c0003        	addw	x,#OFST-3
1552  0021 cd0000        	call	c_ladd
1554  0024 be02          	ldw	x,c_lreg+2
1555  0026 1f01          	ldw	(OFST-5,sp),x
1557                     ; 632   FLASH->CR2 |= FLASH_CR2_ERASE;
1559  0028 721a505b      	bset	20571,#5
1560                     ; 633   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1562  002c 721b505c      	bres	20572,#5
1563                     ; 637     *pwFlash = (uint32_t)0;
1565  0030 4f            	clr	a
1566  0031 e703          	ld	(3,x),a
1567  0033 e702          	ld	(2,x),a
1568  0035 e701          	ld	(1,x),a
1569  0037 f7            	ld	(x),a
1570                     ; 645 }
1573  0038 5b08          	addw	sp,#8
1574  003a 81            	ret	
1678                     ; 656 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
1678                     ; 657                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1678                     ; 658 {
1679                     .text:	section	.text,new
1680  0000               _FLASH_ProgramBlock:
1682  0000 89            	pushw	x
1683  0001 5206          	subw	sp,#6
1684       00000006      OFST:	set	6
1687                     ; 659   uint16_t Count = 0;
1689                     ; 660   uint32_t startaddress = 0;
1691                     ; 663   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1693                     ; 664   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
1695                     ; 665   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1697  0003 7b0b          	ld	a,(OFST+5,sp)
1698  0005 a1fd          	cp	a,#253
1699  0007 2605          	jrne	L117
1700                     ; 667     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1702                     ; 668     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1704  0009 ae8000        	ldw	x,#32768
1706  000c 2003          	jra	L317
1707  000e               L117:
1708                     ; 672     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1710                     ; 673     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1712  000e ae4000        	ldw	x,#16384
1713  0011               L317:
1714  0011 1f03          	ldw	(OFST-3,sp),x
1715  0013 5f            	clrw	x
1716  0014 1f01          	ldw	(OFST-5,sp),x
1718                     ; 677   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1720  0016 a640          	ld	a,#64
1721  0018 1e07          	ldw	x,(OFST+1,sp)
1722  001a cd0000        	call	c_cmulx
1724  001d 96            	ldw	x,sp
1725  001e 5c            	incw	x
1726  001f cd0000        	call	c_lgadd
1729                     ; 680   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
1731  0022 7b0c          	ld	a,(OFST+6,sp)
1732  0024 260a          	jrne	L517
1733                     ; 683     FLASH->CR2 |= FLASH_CR2_PRG;
1735  0026 7210505b      	bset	20571,#0
1736                     ; 684     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
1738  002a 7211505c      	bres	20572,#0
1740  002e 2008          	jra	L717
1741  0030               L517:
1742                     ; 689     FLASH->CR2 |= FLASH_CR2_FPRG;
1744  0030 7218505b      	bset	20571,#4
1745                     ; 690     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
1747  0034 7219505c      	bres	20572,#4
1748  0038               L717:
1749                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1751  0038 5f            	clrw	x
1752  0039 1f05          	ldw	(OFST-1,sp),x
1754  003b               L127:
1755                     ; 696     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1757  003b 1e0d          	ldw	x,(OFST+7,sp)
1758  003d 72fb05        	addw	x,(OFST-1,sp)
1759  0040 f6            	ld	a,(x)
1760  0041 1e03          	ldw	x,(OFST-3,sp)
1761  0043 72fb05        	addw	x,(OFST-1,sp)
1762  0046 f7            	ld	(x),a
1763                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1765  0047 1e05          	ldw	x,(OFST-1,sp)
1766  0049 5c            	incw	x
1767  004a 1f05          	ldw	(OFST-1,sp),x
1771  004c a30040        	cpw	x,#64
1772  004f 25ea          	jrult	L127
1773                     ; 698 }
1776  0051 5b08          	addw	sp,#8
1777  0053 81            	ret	
1790                     	xdef	_FLASH_WaitForLastOperation
1791                     	xdef	_FLASH_ProgramBlock
1792                     	xdef	_FLASH_EraseBlock
1793                     	xdef	_FLASH_GetFlagStatus
1794                     	xdef	_FLASH_GetBootSize
1795                     	xdef	_FLASH_GetProgrammingTime
1796                     	xdef	_FLASH_GetLowPowerMode
1797                     	xdef	_FLASH_SetProgrammingTime
1798                     	xdef	_FLASH_SetLowPowerMode
1799                     	xdef	_FLASH_EraseOptionByte
1800                     	xdef	_FLASH_ProgramOptionByte
1801                     	xdef	_FLASH_ReadOptionByte
1802                     	xdef	_FLASH_ProgramWord
1803                     	xdef	_FLASH_ReadByte
1804                     	xdef	_FLASH_ProgramByte
1805                     	xdef	_FLASH_EraseByte
1806                     	xdef	_FLASH_ITConfig
1807                     	xdef	_FLASH_DeInit
1808                     	xdef	_FLASH_Lock
1809                     	xdef	_FLASH_Unlock
1810                     	xref.b	c_lreg
1811                     	xref.b	c_x
1812                     	xref.b	c_y
1831                     	xref	c_ladd
1832                     	xref	c_cmulx
1833                     	xref	c_ltor
1834                     	xref	c_lgadd
1835                     	xref	c_rtol
1836                     	xref	c_umul
1837                     	end

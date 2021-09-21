   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  21  0002               L5_flagUartRXNE:
  22  0002 00            	dc.b	0
 120                     ; 87 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 120                     ; 88 {
 122                     .text:	section	.text,new
 123  0000               _FLASH_Unlock:
 127                     ; 90   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 129                     ; 93   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
 131  0000 a1fd          	cp	a,#253
 132  0002 2609          	jrne	L36
 133                     ; 95     FLASH->PUKR = FLASH_RASS_KEY1;
 135  0004 35565062      	mov	20578,#86
 136                     ; 96     FLASH->PUKR = FLASH_RASS_KEY2;
 138  0008 35ae5062      	mov	20578,#174
 141  000c 81            	ret	
 142  000d               L36:
 143                     ; 101     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 145  000d 35ae5064      	mov	20580,#174
 146                     ; 102     FLASH->DUKR = FLASH_RASS_KEY1;
 148  0011 35565064      	mov	20580,#86
 149                     ; 104 }
 152  0015 81            	ret	
 187                     ; 112 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 187                     ; 113 {
 188                     .text:	section	.text,new
 189  0000               _FLASH_Lock:
 193                     ; 115   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 195                     ; 118   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 197  0000 c4505f        	and	a,20575
 198  0003 c7505f        	ld	20575,a
 199                     ; 119 }
 202  0006 81            	ret	
 225                     ; 126 void FLASH_DeInit(void)
 225                     ; 127 {
 226                     .text:	section	.text,new
 227  0000               _FLASH_DeInit:
 231                     ; 128   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 233  0000 725f505a      	clr	20570
 234                     ; 129   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 236  0004 725f505b      	clr	20571
 237                     ; 130   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 239  0008 35ff505c      	mov	20572,#255
 240                     ; 131   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 242  000c 7217505f      	bres	20575,#3
 243                     ; 132   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 245  0010 7213505f      	bres	20575,#1
 246                     ; 133   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 248  0014 c6505f        	ld	a,20575
 249                     ; 134 }
 252  0017 81            	ret	
 307                     ; 142 void FLASH_ITConfig(FunctionalState NewState)
 307                     ; 143 {
 308                     .text:	section	.text,new
 309  0000               _FLASH_ITConfig:
 313                     ; 145   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 315                     ; 147   if(NewState != DISABLE)
 317  0000 4d            	tnz	a
 318  0001 2705          	jreq	L341
 319                     ; 149     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 321  0003 7212505a      	bset	20570,#1
 324  0007 81            	ret	
 325  0008               L341:
 326                     ; 153     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 328  0008 7213505a      	bres	20570,#1
 329                     ; 155 }
 332  000c 81            	ret	
 366                     ; 164 void FLASH_EraseByte(uint32_t Address)
 366                     ; 165 {
 367                     .text:	section	.text,new
 368  0000               _FLASH_EraseByte:
 370       00000000      OFST:	set	0
 373                     ; 167   assert_param(IS_FLASH_ADDRESS_OK(Address));
 375                     ; 170   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
 377  0000 1e05          	ldw	x,(OFST+5,sp)
 378  0002 7f            	clr	(x)
 379                     ; 171 }
 382  0003 81            	ret	
 425                     ; 181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 425                     ; 182 {
 426                     .text:	section	.text,new
 427  0000               _FLASH_ProgramByte:
 429       00000000      OFST:	set	0
 432                     ; 184   assert_param(IS_FLASH_ADDRESS_OK(Address));
 434                     ; 185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 436  0000 1e05          	ldw	x,(OFST+5,sp)
 437  0002 7b07          	ld	a,(OFST+7,sp)
 438  0004 f7            	ld	(x),a
 439                     ; 186 }
 442  0005 81            	ret	
 476                     ; 195 uint8_t FLASH_ReadByte(uint32_t Address)
 476                     ; 196 {
 477                     .text:	section	.text,new
 478  0000               _FLASH_ReadByte:
 480       00000000      OFST:	set	0
 483                     ; 198   assert_param(IS_FLASH_ADDRESS_OK(Address));
 485                     ; 201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 487  0000 1e05          	ldw	x,(OFST+5,sp)
 488  0002 f6            	ld	a,(x)
 491  0003 81            	ret	
 534                     ; 212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 534                     ; 213 {
 535                     .text:	section	.text,new
 536  0000               _FLASH_ProgramWord:
 538       00000000      OFST:	set	0
 541                     ; 215   assert_param(IS_FLASH_ADDRESS_OK(Address));
 543                     ; 218   FLASH->CR2 |= FLASH_CR2_WPRG;
 545  0000 721c505b      	bset	20571,#6
 546                     ; 219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 548  0004 721d505c      	bres	20572,#6
 549                     ; 222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
 551  0008 1e05          	ldw	x,(OFST+5,sp)
 552  000a 7b07          	ld	a,(OFST+7,sp)
 553  000c f7            	ld	(x),a
 554                     ; 224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
 556  000d 7b08          	ld	a,(OFST+8,sp)
 557  000f e701          	ld	(1,x),a
 558                     ; 226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
 560  0011 7b09          	ld	a,(OFST+9,sp)
 561  0013 e702          	ld	(2,x),a
 562                     ; 228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
 564  0015 7b0a          	ld	a,(OFST+10,sp)
 565  0017 e703          	ld	(3,x),a
 566                     ; 229 }
 569  0019 81            	ret	
 614                     ; 237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 614                     ; 238 {
 615                     .text:	section	.text,new
 616  0000               _FLASH_ProgramOptionByte:
 618  0000 89            	pushw	x
 619       00000000      OFST:	set	0
 622                     ; 240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 624                     ; 243   FLASH->CR2 |= FLASH_CR2_OPT;
 626  0001 721e505b      	bset	20571,#7
 627                     ; 244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 629  0005 721f505c      	bres	20572,#7
 630                     ; 247   if(Address == 0x4800)
 632  0009 a34800        	cpw	x,#18432
 633  000c 2605          	jrne	L172
 634                     ; 250     *((NEAR uint8_t*)Address) = Data;
 636  000e 7b05          	ld	a,(OFST+5,sp)
 637  0010 f7            	ld	(x),a
 639  0011 2006          	jra	L372
 640  0013               L172:
 641                     ; 255     *((NEAR uint8_t*)Address) = Data;
 643  0013 7b05          	ld	a,(OFST+5,sp)
 644  0015 f7            	ld	(x),a
 645                     ; 256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 647  0016 43            	cpl	a
 648  0017 e701          	ld	(1,x),a
 649  0019               L372:
 650                     ; 258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 652  0019 a6fd          	ld	a,#253
 653  001b cd0000        	call	_FLASH_WaitForLastOperation
 655                     ; 261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 657  001e 721f505b      	bres	20571,#7
 658                     ; 262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 660  0022 721e505c      	bset	20572,#7
 661                     ; 263 }
 664  0026 85            	popw	x
 665  0027 81            	ret	
 701                     ; 270 void FLASH_EraseOptionByte(uint16_t Address)
 701                     ; 271 {
 702                     .text:	section	.text,new
 703  0000               _FLASH_EraseOptionByte:
 705  0000 89            	pushw	x
 706       00000000      OFST:	set	0
 709                     ; 273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 711                     ; 276   FLASH->CR2 |= FLASH_CR2_OPT;
 713  0001 721e505b      	bset	20571,#7
 714                     ; 277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 716  0005 721f505c      	bres	20572,#7
 717                     ; 280   if(Address == 0x4800)
 719  0009 a34800        	cpw	x,#18432
 720  000c 2603          	jrne	L313
 721                     ; 283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 723  000e 7f            	clr	(x)
 725  000f 2005          	jra	L513
 726  0011               L313:
 727                     ; 288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 729  0011 7f            	clr	(x)
 730                     ; 289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 732  0012 a6ff          	ld	a,#255
 733  0014 e701          	ld	(1,x),a
 734  0016               L513:
 735                     ; 291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 737  0016 a6fd          	ld	a,#253
 738  0018 cd0000        	call	_FLASH_WaitForLastOperation
 740                     ; 294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 742  001b 721f505b      	bres	20571,#7
 743                     ; 295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 745  001f 721e505c      	bset	20572,#7
 746                     ; 296 }
 749  0023 85            	popw	x
 750  0024 81            	ret	
 813                     ; 303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
 813                     ; 304 {
 814                     .text:	section	.text,new
 815  0000               _FLASH_ReadOptionByte:
 817  0000 5204          	subw	sp,#4
 818       00000004      OFST:	set	4
 821                     ; 305   uint8_t value_optbyte, value_optbyte_complement = 0;
 823                     ; 306   uint16_t res_value = 0;
 825                     ; 309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 827                     ; 311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
 829  0002 f6            	ld	a,(x)
 830  0003 6b01          	ld	(OFST-3,sp),a
 832                     ; 312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
 834  0005 e601          	ld	a,(1,x)
 835  0007 6b02          	ld	(OFST-2,sp),a
 837                     ; 315   if(Address == 0x4800)	 
 839  0009 a34800        	cpw	x,#18432
 840  000c 2606          	jrne	L153
 841                     ; 317     res_value =	 value_optbyte;
 843  000e 7b01          	ld	a,(OFST-3,sp)
 844  0010 5f            	clrw	x
 845  0011 97            	ld	xl,a
 848  0012 201c          	jra	L353
 849  0014               L153:
 850                     ; 321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
 852  0014 43            	cpl	a
 853  0015 1101          	cp	a,(OFST-3,sp)
 854  0017 2614          	jrne	L553
 855                     ; 323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
 857  0019 7b01          	ld	a,(OFST-3,sp)
 858  001b 97            	ld	xl,a
 859  001c 4f            	clr	a
 860  001d 02            	rlwa	x,a
 861  001e 1f03          	ldw	(OFST-1,sp),x
 863                     ; 324       res_value = res_value | (uint16_t)value_optbyte_complement;
 865  0020 5f            	clrw	x
 866  0021 7b02          	ld	a,(OFST-2,sp)
 867  0023 97            	ld	xl,a
 868  0024 01            	rrwa	x,a
 869  0025 1a04          	or	a,(OFST+0,sp)
 870  0027 01            	rrwa	x,a
 871  0028 1a03          	or	a,(OFST-1,sp)
 872  002a 01            	rrwa	x,a
 875  002b 2003          	jra	L353
 876  002d               L553:
 877                     ; 328       res_value = FLASH_OPTIONBYTE_ERROR;
 879  002d ae5555        	ldw	x,#21845
 881  0030               L353:
 882                     ; 331   return(res_value);
 886  0030 5b04          	addw	sp,#4
 887  0032 81            	ret	
 961                     ; 340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
 961                     ; 341 {
 962                     .text:	section	.text,new
 963  0000               _FLASH_SetLowPowerMode:
 965  0000 88            	push	a
 966       00000000      OFST:	set	0
 969                     ; 343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
 971                     ; 346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
 973  0001 c6505a        	ld	a,20570
 974  0004 a4f3          	and	a,#243
 975  0006 c7505a        	ld	20570,a
 976                     ; 349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
 978  0009 c6505a        	ld	a,20570
 979  000c 1a01          	or	a,(OFST+1,sp)
 980  000e c7505a        	ld	20570,a
 981                     ; 350 }
 984  0011 84            	pop	a
 985  0012 81            	ret	
1043                     ; 358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1043                     ; 359 {
1044                     .text:	section	.text,new
1045  0000               _FLASH_SetProgrammingTime:
1049                     ; 361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1051                     ; 363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1053  0000 7211505a      	bres	20570,#0
1054                     ; 364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1056  0004 ca505a        	or	a,20570
1057  0007 c7505a        	ld	20570,a
1058                     ; 365 }
1061  000a 81            	ret	
1086                     ; 372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1086                     ; 373 {
1087                     .text:	section	.text,new
1088  0000               _FLASH_GetLowPowerMode:
1092                     ; 374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1094  0000 c6505a        	ld	a,20570
1095  0003 a40c          	and	a,#12
1098  0005 81            	ret	
1123                     ; 382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1123                     ; 383 {
1124                     .text:	section	.text,new
1125  0000               _FLASH_GetProgrammingTime:
1129                     ; 384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1131  0000 c6505a        	ld	a,20570
1132  0003 a401          	and	a,#1
1135  0005 81            	ret	
1169                     ; 392 uint32_t FLASH_GetBootSize(void)
1169                     ; 393 {
1170                     .text:	section	.text,new
1171  0000               _FLASH_GetBootSize:
1173  0000 5204          	subw	sp,#4
1174       00000004      OFST:	set	4
1177                     ; 394   uint32_t temp = 0;
1179                     ; 397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1181  0002 c6505d        	ld	a,20573
1182  0005 5f            	clrw	x
1183  0006 97            	ld	xl,a
1184  0007 90ae0200      	ldw	y,#512
1185  000b cd0000        	call	c_umul
1187  000e 96            	ldw	x,sp
1188  000f 5c            	incw	x
1189  0010 cd0000        	call	c_rtol
1192                     ; 400   if(FLASH->FPR == 0xFF)
1194  0013 c6505d        	ld	a,20573
1195  0016 4c            	inc	a
1196  0017 260d          	jrne	L774
1197                     ; 402     temp += 512;
1199  0019 ae0200        	ldw	x,#512
1200  001c bf02          	ldw	c_lreg+2,x
1201  001e 5f            	clrw	x
1202  001f bf00          	ldw	c_lreg,x
1203  0021 96            	ldw	x,sp
1204  0022 5c            	incw	x
1205  0023 cd0000        	call	c_lgadd
1208  0026               L774:
1209                     ; 406   return(temp);
1211  0026 96            	ldw	x,sp
1212  0027 5c            	incw	x
1213  0028 cd0000        	call	c_ltor
1217  002b 5b04          	addw	sp,#4
1218  002d 81            	ret	
1320                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1320                     ; 418 {
1321                     .text:	section	.text,new
1322  0000               _FLASH_GetFlagStatus:
1324       00000001      OFST:	set	1
1327                     ; 419   FlagStatus status = RESET;
1329                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1331                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1333  0000 c4505f        	and	a,20575
1334  0003 2702          	jreq	L745
1335                     ; 426     status = SET; /* FLASH_FLAG is set */
1337  0005 a601          	ld	a,#1
1340  0007               L745:
1341                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
1344                     ; 434   return status;
1348  0007 81            	ret	
1433                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1433                     ; 550 {
1434                     .text:	section	.text,new
1435  0000               _FLASH_WaitForLastOperation:
1437  0000 5203          	subw	sp,#3
1438       00000003      OFST:	set	3
1441                     ; 551   uint8_t flagstatus = 0x00;
1443  0002 0f03          	clr	(OFST+0,sp)
1445                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
1447  0004 aeffff        	ldw	x,#65535
1448                     ; 576   UNUSED(FLASH_MemType);
1451  0007 2008          	jra	L516
1452  0009               L316:
1453                     ; 579     flagstatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
1455  0009 c6505f        	ld	a,20575
1456  000c a405          	and	a,#5
1457  000e 6b03          	ld	(OFST+0,sp),a
1459                     ; 580     timeout--;
1461  0010 5a            	decw	x
1462  0011               L516:
1463  0011 1f01          	ldw	(OFST-2,sp),x
1465                     ; 577   while((flagstatus == 0x00) && (timeout != 0x00))
1467  0013 7b03          	ld	a,(OFST+0,sp)
1468  0015 2604          	jrne	L126
1470  0017 1e01          	ldw	x,(OFST-2,sp)
1471  0019 26ee          	jrne	L316
1472  001b               L126:
1473                     ; 584   if(timeout == 0x00 )
1475  001b 1e01          	ldw	x,(OFST-2,sp)
1476  001d 2602          	jrne	L326
1477                     ; 586     flagstatus = FLASH_STATUS_TIMEOUT;
1479  001f a602          	ld	a,#2
1481  0021               L326:
1482                     ; 589   return((FLASH_Status_TypeDef)flagstatus);
1486  0021 5b03          	addw	sp,#3
1487  0023 81            	ret	
1550                     ; 599 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1550                     ; 600 {
1551                     .text:	section	.text,new
1552  0000               _FLASH_EraseBlock:
1554  0000 89            	pushw	x
1555  0001 5206          	subw	sp,#6
1556       00000006      OFST:	set	6
1559                     ; 601   uint32_t startaddress = 0;
1561                     ; 611   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1563                     ; 612   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1565  0003 7b0b          	ld	a,(OFST+5,sp)
1566  0005 a1fd          	cp	a,#253
1567  0007 2605          	jrne	L756
1568                     ; 614     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1570                     ; 615     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1572  0009 ae8000        	ldw	x,#32768
1574  000c 2003          	jra	L166
1575  000e               L756:
1576                     ; 619     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1578                     ; 620     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1580  000e ae4000        	ldw	x,#16384
1581  0011               L166:
1582  0011 1f05          	ldw	(OFST-1,sp),x
1583  0013 5f            	clrw	x
1584  0014 1f03          	ldw	(OFST-3,sp),x
1586                     ; 628     pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1588  0016 a640          	ld	a,#64
1589  0018 1e07          	ldw	x,(OFST+1,sp)
1590  001a cd0000        	call	c_cmulx
1592  001d 96            	ldw	x,sp
1593  001e 1c0003        	addw	x,#OFST-3
1594  0021 cd0000        	call	c_ladd
1596  0024 be02          	ldw	x,c_lreg+2
1597  0026 1f01          	ldw	(OFST-5,sp),x
1599                     ; 632   FLASH->CR2 |= FLASH_CR2_ERASE;
1601  0028 721a505b      	bset	20571,#5
1602                     ; 633   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1604  002c 721b505c      	bres	20572,#5
1605                     ; 637     *pwFlash = (uint32_t)0;
1607  0030 4f            	clr	a
1608  0031 e703          	ld	(3,x),a
1609  0033 e702          	ld	(2,x),a
1610  0035 e701          	ld	(1,x),a
1611  0037 f7            	ld	(x),a
1612                     ; 645 }
1615  0038 5b08          	addw	sp,#8
1616  003a 81            	ret	
1720                     ; 656 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
1720                     ; 657                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1720                     ; 658 {
1721                     .text:	section	.text,new
1722  0000               _FLASH_ProgramBlock:
1724  0000 89            	pushw	x
1725  0001 5206          	subw	sp,#6
1726       00000006      OFST:	set	6
1729                     ; 659   uint16_t Count = 0;
1731                     ; 660   uint32_t startaddress = 0;
1733                     ; 663   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1735                     ; 664   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
1737                     ; 665   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1739  0003 7b0b          	ld	a,(OFST+5,sp)
1740  0005 a1fd          	cp	a,#253
1741  0007 2605          	jrne	L537
1742                     ; 667     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1744                     ; 668     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1746  0009 ae8000        	ldw	x,#32768
1748  000c 2003          	jra	L737
1749  000e               L537:
1750                     ; 672     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1752                     ; 673     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1754  000e ae4000        	ldw	x,#16384
1755  0011               L737:
1756  0011 1f03          	ldw	(OFST-3,sp),x
1757  0013 5f            	clrw	x
1758  0014 1f01          	ldw	(OFST-5,sp),x
1760                     ; 677   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1762  0016 a640          	ld	a,#64
1763  0018 1e07          	ldw	x,(OFST+1,sp)
1764  001a cd0000        	call	c_cmulx
1766  001d 96            	ldw	x,sp
1767  001e 5c            	incw	x
1768  001f cd0000        	call	c_lgadd
1771                     ; 680   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
1773  0022 7b0c          	ld	a,(OFST+6,sp)
1774  0024 260a          	jrne	L147
1775                     ; 683     FLASH->CR2 |= FLASH_CR2_PRG;
1777  0026 7210505b      	bset	20571,#0
1778                     ; 684     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
1780  002a 7211505c      	bres	20572,#0
1782  002e 2008          	jra	L347
1783  0030               L147:
1784                     ; 689     FLASH->CR2 |= FLASH_CR2_FPRG;
1786  0030 7218505b      	bset	20571,#4
1787                     ; 690     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
1789  0034 7219505c      	bres	20572,#4
1790  0038               L347:
1791                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1793  0038 5f            	clrw	x
1794  0039 1f05          	ldw	(OFST-1,sp),x
1796  003b               L547:
1797                     ; 696     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1799  003b 1e0d          	ldw	x,(OFST+7,sp)
1800  003d 72fb05        	addw	x,(OFST-1,sp)
1801  0040 f6            	ld	a,(x)
1802  0041 1e03          	ldw	x,(OFST-3,sp)
1803  0043 72fb05        	addw	x,(OFST-1,sp)
1804  0046 f7            	ld	(x),a
1805                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1807  0047 1e05          	ldw	x,(OFST-1,sp)
1808  0049 5c            	incw	x
1809  004a 1f05          	ldw	(OFST-1,sp),x
1813  004c a30040        	cpw	x,#64
1814  004f 25ea          	jrult	L547
1815                     ; 698 }
1818  0051 5b08          	addw	sp,#8
1819  0053 81            	ret	
1832                     	xdef	_FLASH_WaitForLastOperation
1833                     	xdef	_FLASH_ProgramBlock
1834                     	xdef	_FLASH_EraseBlock
1835                     	xdef	_FLASH_GetFlagStatus
1836                     	xdef	_FLASH_GetBootSize
1837                     	xdef	_FLASH_GetProgrammingTime
1838                     	xdef	_FLASH_GetLowPowerMode
1839                     	xdef	_FLASH_SetProgrammingTime
1840                     	xdef	_FLASH_SetLowPowerMode
1841                     	xdef	_FLASH_EraseOptionByte
1842                     	xdef	_FLASH_ProgramOptionByte
1843                     	xdef	_FLASH_ReadOptionByte
1844                     	xdef	_FLASH_ProgramWord
1845                     	xdef	_FLASH_ReadByte
1846                     	xdef	_FLASH_ProgramByte
1847                     	xdef	_FLASH_EraseByte
1848                     	xdef	_FLASH_ITConfig
1849                     	xdef	_FLASH_DeInit
1850                     	xdef	_FLASH_Lock
1851                     	xdef	_FLASH_Unlock
1852                     	xref.b	c_lreg
1853                     	xref.b	c_x
1854                     	xref.b	c_y
1873                     	xref	c_ladd
1874                     	xref	c_cmulx
1875                     	xref	c_ltor
1876                     	xref	c_lgadd
1877                     	xref	c_rtol
1878                     	xref	c_umul
1879                     	end

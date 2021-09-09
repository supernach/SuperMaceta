   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  46                     ; 50 void SPI_DeInit(void)
  46                     ; 51 {
  48                     .text:	section	.text,new
  49  0000               _SPI_DeInit:
  53                     ; 52   SPI->CR1    = SPI_CR1_RESET_VALUE;
  55  0000 725f5200      	clr	20992
  56                     ; 53   SPI->CR2    = SPI_CR2_RESET_VALUE;
  58  0004 725f5201      	clr	20993
  59                     ; 54   SPI->ICR    = SPI_ICR_RESET_VALUE;
  61  0008 725f5202      	clr	20994
  62                     ; 55   SPI->SR     = SPI_SR_RESET_VALUE;
  64  000c 35025203      	mov	20995,#2
  65                     ; 56   SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  67  0010 35075205      	mov	20997,#7
  68                     ; 57 }
  71  0014 81            	ret	
 387                     ; 78 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 387                     ; 79 {
 388                     .text:	section	.text,new
 389  0000               _SPI_Init:
 391  0000 89            	pushw	x
 392  0001 88            	push	a
 393       00000001      OFST:	set	1
 396                     ; 81   assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 398                     ; 82   assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 400                     ; 83   assert_param(IS_SPI_MODE_OK(Mode));
 402                     ; 84   assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 404                     ; 85   assert_param(IS_SPI_PHASE_OK(ClockPhase));
 406                     ; 86   assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 408                     ; 87   assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 410                     ; 88   assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 412                     ; 91   SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 412                     ; 92                        (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 414  0002 7b07          	ld	a,(OFST+6,sp)
 415  0004 1a08          	or	a,(OFST+7,sp)
 416  0006 6b01          	ld	(OFST+0,sp),a
 418  0008 9f            	ld	a,xl
 419  0009 1a02          	or	a,(OFST+1,sp)
 420  000b 1a01          	or	a,(OFST+0,sp)
 421  000d c75200        	ld	20992,a
 422                     ; 95   SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 424  0010 7b09          	ld	a,(OFST+8,sp)
 425  0012 1a0a          	or	a,(OFST+9,sp)
 426  0014 c75201        	ld	20993,a
 427                     ; 97   if (Mode == SPI_MODE_MASTER)
 429  0017 7b06          	ld	a,(OFST+5,sp)
 430  0019 a104          	cp	a,#4
 431  001b 2606          	jrne	L302
 432                     ; 99     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 434  001d 72105201      	bset	20993,#0
 436  0021 2004          	jra	L502
 437  0023               L302:
 438                     ; 103     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 440  0023 72115201      	bres	20993,#0
 441  0027               L502:
 442                     ; 107   SPI->CR1 |= (uint8_t)(Mode);
 444  0027 c65200        	ld	a,20992
 445  002a 1a06          	or	a,(OFST+5,sp)
 446  002c c75200        	ld	20992,a
 447                     ; 110   SPI->CRCPR = (uint8_t)CRCPolynomial;
 449  002f 7b0b          	ld	a,(OFST+10,sp)
 450  0031 c75205        	ld	20997,a
 451                     ; 111 }
 454  0034 5b03          	addw	sp,#3
 455  0036 81            	ret	
 510                     ; 119 void SPI_Cmd(FunctionalState NewState)
 510                     ; 120 {
 511                     .text:	section	.text,new
 512  0000               _SPI_Cmd:
 516                     ; 122   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 518                     ; 124   if (NewState != DISABLE)
 520  0000 4d            	tnz	a
 521  0001 2705          	jreq	L532
 522                     ; 126     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 524  0003 721c5200      	bset	20992,#6
 527  0007 81            	ret	
 528  0008               L532:
 529                     ; 130     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 531  0008 721d5200      	bres	20992,#6
 532                     ; 132 }
 535  000c 81            	ret	
 644                     ; 141 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 644                     ; 142 {
 645                     .text:	section	.text,new
 646  0000               _SPI_ITConfig:
 648  0000 89            	pushw	x
 649  0001 88            	push	a
 650       00000001      OFST:	set	1
 653                     ; 143   uint8_t itpos = 0;
 655                     ; 145   assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 657                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 659                     ; 149   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 661  0002 9e            	ld	a,xh
 662  0003 a40f          	and	a,#15
 663  0005 5f            	clrw	x
 664  0006 97            	ld	xl,a
 665  0007 a601          	ld	a,#1
 666  0009 5d            	tnzw	x
 667  000a 2704          	jreq	L41
 668  000c               L61:
 669  000c 48            	sll	a
 670  000d 5a            	decw	x
 671  000e 26fc          	jrne	L61
 672  0010               L41:
 673  0010 6b01          	ld	(OFST+0,sp),a
 675                     ; 151   if (NewState != DISABLE)
 677  0012 0d03          	tnz	(OFST+2,sp)
 678  0014 2707          	jreq	L113
 679                     ; 153     SPI->ICR |= itpos; /* Enable interrupt*/
 681  0016 c65202        	ld	a,20994
 682  0019 1a01          	or	a,(OFST+0,sp)
 684  001b 2004          	jra	L313
 685  001d               L113:
 686                     ; 157     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 688  001d 43            	cpl	a
 689  001e c45202        	and	a,20994
 690  0021               L313:
 691  0021 c75202        	ld	20994,a
 692                     ; 159 }
 695  0024 5b03          	addw	sp,#3
 696  0026 81            	ret	
 730                     ; 166 void SPI_SendData(uint8_t Data)
 730                     ; 167 {
 731                     .text:	section	.text,new
 732  0000               _SPI_SendData:
 736                     ; 168   SPI->DR = Data; /* Write in the DR register the data to be sent*/
 738  0000 c75204        	ld	20996,a
 739                     ; 169 }
 742  0003 81            	ret	
 765                     ; 176 uint8_t SPI_ReceiveData(void)
 765                     ; 177 {
 766                     .text:	section	.text,new
 767  0000               _SPI_ReceiveData:
 771                     ; 178   return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
 773  0000 c65204        	ld	a,20996
 776  0003 81            	ret	
 812                     ; 187 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 812                     ; 188 {
 813                     .text:	section	.text,new
 814  0000               _SPI_NSSInternalSoftwareCmd:
 818                     ; 190   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 820                     ; 192   if (NewState != DISABLE)
 822  0000 4d            	tnz	a
 823  0001 2705          	jreq	L163
 824                     ; 194     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 826  0003 72105201      	bset	20993,#0
 829  0007 81            	ret	
 830  0008               L163:
 831                     ; 198     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 833  0008 72115201      	bres	20993,#0
 834                     ; 200 }
 837  000c 81            	ret	
 860                     ; 207 void SPI_TransmitCRC(void)
 860                     ; 208 {
 861                     .text:	section	.text,new
 862  0000               _SPI_TransmitCRC:
 866                     ; 209   SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 868  0000 72185201      	bset	20993,#4
 869                     ; 210 }
 872  0004 81            	ret	
 908                     ; 218 void SPI_CalculateCRCCmd(FunctionalState NewState)
 908                     ; 219 {
 909                     .text:	section	.text,new
 910  0000               _SPI_CalculateCRCCmd:
 914                     ; 221   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 916                     ; 223   if (NewState != DISABLE)
 918  0000 4d            	tnz	a
 919  0001 2705          	jreq	L314
 920                     ; 225     SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
 922  0003 721a5201      	bset	20993,#5
 925  0007 81            	ret	
 926  0008               L314:
 927                     ; 229     SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
 929  0008 721b5201      	bres	20993,#5
 930                     ; 231 }
 933  000c 81            	ret	
 997                     ; 238 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
 997                     ; 239 {
 998                     .text:	section	.text,new
 999  0000               _SPI_GetCRC:
1001       00000001      OFST:	set	1
1004                     ; 240   uint8_t crcreg = 0;
1006                     ; 243   assert_param(IS_SPI_CRC_OK(SPI_CRC));
1008                     ; 245   if (SPI_CRC != SPI_CRC_RX)
1010  0000 4d            	tnz	a
1011  0001 2704          	jreq	L154
1012                     ; 247     crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1014  0003 c65207        	ld	a,20999
1018  0006 81            	ret	
1019  0007               L154:
1020                     ; 251     crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1022  0007 c65206        	ld	a,20998
1024                     ; 255   return crcreg;
1028  000a 81            	ret	
1053                     ; 263 void SPI_ResetCRC(void)
1053                     ; 264 {
1054                     .text:	section	.text,new
1055  0000               _SPI_ResetCRC:
1059                     ; 267   SPI_CalculateCRCCmd(ENABLE);
1061  0000 a601          	ld	a,#1
1062  0002 cd0000        	call	_SPI_CalculateCRCCmd
1064                     ; 270   SPI_Cmd(ENABLE);
1066  0005 a601          	ld	a,#1
1068                     ; 271 }
1071  0007 cc0000        	jp	_SPI_Cmd
1095                     ; 278 uint8_t SPI_GetCRCPolynomial(void)
1095                     ; 279 {
1096                     .text:	section	.text,new
1097  0000               _SPI_GetCRCPolynomial:
1101                     ; 280   return SPI->CRCPR; /* Return the CRC polynomial register */
1103  0000 c65205        	ld	a,20997
1106  0003 81            	ret	
1162                     ; 288 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1162                     ; 289 {
1163                     .text:	section	.text,new
1164  0000               _SPI_BiDirectionalLineConfig:
1168                     ; 291   assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1170                     ; 293   if (SPI_Direction != SPI_DIRECTION_RX)
1172  0000 4d            	tnz	a
1173  0001 2705          	jreq	L325
1174                     ; 295     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1176  0003 721c5201      	bset	20993,#6
1179  0007 81            	ret	
1180  0008               L325:
1181                     ; 299     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1183  0008 721d5201      	bres	20993,#6
1184                     ; 301 }
1187  000c 81            	ret	
1308                     ; 311 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1308                     ; 312 {
1309                     .text:	section	.text,new
1310  0000               _SPI_GetFlagStatus:
1312       00000001      OFST:	set	1
1315                     ; 313   FlagStatus status = RESET;
1317                     ; 315   assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1319                     ; 318   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1321  0000 c45203        	and	a,20995
1322  0003 2702          	jreq	L306
1323                     ; 320     status = SET; /* SPI_FLAG is set */
1325  0005 a601          	ld	a,#1
1328  0007               L306:
1329                     ; 324     status = RESET; /* SPI_FLAG is reset*/
1332                     ; 328   return status;
1336  0007 81            	ret	
1371                     ; 346 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1371                     ; 347 {
1372                     .text:	section	.text,new
1373  0000               _SPI_ClearFlag:
1377                     ; 348   assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1379                     ; 350   SPI->SR = (uint8_t)(~SPI_FLAG);
1381  0000 43            	cpl	a
1382  0001 c75203        	ld	20995,a
1383                     ; 351 }
1386  0004 81            	ret	
1468                     ; 366 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1468                     ; 367 {
1469                     .text:	section	.text,new
1470  0000               _SPI_GetITStatus:
1472  0000 88            	push	a
1473  0001 89            	pushw	x
1474       00000002      OFST:	set	2
1477                     ; 368   ITStatus pendingbitstatus = RESET;
1479                     ; 369   uint8_t itpos = 0;
1481                     ; 370   uint8_t itmask1 = 0;
1483                     ; 371   uint8_t itmask2 = 0;
1485                     ; 372   uint8_t enablestatus = 0;
1487                     ; 373   assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1489                     ; 375   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1491  0002 a40f          	and	a,#15
1492  0004 5f            	clrw	x
1493  0005 97            	ld	xl,a
1494  0006 a601          	ld	a,#1
1495  0008 5d            	tnzw	x
1496  0009 2704          	jreq	L45
1497  000b               L65:
1498  000b 48            	sll	a
1499  000c 5a            	decw	x
1500  000d 26fc          	jrne	L65
1501  000f               L45:
1502  000f 6b01          	ld	(OFST-1,sp),a
1504                     ; 378   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1506  0011 7b03          	ld	a,(OFST+1,sp)
1507  0013 4e            	swap	a
1508  0014 a40f          	and	a,#15
1509  0016 6b02          	ld	(OFST+0,sp),a
1511                     ; 380   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1513  0018 5f            	clrw	x
1514  0019 97            	ld	xl,a
1515  001a a601          	ld	a,#1
1516  001c 5d            	tnzw	x
1517  001d 2704          	jreq	L06
1518  001f               L26:
1519  001f 48            	sll	a
1520  0020 5a            	decw	x
1521  0021 26fc          	jrne	L26
1522  0023               L06:
1524                     ; 382   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1526  0023 c45203        	and	a,20995
1527  0026 6b02          	ld	(OFST+0,sp),a
1529                     ; 384   if (((SPI->ICR & itpos) != RESET) && enablestatus)
1531  0028 c65202        	ld	a,20994
1532  002b 1501          	bcp	a,(OFST-1,sp)
1533  002d 2708          	jreq	L766
1535  002f 7b02          	ld	a,(OFST+0,sp)
1536  0031 2704          	jreq	L766
1537                     ; 387     pendingbitstatus = SET;
1539  0033 a601          	ld	a,#1
1542  0035 2001          	jra	L176
1543  0037               L766:
1544                     ; 392     pendingbitstatus = RESET;
1546  0037 4f            	clr	a
1548  0038               L176:
1549                     ; 395   return  pendingbitstatus;
1553  0038 5b03          	addw	sp,#3
1554  003a 81            	ret	
1599                     ; 412 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1599                     ; 413 {
1600                     .text:	section	.text,new
1601  0000               _SPI_ClearITPendingBit:
1603       00000001      OFST:	set	1
1606                     ; 414   uint8_t itpos = 0;
1608                     ; 415   assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
1610                     ; 420   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
1612  0000 4e            	swap	a
1613  0001 a40f          	and	a,#15
1614  0003 5f            	clrw	x
1615  0004 97            	ld	xl,a
1616  0005 a601          	ld	a,#1
1617  0007 5d            	tnzw	x
1618  0008 2704          	jreq	L66
1619  000a               L07:
1620  000a 48            	sll	a
1621  000b 5a            	decw	x
1622  000c 26fc          	jrne	L07
1623  000e               L66:
1625                     ; 422   SPI->SR = (uint8_t)(~itpos);
1627  000e 43            	cpl	a
1628  000f c75203        	ld	20995,a
1629                     ; 424 }
1632  0012 81            	ret	
1645                     	xdef	_SPI_ClearITPendingBit
1646                     	xdef	_SPI_GetITStatus
1647                     	xdef	_SPI_ClearFlag
1648                     	xdef	_SPI_GetFlagStatus
1649                     	xdef	_SPI_BiDirectionalLineConfig
1650                     	xdef	_SPI_GetCRCPolynomial
1651                     	xdef	_SPI_ResetCRC
1652                     	xdef	_SPI_GetCRC
1653                     	xdef	_SPI_CalculateCRCCmd
1654                     	xdef	_SPI_TransmitCRC
1655                     	xdef	_SPI_NSSInternalSoftwareCmd
1656                     	xdef	_SPI_ReceiveData
1657                     	xdef	_SPI_SendData
1658                     	xdef	_SPI_ITConfig
1659                     	xdef	_SPI_Cmd
1660                     	xdef	_SPI_Init
1661                     	xdef	_SPI_DeInit
1680                     	end

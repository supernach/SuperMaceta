   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     .const:	section	.text
  19  0000               _APR_Array:
  20  0000 00            	dc.b	0
  21  0001 1e            	dc.b	30
  22  0002 1e            	dc.b	30
  23  0003 1e            	dc.b	30
  24  0004 1e            	dc.b	30
  25  0005 1e            	dc.b	30
  26  0006 1e            	dc.b	30
  27  0007 1e            	dc.b	30
  28  0008 1e            	dc.b	30
  29  0009 1e            	dc.b	30
  30  000a 1e            	dc.b	30
  31  000b 1e            	dc.b	30
  32  000c 1e            	dc.b	30
  33  000d 3d            	dc.b	61
  34  000e 17            	dc.b	23
  35  000f 17            	dc.b	23
  36  0010 3e            	dc.b	62
  37  0011               _TBR_Array:
  38  0011 00            	dc.b	0
  39  0012 01            	dc.b	1
  40  0013 02            	dc.b	2
  41  0014 03            	dc.b	3
  42  0015 04            	dc.b	4
  43  0016 05            	dc.b	5
  44  0017 06            	dc.b	6
  45  0018 07            	dc.b	7
  46  0019 08            	dc.b	8
  47  001a 09            	dc.b	9
  48  001b 0a            	dc.b	10
  49  001c 0b            	dc.b	11
  50  001d 0c            	dc.b	12
  51  001e 0c            	dc.b	12
  52  001f 0e            	dc.b	14
  53  0020 0f            	dc.b	15
  54  0021 0f            	dc.b	15
  83                     ; 73 void AWU_DeInit(void)
  83                     ; 74 {
  85                     .text:	section	.text,new
  86  0000               _AWU_DeInit:
  90                     ; 75   AWU->CSR = AWU_CSR_RESET_VALUE;
  92  0000 725f50f0      	clr	20720
  93                     ; 76   AWU->APR = AWU_APR_RESET_VALUE;
  95  0004 353f50f1      	mov	20721,#63
  96                     ; 77   AWU->TBR = AWU_TBR_RESET_VALUE;
  98  0008 725f50f2      	clr	20722
  99                     ; 78 }
 102  000c 81            	ret	
 264                     ; 88 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 264                     ; 89 {
 265                     .text:	section	.text,new
 266  0000               _AWU_Init:
 268  0000 88            	push	a
 269       00000000      OFST:	set	0
 272                     ; 91   assert_param(IS_AWU_TIMEBASE_OK(AWU_TimeBase));
 274                     ; 94   AWU->CSR |= AWU_CSR_AWUEN;
 276  0001 721850f0      	bset	20720,#4
 277                     ; 97   AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
 279  0005 c650f2        	ld	a,20722
 280  0008 a4f0          	and	a,#240
 281  000a c750f2        	ld	20722,a
 282                     ; 98   AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
 284  000d 7b01          	ld	a,(OFST+1,sp)
 285  000f 5f            	clrw	x
 286  0010 97            	ld	xl,a
 287  0011 c650f2        	ld	a,20722
 288  0014 da0011        	or	a,(_TBR_Array,x)
 289  0017 c750f2        	ld	20722,a
 290                     ; 101   AWU->APR &= (uint8_t)(~AWU_APR_APR);
 292  001a c650f1        	ld	a,20721
 293  001d a4c0          	and	a,#192
 294  001f c750f1        	ld	20721,a
 295                     ; 102   AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
 297  0022 7b01          	ld	a,(OFST+1,sp)
 298  0024 5f            	clrw	x
 299  0025 97            	ld	xl,a
 300  0026 c650f1        	ld	a,20721
 301  0029 da0000        	or	a,(_APR_Array,x)
 302  002c c750f1        	ld	20721,a
 303                     ; 103 }
 306  002f 84            	pop	a
 307  0030 81            	ret	
 362                     ; 112 void AWU_Cmd(FunctionalState NewState)
 362                     ; 113 {
 363                     .text:	section	.text,new
 364  0000               _AWU_Cmd:
 368                     ; 114   if (NewState != DISABLE)
 370  0000 4d            	tnz	a
 371  0001 2705          	jreq	L331
 372                     ; 117     AWU->CSR |= AWU_CSR_AWUEN;
 374  0003 721850f0      	bset	20720,#4
 377  0007 81            	ret	
 378  0008               L331:
 379                     ; 122     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 381  0008 721950f0      	bres	20720,#4
 382                     ; 124 }
 385  000c 81            	ret	
 438                     	switch	.const
 439  0022               L41:
 440  0022 000003e8      	dc.l	1000
 441                     ; 139 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
 441                     ; 140 {
 442                     .text:	section	.text,new
 443  0000               _AWU_LSICalibrationConfig:
 445  0000 5206          	subw	sp,#6
 446       00000006      OFST:	set	6
 449                     ; 141   uint16_t lsifreqkhz = 0x0;
 451                     ; 142   uint16_t A = 0x0;
 453                     ; 145   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 455                     ; 147   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 457  0002 96            	ldw	x,sp
 458  0003 1c0009        	addw	x,#OFST+3
 459  0006 cd0000        	call	c_ltor
 461  0009 ae0022        	ldw	x,#L41
 462  000c cd0000        	call	c_ludv
 464  000f be02          	ldw	x,c_lreg+2
 465  0011 1f03          	ldw	(OFST-3,sp),x
 467                     ; 151   A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 469  0013 54            	srlw	x
 470  0014 54            	srlw	x
 471  0015 1f05          	ldw	(OFST-1,sp),x
 473                     ; 153   if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
 475  0017 58            	sllw	x
 476  0018 58            	sllw	x
 477  0019 1f01          	ldw	(OFST-5,sp),x
 479  001b 1e03          	ldw	x,(OFST-3,sp)
 480  001d 72f001        	subw	x,(OFST-5,sp)
 481  0020 1605          	ldw	y,(OFST-1,sp)
 482  0022 9058          	sllw	y
 483  0024 905c          	incw	y
 484  0026 cd0000        	call	c_imul
 486  0029 1605          	ldw	y,(OFST-1,sp)
 487  002b 9058          	sllw	y
 488  002d bf00          	ldw	c_x,x
 489  002f 9058          	sllw	y
 490  0031 90b300        	cpw	y,c_x
 491  0034 7b06          	ld	a,(OFST+0,sp)
 492  0036 2504          	jrult	L561
 493                     ; 155     AWU->APR = (uint8_t)(A - 2U);
 495  0038 a002          	sub	a,#2
 497  003a 2001          	jra	L761
 498  003c               L561:
 499                     ; 159     AWU->APR = (uint8_t)(A - 1U);
 501  003c 4a            	dec	a
 502  003d               L761:
 503  003d c750f1        	ld	20721,a
 504                     ; 161 }
 507  0040 5b06          	addw	sp,#6
 508  0042 81            	ret	
 531                     ; 168 void AWU_IdleModeEnable(void)
 531                     ; 169 {
 532                     .text:	section	.text,new
 533  0000               _AWU_IdleModeEnable:
 537                     ; 171   AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 539  0000 721950f0      	bres	20720,#4
 540                     ; 174   AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
 542  0004 35f050f2      	mov	20722,#240
 543                     ; 175 }
 546  0008 81            	ret	
 590                     ; 183 FlagStatus AWU_GetFlagStatus(void)
 590                     ; 184 {
 591                     .text:	section	.text,new
 592  0000               _AWU_GetFlagStatus:
 596                     ; 185   return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
 598  0000 720a50f002    	btjt	20720,#5,L22
 599  0005 4f            	clr	a
 601  0006 81            	ret	
 602  0007               L22:
 603  0007 a601          	ld	a,#1
 606  0009 81            	ret	
 641                     	xdef	_TBR_Array
 642                     	xdef	_APR_Array
 643                     	xdef	_AWU_GetFlagStatus
 644                     	xdef	_AWU_IdleModeEnable
 645                     	xdef	_AWU_LSICalibrationConfig
 646                     	xdef	_AWU_Cmd
 647                     	xdef	_AWU_Init
 648                     	xdef	_AWU_DeInit
 649                     	xref.b	c_lreg
 650                     	xref.b	c_x
 669                     	xref	c_imul
 670                     	xref	c_ludv
 671                     	xref	c_ltor
 672                     	end

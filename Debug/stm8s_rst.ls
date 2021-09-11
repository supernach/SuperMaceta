   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 00            	dc.b	0
 151                     ; 54 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
 151                     ; 55 {
 153                     .text:	section	.text,new
 154  0000               _RST_GetFlagStatus:
 158                     ; 57   assert_param(IS_RST_FLAG_OK(RST_Flag));
 160                     ; 60   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
 162  0000 c450b3        	and	a,20659
 163  0003 2702          	jreq	L01
 164  0005 a601          	ld	a,#1
 165  0007               L01:
 168  0007 81            	ret	
 203                     ; 69 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
 203                     ; 70 {
 204                     .text:	section	.text,new
 205  0000               _RST_ClearFlag:
 209                     ; 72   assert_param(IS_RST_FLAG_OK(RST_Flag));
 211                     ; 74   RST->SR = (uint8_t)RST_Flag;
 213  0000 c750b3        	ld	20659,a
 214                     ; 75 }
 217  0003 81            	ret	
 230                     	xdef	_RST_ClearFlag
 231                     	xdef	_RST_GetFlagStatus
 250                     	end

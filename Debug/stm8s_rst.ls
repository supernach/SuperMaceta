   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
 120                     ; 54 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
 120                     ; 55 {
 122                     .text:	section	.text,new
 123  0000               _RST_GetFlagStatus:
 127                     ; 57   assert_param(IS_RST_FLAG_OK(RST_Flag));
 129                     ; 60   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
 131  0000 c450b3        	and	a,20659
 132  0003 2702          	jreq	L01
 133  0005 a601          	ld	a,#1
 134  0007               L01:
 137  0007 81            	ret	
 172                     ; 69 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
 172                     ; 70 {
 173                     .text:	section	.text,new
 174  0000               _RST_ClearFlag:
 178                     ; 72   assert_param(IS_RST_FLAG_OK(RST_Flag));
 180                     ; 74   RST->SR = (uint8_t)RST_Flag;
 182  0000 c750b3        	ld	20659,a
 183                     ; 75 }
 186  0003 81            	ret	
 199                     	xdef	_RST_ClearFlag
 200                     	xdef	_RST_GetFlagStatus
 219                     	end

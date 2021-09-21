   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  21  0002               L5_flagUartRXNE:
  22  0002 00            	dc.b	0
 162                     ; 54 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
 162                     ; 55 {
 164                     .text:	section	.text,new
 165  0000               _RST_GetFlagStatus:
 169                     ; 57   assert_param(IS_RST_FLAG_OK(RST_Flag));
 171                     ; 60   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
 173  0000 c450b3        	and	a,20659
 174  0003 2702          	jreq	L01
 175  0005 a601          	ld	a,#1
 176  0007               L01:
 179  0007 81            	ret	
 214                     ; 69 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
 214                     ; 70 {
 215                     .text:	section	.text,new
 216  0000               _RST_ClearFlag:
 220                     ; 72   assert_param(IS_RST_FLAG_OK(RST_Flag));
 222                     ; 74   RST->SR = (uint8_t)RST_Flag;
 224  0000 c750b3        	ld	20659,a
 225                     ; 75 }
 228  0003 81            	ret	
 241                     	xdef	_RST_ClearFlag
 242                     	xdef	_RST_GetFlagStatus
 261                     	end

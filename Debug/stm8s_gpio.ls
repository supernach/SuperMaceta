   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 00            	dc.b	0
 143                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 143                     ; 54 {
 145                     .text:	section	.text,new
 146  0000               _GPIO_DeInit:
 150                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 152  0000 7f            	clr	(x)
 153                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 155  0001 6f02          	clr	(2,x)
 156                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 158  0003 6f03          	clr	(3,x)
 159                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 161  0005 6f04          	clr	(4,x)
 162                     ; 59 }
 165  0007 81            	ret	
 405                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 405                     ; 72 {
 406                     .text:	section	.text,new
 407  0000               _GPIO_Init:
 409  0000 89            	pushw	x
 410       00000000      OFST:	set	0
 413                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 415                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 417                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 419  0001 7b05          	ld	a,(OFST+5,sp)
 420  0003 43            	cpl	a
 421  0004 e404          	and	a,(4,x)
 422  0006 e704          	ld	(4,x),a
 423                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 425  0008 7b06          	ld	a,(OFST+6,sp)
 426  000a 2a16          	jrpl	L512
 427                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 429  000c a510          	bcp	a,#16
 430  000e 2705          	jreq	L712
 431                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 433  0010 f6            	ld	a,(x)
 434  0011 1a05          	or	a,(OFST+5,sp)
 436  0013 2004          	jra	L122
 437  0015               L712:
 438                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 440  0015 7b05          	ld	a,(OFST+5,sp)
 441  0017 43            	cpl	a
 442  0018 f4            	and	a,(x)
 443  0019               L122:
 444  0019 f7            	ld	(x),a
 445                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 447  001a 1e01          	ldw	x,(OFST+1,sp)
 448  001c e602          	ld	a,(2,x)
 449  001e 1a05          	or	a,(OFST+5,sp)
 451  0020 2005          	jra	L322
 452  0022               L512:
 453                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 455  0022 7b05          	ld	a,(OFST+5,sp)
 456  0024 43            	cpl	a
 457  0025 e402          	and	a,(2,x)
 458  0027               L322:
 459  0027 e702          	ld	(2,x),a
 460                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 462  0029 7b06          	ld	a,(OFST+6,sp)
 463  002b a540          	bcp	a,#64
 464  002d 2706          	jreq	L522
 465                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 467  002f e603          	ld	a,(3,x)
 468  0031 1a05          	or	a,(OFST+5,sp)
 470  0033 2005          	jra	L722
 471  0035               L522:
 472                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 474  0035 7b05          	ld	a,(OFST+5,sp)
 475  0037 43            	cpl	a
 476  0038 e403          	and	a,(3,x)
 477  003a               L722:
 478  003a e703          	ld	(3,x),a
 479                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 481  003c 7b06          	ld	a,(OFST+6,sp)
 482  003e a520          	bcp	a,#32
 483  0040 2706          	jreq	L132
 484                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 486  0042 e604          	ld	a,(4,x)
 487  0044 1a05          	or	a,(OFST+5,sp)
 489  0046 2005          	jra	L332
 490  0048               L132:
 491                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 493  0048 7b05          	ld	a,(OFST+5,sp)
 494  004a 43            	cpl	a
 495  004b e404          	and	a,(4,x)
 496  004d               L332:
 497  004d e704          	ld	(4,x),a
 498                     ; 131 }
 501  004f 85            	popw	x
 502  0050 81            	ret	
 548                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 548                     ; 142 {
 549                     .text:	section	.text,new
 550  0000               _GPIO_Write:
 552       fffffffe      OFST: set -2
 555                     ; 143   GPIOx->ODR = PortVal;
 557  0000 7b03          	ld	a,(OFST+5,sp)
 558  0002 f7            	ld	(x),a
 559                     ; 144 }
 562  0003 81            	ret	
 609                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 609                     ; 155 {
 610                     .text:	section	.text,new
 611  0000               _GPIO_WriteHigh:
 613       fffffffe      OFST: set -2
 616                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 618  0000 f6            	ld	a,(x)
 619  0001 1a03          	or	a,(OFST+5,sp)
 620  0003 f7            	ld	(x),a
 621                     ; 157 }
 624  0004 81            	ret	
 671                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 671                     ; 168 {
 672                     .text:	section	.text,new
 673  0000               _GPIO_WriteLow:
 675       fffffffe      OFST: set -2
 678                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 680  0000 7b03          	ld	a,(OFST+5,sp)
 681  0002 43            	cpl	a
 682  0003 f4            	and	a,(x)
 683  0004 f7            	ld	(x),a
 684                     ; 170 }
 687  0005 81            	ret	
 734                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 734                     ; 181 {
 735                     .text:	section	.text,new
 736  0000               _GPIO_WriteReverse:
 738       fffffffe      OFST: set -2
 741                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 743  0000 f6            	ld	a,(x)
 744  0001 1803          	xor	a,(OFST+5,sp)
 745  0003 f7            	ld	(x),a
 746                     ; 183 }
 749  0004 81            	ret	
 787                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 787                     ; 192 {
 788                     .text:	section	.text,new
 789  0000               _GPIO_ReadOutputData:
 793                     ; 193   return ((uint8_t)GPIOx->ODR);
 795  0000 f6            	ld	a,(x)
 798  0001 81            	ret	
 835                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 835                     ; 203 {
 836                     .text:	section	.text,new
 837  0000               _GPIO_ReadInputData:
 841                     ; 204   return ((uint8_t)GPIOx->IDR);
 843  0000 e601          	ld	a,(1,x)
 846  0002 81            	ret	
 914                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 914                     ; 214 {
 915                     .text:	section	.text,new
 916  0000               _GPIO_ReadInputPin:
 918       fffffffe      OFST: set -2
 921                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 923  0000 e601          	ld	a,(1,x)
 924  0002 1403          	and	a,(OFST+5,sp)
 927  0004 81            	ret	
1005                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
1005                     ; 226 {
1006                     .text:	section	.text,new
1007  0000               _GPIO_ExternalPullUpConfig:
1009       fffffffe      OFST: set -2
1012                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
1014                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1016                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
1018  0000 7b04          	ld	a,(OFST+6,sp)
1019  0002 2706          	jreq	L115
1020                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1022  0004 e603          	ld	a,(3,x)
1023  0006 1a03          	or	a,(OFST+5,sp)
1025  0008 2005          	jra	L315
1026  000a               L115:
1027                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1029  000a 7b03          	ld	a,(OFST+5,sp)
1030  000c 43            	cpl	a
1031  000d e403          	and	a,(3,x)
1032  000f               L315:
1033  000f e703          	ld	(3,x),a
1034                     ; 238 }
1037  0011 81            	ret	
1050                     	xdef	_GPIO_ExternalPullUpConfig
1051                     	xdef	_GPIO_ReadInputPin
1052                     	xdef	_GPIO_ReadOutputData
1053                     	xdef	_GPIO_ReadInputData
1054                     	xdef	_GPIO_WriteReverse
1055                     	xdef	_GPIO_WriteLow
1056                     	xdef	_GPIO_WriteHigh
1057                     	xdef	_GPIO_Write
1058                     	xdef	_GPIO_Init
1059                     	xdef	_GPIO_DeInit
1078                     	end

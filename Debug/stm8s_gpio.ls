   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  21  0002               L5_flagUartRXNE:
  22  0002 00            	dc.b	0
 154                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 154                     ; 54 {
 156                     .text:	section	.text,new
 157  0000               _GPIO_DeInit:
 161                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 163  0000 7f            	clr	(x)
 164                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 166  0001 6f02          	clr	(2,x)
 167                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 169  0003 6f03          	clr	(3,x)
 170                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 172  0005 6f04          	clr	(4,x)
 173                     ; 59 }
 176  0007 81            	ret	
 416                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 416                     ; 72 {
 417                     .text:	section	.text,new
 418  0000               _GPIO_Init:
 420  0000 89            	pushw	x
 421       00000000      OFST:	set	0
 424                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 426                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 428                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 430  0001 7b05          	ld	a,(OFST+5,sp)
 431  0003 43            	cpl	a
 432  0004 e404          	and	a,(4,x)
 433  0006 e704          	ld	(4,x),a
 434                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 436  0008 7b06          	ld	a,(OFST+6,sp)
 437  000a 2a16          	jrpl	L322
 438                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 440  000c a510          	bcp	a,#16
 441  000e 2705          	jreq	L522
 442                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 444  0010 f6            	ld	a,(x)
 445  0011 1a05          	or	a,(OFST+5,sp)
 447  0013 2004          	jra	L722
 448  0015               L522:
 449                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 451  0015 7b05          	ld	a,(OFST+5,sp)
 452  0017 43            	cpl	a
 453  0018 f4            	and	a,(x)
 454  0019               L722:
 455  0019 f7            	ld	(x),a
 456                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 458  001a 1e01          	ldw	x,(OFST+1,sp)
 459  001c e602          	ld	a,(2,x)
 460  001e 1a05          	or	a,(OFST+5,sp)
 462  0020 2005          	jra	L132
 463  0022               L322:
 464                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 466  0022 7b05          	ld	a,(OFST+5,sp)
 467  0024 43            	cpl	a
 468  0025 e402          	and	a,(2,x)
 469  0027               L132:
 470  0027 e702          	ld	(2,x),a
 471                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 473  0029 7b06          	ld	a,(OFST+6,sp)
 474  002b a540          	bcp	a,#64
 475  002d 2706          	jreq	L332
 476                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 478  002f e603          	ld	a,(3,x)
 479  0031 1a05          	or	a,(OFST+5,sp)
 481  0033 2005          	jra	L532
 482  0035               L332:
 483                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 485  0035 7b05          	ld	a,(OFST+5,sp)
 486  0037 43            	cpl	a
 487  0038 e403          	and	a,(3,x)
 488  003a               L532:
 489  003a e703          	ld	(3,x),a
 490                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 492  003c 7b06          	ld	a,(OFST+6,sp)
 493  003e a520          	bcp	a,#32
 494  0040 2706          	jreq	L732
 495                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 497  0042 e604          	ld	a,(4,x)
 498  0044 1a05          	or	a,(OFST+5,sp)
 500  0046 2005          	jra	L142
 501  0048               L732:
 502                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 504  0048 7b05          	ld	a,(OFST+5,sp)
 505  004a 43            	cpl	a
 506  004b e404          	and	a,(4,x)
 507  004d               L142:
 508  004d e704          	ld	(4,x),a
 509                     ; 131 }
 512  004f 85            	popw	x
 513  0050 81            	ret	
 559                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 559                     ; 142 {
 560                     .text:	section	.text,new
 561  0000               _GPIO_Write:
 563       fffffffe      OFST: set -2
 566                     ; 143   GPIOx->ODR = PortVal;
 568  0000 7b03          	ld	a,(OFST+5,sp)
 569  0002 f7            	ld	(x),a
 570                     ; 144 }
 573  0003 81            	ret	
 620                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 620                     ; 155 {
 621                     .text:	section	.text,new
 622  0000               _GPIO_WriteHigh:
 624       fffffffe      OFST: set -2
 627                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 629  0000 f6            	ld	a,(x)
 630  0001 1a03          	or	a,(OFST+5,sp)
 631  0003 f7            	ld	(x),a
 632                     ; 157 }
 635  0004 81            	ret	
 682                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 682                     ; 168 {
 683                     .text:	section	.text,new
 684  0000               _GPIO_WriteLow:
 686       fffffffe      OFST: set -2
 689                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 691  0000 7b03          	ld	a,(OFST+5,sp)
 692  0002 43            	cpl	a
 693  0003 f4            	and	a,(x)
 694  0004 f7            	ld	(x),a
 695                     ; 170 }
 698  0005 81            	ret	
 745                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 745                     ; 181 {
 746                     .text:	section	.text,new
 747  0000               _GPIO_WriteReverse:
 749       fffffffe      OFST: set -2
 752                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 754  0000 f6            	ld	a,(x)
 755  0001 1803          	xor	a,(OFST+5,sp)
 756  0003 f7            	ld	(x),a
 757                     ; 183 }
 760  0004 81            	ret	
 798                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 798                     ; 192 {
 799                     .text:	section	.text,new
 800  0000               _GPIO_ReadOutputData:
 804                     ; 193   return ((uint8_t)GPIOx->ODR);
 806  0000 f6            	ld	a,(x)
 809  0001 81            	ret	
 846                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 846                     ; 203 {
 847                     .text:	section	.text,new
 848  0000               _GPIO_ReadInputData:
 852                     ; 204   return ((uint8_t)GPIOx->IDR);
 854  0000 e601          	ld	a,(1,x)
 857  0002 81            	ret	
 925                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 925                     ; 214 {
 926                     .text:	section	.text,new
 927  0000               _GPIO_ReadInputPin:
 929       fffffffe      OFST: set -2
 932                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 934  0000 e601          	ld	a,(1,x)
 935  0002 1403          	and	a,(OFST+5,sp)
 938  0004 81            	ret	
1016                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
1016                     ; 226 {
1017                     .text:	section	.text,new
1018  0000               _GPIO_ExternalPullUpConfig:
1020       fffffffe      OFST: set -2
1023                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
1025                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1027                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
1029  0000 7b04          	ld	a,(OFST+6,sp)
1030  0002 2706          	jreq	L715
1031                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1033  0004 e603          	ld	a,(3,x)
1034  0006 1a03          	or	a,(OFST+5,sp)
1036  0008 2005          	jra	L125
1037  000a               L715:
1038                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1040  000a 7b03          	ld	a,(OFST+5,sp)
1041  000c 43            	cpl	a
1042  000d e403          	and	a,(3,x)
1043  000f               L125:
1044  000f e703          	ld	(3,x),a
1045                     ; 238 }
1048  0011 81            	ret	
1061                     	xdef	_GPIO_ExternalPullUpConfig
1062                     	xdef	_GPIO_ReadInputPin
1063                     	xdef	_GPIO_ReadOutputData
1064                     	xdef	_GPIO_ReadInputData
1065                     	xdef	_GPIO_WriteReverse
1066                     	xdef	_GPIO_WriteLow
1067                     	xdef	_GPIO_WriteHigh
1068                     	xdef	_GPIO_Write
1069                     	xdef	_GPIO_Init
1070                     	xdef	_GPIO_DeInit
1089                     	end

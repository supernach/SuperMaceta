   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  21  0002               L5_flagUartRXNE:
  22  0002 00            	dc.b	0
  23  0003               L11_flagUartTXE:
  24  0003 00            	dc.b	0
 165                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 165                     ; 54 {
 167                     .text:	section	.text,new
 168  0000               _GPIO_DeInit:
 172                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 174  0000 7f            	clr	(x)
 175                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 177  0001 6f02          	clr	(2,x)
 178                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 180  0003 6f03          	clr	(3,x)
 181                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 183  0005 6f04          	clr	(4,x)
 184                     ; 59 }
 187  0007 81            	ret	
 427                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 427                     ; 72 {
 428                     .text:	section	.text,new
 429  0000               _GPIO_Init:
 431  0000 89            	pushw	x
 432       00000000      OFST:	set	0
 435                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 437                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 439                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 441  0001 7b05          	ld	a,(OFST+5,sp)
 442  0003 43            	cpl	a
 443  0004 e404          	and	a,(4,x)
 444  0006 e704          	ld	(4,x),a
 445                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 447  0008 7b06          	ld	a,(OFST+6,sp)
 448  000a 2a16          	jrpl	L332
 449                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 451  000c a510          	bcp	a,#16
 452  000e 2705          	jreq	L532
 453                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 455  0010 f6            	ld	a,(x)
 456  0011 1a05          	or	a,(OFST+5,sp)
 458  0013 2004          	jra	L732
 459  0015               L532:
 460                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 462  0015 7b05          	ld	a,(OFST+5,sp)
 463  0017 43            	cpl	a
 464  0018 f4            	and	a,(x)
 465  0019               L732:
 466  0019 f7            	ld	(x),a
 467                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 469  001a 1e01          	ldw	x,(OFST+1,sp)
 470  001c e602          	ld	a,(2,x)
 471  001e 1a05          	or	a,(OFST+5,sp)
 473  0020 2005          	jra	L142
 474  0022               L332:
 475                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 477  0022 7b05          	ld	a,(OFST+5,sp)
 478  0024 43            	cpl	a
 479  0025 e402          	and	a,(2,x)
 480  0027               L142:
 481  0027 e702          	ld	(2,x),a
 482                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 484  0029 7b06          	ld	a,(OFST+6,sp)
 485  002b a540          	bcp	a,#64
 486  002d 2706          	jreq	L342
 487                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 489  002f e603          	ld	a,(3,x)
 490  0031 1a05          	or	a,(OFST+5,sp)
 492  0033 2005          	jra	L542
 493  0035               L342:
 494                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 496  0035 7b05          	ld	a,(OFST+5,sp)
 497  0037 43            	cpl	a
 498  0038 e403          	and	a,(3,x)
 499  003a               L542:
 500  003a e703          	ld	(3,x),a
 501                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 503  003c 7b06          	ld	a,(OFST+6,sp)
 504  003e a520          	bcp	a,#32
 505  0040 2706          	jreq	L742
 506                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 508  0042 e604          	ld	a,(4,x)
 509  0044 1a05          	or	a,(OFST+5,sp)
 511  0046 2005          	jra	L152
 512  0048               L742:
 513                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 515  0048 7b05          	ld	a,(OFST+5,sp)
 516  004a 43            	cpl	a
 517  004b e404          	and	a,(4,x)
 518  004d               L152:
 519  004d e704          	ld	(4,x),a
 520                     ; 131 }
 523  004f 85            	popw	x
 524  0050 81            	ret	
 570                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 570                     ; 142 {
 571                     .text:	section	.text,new
 572  0000               _GPIO_Write:
 574       fffffffe      OFST: set -2
 577                     ; 143   GPIOx->ODR = PortVal;
 579  0000 7b03          	ld	a,(OFST+5,sp)
 580  0002 f7            	ld	(x),a
 581                     ; 144 }
 584  0003 81            	ret	
 631                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 631                     ; 155 {
 632                     .text:	section	.text,new
 633  0000               _GPIO_WriteHigh:
 635       fffffffe      OFST: set -2
 638                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 640  0000 f6            	ld	a,(x)
 641  0001 1a03          	or	a,(OFST+5,sp)
 642  0003 f7            	ld	(x),a
 643                     ; 157 }
 646  0004 81            	ret	
 693                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 693                     ; 168 {
 694                     .text:	section	.text,new
 695  0000               _GPIO_WriteLow:
 697       fffffffe      OFST: set -2
 700                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 702  0000 7b03          	ld	a,(OFST+5,sp)
 703  0002 43            	cpl	a
 704  0003 f4            	and	a,(x)
 705  0004 f7            	ld	(x),a
 706                     ; 170 }
 709  0005 81            	ret	
 756                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 756                     ; 181 {
 757                     .text:	section	.text,new
 758  0000               _GPIO_WriteReverse:
 760       fffffffe      OFST: set -2
 763                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 765  0000 f6            	ld	a,(x)
 766  0001 1803          	xor	a,(OFST+5,sp)
 767  0003 f7            	ld	(x),a
 768                     ; 183 }
 771  0004 81            	ret	
 809                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 809                     ; 192 {
 810                     .text:	section	.text,new
 811  0000               _GPIO_ReadOutputData:
 815                     ; 193   return ((uint8_t)GPIOx->ODR);
 817  0000 f6            	ld	a,(x)
 820  0001 81            	ret	
 857                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 857                     ; 203 {
 858                     .text:	section	.text,new
 859  0000               _GPIO_ReadInputData:
 863                     ; 204   return ((uint8_t)GPIOx->IDR);
 865  0000 e601          	ld	a,(1,x)
 868  0002 81            	ret	
 936                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 936                     ; 214 {
 937                     .text:	section	.text,new
 938  0000               _GPIO_ReadInputPin:
 940       fffffffe      OFST: set -2
 943                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 945  0000 e601          	ld	a,(1,x)
 946  0002 1403          	and	a,(OFST+5,sp)
 949  0004 81            	ret	
1027                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
1027                     ; 226 {
1028                     .text:	section	.text,new
1029  0000               _GPIO_ExternalPullUpConfig:
1031       fffffffe      OFST: set -2
1034                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
1036                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1038                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
1040  0000 7b04          	ld	a,(OFST+6,sp)
1041  0002 2706          	jreq	L725
1042                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1044  0004 e603          	ld	a,(3,x)
1045  0006 1a03          	or	a,(OFST+5,sp)
1047  0008 2005          	jra	L135
1048  000a               L725:
1049                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1051  000a 7b03          	ld	a,(OFST+5,sp)
1052  000c 43            	cpl	a
1053  000d e403          	and	a,(3,x)
1054  000f               L135:
1055  000f e703          	ld	(3,x),a
1056                     ; 238 }
1059  0011 81            	ret	
1072                     	xdef	_GPIO_ExternalPullUpConfig
1073                     	xdef	_GPIO_ReadInputPin
1074                     	xdef	_GPIO_ReadOutputData
1075                     	xdef	_GPIO_ReadInputData
1076                     	xdef	_GPIO_WriteReverse
1077                     	xdef	_GPIO_WriteLow
1078                     	xdef	_GPIO_WriteHigh
1079                     	xdef	_GPIO_Write
1080                     	xdef	_GPIO_Init
1081                     	xdef	_GPIO_DeInit
1100                     	end

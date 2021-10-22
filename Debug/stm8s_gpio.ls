   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  21  0002               L5_flagTimer2:
  22  0002 0000          	dc.w	0
  23  0004               L7_flagUartRXNE:
  24  0004 00            	dc.b	0
  25  0005               L31_flagUartTXE:
  26  0005 00            	dc.b	0
 176                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 176                     ; 54 {
 178                     .text:	section	.text,new
 179  0000               _GPIO_DeInit:
 183                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 185  0000 7f            	clr	(x)
 186                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 188  0001 6f02          	clr	(2,x)
 189                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 191  0003 6f03          	clr	(3,x)
 192                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 194  0005 6f04          	clr	(4,x)
 195                     ; 59 }
 198  0007 81            	ret	
 438                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 438                     ; 72 {
 439                     .text:	section	.text,new
 440  0000               _GPIO_Init:
 442  0000 89            	pushw	x
 443       00000000      OFST:	set	0
 446                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 448                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 450                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 452  0001 7b05          	ld	a,(OFST+5,sp)
 453  0003 43            	cpl	a
 454  0004 e404          	and	a,(4,x)
 455  0006 e704          	ld	(4,x),a
 456                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 458  0008 7b06          	ld	a,(OFST+6,sp)
 459  000a 2a16          	jrpl	L142
 460                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 462  000c a510          	bcp	a,#16
 463  000e 2705          	jreq	L342
 464                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 466  0010 f6            	ld	a,(x)
 467  0011 1a05          	or	a,(OFST+5,sp)
 469  0013 2004          	jra	L542
 470  0015               L342:
 471                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 473  0015 7b05          	ld	a,(OFST+5,sp)
 474  0017 43            	cpl	a
 475  0018 f4            	and	a,(x)
 476  0019               L542:
 477  0019 f7            	ld	(x),a
 478                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 480  001a 1e01          	ldw	x,(OFST+1,sp)
 481  001c e602          	ld	a,(2,x)
 482  001e 1a05          	or	a,(OFST+5,sp)
 484  0020 2005          	jra	L742
 485  0022               L142:
 486                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 488  0022 7b05          	ld	a,(OFST+5,sp)
 489  0024 43            	cpl	a
 490  0025 e402          	and	a,(2,x)
 491  0027               L742:
 492  0027 e702          	ld	(2,x),a
 493                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 495  0029 7b06          	ld	a,(OFST+6,sp)
 496  002b a540          	bcp	a,#64
 497  002d 2706          	jreq	L152
 498                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 500  002f e603          	ld	a,(3,x)
 501  0031 1a05          	or	a,(OFST+5,sp)
 503  0033 2005          	jra	L352
 504  0035               L152:
 505                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 507  0035 7b05          	ld	a,(OFST+5,sp)
 508  0037 43            	cpl	a
 509  0038 e403          	and	a,(3,x)
 510  003a               L352:
 511  003a e703          	ld	(3,x),a
 512                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 514  003c 7b06          	ld	a,(OFST+6,sp)
 515  003e a520          	bcp	a,#32
 516  0040 2706          	jreq	L552
 517                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 519  0042 e604          	ld	a,(4,x)
 520  0044 1a05          	or	a,(OFST+5,sp)
 522  0046 2005          	jra	L752
 523  0048               L552:
 524                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 526  0048 7b05          	ld	a,(OFST+5,sp)
 527  004a 43            	cpl	a
 528  004b e404          	and	a,(4,x)
 529  004d               L752:
 530  004d e704          	ld	(4,x),a
 531                     ; 131 }
 534  004f 85            	popw	x
 535  0050 81            	ret	
 581                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 581                     ; 142 {
 582                     .text:	section	.text,new
 583  0000               _GPIO_Write:
 585       fffffffe      OFST: set -2
 588                     ; 143   GPIOx->ODR = PortVal;
 590  0000 7b03          	ld	a,(OFST+5,sp)
 591  0002 f7            	ld	(x),a
 592                     ; 144 }
 595  0003 81            	ret	
 642                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 642                     ; 155 {
 643                     .text:	section	.text,new
 644  0000               _GPIO_WriteHigh:
 646       fffffffe      OFST: set -2
 649                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 651  0000 f6            	ld	a,(x)
 652  0001 1a03          	or	a,(OFST+5,sp)
 653  0003 f7            	ld	(x),a
 654                     ; 157 }
 657  0004 81            	ret	
 704                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 704                     ; 168 {
 705                     .text:	section	.text,new
 706  0000               _GPIO_WriteLow:
 708       fffffffe      OFST: set -2
 711                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 713  0000 7b03          	ld	a,(OFST+5,sp)
 714  0002 43            	cpl	a
 715  0003 f4            	and	a,(x)
 716  0004 f7            	ld	(x),a
 717                     ; 170 }
 720  0005 81            	ret	
 767                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 767                     ; 181 {
 768                     .text:	section	.text,new
 769  0000               _GPIO_WriteReverse:
 771       fffffffe      OFST: set -2
 774                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 776  0000 f6            	ld	a,(x)
 777  0001 1803          	xor	a,(OFST+5,sp)
 778  0003 f7            	ld	(x),a
 779                     ; 183 }
 782  0004 81            	ret	
 820                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 820                     ; 192 {
 821                     .text:	section	.text,new
 822  0000               _GPIO_ReadOutputData:
 826                     ; 193   return ((uint8_t)GPIOx->ODR);
 828  0000 f6            	ld	a,(x)
 831  0001 81            	ret	
 868                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 868                     ; 203 {
 869                     .text:	section	.text,new
 870  0000               _GPIO_ReadInputData:
 874                     ; 204   return ((uint8_t)GPIOx->IDR);
 876  0000 e601          	ld	a,(1,x)
 879  0002 81            	ret	
 947                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 947                     ; 214 {
 948                     .text:	section	.text,new
 949  0000               _GPIO_ReadInputPin:
 951       fffffffe      OFST: set -2
 954                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 956  0000 e601          	ld	a,(1,x)
 957  0002 1403          	and	a,(OFST+5,sp)
 960  0004 81            	ret	
1038                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
1038                     ; 226 {
1039                     .text:	section	.text,new
1040  0000               _GPIO_ExternalPullUpConfig:
1042       fffffffe      OFST: set -2
1045                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
1047                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1049                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
1051  0000 7b04          	ld	a,(OFST+6,sp)
1052  0002 2706          	jreq	L535
1053                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1055  0004 e603          	ld	a,(3,x)
1056  0006 1a03          	or	a,(OFST+5,sp)
1058  0008 2005          	jra	L735
1059  000a               L535:
1060                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1062  000a 7b03          	ld	a,(OFST+5,sp)
1063  000c 43            	cpl	a
1064  000d e403          	and	a,(3,x)
1065  000f               L735:
1066  000f e703          	ld	(3,x),a
1067                     ; 238 }
1070  0011 81            	ret	
1083                     	xdef	_GPIO_ExternalPullUpConfig
1084                     	xdef	_GPIO_ReadInputPin
1085                     	xdef	_GPIO_ReadOutputData
1086                     	xdef	_GPIO_ReadInputData
1087                     	xdef	_GPIO_WriteReverse
1088                     	xdef	_GPIO_WriteLow
1089                     	xdef	_GPIO_WriteHigh
1090                     	xdef	_GPIO_Write
1091                     	xdef	_GPIO_Init
1092                     	xdef	_GPIO_DeInit
1111                     	end

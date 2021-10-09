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
 388                     ; 108 void NHALgpio_Init( Gpio_Config_t* gpio )
 388                     ; 109 {
 390                     .text:	section	.text,new
 391  0000               _NHALgpio_Init:
 395                     ; 110 	GPIO_Init(gpio->Puerto, gpio->Pin, gpio->Tipo);
 397  0000 e603          	ld	a,(3,x)
 398  0002 88            	push	a
 399  0003 e602          	ld	a,(2,x)
 400  0005 88            	push	a
 401  0006 fe            	ldw	x,(x)
 402  0007 cd0000        	call	_GPIO_Init
 404  000a 85            	popw	x
 405                     ; 111 }
 408  000b 81            	ret	
 447                     ; 151 bool NHALgpio_Read( Gpio_Config_t* gpio )
 447                     ; 152 {
 448                     .text:	section	.text,new
 449  0000               _NHALgpio_Read:
 453                     ; 153 	if(GPIO_ReadInputPin(gpio->Puerto, gpio->Pin)) return true;
 455  0000 e602          	ld	a,(2,x)
 456  0002 88            	push	a
 457  0003 fe            	ldw	x,(x)
 458  0004 cd0000        	call	_GPIO_ReadInputPin
 460  0007 5b01          	addw	sp,#1
 461  0009 4d            	tnz	a
 462  000a 2702          	jreq	L542
 465  000c a601          	ld	a,#1
 468  000e               L542:
 469                     ; 154 	else return false;
 473  000e 81            	ret	
 522                     ; 189 void NHALgpio_Write( Gpio_Config_t* gpio, bool estado )
 522                     ; 190 {
 523                     .text:	section	.text,new
 524  0000               _NHALgpio_Write:
 526  0000 89            	pushw	x
 527       00000000      OFST:	set	0
 530                     ; 191 	if( estado )
 532  0001 7b05          	ld	a,(OFST+5,sp)
 533  0003 a501          	bcp	a,#1
 534  0005 2709          	jreq	L572
 535                     ; 193 		GPIO_WriteHigh(gpio->Puerto, gpio->Pin);
 537  0007 e602          	ld	a,(2,x)
 538  0009 88            	push	a
 539  000a fe            	ldw	x,(x)
 540  000b cd0000        	call	_GPIO_WriteHigh
 543  000e 2007          	jra	L772
 544  0010               L572:
 545                     ; 197 		GPIO_WriteLow(gpio->Puerto, gpio->Pin);
 547  0010 e602          	ld	a,(2,x)
 548  0012 88            	push	a
 549  0013 fe            	ldw	x,(x)
 550  0014 cd0000        	call	_GPIO_WriteLow
 552  0017               L772:
 553                     ; 199 }
 556  0017 5b03          	addw	sp,#3
 557  0019 81            	ret	
 570                     	xdef	_NHALgpio_Write
 571                     	xdef	_NHALgpio_Read
 572                     	xdef	_NHALgpio_Init
 573                     	xref	_GPIO_ReadInputPin
 574                     	xref	_GPIO_WriteLow
 575                     	xref	_GPIO_WriteHigh
 576                     	xref	_GPIO_Init
 595                     	end

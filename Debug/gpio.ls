   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  21  0002               L5_flagUartRXNE:
  22  0002 00            	dc.b	0
 377                     ; 108 void NHALgpio_Init( Gpio_Config_t* gpio )
 377                     ; 109 {
 379                     .text:	section	.text,new
 380  0000               _NHALgpio_Init:
 384                     ; 110 	GPIO_Init(gpio->Puerto, gpio->Pin, gpio->Tipo);
 386  0000 e603          	ld	a,(3,x)
 387  0002 88            	push	a
 388  0003 e602          	ld	a,(2,x)
 389  0005 88            	push	a
 390  0006 fe            	ldw	x,(x)
 391  0007 cd0000        	call	_GPIO_Init
 393  000a 85            	popw	x
 394                     ; 111 }
 397  000b 81            	ret	
 436                     ; 151 bool NHALgpio_Read( Gpio_Config_t* gpio )
 436                     ; 152 {
 437                     .text:	section	.text,new
 438  0000               _NHALgpio_Read:
 442                     ; 153 	if(GPIO_ReadInputPin(gpio->Puerto, gpio->Pin)) return true;
 444  0000 e602          	ld	a,(2,x)
 445  0002 88            	push	a
 446  0003 fe            	ldw	x,(x)
 447  0004 cd0000        	call	_GPIO_ReadInputPin
 449  0007 5b01          	addw	sp,#1
 450  0009 4d            	tnz	a
 451  000a 2702          	jreq	L532
 454  000c a601          	ld	a,#1
 457  000e               L532:
 458                     ; 154 	else return false;
 462  000e 81            	ret	
 511                     ; 189 void NHALgpio_Write( Gpio_Config_t* gpio, bool estado )
 511                     ; 190 {
 512                     .text:	section	.text,new
 513  0000               _NHALgpio_Write:
 515  0000 89            	pushw	x
 516       00000000      OFST:	set	0
 519                     ; 191 	if( estado )
 521  0001 7b05          	ld	a,(OFST+5,sp)
 522  0003 a501          	bcp	a,#1
 523  0005 2709          	jreq	L562
 524                     ; 193 		GPIO_WriteHigh(gpio->Puerto, gpio->Pin);
 526  0007 e602          	ld	a,(2,x)
 527  0009 88            	push	a
 528  000a fe            	ldw	x,(x)
 529  000b cd0000        	call	_GPIO_WriteHigh
 532  000e 2007          	jra	L762
 533  0010               L562:
 534                     ; 197 		GPIO_WriteLow(gpio->Puerto, gpio->Pin);
 536  0010 e602          	ld	a,(2,x)
 537  0012 88            	push	a
 538  0013 fe            	ldw	x,(x)
 539  0014 cd0000        	call	_GPIO_WriteLow
 541  0017               L762:
 542                     ; 199 }
 545  0017 5b03          	addw	sp,#3
 546  0019 81            	ret	
 559                     	xdef	_NHALgpio_Write
 560                     	xdef	_NHALgpio_Read
 561                     	xdef	_NHALgpio_Init
 562                     	xref	_GPIO_ReadInputPin
 563                     	xref	_GPIO_WriteLow
 564                     	xref	_GPIO_WriteHigh
 565                     	xref	_GPIO_Init
 584                     	end

   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
 366                     ; 98 void NHALgpio_Init( Gpio_Config_t* gpio )
 366                     ; 99 {
 368                     .text:	section	.text,new
 369  0000               _NHALgpio_Init:
 373                     ; 100 	GPIO_Init(gpio->Puerto, gpio->Pin, gpio->Tipo);
 375  0000 e603          	ld	a,(3,x)
 376  0002 88            	push	a
 377  0003 e602          	ld	a,(2,x)
 378  0005 88            	push	a
 379  0006 fe            	ldw	x,(x)
 380  0007 cd0000        	call	_GPIO_Init
 382  000a 85            	popw	x
 383                     ; 101 }
 386  000b 81            	ret	
 425                     ; 141 bool NHALgpio_Read( Gpio_Config_t* gpio )
 425                     ; 142 {
 426                     .text:	section	.text,new
 427  0000               _NHALgpio_Read:
 431                     ; 143 	if(GPIO_ReadInputPin(gpio->Puerto, gpio->Pin)) return true;
 433  0000 e602          	ld	a,(2,x)
 434  0002 88            	push	a
 435  0003 fe            	ldw	x,(x)
 436  0004 cd0000        	call	_GPIO_ReadInputPin
 438  0007 5b01          	addw	sp,#1
 439  0009 4d            	tnz	a
 440  000a 2702          	jreq	L722
 443  000c a601          	ld	a,#1
 446  000e               L722:
 447                     ; 144 	else return false;
 451  000e 81            	ret	
 500                     ; 179 void NHALgpio_Write( Gpio_Config_t* gpio, bool estado )
 500                     ; 180 {
 501                     .text:	section	.text,new
 502  0000               _NHALgpio_Write:
 504  0000 89            	pushw	x
 505       00000000      OFST:	set	0
 508                     ; 181 	if( estado )
 510  0001 7b05          	ld	a,(OFST+5,sp)
 511  0003 a501          	bcp	a,#1
 512  0005 2709          	jreq	L752
 513                     ; 183 		GPIO_WriteHigh(gpio->Puerto, gpio->Pin);
 515  0007 e602          	ld	a,(2,x)
 516  0009 88            	push	a
 517  000a fe            	ldw	x,(x)
 518  000b cd0000        	call	_GPIO_WriteHigh
 521  000e 2007          	jra	L162
 522  0010               L752:
 523                     ; 187 		GPIO_WriteLow(gpio->Puerto, gpio->Pin);
 525  0010 e602          	ld	a,(2,x)
 526  0012 88            	push	a
 527  0013 fe            	ldw	x,(x)
 528  0014 cd0000        	call	_GPIO_WriteLow
 530  0017               L162:
 531                     ; 189 }
 534  0017 5b03          	addw	sp,#3
 535  0019 81            	ret	
 548                     	xdef	_NHALgpio_Write
 549                     	xdef	_NHALgpio_Read
 550                     	xdef	_NHALgpio_Init
 551                     	xref	_GPIO_ReadInputPin
 552                     	xref	_GPIO_WriteLow
 553                     	xref	_GPIO_WriteHigh
 554                     	xref	_GPIO_Init
 573                     	end

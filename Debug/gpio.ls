   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
 335                     ; 98 void NHALgpio_Init( Gpio_Config_t* gpio )
 335                     ; 99 {
 337                     .text:	section	.text,new
 338  0000               _NHALgpio_Init:
 342                     ; 100 	GPIO_Init(gpio->Puerto, gpio->Pin, gpio->Tipo);
 344  0000 e603          	ld	a,(3,x)
 345  0002 88            	push	a
 346  0003 e602          	ld	a,(2,x)
 347  0005 88            	push	a
 348  0006 fe            	ldw	x,(x)
 349  0007 cd0000        	call	_GPIO_Init
 351  000a 85            	popw	x
 352                     ; 101 }
 355  000b 81            	ret	
 394                     ; 141 bool NHALgpio_Read( Gpio_Config_t* gpio )
 394                     ; 142 {
 395                     .text:	section	.text,new
 396  0000               _NHALgpio_Read:
 400                     ; 143 	if(GPIO_ReadInputPin(gpio->Puerto, gpio->Pin)) return true;
 402  0000 e602          	ld	a,(2,x)
 403  0002 88            	push	a
 404  0003 fe            	ldw	x,(x)
 405  0004 cd0000        	call	_GPIO_ReadInputPin
 407  0007 5b01          	addw	sp,#1
 408  0009 4d            	tnz	a
 409  000a 2702          	jreq	L112
 412  000c a601          	ld	a,#1
 415  000e               L112:
 416                     ; 144 	else return false;
 420  000e 81            	ret	
 469                     ; 179 void NHALgpio_Write( Gpio_Config_t* gpio, bool estado )
 469                     ; 180 {
 470                     .text:	section	.text,new
 471  0000               _NHALgpio_Write:
 473  0000 89            	pushw	x
 474       00000000      OFST:	set	0
 477                     ; 181 	if( estado )
 479  0001 7b05          	ld	a,(OFST+5,sp)
 480  0003 a501          	bcp	a,#1
 481  0005 2709          	jreq	L142
 482                     ; 183 		GPIO_WriteHigh(gpio->Puerto, gpio->Pin);
 484  0007 e602          	ld	a,(2,x)
 485  0009 88            	push	a
 486  000a fe            	ldw	x,(x)
 487  000b cd0000        	call	_GPIO_WriteHigh
 490  000e 2007          	jra	L342
 491  0010               L142:
 492                     ; 187 		GPIO_WriteLow(gpio->Puerto, gpio->Pin);
 494  0010 e602          	ld	a,(2,x)
 495  0012 88            	push	a
 496  0013 fe            	ldw	x,(x)
 497  0014 cd0000        	call	_GPIO_WriteLow
 499  0017               L342:
 500                     ; 189 }
 503  0017 5b03          	addw	sp,#3
 504  0019 81            	ret	
 517                     	xdef	_NHALgpio_Write
 518                     	xdef	_NHALgpio_Read
 519                     	xdef	_NHALgpio_Init
 520                     	xref	_GPIO_ReadInputPin
 521                     	xref	_GPIO_WriteLow
 522                     	xref	_GPIO_WriteHigh
 523                     	xref	_GPIO_Init
 542                     	end

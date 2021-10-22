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
 399                     ; 108 void NHALgpio_Init( Gpio_Config_t* gpio )
 399                     ; 109 {
 401                     .text:	section	.text,new
 402  0000               _NHALgpio_Init:
 406                     ; 110 	GPIO_Init(gpio->Puerto, gpio->Pin, gpio->Tipo);
 408  0000 e603          	ld	a,(3,x)
 409  0002 88            	push	a
 410  0003 e602          	ld	a,(2,x)
 411  0005 88            	push	a
 412  0006 fe            	ldw	x,(x)
 413  0007 cd0000        	call	_GPIO_Init
 415  000a 85            	popw	x
 416                     ; 111 }
 419  000b 81            	ret	
 458                     ; 151 bool NHALgpio_Read( Gpio_Config_t* gpio )
 458                     ; 152 {
 459                     .text:	section	.text,new
 460  0000               _NHALgpio_Read:
 464                     ; 153 	if(GPIO_ReadInputPin(gpio->Puerto, gpio->Pin)) return true;
 466  0000 e602          	ld	a,(2,x)
 467  0002 88            	push	a
 468  0003 fe            	ldw	x,(x)
 469  0004 cd0000        	call	_GPIO_ReadInputPin
 471  0007 5b01          	addw	sp,#1
 472  0009 4d            	tnz	a
 473  000a 2702          	jreq	L352
 476  000c a601          	ld	a,#1
 479  000e               L352:
 480                     ; 154 	else return false;
 484  000e 81            	ret	
 533                     ; 189 void NHALgpio_Write( Gpio_Config_t* gpio, bool estado )
 533                     ; 190 {
 534                     .text:	section	.text,new
 535  0000               _NHALgpio_Write:
 537  0000 89            	pushw	x
 538       00000000      OFST:	set	0
 541                     ; 191 	if( estado )
 543  0001 7b05          	ld	a,(OFST+5,sp)
 544  0003 a501          	bcp	a,#1
 545  0005 2709          	jreq	L303
 546                     ; 193 		GPIO_WriteHigh(gpio->Puerto, gpio->Pin);
 548  0007 e602          	ld	a,(2,x)
 549  0009 88            	push	a
 550  000a fe            	ldw	x,(x)
 551  000b cd0000        	call	_GPIO_WriteHigh
 554  000e 2007          	jra	L503
 555  0010               L303:
 556                     ; 197 		GPIO_WriteLow(gpio->Puerto, gpio->Pin);
 558  0010 e602          	ld	a,(2,x)
 559  0012 88            	push	a
 560  0013 fe            	ldw	x,(x)
 561  0014 cd0000        	call	_GPIO_WriteLow
 563  0017               L503:
 564                     ; 199 }
 567  0017 5b03          	addw	sp,#3
 568  0019 81            	ret	
 581                     	xdef	_NHALgpio_Write
 582                     	xdef	_NHALgpio_Read
 583                     	xdef	_NHALgpio_Init
 584                     	xref	_GPIO_ReadInputPin
 585                     	xref	_GPIO_WriteLow
 586                     	xref	_GPIO_WriteHigh
 587                     	xref	_GPIO_Init
 606                     	end

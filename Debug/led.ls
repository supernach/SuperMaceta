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
 551                     ; 103 void Led_Init( Led_t_ptr led )
 551                     ; 104 {
 553                     .text:	section	.text,new
 554  0000               _Led_Init:
 556  0000 89            	pushw	x
 557       00000000      OFST:	set	0
 560                     ; 105 	led->HW.Tipo = GPIO_MODE_OUT_PP_LOW_SLOW;
 562  0001 a6c0          	ld	a,#192
 563  0003 e704          	ld	(4,x),a
 564                     ; 106 	led->Estado.Estado = 0;
 566  0005 7f            	clr	(x)
 567                     ; 107 	led->SetLed = &cbSetLed;
 569  0006 90ae0000      	ldw	y,#_cbSetLed
 570  000a ef05          	ldw	(5,x),y
 571                     ; 109 	NHALgpio_Init( &led->HW );
 573  000c 5c            	incw	x
 574  000d cd0000        	call	_NHALgpio_Init
 576                     ; 110 	NHALgpio_Write( &led->HW, true );
 578  0010 4b01          	push	#1
 579  0012 1e02          	ldw	x,(OFST+2,sp)
 580  0014 5c            	incw	x
 581  0015 cd0000        	call	_NHALgpio_Write
 583                     ; 111 }
 586  0018 5b03          	addw	sp,#3
 587  001a 81            	ret	
 634                     ; 148 void cbSetLed( Led_t_ptr led, uint8_t estado )
 634                     ; 149 {
 635                     .text:	section	.text,new
 636  0000               _cbSetLed:
 638  0000 89            	pushw	x
 639       00000000      OFST:	set	0
 642                     ; 150 	if( estado == true )
 644  0001 7b05          	ld	a,(OFST+5,sp)
 645  0003 4a            	dec	a
 646  0004 2607          	jrne	L553
 647                     ; 152 		led->Estado.bitEstado.Encendido = false;
 649  0006 f6            	ld	a,(x)
 650  0007 a4fe          	and	a,#254
 651                     ; 153 		led->Estado.bitEstado.Apagado = true;
 653  0009 aa02          	or	a,#2
 655  000b 2005          	jra	L753
 656  000d               L553:
 657                     ; 157 		led->Estado.bitEstado.Encendido = true;
 659  000d f6            	ld	a,(x)
 660  000e a4fd          	and	a,#253
 661  0010 aa01          	or	a,#1
 662                     ; 158 		led->Estado.bitEstado.Apagado = false;
 664  0012               L753:
 665  0012 f7            	ld	(x),a
 666                     ; 161 	NHALgpio_Write(&led->HW, estado );
 668  0013 7b05          	ld	a,(OFST+5,sp)
 669  0015 2702          	jreq	L61
 670  0017 a601          	ld	a,#1
 671  0019               L61:
 672  0019 88            	push	a
 673  001a 1e02          	ldw	x,(OFST+2,sp)
 674  001c 5c            	incw	x
 675  001d cd0000        	call	_NHALgpio_Write
 677                     ; 162 }
 680  0020 5b03          	addw	sp,#3
 681  0022 81            	ret	
 694                     	xdef	_cbSetLed
 695                     	xdef	_Led_Init
 696                     	xref	_NHALgpio_Write
 697                     	xref	_NHALgpio_Init
 716                     	end

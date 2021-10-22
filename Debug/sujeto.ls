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
 248                     ; 103 void Sujeto_Init( Sujeto_t_ptr sujeto, SetSubscriptor_fPtr  setSubscriptor, uint8_t maxSubscritos )
 248                     ; 104 {
 250                     .text:	section	.text,new
 251  0000               _Sujeto_Init:
 253  0000 89            	pushw	x
 254  0001 88            	push	a
 255       00000001      OFST:	set	1
 258                     ; 105 	uint8_t auxTemp = 0;
 260  0002 0f01          	clr	(OFST+0,sp)
 262                     ; 107 	sujeto->NumeroSuscritos = 0;
 264  0004 7f            	clr	(x)
 265                     ; 108 	sujeto->MaxSubscritos = maxSubscritos;
 267  0005 1e02          	ldw	x,(OFST+1,sp)
 268  0007 7b08          	ld	a,(OFST+7,sp)
 269  0009 e701          	ld	(1,x),a
 270                     ; 109 	sujeto->SetSubscriptor = setSubscriptor;
 272  000b 1606          	ldw	y,(OFST+5,sp)
 273  000d ef04          	ldw	(4,x),y
 275  000f 2019          	jra	L371
 276  0011               L761:
 277                     ; 113 		sujeto->Observadores[auxTemp]->Notificacion = NULL; 
 279  0011 7b01          	ld	a,(OFST+0,sp)
 280  0013 5f            	clrw	x
 281  0014 97            	ld	xl,a
 282  0015 58            	sllw	x
 283  0016 72fb02        	addw	x,(OFST+1,sp)
 284  0019 ee02          	ldw	x,(2,x)
 285  001b 905f          	clrw	y
 286  001d ef01          	ldw	(1,x),y
 287                     ; 114 		sujeto->Observadores[auxTemp]->TipoNotificacion = SINNOTIFICACION;
 289  001f 5f            	clrw	x
 290  0020 97            	ld	xl,a
 291  0021 58            	sllw	x
 292  0022 72fb02        	addw	x,(OFST+1,sp)
 293  0025 ee02          	ldw	x,(2,x)
 294  0027 7f            	clr	(x)
 295                     ; 115 		auxTemp = auxTemp + 1;
 297  0028 0c01          	inc	(OFST+0,sp)
 299  002a               L371:
 300                     ; 111 	while( auxTemp < sujeto->MaxSubscritos )
 302  002a 1e02          	ldw	x,(OFST+1,sp)
 303  002c e601          	ld	a,(1,x)
 304  002e 1101          	cp	a,(OFST+0,sp)
 305  0030 22df          	jrugt	L761
 306                     ; 117 	auxTemp = 0;
 308                     ; 118 }
 311  0032 5b03          	addw	sp,#3
 312  0034 81            	ret	
 325                     	xdef	_Sujeto_Init
 344                     	end

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
 237                     ; 103 void Sujeto_Init( Sujeto_t_ptr sujeto, SetSubscriptor_fPtr  setSubscriptor, uint8_t maxSubscritos )
 237                     ; 104 {
 239                     .text:	section	.text,new
 240  0000               _Sujeto_Init:
 242  0000 89            	pushw	x
 243  0001 88            	push	a
 244       00000001      OFST:	set	1
 247                     ; 105 	uint8_t auxTemp = 0;
 249  0002 0f01          	clr	(OFST+0,sp)
 251                     ; 107 	sujeto->NumeroSuscritos = 0;
 253  0004 7f            	clr	(x)
 254                     ; 108 	sujeto->MaxSubscritos = maxSubscritos;
 256  0005 1e02          	ldw	x,(OFST+1,sp)
 257  0007 7b08          	ld	a,(OFST+7,sp)
 258  0009 e701          	ld	(1,x),a
 259                     ; 109 	sujeto->SetSubscriptor = setSubscriptor;
 261  000b 1606          	ldw	y,(OFST+5,sp)
 262  000d ef04          	ldw	(4,x),y
 264  000f 2019          	jra	L561
 265  0011               L161:
 266                     ; 113 		sujeto->Observadores[auxTemp]->Notificacion = NULL; 
 268  0011 7b01          	ld	a,(OFST+0,sp)
 269  0013 5f            	clrw	x
 270  0014 97            	ld	xl,a
 271  0015 58            	sllw	x
 272  0016 72fb02        	addw	x,(OFST+1,sp)
 273  0019 ee02          	ldw	x,(2,x)
 274  001b 905f          	clrw	y
 275  001d ef01          	ldw	(1,x),y
 276                     ; 114 		sujeto->Observadores[auxTemp]->TipoNotificacion = SINNOTIFICACION;
 278  001f 5f            	clrw	x
 279  0020 97            	ld	xl,a
 280  0021 58            	sllw	x
 281  0022 72fb02        	addw	x,(OFST+1,sp)
 282  0025 ee02          	ldw	x,(2,x)
 283  0027 7f            	clr	(x)
 284                     ; 115 		auxTemp = auxTemp + 1;
 286  0028 0c01          	inc	(OFST+0,sp)
 288  002a               L561:
 289                     ; 111 	while( auxTemp < sujeto->MaxSubscritos )
 291  002a 1e02          	ldw	x,(OFST+1,sp)
 292  002c e601          	ld	a,(1,x)
 293  002e 1101          	cp	a,(OFST+0,sp)
 294  0030 22df          	jrugt	L161
 295                     ; 117 	auxTemp = 0;
 297                     ; 118 }
 300  0032 5b03          	addw	sp,#3
 301  0034 81            	ret	
 314                     	xdef	_Sujeto_Init
 333                     	end

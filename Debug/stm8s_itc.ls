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
 113                     ; 32 void TIM1_OV_IRQHandler( void )
 113                     ; 33 {
 114                     .text:	section	.text,new
 115  0000               f_TIM1_OV_IRQHandler:
 117  0000 8a            	push	cc
 118  0001 84            	pop	a
 119  0002 a4bf          	and	a,#191
 120  0004 88            	push	a
 121  0005 86            	pop	cc
 122  0006 3b0002        	push	c_x+2
 123  0009 be00          	ldw	x,c_x
 124  000b 89            	pushw	x
 125  000c 3b0002        	push	c_y+2
 126  000f be00          	ldw	x,c_y
 127  0011 89            	pushw	x
 130                     ; 34 	++flagTimer1;
 132  0012 be00          	ldw	x,L3_flagTimer1
 133  0014 5c            	incw	x
 134  0015 bf00          	ldw	L3_flagTimer1,x
 135                     ; 35 	TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
 137  0017 a601          	ld	a,#1
 138  0019 cd0000        	call	_TIM1_ClearITPendingBit
 140                     ; 36 	TIM1_ClearFlag(TIM1_FLAG_UPDATE);
 142  001c ae0001        	ldw	x,#1
 143  001f cd0000        	call	_TIM1_ClearFlag
 145                     ; 37 }
 148  0022 85            	popw	x
 149  0023 bf00          	ldw	c_y,x
 150  0025 320002        	pop	c_y+2
 151  0028 85            	popw	x
 152  0029 bf00          	ldw	c_x,x
 153  002b 320002        	pop	c_x+2
 154  002e 80            	iret	
 177                     ; 39 uint16_t getFlagTimer1( void )
 177                     ; 40 {
 179                     .text:	section	.text,new
 180  0000               _getFlagTimer1:
 184                     ; 41 	return flagTimer1;
 186  0000 be00          	ldw	x,L3_flagTimer1
 189  0002 81            	ret	
 224                     ; 44 void setFlagTimer1( uint16_t valor )
 224                     ; 45 {
 225                     .text:	section	.text,new
 226  0000               _setFlagTimer1:
 230                     ; 46 	flagTimer1 = valor;
 232  0000 bf00          	ldw	L3_flagTimer1,x
 233                     ; 47 }
 236  0002 81            	ret	
 262                     ; 50 void TIM2_OV_IRQHandler( void )
 262                     ; 51 {
 264                     .text:	section	.text,new
 265  0000               f_TIM2_OV_IRQHandler:
 267  0000 8a            	push	cc
 268  0001 84            	pop	a
 269  0002 a4bf          	and	a,#191
 270  0004 88            	push	a
 271  0005 86            	pop	cc
 272  0006 3b0002        	push	c_x+2
 273  0009 be00          	ldw	x,c_x
 274  000b 89            	pushw	x
 275  000c 3b0002        	push	c_y+2
 276  000f be00          	ldw	x,c_y
 277  0011 89            	pushw	x
 280                     ; 52 	++flagTimer2;
 282  0012 be02          	ldw	x,L5_flagTimer2
 283  0014 5c            	incw	x
 284  0015 bf02          	ldw	L5_flagTimer2,x
 285                     ; 53 	TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
 287  0017 a601          	ld	a,#1
 288  0019 cd0000        	call	_TIM2_ClearITPendingBit
 290                     ; 54 	TIM2_ClearFlag(TIM2_FLAG_UPDATE);
 292  001c ae0001        	ldw	x,#1
 293  001f cd0000        	call	_TIM2_ClearFlag
 295                     ; 55 }
 298  0022 85            	popw	x
 299  0023 bf00          	ldw	c_y,x
 300  0025 320002        	pop	c_y+2
 301  0028 85            	popw	x
 302  0029 bf00          	ldw	c_x,x
 303  002b 320002        	pop	c_x+2
 304  002e 80            	iret	
 327                     ; 57 uint16_t getFlagTimer2( void )
 327                     ; 58 {
 329                     .text:	section	.text,new
 330  0000               _getFlagTimer2:
 334                     ; 59 	return flagTimer2;
 336  0000 be02          	ldw	x,L5_flagTimer2
 339  0002 81            	ret	
 374                     ; 62 void setFlagTimer2( uint16_t valor )
 374                     ; 63 {
 375                     .text:	section	.text,new
 376  0000               _setFlagTimer2:
 380                     ; 64 	flagTimer2 = valor;
 382  0000 bf02          	ldw	L5_flagTimer2,x
 383                     ; 65 }
 386  0002 81            	ret	
 415                     ; 68 void UART_RXNE_IRQHandler( void )
 415                     ; 69 {
 417                     .text:	section	.text,new
 418  0000               f_UART_RXNE_IRQHandler:
 420  0000 8a            	push	cc
 421  0001 84            	pop	a
 422  0002 a4bf          	and	a,#191
 423  0004 88            	push	a
 424  0005 86            	pop	cc
 425  0006 3b0002        	push	c_x+2
 426  0009 be00          	ldw	x,c_x
 427  000b 89            	pushw	x
 428  000c 3b0002        	push	c_y+2
 429  000f be00          	ldw	x,c_y
 430  0011 89            	pushw	x
 433                     ; 70 	bufferRX.temp[flagUartRXNE] = UART1_ReceiveData8( );
 435  0012 b604          	ld	a,L7_flagUartRXNE
 436  0014 5f            	clrw	x
 437  0015 97            	ld	xl,a
 438  0016 89            	pushw	x
 439  0017 cd0000        	call	_UART1_ReceiveData8
 441  001a 85            	popw	x
 442  001b e700          	ld	(L11_bufferRX,x),a
 443                     ; 71 	flagUartRXNE = flagUartRXNE + 1;
 445  001d 3c04          	inc	L7_flagUartRXNE
 446                     ; 72 	UART1_ClearITPendingBit( UART1_IT_RXNE );
 448  001f ae0255        	ldw	x,#597
 449  0022 cd0000        	call	_UART1_ClearITPendingBit
 451                     ; 73 	UART1_ClearFlag( UART1_FLAG_RXNE );
 453  0025 ae0020        	ldw	x,#32
 454  0028 cd0000        	call	_UART1_ClearFlag
 456                     ; 74 }
 459  002b 85            	popw	x
 460  002c bf00          	ldw	c_y,x
 461  002e 320002        	pop	c_y+2
 462  0031 85            	popw	x
 463  0032 bf00          	ldw	c_x,x
 464  0034 320002        	pop	c_x+2
 465  0037 80            	iret	
 488                     ; 76 uint8_t getFlagUartRXNE( void )
 488                     ; 77 {
 490                     .text:	section	.text,new
 491  0000               _getFlagUartRXNE:
 495                     ; 78 	return flagUartRXNE;
 497  0000 b604          	ld	a,L7_flagUartRXNE
 500  0002 81            	ret	
 542                     ; 81 struct bufferRX_s getBufferRX( void )
 542                     ; 82 {
 543                     .text:	section	.text,new
 544  0000               _getBufferRX:
 546       00000000      OFST:	set	0
 549                     ; 83 	return bufferRX;
 551  0000 1e03          	ldw	x,(OFST+3,sp)
 552  0002 90ae0000      	ldw	y,#L11_bufferRX
 553  0006 a606          	ld	a,#6
 557  0008 cc0000        	jp	c_xymov
 592                     ; 86 void setFlagUartRXNE( uint8_t valor )
 592                     ; 87 {
 593                     .text:	section	.text,new
 594  0000               _setFlagUartRXNE:
 598                     ; 88 	flagUartRXNE = valor;
 600  0000 b704          	ld	L7_flagUartRXNE,a
 601                     ; 89 }
 604  0002 81            	ret	
 632                     ; 92 void UART_TXE_IRQHandler( void )
 632                     ; 93 {
 634                     .text:	section	.text,new
 635  0000               f_UART_TXE_IRQHandler:
 637  0000 8a            	push	cc
 638  0001 84            	pop	a
 639  0002 a4bf          	and	a,#191
 640  0004 88            	push	a
 641  0005 86            	pop	cc
 642  0006 3b0002        	push	c_x+2
 643  0009 be00          	ldw	x,c_x
 644  000b 89            	pushw	x
 645  000c 3b0002        	push	c_y+2
 646  000f be00          	ldw	x,c_y
 647  0011 89            	pushw	x
 650                     ; 94 	++flagUartTXE;
 652  0012 3c05          	inc	L31_flagUartTXE
 653                     ; 95 	UART1_ClearITPendingBit( UART1_IT_TXE );
 655  0014 ae0277        	ldw	x,#631
 656  0017 cd0000        	call	_UART1_ClearITPendingBit
 658                     ; 96 	UART1_ClearFlag( UART1_FLAG_TXE );
 660  001a ae0080        	ldw	x,#128
 661  001d cd0000        	call	_UART1_ClearFlag
 663                     ; 97 	UART1_ITConfig( UART1_IT_TXE, DISABLE );
 665  0020 4b00          	push	#0
 666  0022 ae0277        	ldw	x,#631
 667  0025 cd0000        	call	_UART1_ITConfig
 669  0028 84            	pop	a
 670                     ; 98 }
 673  0029 85            	popw	x
 674  002a bf00          	ldw	c_y,x
 675  002c 320002        	pop	c_y+2
 676  002f 85            	popw	x
 677  0030 bf00          	ldw	c_x,x
 678  0032 320002        	pop	c_x+2
 679  0035 80            	iret	
 702                     ; 100 uint8_t getFlagUartTXE( void )
 702                     ; 101 {
 704                     .text:	section	.text,new
 705  0000               _getFlagUartTXE:
 709                     ; 102 	return flagUartTXE;
 711  0000 b605          	ld	a,L31_flagUartTXE
 714  0002 81            	ret	
 749                     ; 105 void setFlagUartTXE( uint8_t valor )
 749                     ; 106 {
 750                     .text:	section	.text,new
 751  0000               _setFlagUartTXE:
 755                     ; 107 	flagUartTXE = valor;
 757  0000 b705          	ld	L31_flagUartTXE,a
 758                     ; 108 }
 761  0002 81            	ret	
 784                     ; 129 uint8_t ITC_GetCPUCC(void)
 784                     ; 130 {
 785                     .text:	section	.text,new
 786  0000               _ITC_GetCPUCC:
 790                     ; 132   _asm("push cc");
 793  0000 8a            	push	cc
 795                     ; 133   _asm("pop a");
 798  0001 84            	pop	a
 800                     ; 134   return; /* Ignore compiler warning, the returned value is in A register */
 803  0002 81            	ret	
 826                     ; 159 void ITC_DeInit(void)
 826                     ; 160 {
 827                     .text:	section	.text,new
 828  0000               _ITC_DeInit:
 832                     ; 161   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
 834  0000 35ff7f70      	mov	32624,#255
 835                     ; 162   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
 837  0004 35ff7f71      	mov	32625,#255
 838                     ; 163   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 840  0008 35ff7f72      	mov	32626,#255
 841                     ; 164   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 843  000c 35ff7f73      	mov	32627,#255
 844                     ; 165   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 846  0010 35ff7f74      	mov	32628,#255
 847                     ; 166   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 849  0014 35ff7f75      	mov	32629,#255
 850                     ; 167   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 852  0018 35ff7f76      	mov	32630,#255
 853                     ; 168   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 855  001c 35ff7f77      	mov	32631,#255
 856                     ; 169 }
 859  0020 81            	ret	
 884                     ; 176 uint8_t ITC_GetSoftIntStatus(void)
 884                     ; 177 {
 885                     .text:	section	.text,new
 886  0000               _ITC_GetSoftIntStatus:
 890                     ; 178   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 892  0000 cd0000        	call	_ITC_GetCPUCC
 894  0003 a428          	and	a,#40
 897  0005 81            	ret	
1146                     .const:	section	.text
1147  0000               L201:
1148  0000 0021          	dc.w	L313
1149  0002 0021          	dc.w	L313
1150  0004 0021          	dc.w	L313
1151  0006 0021          	dc.w	L313
1152  0008 0026          	dc.w	L513
1153  000a 0026          	dc.w	L513
1154  000c 0026          	dc.w	L513
1155  000e 0026          	dc.w	L513
1156  0010 0046          	dc.w	L554
1157  0012 0046          	dc.w	L554
1158  0014 002b          	dc.w	L713
1159  0016 002b          	dc.w	L713
1160  0018 0030          	dc.w	L123
1161  001a 0030          	dc.w	L123
1162  001c 0030          	dc.w	L123
1163  001e 0030          	dc.w	L123
1164  0020 0035          	dc.w	L323
1165  0022 0035          	dc.w	L323
1166  0024 0035          	dc.w	L323
1167  0026 0035          	dc.w	L323
1168  0028 0046          	dc.w	L554
1169  002a 0046          	dc.w	L554
1170  002c 003a          	dc.w	L523
1171  002e 003a          	dc.w	L523
1172  0030 003f          	dc.w	L723
1173                     ; 186 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
1173                     ; 187 {
1174                     .text:	section	.text,new
1175  0000               _ITC_GetSoftwarePriority:
1177  0000 88            	push	a
1178  0001 89            	pushw	x
1179       00000002      OFST:	set	2
1182                     ; 188   uint8_t Value = 0;
1184  0002 0f02          	clr	(OFST+0,sp)
1186                     ; 189   uint8_t Mask = 0;
1188                     ; 192   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
1190                     ; 195   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
1192  0004 a403          	and	a,#3
1193  0006 48            	sll	a
1194  0007 5f            	clrw	x
1195  0008 97            	ld	xl,a
1196  0009 a603          	ld	a,#3
1197  000b 5d            	tnzw	x
1198  000c 2704          	jreq	L47
1199  000e               L67:
1200  000e 48            	sll	a
1201  000f 5a            	decw	x
1202  0010 26fc          	jrne	L67
1203  0012               L47:
1204  0012 6b01          	ld	(OFST-1,sp),a
1206                     ; 197   switch (IrqNum)
1208  0014 7b03          	ld	a,(OFST+1,sp)
1210                     ; 277   default:
1210                     ; 278     break;
1211  0016 a119          	cp	a,#25
1212  0018 242c          	jruge	L554
1213  001a 5f            	clrw	x
1214  001b 97            	ld	xl,a
1215  001c 58            	sllw	x
1216  001d de0000        	ldw	x,(L201,x)
1217  0020 fc            	jp	(x)
1218  0021               L313:
1219                     ; 199   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
1219                     ; 200   case ITC_IRQ_AWU:
1219                     ; 201   case ITC_IRQ_CLK:
1219                     ; 202   case ITC_IRQ_PORTA:
1219                     ; 203     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
1221  0021 c67f70        	ld	a,32624
1222                     ; 204     break;
1224  0024 201c          	jp	LC001
1225  0026               L513:
1226                     ; 206   case ITC_IRQ_PORTB:
1226                     ; 207   case ITC_IRQ_PORTC:
1226                     ; 208   case ITC_IRQ_PORTD:
1226                     ; 209   case ITC_IRQ_PORTE:
1226                     ; 210     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
1228  0026 c67f71        	ld	a,32625
1229                     ; 211     break;
1231  0029 2017          	jp	LC001
1232  002b               L713:
1233                     ; 220   case ITC_IRQ_SPI:
1233                     ; 221   case ITC_IRQ_TIM1_OVF:
1233                     ; 222     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
1235  002b c67f72        	ld	a,32626
1236                     ; 223     break;
1238  002e 2012          	jp	LC001
1239  0030               L123:
1240                     ; 225   case ITC_IRQ_TIM1_CAPCOM:
1240                     ; 226 #if defined (STM8S903) || defined (STM8AF622x)
1240                     ; 227   case ITC_IRQ_TIM5_OVFTRI:
1240                     ; 228   case ITC_IRQ_TIM5_CAPCOM:
1240                     ; 229 #else
1240                     ; 230   case ITC_IRQ_TIM2_OVF:
1240                     ; 231   case ITC_IRQ_TIM2_CAPCOM:
1240                     ; 232 #endif /* STM8S903 or STM8AF622x*/
1240                     ; 233   case ITC_IRQ_TIM3_OVF:
1240                     ; 234     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
1242  0030 c67f73        	ld	a,32627
1243                     ; 235     break;
1245  0033 200d          	jp	LC001
1246  0035               L323:
1247                     ; 237   case ITC_IRQ_TIM3_CAPCOM:
1247                     ; 238 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
1247                     ; 239     defined(STM8S003) ||defined(STM8S001) || defined (STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
1247                     ; 240   case ITC_IRQ_UART1_TX:
1247                     ; 241   case ITC_IRQ_UART1_RX:
1247                     ; 242 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
1247                     ; 243 #if defined(STM8AF622x)
1247                     ; 244   case ITC_IRQ_UART4_TX:
1247                     ; 245   case ITC_IRQ_UART4_RX:
1247                     ; 246 #endif /*STM8AF622x */
1247                     ; 247   case ITC_IRQ_I2C:
1247                     ; 248     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
1249  0035 c67f74        	ld	a,32628
1250                     ; 249     break;
1252  0038 2008          	jp	LC001
1253  003a               L523:
1254                     ; 263   case ITC_IRQ_ADC1:
1254                     ; 264 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
1254                     ; 265 #if defined (STM8S903) || defined (STM8AF622x)
1254                     ; 266   case ITC_IRQ_TIM6_OVFTRI:
1254                     ; 267 #else
1254                     ; 268   case ITC_IRQ_TIM4_OVF:
1254                     ; 269 #endif /*STM8S903 or STM8AF622x */
1254                     ; 270     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
1256  003a c67f75        	ld	a,32629
1257                     ; 271     break;
1259  003d 2003          	jp	LC001
1260  003f               L723:
1261                     ; 273   case ITC_IRQ_EEPROM_EEC:
1261                     ; 274     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
1263  003f c67f76        	ld	a,32630
1264  0042               LC001:
1265  0042 1401          	and	a,(OFST-1,sp)
1266  0044 6b02          	ld	(OFST+0,sp),a
1268                     ; 275     break;
1270                     ; 277   default:
1270                     ; 278     break;
1272  0046               L554:
1273                     ; 281   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
1275  0046 7b03          	ld	a,(OFST+1,sp)
1276  0048 a403          	and	a,#3
1277  004a 48            	sll	a
1278  004b 5f            	clrw	x
1279  004c 97            	ld	xl,a
1280  004d 7b02          	ld	a,(OFST+0,sp)
1281  004f 5d            	tnzw	x
1282  0050 2704          	jreq	L401
1283  0052               L601:
1284  0052 44            	srl	a
1285  0053 5a            	decw	x
1286  0054 26fc          	jrne	L601
1287  0056               L401:
1289                     ; 283   return((ITC_PriorityLevel_TypeDef)Value);
1293  0056 5b03          	addw	sp,#3
1294  0058 81            	ret	
1358                     	switch	.const
1359  0032               L421:
1360  0032 0036          	dc.w	L754
1361  0034 0036          	dc.w	L754
1362  0036 0036          	dc.w	L754
1363  0038 0036          	dc.w	L754
1364  003a 0048          	dc.w	L164
1365  003c 0048          	dc.w	L164
1366  003e 0048          	dc.w	L164
1367  0040 0048          	dc.w	L164
1368  0042 00b2          	dc.w	L335
1369  0044 00b2          	dc.w	L335
1370  0046 005a          	dc.w	L364
1371  0048 005a          	dc.w	L364
1372  004a 006c          	dc.w	L564
1373  004c 006c          	dc.w	L564
1374  004e 006c          	dc.w	L564
1375  0050 006c          	dc.w	L564
1376  0052 007e          	dc.w	L764
1377  0054 007e          	dc.w	L764
1378  0056 007e          	dc.w	L764
1379  0058 007e          	dc.w	L764
1380  005a 00b2          	dc.w	L335
1381  005c 00b2          	dc.w	L335
1382  005e 0090          	dc.w	L174
1383  0060 0090          	dc.w	L174
1384  0062 00a2          	dc.w	L374
1385                     ; 299 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
1385                     ; 300 {
1386                     .text:	section	.text,new
1387  0000               _ITC_SetSoftwarePriority:
1389  0000 89            	pushw	x
1390  0001 89            	pushw	x
1391       00000002      OFST:	set	2
1394                     ; 301   uint8_t Mask = 0;
1396                     ; 302   uint8_t NewPriority = 0;
1398                     ; 305   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
1400                     ; 306   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
1402                     ; 309   assert_param(IS_ITC_INTERRUPTS_DISABLED);
1404                     ; 313   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
1406  0002 9e            	ld	a,xh
1407  0003 a403          	and	a,#3
1408  0005 48            	sll	a
1409  0006 5f            	clrw	x
1410  0007 97            	ld	xl,a
1411  0008 a603          	ld	a,#3
1412  000a 5d            	tnzw	x
1413  000b 2704          	jreq	L211
1414  000d               L411:
1415  000d 48            	sll	a
1416  000e 5a            	decw	x
1417  000f 26fc          	jrne	L411
1418  0011               L211:
1419  0011 43            	cpl	a
1420  0012 6b01          	ld	(OFST-1,sp),a
1422                     ; 316   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
1424  0014 7b03          	ld	a,(OFST+1,sp)
1425  0016 a403          	and	a,#3
1426  0018 48            	sll	a
1427  0019 5f            	clrw	x
1428  001a 97            	ld	xl,a
1429  001b 7b04          	ld	a,(OFST+2,sp)
1430  001d 5d            	tnzw	x
1431  001e 2704          	jreq	L611
1432  0020               L021:
1433  0020 48            	sll	a
1434  0021 5a            	decw	x
1435  0022 26fc          	jrne	L021
1436  0024               L611:
1437  0024 6b02          	ld	(OFST+0,sp),a
1439                     ; 318   switch (IrqNum)
1441  0026 7b03          	ld	a,(OFST+1,sp)
1443                     ; 408   default:
1443                     ; 409     break;
1444  0028 a119          	cp	a,#25
1445  002a 2503cc00b2    	jruge	L335
1446  002f 5f            	clrw	x
1447  0030 97            	ld	xl,a
1448  0031 58            	sllw	x
1449  0032 de0032        	ldw	x,(L421,x)
1450  0035 fc            	jp	(x)
1451  0036               L754:
1452                     ; 320   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
1452                     ; 321   case ITC_IRQ_AWU:
1452                     ; 322   case ITC_IRQ_CLK:
1452                     ; 323   case ITC_IRQ_PORTA:
1452                     ; 324     ITC->ISPR1 &= Mask;
1454  0036 c67f70        	ld	a,32624
1455  0039 1401          	and	a,(OFST-1,sp)
1456  003b c77f70        	ld	32624,a
1457                     ; 325     ITC->ISPR1 |= NewPriority;
1459  003e c67f70        	ld	a,32624
1460  0041 1a02          	or	a,(OFST+0,sp)
1461  0043 c77f70        	ld	32624,a
1462                     ; 326     break;
1464  0046 206a          	jra	L335
1465  0048               L164:
1466                     ; 328   case ITC_IRQ_PORTB:
1466                     ; 329   case ITC_IRQ_PORTC:
1466                     ; 330   case ITC_IRQ_PORTD:
1466                     ; 331   case ITC_IRQ_PORTE:
1466                     ; 332     ITC->ISPR2 &= Mask;
1468  0048 c67f71        	ld	a,32625
1469  004b 1401          	and	a,(OFST-1,sp)
1470  004d c77f71        	ld	32625,a
1471                     ; 333     ITC->ISPR2 |= NewPriority;
1473  0050 c67f71        	ld	a,32625
1474  0053 1a02          	or	a,(OFST+0,sp)
1475  0055 c77f71        	ld	32625,a
1476                     ; 334     break;
1478  0058 2058          	jra	L335
1479  005a               L364:
1480                     ; 343   case ITC_IRQ_SPI:
1480                     ; 344   case ITC_IRQ_TIM1_OVF:
1480                     ; 345     ITC->ISPR3 &= Mask;
1482  005a c67f72        	ld	a,32626
1483  005d 1401          	and	a,(OFST-1,sp)
1484  005f c77f72        	ld	32626,a
1485                     ; 346     ITC->ISPR3 |= NewPriority;
1487  0062 c67f72        	ld	a,32626
1488  0065 1a02          	or	a,(OFST+0,sp)
1489  0067 c77f72        	ld	32626,a
1490                     ; 347     break;
1492  006a 2046          	jra	L335
1493  006c               L564:
1494                     ; 349   case ITC_IRQ_TIM1_CAPCOM:
1494                     ; 350 #if defined(STM8S903) || defined(STM8AF622x) 
1494                     ; 351   case ITC_IRQ_TIM5_OVFTRI:
1494                     ; 352   case ITC_IRQ_TIM5_CAPCOM:
1494                     ; 353 #else
1494                     ; 354   case ITC_IRQ_TIM2_OVF:
1494                     ; 355   case ITC_IRQ_TIM2_CAPCOM:
1494                     ; 356 #endif /*STM8S903 or STM8AF622x */
1494                     ; 357   case ITC_IRQ_TIM3_OVF:
1494                     ; 358     ITC->ISPR4 &= Mask;
1496  006c c67f73        	ld	a,32627
1497  006f 1401          	and	a,(OFST-1,sp)
1498  0071 c77f73        	ld	32627,a
1499                     ; 359     ITC->ISPR4 |= NewPriority;
1501  0074 c67f73        	ld	a,32627
1502  0077 1a02          	or	a,(OFST+0,sp)
1503  0079 c77f73        	ld	32627,a
1504                     ; 360     break;
1506  007c 2034          	jra	L335
1507  007e               L764:
1508                     ; 362   case ITC_IRQ_TIM3_CAPCOM:
1508                     ; 363 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
1508                     ; 364     defined(STM8S001) ||defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
1508                     ; 365   case ITC_IRQ_UART1_TX:
1508                     ; 366   case ITC_IRQ_UART1_RX:
1508                     ; 367 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
1508                     ; 368 #if defined(STM8AF622x)
1508                     ; 369   case ITC_IRQ_UART4_TX:
1508                     ; 370   case ITC_IRQ_UART4_RX:
1508                     ; 371 #endif /*STM8AF622x */
1508                     ; 372   case ITC_IRQ_I2C:
1508                     ; 373     ITC->ISPR5 &= Mask;
1510  007e c67f74        	ld	a,32628
1511  0081 1401          	and	a,(OFST-1,sp)
1512  0083 c77f74        	ld	32628,a
1513                     ; 374     ITC->ISPR5 |= NewPriority;
1515  0086 c67f74        	ld	a,32628
1516  0089 1a02          	or	a,(OFST+0,sp)
1517  008b c77f74        	ld	32628,a
1518                     ; 375     break;
1520  008e 2022          	jra	L335
1521  0090               L174:
1522                     ; 391   case ITC_IRQ_ADC1:
1522                     ; 392 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
1522                     ; 393     
1522                     ; 394 #if defined (STM8S903) || defined (STM8AF622x)
1522                     ; 395   case ITC_IRQ_TIM6_OVFTRI:
1522                     ; 396 #else
1522                     ; 397   case ITC_IRQ_TIM4_OVF:
1522                     ; 398 #endif /* STM8S903 or STM8AF622x */
1522                     ; 399     ITC->ISPR6 &= Mask;
1524  0090 c67f75        	ld	a,32629
1525  0093 1401          	and	a,(OFST-1,sp)
1526  0095 c77f75        	ld	32629,a
1527                     ; 400     ITC->ISPR6 |= NewPriority;
1529  0098 c67f75        	ld	a,32629
1530  009b 1a02          	or	a,(OFST+0,sp)
1531  009d c77f75        	ld	32629,a
1532                     ; 401     break;
1534  00a0 2010          	jra	L335
1535  00a2               L374:
1536                     ; 403   case ITC_IRQ_EEPROM_EEC:
1536                     ; 404     ITC->ISPR7 &= Mask;
1538  00a2 c67f76        	ld	a,32630
1539  00a5 1401          	and	a,(OFST-1,sp)
1540  00a7 c77f76        	ld	32630,a
1541                     ; 405     ITC->ISPR7 |= NewPriority;
1543  00aa c67f76        	ld	a,32630
1544  00ad 1a02          	or	a,(OFST+0,sp)
1545  00af c77f76        	ld	32630,a
1546                     ; 406     break;
1548                     ; 408   default:
1548                     ; 409     break;
1550  00b2               L335:
1551                     ; 411 }
1554  00b2 5b04          	addw	sp,#4
1555  00b4 81            	ret	
1568                     	xdef	_ITC_GetSoftwarePriority
1569                     	xdef	_ITC_SetSoftwarePriority
1570                     	xdef	_ITC_GetSoftIntStatus
1571                     	xdef	_ITC_DeInit
1572                     	xdef	_ITC_GetCPUCC
1573                     	xdef	_setFlagUartTXE
1574                     	xdef	_getFlagUartTXE
1575                     	xdef	f_UART_TXE_IRQHandler
1576                     	xdef	_setFlagUartRXNE
1577                     	xdef	_getBufferRX
1578                     	xdef	_getFlagUartRXNE
1579                     	xdef	f_UART_RXNE_IRQHandler
1580                     	switch	.ubsct
1581  0000               L11_bufferRX:
1582  0000 000000000000  	ds.b	6
1583                     	xdef	_setFlagTimer2
1584                     	xdef	_getFlagTimer2
1585                     	xdef	f_TIM2_OV_IRQHandler
1586                     	xdef	_setFlagTimer1
1587                     	xdef	_getFlagTimer1
1588                     	xdef	f_TIM1_OV_IRQHandler
1589                     	xref	_UART1_ClearITPendingBit
1590                     	xref	_UART1_ClearFlag
1591                     	xref	_UART1_ReceiveData8
1592                     	xref	_UART1_ITConfig
1593                     	xref	_TIM2_ClearITPendingBit
1594                     	xref	_TIM2_ClearFlag
1595                     	xref	_TIM1_ClearITPendingBit
1596                     	xref	_TIM1_ClearFlag
1597                     	xref.b	c_x
1598                     	xref.b	c_y
1618                     	xref	c_xymov
1619                     	end

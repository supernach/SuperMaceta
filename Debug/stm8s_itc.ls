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
 102                     ; 32 void TIM1_OV_IRQHandler( void )
 102                     ; 33 {
 103                     .text:	section	.text,new
 104  0000               f_TIM1_OV_IRQHandler:
 106  0000 8a            	push	cc
 107  0001 84            	pop	a
 108  0002 a4bf          	and	a,#191
 109  0004 88            	push	a
 110  0005 86            	pop	cc
 111  0006 3b0002        	push	c_x+2
 112  0009 be00          	ldw	x,c_x
 113  000b 89            	pushw	x
 114  000c 3b0002        	push	c_y+2
 115  000f be00          	ldw	x,c_y
 116  0011 89            	pushw	x
 119                     ; 34 	++flagTimer1;
 121  0012 be00          	ldw	x,L3_flagTimer1
 122  0014 5c            	incw	x
 123  0015 bf00          	ldw	L3_flagTimer1,x
 124                     ; 35 	TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
 126  0017 a601          	ld	a,#1
 127  0019 cd0000        	call	_TIM1_ClearITPendingBit
 129                     ; 36 	TIM1_ClearFlag(TIM1_FLAG_UPDATE);
 131  001c ae0001        	ldw	x,#1
 132  001f cd0000        	call	_TIM1_ClearFlag
 134                     ; 37 }
 137  0022 85            	popw	x
 138  0023 bf00          	ldw	c_y,x
 139  0025 320002        	pop	c_y+2
 140  0028 85            	popw	x
 141  0029 bf00          	ldw	c_x,x
 142  002b 320002        	pop	c_x+2
 143  002e 80            	iret	
 166                     ; 39 uint16_t getFlagTimer1( void )
 166                     ; 40 {
 168                     .text:	section	.text,new
 169  0000               _getFlagTimer1:
 173                     ; 41 	return flagTimer1;
 175  0000 be00          	ldw	x,L3_flagTimer1
 178  0002 81            	ret	
 213                     ; 44 void setFlagTimer1( uint16_t valor )
 213                     ; 45 {
 214                     .text:	section	.text,new
 215  0000               _setFlagTimer1:
 219                     ; 46 	flagTimer1 = valor;
 221  0000 bf00          	ldw	L3_flagTimer1,x
 222                     ; 47 }
 225  0002 81            	ret	
 254                     ; 50 void UART_RXNE_IRQHandler( void )
 254                     ; 51 {
 256                     .text:	section	.text,new
 257  0000               f_UART_RXNE_IRQHandler:
 259  0000 8a            	push	cc
 260  0001 84            	pop	a
 261  0002 a4bf          	and	a,#191
 262  0004 88            	push	a
 263  0005 86            	pop	cc
 264  0006 3b0002        	push	c_x+2
 265  0009 be00          	ldw	x,c_x
 266  000b 89            	pushw	x
 267  000c 3b0002        	push	c_y+2
 268  000f be00          	ldw	x,c_y
 269  0011 89            	pushw	x
 272                     ; 52 	bufferRX.temp[flagUartRXNE] = UART1_ReceiveData8( );
 274  0012 b602          	ld	a,L5_flagUartRXNE
 275  0014 5f            	clrw	x
 276  0015 97            	ld	xl,a
 277  0016 89            	pushw	x
 278  0017 cd0000        	call	_UART1_ReceiveData8
 280  001a 85            	popw	x
 281  001b e700          	ld	(L7_bufferRX,x),a
 282                     ; 53 	flagUartRXNE = flagUartRXNE + 1;
 284  001d 3c02          	inc	L5_flagUartRXNE
 285                     ; 54 	UART1_ClearITPendingBit( UART1_IT_RXNE );
 287  001f ae0255        	ldw	x,#597
 288  0022 cd0000        	call	_UART1_ClearITPendingBit
 290                     ; 55 	UART1_ClearFlag( UART1_FLAG_RXNE );
 292  0025 ae0020        	ldw	x,#32
 293  0028 cd0000        	call	_UART1_ClearFlag
 295                     ; 56 }
 298  002b 85            	popw	x
 299  002c bf00          	ldw	c_y,x
 300  002e 320002        	pop	c_y+2
 301  0031 85            	popw	x
 302  0032 bf00          	ldw	c_x,x
 303  0034 320002        	pop	c_x+2
 304  0037 80            	iret	
 327                     ; 58 uint8_t getFlagUartRXNE( void )
 327                     ; 59 {
 329                     .text:	section	.text,new
 330  0000               _getFlagUartRXNE:
 334                     ; 60 	return flagUartRXNE;
 336  0000 b602          	ld	a,L5_flagUartRXNE
 339  0002 81            	ret	
 381                     ; 63 struct bufferRX_s getBufferRX( void )
 381                     ; 64 {
 382                     .text:	section	.text,new
 383  0000               _getBufferRX:
 385       00000000      OFST:	set	0
 388                     ; 65 	return bufferRX;
 390  0000 1e03          	ldw	x,(OFST+3,sp)
 391  0002 90ae0000      	ldw	y,#L7_bufferRX
 392  0006 a606          	ld	a,#6
 396  0008 cc0000        	jp	c_xymov
 431                     ; 68 void setFlagUartRXNE( uint8_t valor )
 431                     ; 69 {
 432                     .text:	section	.text,new
 433  0000               _setFlagUartRXNE:
 437                     ; 70 	flagUartRXNE = valor;
 439  0000 b702          	ld	L5_flagUartRXNE,a
 440                     ; 71 }
 443  0002 81            	ret	
 471                     ; 74 void UART_TXE_IRQHandler( void )
 471                     ; 75 {
 473                     .text:	section	.text,new
 474  0000               f_UART_TXE_IRQHandler:
 476  0000 8a            	push	cc
 477  0001 84            	pop	a
 478  0002 a4bf          	and	a,#191
 479  0004 88            	push	a
 480  0005 86            	pop	cc
 481  0006 3b0002        	push	c_x+2
 482  0009 be00          	ldw	x,c_x
 483  000b 89            	pushw	x
 484  000c 3b0002        	push	c_y+2
 485  000f be00          	ldw	x,c_y
 486  0011 89            	pushw	x
 489                     ; 76 	++flagUartTXE;
 491  0012 3c03          	inc	L11_flagUartTXE
 492                     ; 77 	UART1_ClearITPendingBit( UART1_IT_TXE );
 494  0014 ae0277        	ldw	x,#631
 495  0017 cd0000        	call	_UART1_ClearITPendingBit
 497                     ; 78 	UART1_ClearFlag( UART1_FLAG_TXE );
 499  001a ae0080        	ldw	x,#128
 500  001d cd0000        	call	_UART1_ClearFlag
 502                     ; 79 	UART1_ITConfig( UART1_IT_TXE, DISABLE );
 504  0020 4b00          	push	#0
 505  0022 ae0277        	ldw	x,#631
 506  0025 cd0000        	call	_UART1_ITConfig
 508  0028 84            	pop	a
 509                     ; 80 }
 512  0029 85            	popw	x
 513  002a bf00          	ldw	c_y,x
 514  002c 320002        	pop	c_y+2
 515  002f 85            	popw	x
 516  0030 bf00          	ldw	c_x,x
 517  0032 320002        	pop	c_x+2
 518  0035 80            	iret	
 541                     ; 82 uint8_t getFlagUartTXE( void )
 541                     ; 83 {
 543                     .text:	section	.text,new
 544  0000               _getFlagUartTXE:
 548                     ; 84 	return flagUartTXE;
 550  0000 b603          	ld	a,L11_flagUartTXE
 553  0002 81            	ret	
 588                     ; 87 void setFlagUartTXE( uint8_t valor )
 588                     ; 88 {
 589                     .text:	section	.text,new
 590  0000               _setFlagUartTXE:
 594                     ; 89 	flagUartTXE = valor;
 596  0000 b703          	ld	L11_flagUartTXE,a
 597                     ; 90 }
 600  0002 81            	ret	
 623                     ; 111 uint8_t ITC_GetCPUCC(void)
 623                     ; 112 {
 624                     .text:	section	.text,new
 625  0000               _ITC_GetCPUCC:
 629                     ; 114   _asm("push cc");
 632  0000 8a            	push	cc
 634                     ; 115   _asm("pop a");
 637  0001 84            	pop	a
 639                     ; 116   return; /* Ignore compiler warning, the returned value is in A register */
 642  0002 81            	ret	
 665                     ; 141 void ITC_DeInit(void)
 665                     ; 142 {
 666                     .text:	section	.text,new
 667  0000               _ITC_DeInit:
 671                     ; 143   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
 673  0000 35ff7f70      	mov	32624,#255
 674                     ; 144   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
 676  0004 35ff7f71      	mov	32625,#255
 677                     ; 145   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 679  0008 35ff7f72      	mov	32626,#255
 680                     ; 146   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 682  000c 35ff7f73      	mov	32627,#255
 683                     ; 147   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 685  0010 35ff7f74      	mov	32628,#255
 686                     ; 148   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 688  0014 35ff7f75      	mov	32629,#255
 689                     ; 149   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 691  0018 35ff7f76      	mov	32630,#255
 692                     ; 150   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 694  001c 35ff7f77      	mov	32631,#255
 695                     ; 151 }
 698  0020 81            	ret	
 723                     ; 158 uint8_t ITC_GetSoftIntStatus(void)
 723                     ; 159 {
 724                     .text:	section	.text,new
 725  0000               _ITC_GetSoftIntStatus:
 729                     ; 160   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 731  0000 cd0000        	call	_ITC_GetCPUCC
 733  0003 a428          	and	a,#40
 736  0005 81            	ret	
 985                     .const:	section	.text
 986  0000               L07:
 987  0000 0021          	dc.w	L742
 988  0002 0021          	dc.w	L742
 989  0004 0021          	dc.w	L742
 990  0006 0021          	dc.w	L742
 991  0008 0026          	dc.w	L152
 992  000a 0026          	dc.w	L152
 993  000c 0026          	dc.w	L152
 994  000e 0026          	dc.w	L152
 995  0010 0046          	dc.w	L114
 996  0012 0046          	dc.w	L114
 997  0014 002b          	dc.w	L352
 998  0016 002b          	dc.w	L352
 999  0018 0030          	dc.w	L552
1000  001a 0030          	dc.w	L552
1001  001c 0030          	dc.w	L552
1002  001e 0030          	dc.w	L552
1003  0020 0035          	dc.w	L752
1004  0022 0035          	dc.w	L752
1005  0024 0035          	dc.w	L752
1006  0026 0035          	dc.w	L752
1007  0028 0046          	dc.w	L114
1008  002a 0046          	dc.w	L114
1009  002c 003a          	dc.w	L162
1010  002e 003a          	dc.w	L162
1011  0030 003f          	dc.w	L362
1012                     ; 168 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
1012                     ; 169 {
1013                     .text:	section	.text,new
1014  0000               _ITC_GetSoftwarePriority:
1016  0000 88            	push	a
1017  0001 89            	pushw	x
1018       00000002      OFST:	set	2
1021                     ; 170   uint8_t Value = 0;
1023  0002 0f02          	clr	(OFST+0,sp)
1025                     ; 171   uint8_t Mask = 0;
1027                     ; 174   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
1029                     ; 177   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
1031  0004 a403          	and	a,#3
1032  0006 48            	sll	a
1033  0007 5f            	clrw	x
1034  0008 97            	ld	xl,a
1035  0009 a603          	ld	a,#3
1036  000b 5d            	tnzw	x
1037  000c 2704          	jreq	L26
1038  000e               L46:
1039  000e 48            	sll	a
1040  000f 5a            	decw	x
1041  0010 26fc          	jrne	L46
1042  0012               L26:
1043  0012 6b01          	ld	(OFST-1,sp),a
1045                     ; 179   switch (IrqNum)
1047  0014 7b03          	ld	a,(OFST+1,sp)
1049                     ; 259   default:
1049                     ; 260     break;
1050  0016 a119          	cp	a,#25
1051  0018 242c          	jruge	L114
1052  001a 5f            	clrw	x
1053  001b 97            	ld	xl,a
1054  001c 58            	sllw	x
1055  001d de0000        	ldw	x,(L07,x)
1056  0020 fc            	jp	(x)
1057  0021               L742:
1058                     ; 181   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
1058                     ; 182   case ITC_IRQ_AWU:
1058                     ; 183   case ITC_IRQ_CLK:
1058                     ; 184   case ITC_IRQ_PORTA:
1058                     ; 185     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
1060  0021 c67f70        	ld	a,32624
1061                     ; 186     break;
1063  0024 201c          	jp	LC001
1064  0026               L152:
1065                     ; 188   case ITC_IRQ_PORTB:
1065                     ; 189   case ITC_IRQ_PORTC:
1065                     ; 190   case ITC_IRQ_PORTD:
1065                     ; 191   case ITC_IRQ_PORTE:
1065                     ; 192     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
1067  0026 c67f71        	ld	a,32625
1068                     ; 193     break;
1070  0029 2017          	jp	LC001
1071  002b               L352:
1072                     ; 202   case ITC_IRQ_SPI:
1072                     ; 203   case ITC_IRQ_TIM1_OVF:
1072                     ; 204     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
1074  002b c67f72        	ld	a,32626
1075                     ; 205     break;
1077  002e 2012          	jp	LC001
1078  0030               L552:
1079                     ; 207   case ITC_IRQ_TIM1_CAPCOM:
1079                     ; 208 #if defined (STM8S903) || defined (STM8AF622x)
1079                     ; 209   case ITC_IRQ_TIM5_OVFTRI:
1079                     ; 210   case ITC_IRQ_TIM5_CAPCOM:
1079                     ; 211 #else
1079                     ; 212   case ITC_IRQ_TIM2_OVF:
1079                     ; 213   case ITC_IRQ_TIM2_CAPCOM:
1079                     ; 214 #endif /* STM8S903 or STM8AF622x*/
1079                     ; 215   case ITC_IRQ_TIM3_OVF:
1079                     ; 216     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
1081  0030 c67f73        	ld	a,32627
1082                     ; 217     break;
1084  0033 200d          	jp	LC001
1085  0035               L752:
1086                     ; 219   case ITC_IRQ_TIM3_CAPCOM:
1086                     ; 220 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
1086                     ; 221     defined(STM8S003) ||defined(STM8S001) || defined (STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
1086                     ; 222   case ITC_IRQ_UART1_TX:
1086                     ; 223   case ITC_IRQ_UART1_RX:
1086                     ; 224 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
1086                     ; 225 #if defined(STM8AF622x)
1086                     ; 226   case ITC_IRQ_UART4_TX:
1086                     ; 227   case ITC_IRQ_UART4_RX:
1086                     ; 228 #endif /*STM8AF622x */
1086                     ; 229   case ITC_IRQ_I2C:
1086                     ; 230     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
1088  0035 c67f74        	ld	a,32628
1089                     ; 231     break;
1091  0038 2008          	jp	LC001
1092  003a               L162:
1093                     ; 245   case ITC_IRQ_ADC1:
1093                     ; 246 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
1093                     ; 247 #if defined (STM8S903) || defined (STM8AF622x)
1093                     ; 248   case ITC_IRQ_TIM6_OVFTRI:
1093                     ; 249 #else
1093                     ; 250   case ITC_IRQ_TIM4_OVF:
1093                     ; 251 #endif /*STM8S903 or STM8AF622x */
1093                     ; 252     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
1095  003a c67f75        	ld	a,32629
1096                     ; 253     break;
1098  003d 2003          	jp	LC001
1099  003f               L362:
1100                     ; 255   case ITC_IRQ_EEPROM_EEC:
1100                     ; 256     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
1102  003f c67f76        	ld	a,32630
1103  0042               LC001:
1104  0042 1401          	and	a,(OFST-1,sp)
1105  0044 6b02          	ld	(OFST+0,sp),a
1107                     ; 257     break;
1109                     ; 259   default:
1109                     ; 260     break;
1111  0046               L114:
1112                     ; 263   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
1114  0046 7b03          	ld	a,(OFST+1,sp)
1115  0048 a403          	and	a,#3
1116  004a 48            	sll	a
1117  004b 5f            	clrw	x
1118  004c 97            	ld	xl,a
1119  004d 7b02          	ld	a,(OFST+0,sp)
1120  004f 5d            	tnzw	x
1121  0050 2704          	jreq	L27
1122  0052               L47:
1123  0052 44            	srl	a
1124  0053 5a            	decw	x
1125  0054 26fc          	jrne	L47
1126  0056               L27:
1128                     ; 265   return((ITC_PriorityLevel_TypeDef)Value);
1132  0056 5b03          	addw	sp,#3
1133  0058 81            	ret	
1197                     	switch	.const
1198  0032               L211:
1199  0032 0036          	dc.w	L314
1200  0034 0036          	dc.w	L314
1201  0036 0036          	dc.w	L314
1202  0038 0036          	dc.w	L314
1203  003a 0048          	dc.w	L514
1204  003c 0048          	dc.w	L514
1205  003e 0048          	dc.w	L514
1206  0040 0048          	dc.w	L514
1207  0042 00b2          	dc.w	L764
1208  0044 00b2          	dc.w	L764
1209  0046 005a          	dc.w	L714
1210  0048 005a          	dc.w	L714
1211  004a 006c          	dc.w	L124
1212  004c 006c          	dc.w	L124
1213  004e 006c          	dc.w	L124
1214  0050 006c          	dc.w	L124
1215  0052 007e          	dc.w	L324
1216  0054 007e          	dc.w	L324
1217  0056 007e          	dc.w	L324
1218  0058 007e          	dc.w	L324
1219  005a 00b2          	dc.w	L764
1220  005c 00b2          	dc.w	L764
1221  005e 0090          	dc.w	L524
1222  0060 0090          	dc.w	L524
1223  0062 00a2          	dc.w	L724
1224                     ; 281 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
1224                     ; 282 {
1225                     .text:	section	.text,new
1226  0000               _ITC_SetSoftwarePriority:
1228  0000 89            	pushw	x
1229  0001 89            	pushw	x
1230       00000002      OFST:	set	2
1233                     ; 283   uint8_t Mask = 0;
1235                     ; 284   uint8_t NewPriority = 0;
1237                     ; 287   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
1239                     ; 288   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
1241                     ; 291   assert_param(IS_ITC_INTERRUPTS_DISABLED);
1243                     ; 295   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
1245  0002 9e            	ld	a,xh
1246  0003 a403          	and	a,#3
1247  0005 48            	sll	a
1248  0006 5f            	clrw	x
1249  0007 97            	ld	xl,a
1250  0008 a603          	ld	a,#3
1251  000a 5d            	tnzw	x
1252  000b 2704          	jreq	L001
1253  000d               L201:
1254  000d 48            	sll	a
1255  000e 5a            	decw	x
1256  000f 26fc          	jrne	L201
1257  0011               L001:
1258  0011 43            	cpl	a
1259  0012 6b01          	ld	(OFST-1,sp),a
1261                     ; 298   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
1263  0014 7b03          	ld	a,(OFST+1,sp)
1264  0016 a403          	and	a,#3
1265  0018 48            	sll	a
1266  0019 5f            	clrw	x
1267  001a 97            	ld	xl,a
1268  001b 7b04          	ld	a,(OFST+2,sp)
1269  001d 5d            	tnzw	x
1270  001e 2704          	jreq	L401
1271  0020               L601:
1272  0020 48            	sll	a
1273  0021 5a            	decw	x
1274  0022 26fc          	jrne	L601
1275  0024               L401:
1276  0024 6b02          	ld	(OFST+0,sp),a
1278                     ; 300   switch (IrqNum)
1280  0026 7b03          	ld	a,(OFST+1,sp)
1282                     ; 390   default:
1282                     ; 391     break;
1283  0028 a119          	cp	a,#25
1284  002a 2503cc00b2    	jruge	L764
1285  002f 5f            	clrw	x
1286  0030 97            	ld	xl,a
1287  0031 58            	sllw	x
1288  0032 de0032        	ldw	x,(L211,x)
1289  0035 fc            	jp	(x)
1290  0036               L314:
1291                     ; 302   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
1291                     ; 303   case ITC_IRQ_AWU:
1291                     ; 304   case ITC_IRQ_CLK:
1291                     ; 305   case ITC_IRQ_PORTA:
1291                     ; 306     ITC->ISPR1 &= Mask;
1293  0036 c67f70        	ld	a,32624
1294  0039 1401          	and	a,(OFST-1,sp)
1295  003b c77f70        	ld	32624,a
1296                     ; 307     ITC->ISPR1 |= NewPriority;
1298  003e c67f70        	ld	a,32624
1299  0041 1a02          	or	a,(OFST+0,sp)
1300  0043 c77f70        	ld	32624,a
1301                     ; 308     break;
1303  0046 206a          	jra	L764
1304  0048               L514:
1305                     ; 310   case ITC_IRQ_PORTB:
1305                     ; 311   case ITC_IRQ_PORTC:
1305                     ; 312   case ITC_IRQ_PORTD:
1305                     ; 313   case ITC_IRQ_PORTE:
1305                     ; 314     ITC->ISPR2 &= Mask;
1307  0048 c67f71        	ld	a,32625
1308  004b 1401          	and	a,(OFST-1,sp)
1309  004d c77f71        	ld	32625,a
1310                     ; 315     ITC->ISPR2 |= NewPriority;
1312  0050 c67f71        	ld	a,32625
1313  0053 1a02          	or	a,(OFST+0,sp)
1314  0055 c77f71        	ld	32625,a
1315                     ; 316     break;
1317  0058 2058          	jra	L764
1318  005a               L714:
1319                     ; 325   case ITC_IRQ_SPI:
1319                     ; 326   case ITC_IRQ_TIM1_OVF:
1319                     ; 327     ITC->ISPR3 &= Mask;
1321  005a c67f72        	ld	a,32626
1322  005d 1401          	and	a,(OFST-1,sp)
1323  005f c77f72        	ld	32626,a
1324                     ; 328     ITC->ISPR3 |= NewPriority;
1326  0062 c67f72        	ld	a,32626
1327  0065 1a02          	or	a,(OFST+0,sp)
1328  0067 c77f72        	ld	32626,a
1329                     ; 329     break;
1331  006a 2046          	jra	L764
1332  006c               L124:
1333                     ; 331   case ITC_IRQ_TIM1_CAPCOM:
1333                     ; 332 #if defined(STM8S903) || defined(STM8AF622x) 
1333                     ; 333   case ITC_IRQ_TIM5_OVFTRI:
1333                     ; 334   case ITC_IRQ_TIM5_CAPCOM:
1333                     ; 335 #else
1333                     ; 336   case ITC_IRQ_TIM2_OVF:
1333                     ; 337   case ITC_IRQ_TIM2_CAPCOM:
1333                     ; 338 #endif /*STM8S903 or STM8AF622x */
1333                     ; 339   case ITC_IRQ_TIM3_OVF:
1333                     ; 340     ITC->ISPR4 &= Mask;
1335  006c c67f73        	ld	a,32627
1336  006f 1401          	and	a,(OFST-1,sp)
1337  0071 c77f73        	ld	32627,a
1338                     ; 341     ITC->ISPR4 |= NewPriority;
1340  0074 c67f73        	ld	a,32627
1341  0077 1a02          	or	a,(OFST+0,sp)
1342  0079 c77f73        	ld	32627,a
1343                     ; 342     break;
1345  007c 2034          	jra	L764
1346  007e               L324:
1347                     ; 344   case ITC_IRQ_TIM3_CAPCOM:
1347                     ; 345 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
1347                     ; 346     defined(STM8S001) ||defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
1347                     ; 347   case ITC_IRQ_UART1_TX:
1347                     ; 348   case ITC_IRQ_UART1_RX:
1347                     ; 349 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
1347                     ; 350 #if defined(STM8AF622x)
1347                     ; 351   case ITC_IRQ_UART4_TX:
1347                     ; 352   case ITC_IRQ_UART4_RX:
1347                     ; 353 #endif /*STM8AF622x */
1347                     ; 354   case ITC_IRQ_I2C:
1347                     ; 355     ITC->ISPR5 &= Mask;
1349  007e c67f74        	ld	a,32628
1350  0081 1401          	and	a,(OFST-1,sp)
1351  0083 c77f74        	ld	32628,a
1352                     ; 356     ITC->ISPR5 |= NewPriority;
1354  0086 c67f74        	ld	a,32628
1355  0089 1a02          	or	a,(OFST+0,sp)
1356  008b c77f74        	ld	32628,a
1357                     ; 357     break;
1359  008e 2022          	jra	L764
1360  0090               L524:
1361                     ; 373   case ITC_IRQ_ADC1:
1361                     ; 374 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
1361                     ; 375     
1361                     ; 376 #if defined (STM8S903) || defined (STM8AF622x)
1361                     ; 377   case ITC_IRQ_TIM6_OVFTRI:
1361                     ; 378 #else
1361                     ; 379   case ITC_IRQ_TIM4_OVF:
1361                     ; 380 #endif /* STM8S903 or STM8AF622x */
1361                     ; 381     ITC->ISPR6 &= Mask;
1363  0090 c67f75        	ld	a,32629
1364  0093 1401          	and	a,(OFST-1,sp)
1365  0095 c77f75        	ld	32629,a
1366                     ; 382     ITC->ISPR6 |= NewPriority;
1368  0098 c67f75        	ld	a,32629
1369  009b 1a02          	or	a,(OFST+0,sp)
1370  009d c77f75        	ld	32629,a
1371                     ; 383     break;
1373  00a0 2010          	jra	L764
1374  00a2               L724:
1375                     ; 385   case ITC_IRQ_EEPROM_EEC:
1375                     ; 386     ITC->ISPR7 &= Mask;
1377  00a2 c67f76        	ld	a,32630
1378  00a5 1401          	and	a,(OFST-1,sp)
1379  00a7 c77f76        	ld	32630,a
1380                     ; 387     ITC->ISPR7 |= NewPriority;
1382  00aa c67f76        	ld	a,32630
1383  00ad 1a02          	or	a,(OFST+0,sp)
1384  00af c77f76        	ld	32630,a
1385                     ; 388     break;
1387                     ; 390   default:
1387                     ; 391     break;
1389  00b2               L764:
1390                     ; 393 }
1393  00b2 5b04          	addw	sp,#4
1394  00b4 81            	ret	
1407                     	xdef	_ITC_GetSoftwarePriority
1408                     	xdef	_ITC_SetSoftwarePriority
1409                     	xdef	_ITC_GetSoftIntStatus
1410                     	xdef	_ITC_DeInit
1411                     	xdef	_ITC_GetCPUCC
1412                     	xdef	_setFlagUartTXE
1413                     	xdef	_getFlagUartTXE
1414                     	xdef	f_UART_TXE_IRQHandler
1415                     	xdef	_setFlagUartRXNE
1416                     	xdef	_getBufferRX
1417                     	xdef	_getFlagUartRXNE
1418                     	xdef	f_UART_RXNE_IRQHandler
1419                     	switch	.ubsct
1420  0000               L7_bufferRX:
1421  0000 000000000000  	ds.b	6
1422                     	xdef	_setFlagTimer1
1423                     	xdef	_getFlagTimer1
1424                     	xdef	f_TIM1_OV_IRQHandler
1425                     	xref	_UART1_ClearITPendingBit
1426                     	xref	_UART1_ClearFlag
1427                     	xref	_UART1_ReceiveData8
1428                     	xref	_UART1_ITConfig
1429                     	xref	_TIM1_ClearITPendingBit
1430                     	xref	_TIM1_ClearFlag
1431                     	xref.b	c_x
1432                     	xref.b	c_y
1452                     	xref	c_xymov
1453                     	end

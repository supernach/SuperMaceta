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
 112                     ; 20 @far @interrupt void NonHandledInterrupt (void)
 112                     ; 21 {
 113                     .text:	section	.text,new
 114  0000               f_NonHandledInterrupt:
 118                     ; 25 	return;
 121  0000 80            	iret	
 123                     .const:	section	.text
 124  0000               __vectab:
 125  0000 82            	dc.b	130
 127  0001 00            	dc.b	page(__stext)
 128  0002 0000          	dc.w	__stext
 129  0004 82            	dc.b	130
 131  0005 00            	dc.b	page(f_NonHandledInterrupt)
 132  0006 0000          	dc.w	f_NonHandledInterrupt
 133  0008 82            	dc.b	130
 135  0009 00            	dc.b	page(f_NonHandledInterrupt)
 136  000a 0000          	dc.w	f_NonHandledInterrupt
 137  000c 82            	dc.b	130
 139  000d 00            	dc.b	page(f_NonHandledInterrupt)
 140  000e 0000          	dc.w	f_NonHandledInterrupt
 141  0010 82            	dc.b	130
 143  0011 00            	dc.b	page(f_NonHandledInterrupt)
 144  0012 0000          	dc.w	f_NonHandledInterrupt
 145  0014 82            	dc.b	130
 147  0015 00            	dc.b	page(f_NonHandledInterrupt)
 148  0016 0000          	dc.w	f_NonHandledInterrupt
 149  0018 82            	dc.b	130
 151  0019 00            	dc.b	page(f_NonHandledInterrupt)
 152  001a 0000          	dc.w	f_NonHandledInterrupt
 153  001c 82            	dc.b	130
 155  001d 00            	dc.b	page(f_NonHandledInterrupt)
 156  001e 0000          	dc.w	f_NonHandledInterrupt
 157  0020 82            	dc.b	130
 159  0021 00            	dc.b	page(f_NonHandledInterrupt)
 160  0022 0000          	dc.w	f_NonHandledInterrupt
 161  0024 82            	dc.b	130
 163  0025 00            	dc.b	page(f_NonHandledInterrupt)
 164  0026 0000          	dc.w	f_NonHandledInterrupt
 165  0028 82            	dc.b	130
 167  0029 00            	dc.b	page(f_NonHandledInterrupt)
 168  002a 0000          	dc.w	f_NonHandledInterrupt
 169  002c 82            	dc.b	130
 171  002d 00            	dc.b	page(f_NonHandledInterrupt)
 172  002e 0000          	dc.w	f_NonHandledInterrupt
 173  0030 82            	dc.b	130
 175  0031 00            	dc.b	page(f_NonHandledInterrupt)
 176  0032 0000          	dc.w	f_NonHandledInterrupt
 177  0034 82            	dc.b	130
 179  0035 00            	dc.b	page(f_TIM1_OV_IRQHandler)
 180  0036 0000          	dc.w	f_TIM1_OV_IRQHandler
 181  0038 82            	dc.b	130
 183  0039 00            	dc.b	page(f_NonHandledInterrupt)
 184  003a 0000          	dc.w	f_NonHandledInterrupt
 185  003c 82            	dc.b	130
 187  003d 00            	dc.b	page(f_TIM2_OV_IRQHandler)
 188  003e 0000          	dc.w	f_TIM2_OV_IRQHandler
 189  0040 82            	dc.b	130
 191  0041 00            	dc.b	page(f_NonHandledInterrupt)
 192  0042 0000          	dc.w	f_NonHandledInterrupt
 193  0044 82            	dc.b	130
 195  0045 00            	dc.b	page(f_NonHandledInterrupt)
 196  0046 0000          	dc.w	f_NonHandledInterrupt
 197  0048 82            	dc.b	130
 199  0049 00            	dc.b	page(f_NonHandledInterrupt)
 200  004a 0000          	dc.w	f_NonHandledInterrupt
 201  004c 82            	dc.b	130
 203  004d 00            	dc.b	page(f_UART_TXE_IRQHandler)
 204  004e 0000          	dc.w	f_UART_TXE_IRQHandler
 205  0050 82            	dc.b	130
 207  0051 00            	dc.b	page(f_UART_RXNE_IRQHandler)
 208  0052 0000          	dc.w	f_UART_RXNE_IRQHandler
 209  0054 82            	dc.b	130
 211  0055 00            	dc.b	page(f_NonHandledInterrupt)
 212  0056 0000          	dc.w	f_NonHandledInterrupt
 213  0058 82            	dc.b	130
 215  0059 00            	dc.b	page(f_NonHandledInterrupt)
 216  005a 0000          	dc.w	f_NonHandledInterrupt
 217  005c 82            	dc.b	130
 219  005d 00            	dc.b	page(f_NonHandledInterrupt)
 220  005e 0000          	dc.w	f_NonHandledInterrupt
 221  0060 82            	dc.b	130
 223  0061 00            	dc.b	page(f_NonHandledInterrupt)
 224  0062 0000          	dc.w	f_NonHandledInterrupt
 225  0064 82            	dc.b	130
 227  0065 00            	dc.b	page(f_NonHandledInterrupt)
 228  0066 0000          	dc.w	f_NonHandledInterrupt
 229  0068 82            	dc.b	130
 231  0069 00            	dc.b	page(f_NonHandledInterrupt)
 232  006a 0000          	dc.w	f_NonHandledInterrupt
 233  006c 82            	dc.b	130
 235  006d 00            	dc.b	page(f_NonHandledInterrupt)
 236  006e 0000          	dc.w	f_NonHandledInterrupt
 237  0070 82            	dc.b	130
 239  0071 00            	dc.b	page(f_NonHandledInterrupt)
 240  0072 0000          	dc.w	f_NonHandledInterrupt
 241  0074 82            	dc.b	130
 243  0075 00            	dc.b	page(f_NonHandledInterrupt)
 244  0076 0000          	dc.w	f_NonHandledInterrupt
 245  0078 82            	dc.b	130
 247  0079 00            	dc.b	page(f_NonHandledInterrupt)
 248  007a 0000          	dc.w	f_NonHandledInterrupt
 249  007c 82            	dc.b	130
 251  007d 00            	dc.b	page(f_NonHandledInterrupt)
 252  007e 0000          	dc.w	f_NonHandledInterrupt
 303                     	xdef	__vectab
 304                     	xref	__stext
 305                     	xdef	f_NonHandledInterrupt
 306                     	xref	f_UART_TXE_IRQHandler
 307                     	xref	f_UART_RXNE_IRQHandler
 308                     	xref	f_TIM2_OV_IRQHandler
 309                     	xref	f_TIM1_OV_IRQHandler
 328                     	end

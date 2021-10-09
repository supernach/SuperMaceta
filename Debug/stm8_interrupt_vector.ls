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
 101                     ; 20 @far @interrupt void NonHandledInterrupt (void)
 101                     ; 21 {
 102                     .text:	section	.text,new
 103  0000               f_NonHandledInterrupt:
 107                     ; 25 	return;
 110  0000 80            	iret	
 112                     .const:	section	.text
 113  0000               __vectab:
 114  0000 82            	dc.b	130
 116  0001 00            	dc.b	page(__stext)
 117  0002 0000          	dc.w	__stext
 118  0004 82            	dc.b	130
 120  0005 00            	dc.b	page(f_NonHandledInterrupt)
 121  0006 0000          	dc.w	f_NonHandledInterrupt
 122  0008 82            	dc.b	130
 124  0009 00            	dc.b	page(f_NonHandledInterrupt)
 125  000a 0000          	dc.w	f_NonHandledInterrupt
 126  000c 82            	dc.b	130
 128  000d 00            	dc.b	page(f_NonHandledInterrupt)
 129  000e 0000          	dc.w	f_NonHandledInterrupt
 130  0010 82            	dc.b	130
 132  0011 00            	dc.b	page(f_NonHandledInterrupt)
 133  0012 0000          	dc.w	f_NonHandledInterrupt
 134  0014 82            	dc.b	130
 136  0015 00            	dc.b	page(f_NonHandledInterrupt)
 137  0016 0000          	dc.w	f_NonHandledInterrupt
 138  0018 82            	dc.b	130
 140  0019 00            	dc.b	page(f_NonHandledInterrupt)
 141  001a 0000          	dc.w	f_NonHandledInterrupt
 142  001c 82            	dc.b	130
 144  001d 00            	dc.b	page(f_NonHandledInterrupt)
 145  001e 0000          	dc.w	f_NonHandledInterrupt
 146  0020 82            	dc.b	130
 148  0021 00            	dc.b	page(f_NonHandledInterrupt)
 149  0022 0000          	dc.w	f_NonHandledInterrupt
 150  0024 82            	dc.b	130
 152  0025 00            	dc.b	page(f_NonHandledInterrupt)
 153  0026 0000          	dc.w	f_NonHandledInterrupt
 154  0028 82            	dc.b	130
 156  0029 00            	dc.b	page(f_NonHandledInterrupt)
 157  002a 0000          	dc.w	f_NonHandledInterrupt
 158  002c 82            	dc.b	130
 160  002d 00            	dc.b	page(f_NonHandledInterrupt)
 161  002e 0000          	dc.w	f_NonHandledInterrupt
 162  0030 82            	dc.b	130
 164  0031 00            	dc.b	page(f_NonHandledInterrupt)
 165  0032 0000          	dc.w	f_NonHandledInterrupt
 166  0034 82            	dc.b	130
 168  0035 00            	dc.b	page(f_TIM1_OV_IRQHandler)
 169  0036 0000          	dc.w	f_TIM1_OV_IRQHandler
 170  0038 82            	dc.b	130
 172  0039 00            	dc.b	page(f_NonHandledInterrupt)
 173  003a 0000          	dc.w	f_NonHandledInterrupt
 174  003c 82            	dc.b	130
 176  003d 00            	dc.b	page(f_NonHandledInterrupt)
 177  003e 0000          	dc.w	f_NonHandledInterrupt
 178  0040 82            	dc.b	130
 180  0041 00            	dc.b	page(f_NonHandledInterrupt)
 181  0042 0000          	dc.w	f_NonHandledInterrupt
 182  0044 82            	dc.b	130
 184  0045 00            	dc.b	page(f_NonHandledInterrupt)
 185  0046 0000          	dc.w	f_NonHandledInterrupt
 186  0048 82            	dc.b	130
 188  0049 00            	dc.b	page(f_NonHandledInterrupt)
 189  004a 0000          	dc.w	f_NonHandledInterrupt
 190  004c 82            	dc.b	130
 192  004d 00            	dc.b	page(f_UART_TXE_IRQHandler)
 193  004e 0000          	dc.w	f_UART_TXE_IRQHandler
 194  0050 82            	dc.b	130
 196  0051 00            	dc.b	page(f_UART_RXNE_IRQHandler)
 197  0052 0000          	dc.w	f_UART_RXNE_IRQHandler
 198  0054 82            	dc.b	130
 200  0055 00            	dc.b	page(f_NonHandledInterrupt)
 201  0056 0000          	dc.w	f_NonHandledInterrupt
 202  0058 82            	dc.b	130
 204  0059 00            	dc.b	page(f_NonHandledInterrupt)
 205  005a 0000          	dc.w	f_NonHandledInterrupt
 206  005c 82            	dc.b	130
 208  005d 00            	dc.b	page(f_NonHandledInterrupt)
 209  005e 0000          	dc.w	f_NonHandledInterrupt
 210  0060 82            	dc.b	130
 212  0061 00            	dc.b	page(f_NonHandledInterrupt)
 213  0062 0000          	dc.w	f_NonHandledInterrupt
 214  0064 82            	dc.b	130
 216  0065 00            	dc.b	page(f_NonHandledInterrupt)
 217  0066 0000          	dc.w	f_NonHandledInterrupt
 218  0068 82            	dc.b	130
 220  0069 00            	dc.b	page(f_NonHandledInterrupt)
 221  006a 0000          	dc.w	f_NonHandledInterrupt
 222  006c 82            	dc.b	130
 224  006d 00            	dc.b	page(f_NonHandledInterrupt)
 225  006e 0000          	dc.w	f_NonHandledInterrupt
 226  0070 82            	dc.b	130
 228  0071 00            	dc.b	page(f_NonHandledInterrupt)
 229  0072 0000          	dc.w	f_NonHandledInterrupt
 230  0074 82            	dc.b	130
 232  0075 00            	dc.b	page(f_NonHandledInterrupt)
 233  0076 0000          	dc.w	f_NonHandledInterrupt
 234  0078 82            	dc.b	130
 236  0079 00            	dc.b	page(f_NonHandledInterrupt)
 237  007a 0000          	dc.w	f_NonHandledInterrupt
 238  007c 82            	dc.b	130
 240  007d 00            	dc.b	page(f_NonHandledInterrupt)
 241  007e 0000          	dc.w	f_NonHandledInterrupt
 292                     	xdef	__vectab
 293                     	xref	__stext
 294                     	xdef	f_NonHandledInterrupt
 295                     	xref	f_UART_TXE_IRQHandler
 296                     	xref	f_UART_RXNE_IRQHandler
 297                     	xref	f_TIM1_OV_IRQHandler
 316                     	end

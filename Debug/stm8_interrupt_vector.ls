   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  21  0002               L5_flagUartRXNE:
  22  0002 00            	dc.b	0
  90                     ; 20 @far @interrupt void NonHandledInterrupt (void)
  90                     ; 21 {
  91                     .text:	section	.text,new
  92  0000               f_NonHandledInterrupt:
  96                     ; 25 	return;
  99  0000 80            	iret	
 101                     .const:	section	.text
 102  0000               __vectab:
 103  0000 82            	dc.b	130
 105  0001 00            	dc.b	page(__stext)
 106  0002 0000          	dc.w	__stext
 107  0004 82            	dc.b	130
 109  0005 00            	dc.b	page(f_NonHandledInterrupt)
 110  0006 0000          	dc.w	f_NonHandledInterrupt
 111  0008 82            	dc.b	130
 113  0009 00            	dc.b	page(f_NonHandledInterrupt)
 114  000a 0000          	dc.w	f_NonHandledInterrupt
 115  000c 82            	dc.b	130
 117  000d 00            	dc.b	page(f_NonHandledInterrupt)
 118  000e 0000          	dc.w	f_NonHandledInterrupt
 119  0010 82            	dc.b	130
 121  0011 00            	dc.b	page(f_NonHandledInterrupt)
 122  0012 0000          	dc.w	f_NonHandledInterrupt
 123  0014 82            	dc.b	130
 125  0015 00            	dc.b	page(f_NonHandledInterrupt)
 126  0016 0000          	dc.w	f_NonHandledInterrupt
 127  0018 82            	dc.b	130
 129  0019 00            	dc.b	page(f_NonHandledInterrupt)
 130  001a 0000          	dc.w	f_NonHandledInterrupt
 131  001c 82            	dc.b	130
 133  001d 00            	dc.b	page(f_NonHandledInterrupt)
 134  001e 0000          	dc.w	f_NonHandledInterrupt
 135  0020 82            	dc.b	130
 137  0021 00            	dc.b	page(f_NonHandledInterrupt)
 138  0022 0000          	dc.w	f_NonHandledInterrupt
 139  0024 82            	dc.b	130
 141  0025 00            	dc.b	page(f_NonHandledInterrupt)
 142  0026 0000          	dc.w	f_NonHandledInterrupt
 143  0028 82            	dc.b	130
 145  0029 00            	dc.b	page(f_NonHandledInterrupt)
 146  002a 0000          	dc.w	f_NonHandledInterrupt
 147  002c 82            	dc.b	130
 149  002d 00            	dc.b	page(f_NonHandledInterrupt)
 150  002e 0000          	dc.w	f_NonHandledInterrupt
 151  0030 82            	dc.b	130
 153  0031 00            	dc.b	page(f_NonHandledInterrupt)
 154  0032 0000          	dc.w	f_NonHandledInterrupt
 155  0034 82            	dc.b	130
 157  0035 00            	dc.b	page(f_TIM1_OV_IRQHandler)
 158  0036 0000          	dc.w	f_TIM1_OV_IRQHandler
 159  0038 82            	dc.b	130
 161  0039 00            	dc.b	page(f_NonHandledInterrupt)
 162  003a 0000          	dc.w	f_NonHandledInterrupt
 163  003c 82            	dc.b	130
 165  003d 00            	dc.b	page(f_NonHandledInterrupt)
 166  003e 0000          	dc.w	f_NonHandledInterrupt
 167  0040 82            	dc.b	130
 169  0041 00            	dc.b	page(f_NonHandledInterrupt)
 170  0042 0000          	dc.w	f_NonHandledInterrupt
 171  0044 82            	dc.b	130
 173  0045 00            	dc.b	page(f_NonHandledInterrupt)
 174  0046 0000          	dc.w	f_NonHandledInterrupt
 175  0048 82            	dc.b	130
 177  0049 00            	dc.b	page(f_NonHandledInterrupt)
 178  004a 0000          	dc.w	f_NonHandledInterrupt
 179  004c 82            	dc.b	130
 181  004d 00            	dc.b	page(f_NonHandledInterrupt)
 182  004e 0000          	dc.w	f_NonHandledInterrupt
 183  0050 82            	dc.b	130
 185  0051 00            	dc.b	page(f_UART_RXNE_IRQHandler)
 186  0052 0000          	dc.w	f_UART_RXNE_IRQHandler
 187  0054 82            	dc.b	130
 189  0055 00            	dc.b	page(f_NonHandledInterrupt)
 190  0056 0000          	dc.w	f_NonHandledInterrupt
 191  0058 82            	dc.b	130
 193  0059 00            	dc.b	page(f_NonHandledInterrupt)
 194  005a 0000          	dc.w	f_NonHandledInterrupt
 195  005c 82            	dc.b	130
 197  005d 00            	dc.b	page(f_NonHandledInterrupt)
 198  005e 0000          	dc.w	f_NonHandledInterrupt
 199  0060 82            	dc.b	130
 201  0061 00            	dc.b	page(f_NonHandledInterrupt)
 202  0062 0000          	dc.w	f_NonHandledInterrupt
 203  0064 82            	dc.b	130
 205  0065 00            	dc.b	page(f_NonHandledInterrupt)
 206  0066 0000          	dc.w	f_NonHandledInterrupt
 207  0068 82            	dc.b	130
 209  0069 00            	dc.b	page(f_NonHandledInterrupt)
 210  006a 0000          	dc.w	f_NonHandledInterrupt
 211  006c 82            	dc.b	130
 213  006d 00            	dc.b	page(f_NonHandledInterrupt)
 214  006e 0000          	dc.w	f_NonHandledInterrupt
 215  0070 82            	dc.b	130
 217  0071 00            	dc.b	page(f_NonHandledInterrupt)
 218  0072 0000          	dc.w	f_NonHandledInterrupt
 219  0074 82            	dc.b	130
 221  0075 00            	dc.b	page(f_NonHandledInterrupt)
 222  0076 0000          	dc.w	f_NonHandledInterrupt
 223  0078 82            	dc.b	130
 225  0079 00            	dc.b	page(f_NonHandledInterrupt)
 226  007a 0000          	dc.w	f_NonHandledInterrupt
 227  007c 82            	dc.b	130
 229  007d 00            	dc.b	page(f_NonHandledInterrupt)
 230  007e 0000          	dc.w	f_NonHandledInterrupt
 281                     	xdef	__vectab
 282                     	xref	__stext
 283                     	xdef	f_NonHandledInterrupt
 284                     	xref	f_UART_RXNE_IRQHandler
 285                     	xref	f_TIM1_OV_IRQHandler
 304                     	end

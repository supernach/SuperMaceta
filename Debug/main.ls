   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  21  0002               L5_flagUartRXNE:
  22  0002 00            	dc.b	0
  61                     .const:	section	.text
  62  0000               L53_HX711_LONGITUDTRAMA:
  63  0000 18            	dc.b	24
  64  0001               L73_HX711_TIEMPOCLOCK:
  65  0001 03            	dc.b	3
  66  0002               L14_HX711_TIEMPOCLOCKSLEEP:
  67  0002 46            	dc.b	70
1982                     ; 225 int main()
1982                     ; 226 {
1984                     .text:	section	.text,new
1985  0000               _main:
1987  0000 5204          	subw	sp,#4
1988       00000004      OFST:	set	4
1991                     ; 57 	GPIO_DeInit(GPIOA);
1995  0002 ae5000        	ldw	x,#20480
1996  0005 cd0000        	call	_GPIO_DeInit
1998                     ; 58 	GPIO_DeInit(GPIOB);
2000  0008 ae5005        	ldw	x,#20485
2001  000b cd0000        	call	_GPIO_DeInit
2003                     ; 59 	GPIO_DeInit(GPIOC);
2005  000e ae500a        	ldw	x,#20490
2006  0011 cd0000        	call	_GPIO_DeInit
2008                     ; 60 	GPIO_DeInit(GPIOD);
2010  0014 ae500f        	ldw	x,#20495
2011  0017 cd0000        	call	_GPIO_DeInit
2013                     ; 107 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
2016  001a ae0080        	ldw	x,#128
2017  001d cd0000        	call	_Clock_HSI_Init
2019                     ; 74 	SensorTempHum.Config.HW.Puerto = GPIOA;
2023  0020 ae5000        	ldw	x,#20480
2024  0023 bf58          	ldw	_SensorTempHum,x
2025                     ; 75 	SensorTempHum.Config.HW.Pin = GPIO_PIN_3;
2027  0025 3508005a      	mov	_SensorTempHum+2,#8
2028                     ; 78 	SensorPesaje.Config.DOUT.Puerto = GPIOD;
2030  0029 ae500f        	ldw	x,#20495
2031  002c bf3c          	ldw	_SensorPesaje,x
2032                     ; 79 	SensorPesaje.Config.DOUT.Pin = GPIO_PIN_2;
2034  002e 3504003e      	mov	_SensorPesaje+2,#4
2035                     ; 81 	SensorPesaje.Config.PD_SCK.Puerto = GPIOD;
2037  0032 bf40          	ldw	_SensorPesaje+4,x
2038                     ; 82 	SensorPesaje.Config.PD_SCK.Pin = GPIO_PIN_3;
2040  0034 35080042      	mov	_SensorPesaje+6,#8
2041                     ; 118 	Timer_Config_Init( &timer_Timeout.Config, TIMER1, CANAL1, COUNTERUP, SI, 1 );
2044  0038 ae0001        	ldw	x,#1
2045  003b 89            	pushw	x
2046  003c 4b00          	push	#0
2047  003e 4b00          	push	#0
2048  0040 4b00          	push	#0
2049  0042 4b00          	push	#0
2050  0044 ae0036        	ldw	x,#_timer_Timeout
2051  0047 cd0000        	call	_Timer_Config_Init
2053  004a 5b06          	addw	sp,#6
2054                     ; 119 	Timeout_Init( &Timeout, &timer_Timeout, &getFlagTimer1, &setFlagTimer1 );
2056  004c ae0000        	ldw	x,#_setFlagTimer1
2057  004f 89            	pushw	x
2058  0050 ae0000        	ldw	x,#_getFlagTimer1
2059  0053 89            	pushw	x
2060  0054 ae0036        	ldw	x,#_timer_Timeout
2061  0057 89            	pushw	x
2062  0058 ae002d        	ldw	x,#_Timeout
2063  005b cd0000        	call	_Timeout_Init
2065  005e 5b06          	addw	sp,#6
2066                     ; 121 	RS485_Init( &Comunicacion );
2068  0060 ae0000        	ldw	x,#_Comunicacion
2069  0063 cd0000        	call	_RS485_Init
2071                     ; 123 	DHT11_Init( &SensorTempHum, &dht11_Lectura, &Timeout );
2073  0066 ae002d        	ldw	x,#_Timeout
2074  0069 89            	pushw	x
2075  006a ae0000        	ldw	x,#_dht11_Lectura
2076  006d 89            	pushw	x
2077  006e ae0058        	ldw	x,#_SensorTempHum
2078  0071 cd0000        	call	_DHT11_Init
2080  0074 5b04          	addw	sp,#4
2081                     ; 124 	HX711_Init( &SensorPesaje, &hx711_Lectura, &hx711_Tarar, &Timeout );
2083  0076 ae002d        	ldw	x,#_Timeout
2084  0079 89            	pushw	x
2085  007a ae0000        	ldw	x,#_hx711_Tarar
2086  007d 89            	pushw	x
2087  007e ae0000        	ldw	x,#_hx711_Lectura
2088  0081 89            	pushw	x
2089  0082 ae003c        	ldw	x,#_SensorPesaje
2090  0085 cd0000        	call	_HX711_Init
2092  0088 5b06          	addw	sp,#6
2093                     ; 229 	SensorPesaje.Config.ValorZero = SensorPesaje.Tarar( &SensorPesaje );
2095  008a ae003c        	ldw	x,#_SensorPesaje
2096  008d 92cd56        	call	[_SensorPesaje+26.w]
2098  0090 cd0000        	call	c_uitolx
2100  0093 ae0047        	ldw	x,#_SensorPesaje+11
2101  0096 cd0000        	call	c_rtol
2103  0099               L5341:
2104                     ; 232 		if( getFlagUartRXNE( ) > 0 )
2106  0099 cd0000        	call	_getFlagUartRXNE
2108  009c 4d            	tnz	a
2109  009d 27fa          	jreq	L5341
2110                     ; 234 			LecturaRS485( &Comunicacion.Buffer.Rx, UART1_ReceiveData8( ) );
2113  009f ae001e        	ldw	x,#_Comunicacion+30
2114  00a2 1f03          	ldw	(OFST-1,sp),x
2118  00a4 cd0000        	call	_UART1_ReceiveData8
2120  00a7 6b01          	ld	(OFST-3,sp),a
2122                     ; 180 	uint8_t nuevaRecepcion = 0;
2124  00a9 0f02          	clr	(OFST-2,sp)
2126                     ; 182 	if( bufRX->Secuencia.pasoActual == 0 )
2128  00ab b625          	ld	a,_Comunicacion+37
2129  00ad 2617          	jrne	L3441
2130                     ; 184 		if( bufRX->ptrBuffer == ( bufRX->Secuencia.LecturaNodo.BytesaLeer ) - 1 )
2132  00af b627          	ld	a,_Comunicacion+39
2133  00b1 5f            	clrw	x
2134  00b2 97            	ld	xl,a
2135  00b3 5a            	decw	x
2136  00b4 b624          	ld	a,_Comunicacion+36
2137  00b6 905f          	clrw	y
2138  00b8 9097          	ld	yl,a
2139  00ba 90bf00        	ldw	c_y,y
2140  00bd b300          	cpw	x,c_y
2141  00bf 2648          	jrne	L7441
2142                     ; 186 			bufRX->Secuencia.pasoActual = bufRX->Secuencia.LecturaNodo.nPasoSiguiente;
2144  00c1 452625        	mov	_Comunicacion+37,_Comunicacion+38
2145  00c4 2043          	jra	L7441
2146  00c6               L3441:
2147                     ; 189 	else if( bufRX->Secuencia.pasoActual == 1 )
2149  00c6 a101          	cp	a,#1
2150  00c8 261a          	jrne	L1541
2151                     ; 191 		if( bufRX->ptrBuffer == ( ( bufRX->Secuencia.LecturaNodo.BytesaLeer + bufRX->Secuencia.LecturaOrdenDHT11.BytesaLeer ) - 1 ) )
2153  00ca b627          	ld	a,_Comunicacion+39
2154  00cc 5f            	clrw	x
2155  00cd bb29          	add	a,_Comunicacion+41
2156  00cf 59            	rlcw	x
2157  00d0 02            	rlwa	x,a
2158  00d1 5a            	decw	x
2159  00d2 b624          	ld	a,_Comunicacion+36
2160  00d4 905f          	clrw	y
2161  00d6 9097          	ld	yl,a
2162  00d8 90bf00        	ldw	c_y,y
2163  00db b300          	cpw	x,c_y
2164  00dd 262a          	jrne	L7441
2165                     ; 193 			bufRX->Secuencia.pasoActual = bufRX->Secuencia.LecturaOrdenDHT11.nPasoSiguiente;
2167  00df 452825        	mov	_Comunicacion+37,_Comunicacion+40
2168  00e2 2025          	jra	L7441
2169  00e4               L1541:
2170                     ; 196 	else if( bufRX->Secuencia.pasoActual == 2 )
2172  00e4 a102          	cp	a,#2
2173  00e6 2621          	jrne	L7441
2174                     ; 198 		if( bufRX->ptrBuffer == ( ( bufRX->Secuencia.LecturaNodo.BytesaLeer + bufRX->Secuencia.LecturaOrdenDHT11.BytesaLeer + bufRX->Secuencia.LecturaOrdenHX711.BytesaLeer ) - 1 ) )
2176  00e8 b627          	ld	a,_Comunicacion+39
2177  00ea 5f            	clrw	x
2178  00eb bb29          	add	a,_Comunicacion+41
2179  00ed 59            	rlcw	x
2180  00ee bb2b          	add	a,_Comunicacion+43
2181  00f0 2401          	jrnc	L44
2182  00f2 5c            	incw	x
2183  00f3               L44:
2184  00f3 02            	rlwa	x,a
2185  00f4 5a            	decw	x
2186  00f5 b624          	ld	a,_Comunicacion+36
2187  00f7 905f          	clrw	y
2188  00f9 9097          	ld	yl,a
2189  00fb 90bf00        	ldw	c_y,y
2190  00fe b300          	cpw	x,c_y
2191  0100 2607          	jrne	L7441
2192                     ; 200 			bufRX->Secuencia.pasoActual = bufRX->Secuencia.LecturaOrdenHX711.nPasoSiguiente;
2194  0102 452a25        	mov	_Comunicacion+37,_Comunicacion+42
2195                     ; 201 			nuevaRecepcion = 1;
2197  0105 a601          	ld	a,#1
2198  0107 6b02          	ld	(OFST-2,sp),a
2200  0109               L7441:
2201                     ; 209 	bufRX->buffer[bufRX->ptrBuffer] = dato;
2203  0109 1e03          	ldw	x,(OFST-1,sp)
2204  010b e606          	ld	a,(6,x)
2205  010d 5f            	clrw	x
2206  010e 97            	ld	xl,a
2207  010f 72fb03        	addw	x,(OFST-1,sp)
2208  0112 7b01          	ld	a,(OFST-3,sp)
2209  0114 f7            	ld	(x),a
2210                     ; 210 	bufRX->ptrBuffer = bufRX->ptrBuffer + 1;
2212  0115 1e03          	ldw	x,(OFST-1,sp)
2213  0117 6c06          	inc	(6,x)
2214                     ; 212 	if( nuevaRecepcion == 1 )
2216  0119 7b02          	ld	a,(OFST-2,sp)
2217  011b 4a            	dec	a
2218  011c 2602          	jrne	L5231
2219                     ; 214 		bufRX->ptrBuffer = 0;
2221  011e e706          	ld	(6,x),a
2222  0120               L5231:
2223                     ; 235 			setFlagUartRXNE( 0 );
2225  0120 4f            	clr	a
2226  0121 cd0000        	call	_setFlagUartRXNE
2228  0124 cc0099        	jra	L5341
2241                     	xdef	_main
2242                     	switch	.ubsct
2243  0000               _Comunicacion:
2244  0000 000000000000  	ds.b	45
2245                     	xdef	_Comunicacion
2246  002d               _Timeout:
2247  002d 000000000000  	ds.b	9
2248                     	xdef	_Timeout
2249  0036               _timer_Timeout:
2250  0036 000000000000  	ds.b	6
2251                     	xdef	_timer_Timeout
2252  003c               _SensorPesaje:
2253  003c 000000000000  	ds.b	28
2254                     	xdef	_SensorPesaje
2255  0058               _SensorTempHum:
2256  0058 000000000000  	ds.b	14
2257                     	xdef	_SensorTempHum
2258                     	xref	_RS485_Init
2259                     	xref	_hx711_Tarar
2260                     	xref	_hx711_Lectura
2261                     	xref	_HX711_Init
2262                     	xref	_dht11_Lectura
2263                     	xref	_DHT11_Init
2264                     	xref	_Timeout_Init
2265                     	xref	_Timer_Config_Init
2266                     	xref	_Clock_HSI_Init
2267                     	xref	_UART1_ReceiveData8
2268                     	xref	_setFlagUartRXNE
2269                     	xref	_getFlagUartRXNE
2270                     	xref	_setFlagTimer1
2271                     	xref	_getFlagTimer1
2272                     	xref	_GPIO_DeInit
2273                     	xref.b	c_y
2293                     	xref	c_rtol
2294                     	xref	c_uitolx
2295                     	end

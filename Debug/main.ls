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
2010                     ; 228 int main()
2010                     ; 229 {
2012                     .text:	section	.text,new
2013  0000               _main:
2015  0000 5204          	subw	sp,#4
2016       00000004      OFST:	set	4
2019                     ; 57 	GPIO_DeInit(GPIOA);
2023  0002 ae5000        	ldw	x,#20480
2024  0005 cd0000        	call	_GPIO_DeInit
2026                     ; 58 	GPIO_DeInit(GPIOB);
2028  0008 ae5005        	ldw	x,#20485
2029  000b cd0000        	call	_GPIO_DeInit
2031                     ; 59 	GPIO_DeInit(GPIOC);
2033  000e ae500a        	ldw	x,#20490
2034  0011 cd0000        	call	_GPIO_DeInit
2036                     ; 60 	GPIO_DeInit(GPIOD);
2038  0014 ae500f        	ldw	x,#20495
2039  0017 cd0000        	call	_GPIO_DeInit
2041                     ; 107 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
2044  001a ae0080        	ldw	x,#128
2045  001d cd0000        	call	_Clock_HSI_Init
2047                     ; 74 	SensorTempHum.Config.HW.Puerto = GPIOA;
2051  0020 ae5000        	ldw	x,#20480
2052  0023 bf5c          	ldw	_SensorTempHum,x
2053                     ; 75 	SensorTempHum.Config.HW.Pin = GPIO_PIN_3;
2055  0025 3508005e      	mov	_SensorTempHum+2,#8
2056                     ; 78 	SensorPesaje.Config.DOUT.Puerto = GPIOD;
2058  0029 ae500f        	ldw	x,#20495
2059  002c bf40          	ldw	_SensorPesaje,x
2060                     ; 79 	SensorPesaje.Config.DOUT.Pin = GPIO_PIN_2;
2062  002e 35040042      	mov	_SensorPesaje+2,#4
2063                     ; 81 	SensorPesaje.Config.PD_SCK.Puerto = GPIOD;
2065  0032 bf44          	ldw	_SensorPesaje+4,x
2066                     ; 82 	SensorPesaje.Config.PD_SCK.Pin = GPIO_PIN_3;
2068  0034 35080046      	mov	_SensorPesaje+6,#8
2069                     ; 118 	Timer_Config_Init( &timer_Timeout.Config, TIMER1, CANAL1, COUNTERUP, SI, 1 );
2072  0038 ae0001        	ldw	x,#1
2073  003b 89            	pushw	x
2074  003c 4b00          	push	#0
2075  003e 4b00          	push	#0
2076  0040 4b00          	push	#0
2077  0042 4b00          	push	#0
2078  0044 ae003a        	ldw	x,#_timer_Timeout
2079  0047 cd0000        	call	_Timer_Config_Init
2081  004a 5b06          	addw	sp,#6
2082                     ; 119 	Timeout_Init( &Timeout, &timer_Timeout, &getFlagTimer1, &setFlagTimer1 );
2084  004c ae0000        	ldw	x,#_setFlagTimer1
2085  004f 89            	pushw	x
2086  0050 ae0000        	ldw	x,#_getFlagTimer1
2087  0053 89            	pushw	x
2088  0054 ae003a        	ldw	x,#_timer_Timeout
2089  0057 89            	pushw	x
2090  0058 ae0031        	ldw	x,#_Timeout
2091  005b cd0000        	call	_Timeout_Init
2093  005e 5b06          	addw	sp,#6
2094                     ; 121 	RS485_Init( &Comunicacion );
2096  0060 ae0000        	ldw	x,#_Comunicacion
2097  0063 cd0000        	call	_RS485_Init
2099                     ; 123 	DHT11_Init( &SensorTempHum, &dht11_Lectura, &Timeout );
2101  0066 ae0031        	ldw	x,#_Timeout
2102  0069 89            	pushw	x
2103  006a ae0000        	ldw	x,#_dht11_Lectura
2104  006d 89            	pushw	x
2105  006e ae005c        	ldw	x,#_SensorTempHum
2106  0071 cd0000        	call	_DHT11_Init
2108  0074 5b04          	addw	sp,#4
2109                     ; 124 	HX711_Init( &SensorPesaje, &hx711_Lectura, &hx711_Tarar, &Timeout );
2111  0076 ae0031        	ldw	x,#_Timeout
2112  0079 89            	pushw	x
2113  007a ae0000        	ldw	x,#_hx711_Tarar
2114  007d 89            	pushw	x
2115  007e ae0000        	ldw	x,#_hx711_Lectura
2116  0081 89            	pushw	x
2117  0082 ae0040        	ldw	x,#_SensorPesaje
2118  0085 cd0000        	call	_HX711_Init
2120  0088 5b06          	addw	sp,#6
2121                     ; 232 	SensorPesaje.Config.ValorZero = SensorPesaje.Tarar( &SensorPesaje );
2123  008a ae0040        	ldw	x,#_SensorPesaje
2124  008d 92cd5a        	call	[_SensorPesaje+26.w]
2126  0090 cd0000        	call	c_uitolx
2128  0093 ae004b        	ldw	x,#_SensorPesaje+11
2129  0096 cd0000        	call	c_rtol
2131  0099               L5441:
2132                     ; 235 		if( getFlagUartRXNE( ) > 0 )
2134  0099 cd0000        	call	_getFlagUartRXNE
2136  009c 4d            	tnz	a
2137  009d 27fa          	jreq	L5441
2138                     ; 237 			LecturaRS485( &Comunicacion.Buffer.Rx, UART1_ReceiveData8( ) );
2141  009f ae001e        	ldw	x,#_Comunicacion+30
2142  00a2 1f03          	ldw	(OFST-1,sp),x
2146  00a4 cd0000        	call	_UART1_ReceiveData8
2148  00a7 6b01          	ld	(OFST-3,sp),a
2150                     ; 180 	uint8_t nuevaRecepcion = 0;
2152  00a9 0f02          	clr	(OFST-2,sp)
2154                     ; 182 	if( bufRX->Secuencia.pasoActual == bufRX->Secuencia.LecturaNodo.nPaso )
2156  00ab b625          	ld	a,_Comunicacion+37
2157  00ad b129          	cp	a,_Comunicacion+41
2158  00af 260f          	jrne	L3541
2159                     ; 184 		if( bufRX->ptrBuffer == bufRX->Secuencia.transicion )
2161  00b1 b624          	ld	a,_Comunicacion+36
2162  00b3 b126          	cp	a,_Comunicacion+38
2163  00b5 2633          	jrne	L7541
2164                     ; 186 			bufRX->Secuencia.pasoActual = bufRX->Secuencia.LecturaNodo.nPasoSiguiente;
2166  00b7 452725        	mov	_Comunicacion+37,_Comunicacion+39
2167                     ; 187 			bufRX->Secuencia.transicion = bufRX->Secuencia.transicion + bufRX->Secuencia.LecturaOrdenDHT11.BytesaLeer;
2169  00ba b626          	ld	a,_Comunicacion+38
2170  00bc bb2b          	add	a,_Comunicacion+43
2171  00be 2011          	jp	LC001
2172  00c0               L3541:
2173                     ; 190 	else if( bufRX->Secuencia.pasoActual == bufRX->Secuencia.LecturaOrdenDHT11.nPaso )
2175  00c0 b12c          	cp	a,_Comunicacion+44
2176  00c2 2611          	jrne	L1641
2177                     ; 192 		if( bufRX->ptrBuffer == bufRX->Secuencia.transicion )
2179  00c4 b624          	ld	a,_Comunicacion+36
2180  00c6 b126          	cp	a,_Comunicacion+38
2181  00c8 2620          	jrne	L7541
2182                     ; 194 			bufRX->Secuencia.pasoActual = bufRX->Secuencia.LecturaOrdenDHT11.nPasoSiguiente;
2184  00ca 452a25        	mov	_Comunicacion+37,_Comunicacion+42
2185                     ; 195 			bufRX->Secuencia.transicion = bufRX->Secuencia.transicion + bufRX->Secuencia.LecturaOrdenHX711.BytesaLeer;
2187  00cd b626          	ld	a,_Comunicacion+38
2188  00cf bb2e          	add	a,_Comunicacion+46
2189  00d1               LC001:
2190  00d1 b726          	ld	_Comunicacion+38,a
2191  00d3 2015          	jra	L7541
2192  00d5               L1641:
2193                     ; 198 	else if( bufRX->Secuencia.pasoActual ==  bufRX->Secuencia.LecturaOrdenHX711.nPaso )
2195  00d5 b12f          	cp	a,_Comunicacion+47
2196  00d7 2611          	jrne	L7541
2197                     ; 200 		if( bufRX->ptrBuffer == bufRX->Secuencia.transicion )
2199  00d9 b624          	ld	a,_Comunicacion+36
2200  00db b126          	cp	a,_Comunicacion+38
2201  00dd 260b          	jrne	L7541
2202                     ; 202 			bufRX->Secuencia.pasoActual = bufRX->Secuencia.LecturaOrdenHX711.nPasoSiguiente;
2204  00df 452d25        	mov	_Comunicacion+37,_Comunicacion+45
2205                     ; 203 			bufRX->Secuencia.transicion = 1; // (bytes nnodo - 1)
2207  00e2 35010026      	mov	_Comunicacion+38,#1
2208                     ; 204 			nuevaRecepcion = 1;
2210  00e6 a601          	ld	a,#1
2211  00e8 6b02          	ld	(OFST-2,sp),a
2213  00ea               L7541:
2214                     ; 212 	bufRX->buffer[bufRX->ptrBuffer] = dato;
2216  00ea 1e03          	ldw	x,(OFST-1,sp)
2217  00ec e606          	ld	a,(6,x)
2218  00ee 5f            	clrw	x
2219  00ef 97            	ld	xl,a
2220  00f0 72fb03        	addw	x,(OFST-1,sp)
2221  00f3 7b01          	ld	a,(OFST-3,sp)
2222  00f5 f7            	ld	(x),a
2223                     ; 213 	bufRX->ptrBuffer = bufRX->ptrBuffer + 1;
2225  00f6 1e03          	ldw	x,(OFST-1,sp)
2226  00f8 6c06          	inc	(6,x)
2227                     ; 215 	if( nuevaRecepcion == 1 )
2229  00fa 7b02          	ld	a,(OFST-2,sp)
2230  00fc 4a            	dec	a
2231  00fd 2602          	jrne	L1331
2232                     ; 217 		bufRX->ptrBuffer = 0;
2234  00ff e706          	ld	(6,x),a
2235  0101               L1331:
2236                     ; 238 			setFlagUartRXNE( 0 );
2238  0101 4f            	clr	a
2239  0102 cd0000        	call	_setFlagUartRXNE
2241  0105 2092          	jra	L5441
2254                     	xdef	_main
2255                     	switch	.ubsct
2256  0000               _Comunicacion:
2257  0000 000000000000  	ds.b	49
2258                     	xdef	_Comunicacion
2259  0031               _Timeout:
2260  0031 000000000000  	ds.b	9
2261                     	xdef	_Timeout
2262  003a               _timer_Timeout:
2263  003a 000000000000  	ds.b	6
2264                     	xdef	_timer_Timeout
2265  0040               _SensorPesaje:
2266  0040 000000000000  	ds.b	28
2267                     	xdef	_SensorPesaje
2268  005c               _SensorTempHum:
2269  005c 000000000000  	ds.b	14
2270                     	xdef	_SensorTempHum
2271                     	xref	_RS485_Init
2272                     	xref	_hx711_Tarar
2273                     	xref	_hx711_Lectura
2274                     	xref	_HX711_Init
2275                     	xref	_dht11_Lectura
2276                     	xref	_DHT11_Init
2277                     	xref	_Timeout_Init
2278                     	xref	_Timer_Config_Init
2279                     	xref	_Clock_HSI_Init
2280                     	xref	_UART1_ReceiveData8
2281                     	xref	_setFlagUartRXNE
2282                     	xref	_getFlagUartRXNE
2283                     	xref	_setFlagTimer1
2284                     	xref	_getFlagTimer1
2285                     	xref	_GPIO_DeInit
2305                     	xref	c_rtol
2306                     	xref	c_uitolx
2307                     	end

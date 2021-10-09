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
  72                     .const:	section	.text
  73  0000               L15_HX711_LONGITUDTRAMA:
  74  0000 18            	dc.b	24
  75  0001               L35_HX711_TIEMPOCLOCK:
  76  0001 03            	dc.b	3
  77  0002               L55_HX711_TIEMPOCLOCKSLEEP:
  78  0002 46            	dc.b	70
2154                     ; 122 void GO_Init( Gestor_Ordenes_t_ptr gestor, struct GO_Dispositivos dispositivos, RS485_t_ptr sujeto )
2154                     ; 123 {
2156                     .text:	section	.text,new
2157  0000               _GO_Init:
2159  0000 89            	pushw	x
2160  0001 89            	pushw	x
2161       00000002      OFST:	set	2
2164                     ; 124 	LimpiarDatos( gestor );
2167  0002 1f01          	ldw	(OFST-1,sp),x
2169                     ; 70 	gestor->nNodo = 0;
2171  0004 7f            	clr	(x)
2172                     ; 72 	gestor->ordenDHT11.Ejecutada = false;
2174  0005 e601          	ld	a,(1,x)
2175  0007 a4fe          	and	a,#254
2176  0009 e701          	ld	(1,x),a
2177                     ; 73 	gestor->ordenDHT11.Orden.Funcion = 0;
2179  000b 6f02          	clr	(2,x)
2180                     ; 74 	gestor->ordenDHT11.Orden.Comando = 0;
2182  000d 6f03          	clr	(3,x)
2183                     ; 75 	gestor->ordenHX711.Ejecutada = false;
2185  000f e604          	ld	a,(4,x)
2186  0011 a4fe          	and	a,#254
2187  0013 e704          	ld	(4,x),a
2188                     ; 76 	gestor->ordenHX711.Orden.Funcion = 0;
2190  0015 6f05          	clr	(5,x)
2191                     ; 77 	gestor->ordenHX711.Orden.Comando = 0;
2193  0017 6f06          	clr	(6,x)
2194                     ; 79 	gestor->DatosEnvio.Dht11.EnvioPreparado = false;
2196  0019 e60b          	ld	a,(11,x)
2197  001b a4fe          	and	a,#254
2198  001d e70b          	ld	(11,x),a
2199                     ; 80 	gestor->DatosEnvio.Dht11.T_Entero = 0;
2201  001f 6f0c          	clr	(12,x)
2202                     ; 81 	gestor->DatosEnvio.Dht11.T_Decimal = 0;
2204  0021 6f0d          	clr	(13,x)
2205                     ; 82 	gestor->DatosEnvio.Dht11.H_Entero = 0;
2207  0023 6f0e          	clr	(14,x)
2208                     ; 83 	gestor->DatosEnvio.Dht11.H_Decimal = 0;
2210  0025 6f0f          	clr	(15,x)
2211                     ; 84 	gestor->DatosEnvio.Hx711.EnvioPreparado = false;
2213  0027 e610          	ld	a,(16,x)
2214  0029 a4fe          	and	a,#254
2215  002b e710          	ld	(16,x),a
2216                     ; 85 	gestor->DatosEnvio.Hx711.Medida = 0;
2218  002d 905f          	clrw	y
2219  002f ef11          	ldw	(17,x),y
2220                     ; 126 	gestor->Dispositivos = dispositivos;
2222  0031 1e03          	ldw	x,(OFST+1,sp)
2223  0033 1c0007        	addw	x,#7
2224  0036 9096          	ldw	y,sp
2225  0038 72a90007      	addw	y,#OFST+5
2226  003c a604          	ld	a,#4
2227  003e cd0000        	call	c_xymov
2229                     ; 127 	gestor->rs485 = sujeto;
2231  0041 1e03          	ldw	x,(OFST+1,sp)
2232  0043 160b          	ldw	y,(OFST+9,sp)
2233  0045 ef16          	ldw	(22,x),y
2234                     ; 129 	Observador_Init( &gestor->GO_Observador, RECEPCION, &GO_evRecepcion );
2236  0047 ae0000        	ldw	x,#_GO_evRecepcion
2237  004a 89            	pushw	x
2238  004b 4b01          	push	#1
2239  004d 1e06          	ldw	x,(OFST+4,sp)
2240  004f 1c0013        	addw	x,#19
2241  0052 cd0000        	call	_Observador_Init
2243  0055 5b03          	addw	sp,#3
2244                     ; 131 	sujeto->Sujeto.SetSubscriptor( &sujeto->Sujeto, &gestor->GO_Observador );
2246  0057 1e03          	ldw	x,(OFST+1,sp)
2247  0059 1c0013        	addw	x,#19
2248  005c 89            	pushw	x
2249  005d 1e0d          	ldw	x,(OFST+11,sp)
2250  005f 160d          	ldw	y,(OFST+11,sp)
2251  0061 1c0029        	addw	x,#41
2252  0064 90ee2d        	ldw	y,(45,y)
2253  0067 90fd          	call	(y)
2255  0069 85            	popw	x
2256                     ; 132 }
2259  006a 5b04          	addw	sp,#4
2260  006c 81            	ret	
2396                     ; 314 void GO_evRecepcion( Trama_RX_t* rx )
2396                     ; 315 {
2397                     .text:	section	.text,new
2398  0000               _GO_evRecepcion:
2400  0000 89            	pushw	x
2401  0001 520a          	subw	sp,#10
2402       0000000a      OFST:	set	10
2405                     ; 316 	GO_Auxiliar_evRecepcion( &GestorRS485, rx );
2408  0003 ae0000        	ldw	x,#_GestorRS485
2409  0006 1f09          	ldw	(OFST-1,sp),x
2414  0008 1f04          	ldw	(OFST-6,sp),x
2418  000a 1e0b          	ldw	x,(OFST+1,sp)
2419  000c 1f06          	ldw	(OFST-4,sp),x
2424  000e f6            	ld	a,(x)
2425  000f 6b02          	ld	(OFST-8,sp),a
2429  0011 e601          	ld	a,(1,x)
2431                     ; 227 	return (uint8_t)( ( ( decena - 48 ) * 10 ) + ( unidad - 48 ) );
2433  0013 a030          	sub	a,#48
2434  0015 6b01          	ld	(OFST-9,sp),a
2436  0017 7b02          	ld	a,(OFST-8,sp)
2437  0019 97            	ld	xl,a
2438  001a a60a          	ld	a,#10
2439  001c 42            	mul	x,a
2440  001d 9f            	ld	a,xl
2441  001e a0e0          	sub	a,#224
2442  0020 1b01          	add	a,(OFST-9,sp)
2443  0022 b700          	ld	_GestorRS485,a
2446                     ; 316 	GO_Auxiliar_evRecepcion( &GestorRS485, rx );
2449  0024 1e06          	ldw	x,(OFST-4,sp)
2450  0026 e602          	ld	a,(2,x)
2452                     ; 265 	return (uint8_t)( unidad - 48 );
2454  0028 1e04          	ldw	x,(OFST-6,sp)
2455  002a a030          	sub	a,#48
2456  002c e702          	ld	(2,x),a
2459                     ; 316 	GO_Auxiliar_evRecepcion( &GestorRS485, rx );
2462  002e 1e06          	ldw	x,(OFST-4,sp)
2463  0030 e603          	ld	a,(3,x)
2465                     ; 265 	return (uint8_t)( unidad - 48 );
2467  0032 1e04          	ldw	x,(OFST-6,sp)
2468  0034 a030          	sub	a,#48
2469  0036 e703          	ld	(3,x),a
2472                     ; 316 	GO_Auxiliar_evRecepcion( &GestorRS485, rx );
2475  0038 1e06          	ldw	x,(OFST-4,sp)
2476  003a e604          	ld	a,(4,x)
2478                     ; 265 	return (uint8_t)( unidad - 48 );
2480  003c 1e04          	ldw	x,(OFST-6,sp)
2481  003e a030          	sub	a,#48
2482  0040 e705          	ld	(5,x),a
2485                     ; 316 	GO_Auxiliar_evRecepcion( &GestorRS485, rx );
2488  0042 1e06          	ldw	x,(OFST-4,sp)
2489  0044 e605          	ld	a,(5,x)
2490  0046 6b03          	ld	(OFST-7,sp),a
2492                     ; 265 	return (uint8_t)( unidad - 48 );
2494  0048 1e04          	ldw	x,(OFST-6,sp)
2495  004a a030          	sub	a,#48
2496  004c e706          	ld	(6,x),a
2499                     ; 149 	if( gestor->nNodo == NUMERO_NODO_COMUNICACION )
2502  004e 1e09          	ldw	x,(OFST-1,sp)
2503  0050 f6            	ld	a,(x)
2504  0051 4a            	dec	a
2505  0052 2605          	jrne	L1202
2506                     ; 151 		return true;
2508  0054 4c            	inc	a
2509  0055 6b08          	ld	(OFST-2,sp),a
2512  0057 2002          	jra	L3461
2513  0059               L1202:
2514                     ; 155 		return false;
2516  0059 0f08          	clr	(OFST-2,sp)
2519  005b               L3461:
2521  005b 2603cc0183    	jreq	L7102
2522                     ; 161 	if( gestor->ordenDHT11.Orden.Funcion == 1 ) // FUNCIONES DEL DISPOSITIVO
2525  0060 e602          	ld	a,(2,x)
2526  0062 4a            	dec	a
2527  0063 2655          	jrne	L1761
2528                     ; 163 		switch( gestor->ordenDHT11.Orden.Comando )
2530  0065 e603          	ld	a,(3,x)
2532                     ; 199 			break;
2533  0067 274b          	jreq	L1561
2534  0069 4a            	dec	a
2535  006a 271a          	jreq	L7461
2536  006c 4a            	dec	a
2537  006d 2745          	jreq	L1561
2538  006f 4a            	dec	a
2539  0070 2742          	jreq	L1561
2540  0072 4a            	dec	a
2541  0073 273f          	jreq	L1561
2542  0075 4a            	dec	a
2543  0076 273c          	jreq	L1561
2544  0078 4a            	dec	a
2545  0079 2739          	jreq	L1561
2546  007b 4a            	dec	a
2547  007c 2736          	jreq	L1561
2548  007e 4a            	dec	a
2549  007f 2733          	jreq	L1561
2550  0081 4a            	dec	a
2551  0082 2730          	jreq	L1561
2552  0084 2034          	jra	L1761
2553                     ; 165 			case 0: // SIN COMANDO
2553                     ; 166 				gestor->ordenDHT11.Ejecutada = false;
2554                     ; 167 			break;
2556  0086               L7461:
2557                     ; 168 			case 1: // LECTURA
2557                     ; 169 				gestor->DatosEnvio.Dht11.T_Entero = gestor->Dispositivos.Dht11->Datos.UltimaLectura.T_Entero;
2559  0086 ee07          	ldw	x,(7,x)
2560  0088 e606          	ld	a,(6,x)
2561  008a 1e09          	ldw	x,(OFST-1,sp)
2562  008c e70c          	ld	(12,x),a
2563                     ; 170 				gestor->DatosEnvio.Dht11.T_Decimal = gestor->Dispositivos.Dht11->Datos.UltimaLectura.T_Decimal;
2565  008e ee07          	ldw	x,(7,x)
2566  0090 e605          	ld	a,(5,x)
2567  0092 1e09          	ldw	x,(OFST-1,sp)
2568  0094 e70d          	ld	(13,x),a
2569                     ; 171 				gestor->DatosEnvio.Dht11.H_Entero = gestor->Dispositivos.Dht11->Datos.UltimaLectura.H_Entero;
2571  0096 ee07          	ldw	x,(7,x)
2572  0098 e608          	ld	a,(8,x)
2573  009a 1e09          	ldw	x,(OFST-1,sp)
2574  009c e70e          	ld	(14,x),a
2575                     ; 172 				gestor->DatosEnvio.Dht11.H_Decimal = gestor->Dispositivos.Dht11->Datos.UltimaLectura.H_Decimal;
2577  009e ee07          	ldw	x,(7,x)
2578  00a0 e607          	ld	a,(7,x)
2579  00a2 1e09          	ldw	x,(OFST-1,sp)
2580  00a4 e70f          	ld	(15,x),a
2581                     ; 173 				gestor->ordenDHT11.Ejecutada = true;
2583  00a6 e601          	ld	a,(1,x)
2584  00a8 aa01          	or	a,#1
2585  00aa e701          	ld	(1,x),a
2586                     ; 174 				gestor->DatosEnvio.Dht11.EnvioPreparado = true;
2588  00ac e60b          	ld	a,(11,x)
2589  00ae aa01          	or	a,#1
2590  00b0 e70b          	ld	(11,x),a
2591                     ; 175 			break;
2593  00b2 2006          	jra	L1761
2594  00b4               L1561:
2595                     ; 176 			case 2:
2595                     ; 177 				gestor->ordenDHT11.Ejecutada = false;
2596                     ; 178 			break;
2598                     ; 179 			case 3:
2598                     ; 180 				gestor->ordenDHT11.Ejecutada = false;
2599                     ; 181 			break;
2601                     ; 182 			case 4:
2601                     ; 183 				gestor->ordenDHT11.Ejecutada = false;
2602                     ; 184 			break;
2604                     ; 185 			case 5:
2604                     ; 186 				gestor->ordenDHT11.Ejecutada = false;
2605                     ; 187 			break;
2607                     ; 188 			case 6:
2607                     ; 189 				gestor->ordenDHT11.Ejecutada = false;
2608                     ; 190 			break;
2610                     ; 191 			case 7:
2610                     ; 192 				gestor->ordenDHT11.Ejecutada = false;
2611                     ; 193 			break;
2613                     ; 194 			case 8:
2613                     ; 195 				gestor->ordenDHT11.Ejecutada = false;
2614                     ; 196 			break;
2616                     ; 197 			case 9:
2616                     ; 198 				gestor->ordenDHT11.Ejecutada = false;
2626  00b4 e601          	ld	a,(1,x)
2627  00b6 a4fe          	and	a,#254
2628  00b8 e701          	ld	(1,x),a
2629                     ; 199 			break;
2631  00ba               L1761:
2632                     ; 207 	if( gestor->ordenHX711.Orden.Funcion == 1 ) // FUNCIONES DEL DISPOSITIVO
2635  00ba e605          	ld	a,(5,x)
2636  00bc 4a            	dec	a
2637  00bd 2676          	jrne	L7171
2638                     ; 209 		switch( gestor->ordenHX711.Orden.Comando )
2640  00bf e606          	ld	a,(6,x)
2642                     ; 244 			break;
2643  00c1 276c          	jreq	L3071
2644  00c3 4a            	dec	a
2645  00c4 271a          	jreq	L5761
2646  00c6 4a            	dec	a
2647  00c7 272f          	jreq	L7761
2648  00c9 4a            	dec	a
2649  00ca 2742          	jreq	L1071
2650  00cc 4a            	dec	a
2651  00cd 2760          	jreq	L3071
2652  00cf 4a            	dec	a
2653  00d0 275d          	jreq	L3071
2654  00d2 4a            	dec	a
2655  00d3 275a          	jreq	L3071
2656  00d5 4a            	dec	a
2657  00d6 2757          	jreq	L3071
2658  00d8 4a            	dec	a
2659  00d9 2754          	jreq	L3071
2660  00db 4a            	dec	a
2661  00dc 2751          	jreq	L3071
2662  00de 2055          	jra	L7171
2663                     ; 211 			case 0: // SIN COMANDO
2663                     ; 212 				gestor->ordenHX711.Ejecutada = false;
2664                     ; 213 			break;
2666  00e0               L5761:
2667                     ; 214 			case 1: // LECTURA
2667                     ; 215 				gestor->DatosEnvio.Hx711.Medida = gestor->Dispositivos.Hx711->Datos.UltimaLectura;
2669  00e0 ee09          	ldw	x,(9,x)
2670  00e2 1609          	ldw	y,(OFST-1,sp)
2671  00e4 ee13          	ldw	x,(19,x)
2672  00e6 90ef11        	ldw	(17,y),x
2673                     ; 216 				gestor->ordenHX711.Ejecutada = true;
2675  00e9 93            	ldw	x,y
2676  00ea e604          	ld	a,(4,x)
2677  00ec aa01          	or	a,#1
2678  00ee e704          	ld	(4,x),a
2679                     ; 217 				gestor->DatosEnvio.Hx711.EnvioPreparado = true;
2681  00f0 e610          	ld	a,(16,x)
2682  00f2 aa01          	or	a,#1
2683  00f4 e710          	ld	(16,x),a
2684                     ; 218 			break;
2686  00f6 203d          	jra	L7171
2687  00f8               L7761:
2688                     ; 219 			case 2: // TARAR
2688                     ; 220 				gestor->Dispositivos.Hx711->Config.ValorTara = gestor->Dispositivos.Hx711->Tarar( gestor->Dispositivos.Hx711 );
2690  00f8 1609          	ldw	y,(OFST-1,sp)
2691  00fa 90ee09        	ldw	y,(9,y)
2692  00fd ee09          	ldw	x,(9,x)
2693  00ff 90ee1a        	ldw	y,(26,y)
2694  0102 90fd          	call	(y)
2696  0104 1609          	ldw	y,(OFST-1,sp)
2697  0106 90ee09        	ldw	y,(9,y)
2698  0109 90ef0f        	ldw	(15,y),x
2699                     ; 221 				gestor->ordenHX711.Ejecutada = true;
2700                     ; 222 			break;
2702  010c 2019          	jp	LC004
2703  010e               L1071:
2704                     ; 223 			case 3: // VALOR ZERO
2704                     ; 224 				gestor->Dispositivos.Hx711->Config.ValorZero = gestor->Dispositivos.Hx711->Tarar( gestor->Dispositivos.Hx711 );
2706  010e 1609          	ldw	y,(OFST-1,sp)
2707  0110 90ee09        	ldw	y,(9,y)
2708  0113 ee09          	ldw	x,(9,x)
2709  0115 90ee1a        	ldw	y,(26,y)
2710  0118 90fd          	call	(y)
2712  011a cd0000        	call	c_uitolx
2714  011d 1e09          	ldw	x,(OFST-1,sp)
2715  011f ee09          	ldw	x,(9,x)
2716  0121 1c000b        	addw	x,#11
2717  0124 cd0000        	call	c_rtol
2719                     ; 225 				gestor->ordenHX711.Ejecutada = true;
2721  0127               LC004:
2723  0127 1e09          	ldw	x,(OFST-1,sp)
2724  0129 e604          	ld	a,(4,x)
2725  012b aa01          	or	a,#1
2726                     ; 226 			break;
2728  012d 2004          	jp	LC002
2729  012f               L3071:
2730                     ; 227 			case 4:
2730                     ; 228 				gestor->ordenHX711.Ejecutada = false;
2731                     ; 229 			break;
2733                     ; 230 			case 5:
2733                     ; 231 				gestor->ordenHX711.Ejecutada = false;
2734                     ; 232 			break;
2736                     ; 233 			case 6:
2736                     ; 234 				gestor->ordenHX711.Ejecutada = false;
2737                     ; 235 			break;
2739                     ; 236 			case 7:
2739                     ; 237 				gestor->ordenHX711.Ejecutada = false;
2740                     ; 238 			break;
2742                     ; 239 			case 8:
2742                     ; 240 				gestor->ordenHX711.Ejecutada = false;
2743                     ; 241 			break;
2745                     ; 242 			case 9:
2745                     ; 243 				gestor->ordenHX711.Ejecutada = false;
2753  012f e604          	ld	a,(4,x)
2754  0131 a4fe          	and	a,#254
2755  0133               LC002:
2756  0133 e704          	ld	(4,x),a
2757                     ; 244 			break;
2759  0135               L7171:
2760                     ; 259 		if( ( gestor->DatosEnvio.Dht11.EnvioPreparado == true ) || ( gestor->DatosEnvio.Hx711.EnvioPreparado == true ) )
2762  0135 e60b          	ld	a,(11,x)
2763  0137 a501          	bcp	a,#1
2764  0139 2606          	jrne	L3402
2766  013b e610          	ld	a,(16,x)
2767  013d a501          	bcp	a,#1
2768  013f 276f          	jreq	L3271
2769  0141               L3402:
2770                     ; 261 			gestor->rs485->Buffer.Tx.buffer[0] = NUMERO_NODO_COMUNICACION;
2772  0141 ee16          	ldw	x,(22,x)
2773  0143 a601          	ld	a,#1
2774  0145 e712          	ld	(18,x),a
2775                     ; 262 			gestor->rs485->Buffer.Tx.buffer[1] = gestor->DatosEnvio.Dht11.T_Entero;
2777  0147 1e09          	ldw	x,(OFST-1,sp)
2778  0149 e60c          	ld	a,(12,x)
2779  014b ee16          	ldw	x,(22,x)
2780  014d e713          	ld	(19,x),a
2781                     ; 263 			gestor->rs485->Buffer.Tx.buffer[2] = gestor->DatosEnvio.Dht11.T_Decimal;
2783  014f 1e09          	ldw	x,(OFST-1,sp)
2784  0151 e60d          	ld	a,(13,x)
2785  0153 ee16          	ldw	x,(22,x)
2786  0155 e714          	ld	(20,x),a
2787                     ; 264 			gestor->rs485->Buffer.Tx.buffer[3] = gestor->DatosEnvio.Dht11.H_Entero;
2789  0157 1e09          	ldw	x,(OFST-1,sp)
2790  0159 e60e          	ld	a,(14,x)
2791  015b ee16          	ldw	x,(22,x)
2792  015d e715          	ld	(21,x),a
2793                     ; 265 			gestor->rs485->Buffer.Tx.buffer[4] = gestor->DatosEnvio.Dht11.H_Decimal;
2795  015f 1e09          	ldw	x,(OFST-1,sp)
2796  0161 e60f          	ld	a,(15,x)
2797  0163 ee16          	ldw	x,(22,x)
2798  0165 e716          	ld	(22,x),a
2799                     ; 267 			gestor->rs485->Buffer.Tx.buffer[5] = gestor->DatosEnvio.Hx711.Bytes.alto;
2801  0167 1e09          	ldw	x,(OFST-1,sp)
2802  0169 e611          	ld	a,(17,x)
2803  016b ee16          	ldw	x,(22,x)
2804  016d e717          	ld	(23,x),a
2805                     ; 268 			gestor->rs485->Buffer.Tx.buffer[6] = gestor->DatosEnvio.Hx711.Bytes.bajo;
2807  016f 1e09          	ldw	x,(OFST-1,sp)
2808  0171 e612          	ld	a,(18,x)
2809  0173 ee16          	ldw	x,(22,x)
2810  0175 e718          	ld	(24,x),a
2811                     ; 271 			gestor->rs485->Flags.bit.EnvioPreparado = 1;
2813  0177 1e09          	ldw	x,(OFST-1,sp)
2814  0179 ee16          	ldw	x,(22,x)
2815  017b e621          	ld	a,(33,x)
2816  017d aa10          	or	a,#16
2817  017f e721          	ld	(33,x),a
2818  0181 202d          	jra	L3271
2819  0183               L7102:
2820                     ; 70 	gestor->nNodo = 0;
2823  0183 7f            	clr	(x)
2824                     ; 72 	gestor->ordenDHT11.Ejecutada = false;
2826  0184 e601          	ld	a,(1,x)
2827  0186 a4fe          	and	a,#254
2828  0188 e701          	ld	(1,x),a
2829                     ; 73 	gestor->ordenDHT11.Orden.Funcion = 0;
2831  018a 6f02          	clr	(2,x)
2832                     ; 74 	gestor->ordenDHT11.Orden.Comando = 0;
2834  018c 6f03          	clr	(3,x)
2835                     ; 75 	gestor->ordenHX711.Ejecutada = false;
2837  018e e604          	ld	a,(4,x)
2838  0190 a4fe          	and	a,#254
2839  0192 e704          	ld	(4,x),a
2840                     ; 76 	gestor->ordenHX711.Orden.Funcion = 0;
2842  0194 6f05          	clr	(5,x)
2843                     ; 77 	gestor->ordenHX711.Orden.Comando = 0;
2845  0196 6f06          	clr	(6,x)
2846                     ; 79 	gestor->DatosEnvio.Dht11.EnvioPreparado = false;
2848  0198 e60b          	ld	a,(11,x)
2849  019a a4fe          	and	a,#254
2850  019c e70b          	ld	(11,x),a
2851                     ; 80 	gestor->DatosEnvio.Dht11.T_Entero = 0;
2853  019e 6f0c          	clr	(12,x)
2854                     ; 81 	gestor->DatosEnvio.Dht11.T_Decimal = 0;
2856  01a0 6f0d          	clr	(13,x)
2857                     ; 82 	gestor->DatosEnvio.Dht11.H_Entero = 0;
2859  01a2 6f0e          	clr	(14,x)
2860                     ; 83 	gestor->DatosEnvio.Dht11.H_Decimal = 0;
2862  01a4 6f0f          	clr	(15,x)
2863                     ; 84 	gestor->DatosEnvio.Hx711.EnvioPreparado = false;
2865  01a6 e610          	ld	a,(16,x)
2866  01a8 a4fe          	and	a,#254
2867  01aa e710          	ld	(16,x),a
2868                     ; 85 	gestor->DatosEnvio.Hx711.Medida = 0;
2870  01ac 905f          	clrw	y
2871  01ae ef11          	ldw	(17,x),y
2872  01b0               L3271:
2873                     ; 317 }
2876  01b0 5b0c          	addw	sp,#12
2877  01b2 81            	ret	
2890                     	xdef	_GO_evRecepcion
2891                     	xdef	_GO_Init
2892                     	xref.b	_GestorRS485
2893                     	xref	_Observador_Init
2894                     	xref.b	c_x
2913                     	xref	c_rtol
2914                     	xref	c_uitolx
2915                     	xref	c_xymov
2916                     	end

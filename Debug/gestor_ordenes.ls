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
  83                     .const:	section	.text
  84  0000               L75_HX711_LONGITUDTRAMA:
  85  0000 18            	dc.b	24
  86  0001               L16_HX711_TIEMPOCLOCK:
  87  0001 03            	dc.b	3
  88  0002               L36_HX711_TIEMPOCLOCKSLEEP:
  89  0002 46            	dc.b	70
2340                     ; 157 void GO_Init( Gestor_Ordenes_t_ptr gestor, struct GO_Dispositivos dispositivos, RS485_t_ptr sujeto )
2340                     ; 158 {
2342                     .text:	section	.text,new
2343  0000               _GO_Init:
2345  0000 89            	pushw	x
2346  0001 89            	pushw	x
2347       00000002      OFST:	set	2
2350                     ; 159 	LimpiarDatos( gestor );
2353  0002 1f01          	ldw	(OFST-1,sp),x
2355                     ; 105 	gestor->nNodo = 0;
2357  0004 7f            	clr	(x)
2358                     ; 107 	gestor->ordenDHT11.Ejecutada = false;
2360  0005 e601          	ld	a,(1,x)
2361  0007 a4fe          	and	a,#254
2362  0009 e701          	ld	(1,x),a
2363                     ; 108 	gestor->ordenDHT11.Orden.Funcion = 0;
2365  000b 6f02          	clr	(2,x)
2366                     ; 109 	gestor->ordenDHT11.Orden.Comando = 0;
2368  000d 6f03          	clr	(3,x)
2369                     ; 110 	gestor->ordenHX711.Ejecutada = false;
2371  000f e604          	ld	a,(4,x)
2372  0011 a4fe          	and	a,#254
2373  0013 e704          	ld	(4,x),a
2374                     ; 111 	gestor->ordenHX711.Orden.Funcion = 0;
2376  0015 6f05          	clr	(5,x)
2377                     ; 112 	gestor->ordenHX711.Orden.Comando = 0;
2379  0017 6f06          	clr	(6,x)
2380                     ; 114 	gestor->DatosEnvio.Dht11.EnvioPreparado = false;
2382  0019 e60d          	ld	a,(13,x)
2383  001b a4fe          	and	a,#254
2384  001d e70d          	ld	(13,x),a
2385                     ; 115 	gestor->DatosEnvio.Dht11.T_Entero = 0;
2387  001f 6f0e          	clr	(14,x)
2388                     ; 116 	gestor->DatosEnvio.Dht11.T_Decimal = 0;
2390  0021 6f0f          	clr	(15,x)
2391                     ; 117 	gestor->DatosEnvio.Dht11.H_Entero = 0;
2393  0023 6f10          	clr	(16,x)
2394                     ; 118 	gestor->DatosEnvio.Dht11.H_Decimal = 0;
2396  0025 6f11          	clr	(17,x)
2397                     ; 119 	gestor->DatosEnvio.Hx711.EnvioPreparado = false;
2399  0027 e612          	ld	a,(18,x)
2400  0029 a4fe          	and	a,#254
2401  002b e712          	ld	(18,x),a
2402                     ; 120 	gestor->DatosEnvio.Hx711.Medida = 0;
2404  002d 905f          	clrw	y
2405  002f ef13          	ldw	(19,x),y
2406                     ; 161 	gestor->Dispositivos = dispositivos;
2408  0031 1e03          	ldw	x,(OFST+1,sp)
2409  0033 1c0007        	addw	x,#7
2410  0036 9096          	ldw	y,sp
2411  0038 72a90007      	addw	y,#OFST+5
2412  003c a606          	ld	a,#6
2413  003e cd0000        	call	c_xymov
2415                     ; 162 	gestor->rs485 = sujeto;
2417  0041 1e03          	ldw	x,(OFST+1,sp)
2418  0043 160d          	ldw	y,(OFST+11,sp)
2419  0045 ef18          	ldw	(24,x),y
2420                     ; 164 	Observador_Init( &gestor->GO_Observador, RECEPCION, &GO_evRecepcion );
2422  0047 ae0000        	ldw	x,#_GO_evRecepcion
2423  004a 89            	pushw	x
2424  004b 4b01          	push	#1
2425  004d 1e06          	ldw	x,(OFST+4,sp)
2426  004f 1c0015        	addw	x,#21
2427  0052 cd0000        	call	_Observador_Init
2429  0055 5b03          	addw	sp,#3
2430                     ; 166 	sujeto->Sujeto.SetSubscriptor( &sujeto->Sujeto, &gestor->GO_Observador );
2432  0057 1e03          	ldw	x,(OFST+1,sp)
2433  0059 1c0015        	addw	x,#21
2434  005c 89            	pushw	x
2435  005d 1e0f          	ldw	x,(OFST+13,sp)
2436  005f 160f          	ldw	y,(OFST+13,sp)
2437  0061 1c0029        	addw	x,#41
2438  0064 90ee2d        	ldw	y,(45,y)
2439  0067 90fd          	call	(y)
2441  0069 85            	popw	x
2442                     ; 167 }
2445  006a 5b04          	addw	sp,#4
2446  006c 81            	ret	
2582                     ; 550 void GO_evRecepcion( Trama_RX_t* rx )
2582                     ; 551 {
2583                     .text:	section	.text,new
2584  0000               _GO_evRecepcion:
2586  0000 89            	pushw	x
2587  0001 520a          	subw	sp,#10
2588       0000000a      OFST:	set	10
2591                     ; 552 	GO_Auxiliar_evRecepcion( &GestorRS485, rx );
2594  0003 ae0000        	ldw	x,#_GestorRS485
2595  0006 1f09          	ldw	(OFST-1,sp),x
2600  0008 1f04          	ldw	(OFST-6,sp),x
2604  000a 1e0b          	ldw	x,(OFST+1,sp)
2605  000c 1f06          	ldw	(OFST-4,sp),x
2610  000e f6            	ld	a,(x)
2611  000f 6b02          	ld	(OFST-8,sp),a
2615  0011 e601          	ld	a,(1,x)
2617                     ; 227 	return (uint8_t)( ( ( decena - 48 ) * 10 ) + ( unidad - 48 ) );
2619  0013 a030          	sub	a,#48
2620  0015 6b01          	ld	(OFST-9,sp),a
2622  0017 7b02          	ld	a,(OFST-8,sp)
2623  0019 97            	ld	xl,a
2624  001a a60a          	ld	a,#10
2625  001c 42            	mul	x,a
2626  001d 9f            	ld	a,xl
2627  001e a0e0          	sub	a,#224
2628  0020 1b01          	add	a,(OFST-9,sp)
2629  0022 b700          	ld	_GestorRS485,a
2632                     ; 552 	GO_Auxiliar_evRecepcion( &GestorRS485, rx );
2635  0024 1e06          	ldw	x,(OFST-4,sp)
2636  0026 e602          	ld	a,(2,x)
2638                     ; 265 	return (uint8_t)( unidad - 48 );
2640  0028 1e04          	ldw	x,(OFST-6,sp)
2641  002a a030          	sub	a,#48
2642  002c e702          	ld	(2,x),a
2645                     ; 552 	GO_Auxiliar_evRecepcion( &GestorRS485, rx );
2648  002e 1e06          	ldw	x,(OFST-4,sp)
2649  0030 e603          	ld	a,(3,x)
2651                     ; 265 	return (uint8_t)( unidad - 48 );
2653  0032 1e04          	ldw	x,(OFST-6,sp)
2654  0034 a030          	sub	a,#48
2655  0036 e703          	ld	(3,x),a
2658                     ; 552 	GO_Auxiliar_evRecepcion( &GestorRS485, rx );
2661  0038 1e06          	ldw	x,(OFST-4,sp)
2662  003a e604          	ld	a,(4,x)
2664                     ; 265 	return (uint8_t)( unidad - 48 );
2666  003c 1e04          	ldw	x,(OFST-6,sp)
2667  003e a030          	sub	a,#48
2668  0040 e705          	ld	(5,x),a
2671                     ; 552 	GO_Auxiliar_evRecepcion( &GestorRS485, rx );
2674  0042 1e06          	ldw	x,(OFST-4,sp)
2675  0044 e605          	ld	a,(5,x)
2676  0046 6b03          	ld	(OFST-7,sp),a
2678                     ; 265 	return (uint8_t)( unidad - 48 );
2680  0048 1e04          	ldw	x,(OFST-6,sp)
2681  004a a030          	sub	a,#48
2682  004c e706          	ld	(6,x),a
2685                     ; 252 	if( gestor->nNodo == NUMERO_NODO_COMUNICACION )
2688  004e 1e09          	ldw	x,(OFST-1,sp)
2689  0050 f6            	ld	a,(x)
2690  0051 4a            	dec	a
2691  0052 2605          	jrne	L7412
2692                     ; 254 		return true;
2694  0054 4c            	inc	a
2695  0055 6b08          	ld	(OFST-2,sp),a
2698  0057 2002          	jra	L5671
2699  0059               L7412:
2700                     ; 258 		return false;
2702  0059 0f08          	clr	(OFST-2,sp)
2705  005b               L5671:
2707  005b 2603cc01d8    	jreq	L5412
2708                     ; 298 	if( gestor->ordenDHT11.Orden.Funcion == 1 ) // FUNCIONES DEL DISPOSITIVO
2711  0060 e602          	ld	a,(2,x)
2712  0062 a101          	cp	a,#1
2713  0064 264f          	jrne	L3512
2714                     ; 300 		switch( gestor->ordenDHT11.Orden.Comando )
2716  0066 e603          	ld	a,(3,x)
2718                     ; 336 			break;
2719  0068 2767          	jreq	LC001
2720  006a 4a            	dec	a
2721  006b 271a          	jreq	L1771
2722  006d 4a            	dec	a
2723  006e 2761          	jreq	LC001
2724  0070 4a            	dec	a
2725  0071 275e          	jreq	LC001
2726  0073 4a            	dec	a
2727  0074 275b          	jreq	LC001
2728  0076 4a            	dec	a
2729  0077 2758          	jreq	LC001
2730  0079 4a            	dec	a
2731  007a 2755          	jreq	LC001
2732  007c 4a            	dec	a
2733  007d 2752          	jreq	LC001
2734  007f 4a            	dec	a
2735  0080 274f          	jreq	LC001
2736  0082 4a            	dec	a
2737  0083 274c          	jreq	LC001
2738  0085 2050          	jra	L7102
2739                     ; 302 			case 0: // SIN COMANDO
2739                     ; 303 				gestor->ordenDHT11.Ejecutada = false;
2740                     ; 304 			break;
2742  0087               L1771:
2743                     ; 305 			case 1: // LECTURA
2743                     ; 306 				gestor->DatosEnvio.Dht11.T_Entero = gestor->Dispositivos.Dht11->Datos.UltimaLectura.T_Entero;
2745  0087 ee07          	ldw	x,(7,x)
2746  0089 e606          	ld	a,(6,x)
2747  008b 1e09          	ldw	x,(OFST-1,sp)
2748  008d e70e          	ld	(14,x),a
2749                     ; 307 				gestor->DatosEnvio.Dht11.T_Decimal = gestor->Dispositivos.Dht11->Datos.UltimaLectura.T_Decimal;
2751  008f ee07          	ldw	x,(7,x)
2752  0091 e605          	ld	a,(5,x)
2753  0093 1e09          	ldw	x,(OFST-1,sp)
2754  0095 e70f          	ld	(15,x),a
2755                     ; 308 				gestor->DatosEnvio.Dht11.H_Entero = gestor->Dispositivos.Dht11->Datos.UltimaLectura.H_Entero;
2757  0097 ee07          	ldw	x,(7,x)
2758  0099 e608          	ld	a,(8,x)
2759  009b 1e09          	ldw	x,(OFST-1,sp)
2760  009d e710          	ld	(16,x),a
2761                     ; 309 				gestor->DatosEnvio.Dht11.H_Decimal = gestor->Dispositivos.Dht11->Datos.UltimaLectura.H_Decimal;
2763  009f ee07          	ldw	x,(7,x)
2764  00a1 e607          	ld	a,(7,x)
2765  00a3 1e09          	ldw	x,(OFST-1,sp)
2766  00a5 e711          	ld	(17,x),a
2767                     ; 310 				gestor->ordenDHT11.Ejecutada = true;
2769  00a7 e601          	ld	a,(1,x)
2770  00a9 aa01          	or	a,#1
2771  00ab e701          	ld	(1,x),a
2772                     ; 311 				gestor->DatosEnvio.Dht11.EnvioPreparado = true;
2774  00ad e60d          	ld	a,(13,x)
2775  00af aa01          	or	a,#1
2776  00b1 e70d          	ld	(13,x),a
2777                     ; 312 			break;
2779  00b3 2022          	jra	L7102
2780                     ; 313 			case 2:
2780                     ; 314 				gestor->ordenDHT11.Ejecutada = false;
2781                     ; 315 			break;
2783                     ; 316 			case 3:
2783                     ; 317 				gestor->ordenDHT11.Ejecutada = false;
2784                     ; 318 			break;
2786                     ; 319 			case 4:
2786                     ; 320 				gestor->ordenDHT11.Ejecutada = false;
2787                     ; 321 			break;
2789                     ; 322 			case 5:
2789                     ; 323 				gestor->ordenDHT11.Ejecutada = false;
2790                     ; 324 			break;
2792                     ; 325 			case 6:
2792                     ; 326 				gestor->ordenDHT11.Ejecutada = false;
2793                     ; 327 			break;
2795                     ; 328 			case 7:
2795                     ; 329 				gestor->ordenDHT11.Ejecutada = false;
2796                     ; 330 			break;
2798                     ; 331 			case 8:
2798                     ; 332 				gestor->ordenDHT11.Ejecutada = false;
2799                     ; 333 			break;
2801                     ; 334 			case 9:
2801                     ; 335 				gestor->ordenDHT11.Ejecutada = false;
2802                     ; 336 			break;
2805  00b5               L3512:
2806                     ; 340 	else if( gestor->ordenDHT11.Orden.Funcion == 9 ) // FUNCIONES DEL DISPOSITIVO led check
2808  00b5 a109          	cp	a,#9
2809  00b7 261e          	jrne	L7102
2810                     ; 342 		switch( gestor->ordenDHT11.Orden.Comando )
2812  00b9 e603          	ld	a,(3,x)
2814                     ; 351 			break;
2815  00bb 2705          	jreq	L3102
2816  00bd 4a            	dec	a
2817  00be 2709          	jreq	L5102
2818  00c0 2015          	jra	L7102
2819  00c2               L3102:
2820                     ; 344 			case 0: // APAGAR
2820                     ; 345 				gestor->Dispositivos.LedCheck->Estado.bitEstado.ComandoRecibido = false;
2822  00c2 ee0b          	ldw	x,(11,x)
2823  00c4 f6            	ld	a,(x)
2824  00c5 a4fb          	and	a,#251
2825                     ; 346 				gestor->ordenDHT11.Ejecutada = false;
2826                     ; 347 			break;
2828  00c7 2005          	jp	LC002
2829  00c9               L5102:
2830                     ; 348 			case 1: // ENCENDER
2830                     ; 349 				gestor->Dispositivos.LedCheck->Estado.bitEstado.ComandoRecibido = true;
2832  00c9 ee0b          	ldw	x,(11,x)
2833  00cb f6            	ld	a,(x)
2834  00cc aa04          	or	a,#4
2835                     ; 350 				gestor->ordenDHT11.Ejecutada = false;
2837  00ce               LC002:
2838  00ce f7            	ld	(x),a
2840  00cf 1e09          	ldw	x,(OFST-1,sp)
2841  00d1               LC001:
2851  00d1 e601          	ld	a,(1,x)
2852  00d3 a4fe          	and	a,#254
2853  00d5 e701          	ld	(1,x),a
2854                     ; 351 			break;
2856  00d7               L7102:
2857                     ; 392 	if( gestor->ordenHX711.Orden.Funcion == 1 ) // FUNCIONES DEL DISPOSITIVO
2860  00d7 1e09          	ldw	x,(OFST-1,sp)
2861  00d9 e605          	ld	a,(5,x)
2862  00db 4a            	dec	a
2863  00dc 2676          	jrne	L5402
2864                     ; 394 		switch( gestor->ordenHX711.Orden.Comando )
2866  00de e606          	ld	a,(6,x)
2868                     ; 429 			break;
2869  00e0 276c          	jreq	L1302
2870  00e2 4a            	dec	a
2871  00e3 271a          	jreq	L3202
2872  00e5 4a            	dec	a
2873  00e6 272f          	jreq	L5202
2874  00e8 4a            	dec	a
2875  00e9 2742          	jreq	L7202
2876  00eb 4a            	dec	a
2877  00ec 2760          	jreq	L1302
2878  00ee 4a            	dec	a
2879  00ef 275d          	jreq	L1302
2880  00f1 4a            	dec	a
2881  00f2 275a          	jreq	L1302
2882  00f4 4a            	dec	a
2883  00f5 2757          	jreq	L1302
2884  00f7 4a            	dec	a
2885  00f8 2754          	jreq	L1302
2886  00fa 4a            	dec	a
2887  00fb 2751          	jreq	L1302
2888  00fd 2055          	jra	L5402
2889                     ; 396 			case 0: // SIN COMANDO
2889                     ; 397 				gestor->ordenHX711.Ejecutada = false;
2890                     ; 398 			break;
2892  00ff               L3202:
2893                     ; 399 			case 1: // LECTURA
2893                     ; 400 				gestor->DatosEnvio.Hx711.Medida = gestor->Dispositivos.Hx711->Datos.UltimaLectura;
2895  00ff ee09          	ldw	x,(9,x)
2896  0101 1609          	ldw	y,(OFST-1,sp)
2897  0103 ee13          	ldw	x,(19,x)
2898  0105 90ef13        	ldw	(19,y),x
2899                     ; 401 				gestor->ordenHX711.Ejecutada = true;
2901  0108 93            	ldw	x,y
2902  0109 e604          	ld	a,(4,x)
2903  010b aa01          	or	a,#1
2904  010d e704          	ld	(4,x),a
2905                     ; 402 				gestor->DatosEnvio.Hx711.EnvioPreparado = true;
2907  010f e612          	ld	a,(18,x)
2908  0111 aa01          	or	a,#1
2909  0113 e712          	ld	(18,x),a
2910                     ; 403 			break;
2912  0115 203d          	jra	L5402
2913  0117               L5202:
2914                     ; 404 			case 2: // TARAR
2914                     ; 405 				gestor->Dispositivos.Hx711->Config.ValorTara = gestor->Dispositivos.Hx711->Tarar( gestor->Dispositivos.Hx711 );
2916  0117 1609          	ldw	y,(OFST-1,sp)
2917  0119 90ee09        	ldw	y,(9,y)
2918  011c ee09          	ldw	x,(9,x)
2919  011e 90ee1a        	ldw	y,(26,y)
2920  0121 90fd          	call	(y)
2922  0123 1609          	ldw	y,(OFST-1,sp)
2923  0125 90ee09        	ldw	y,(9,y)
2924  0128 90ef0f        	ldw	(15,y),x
2925                     ; 406 				gestor->ordenHX711.Ejecutada = true;
2926                     ; 407 			break;
2928  012b 2019          	jp	LC005
2929  012d               L7202:
2930                     ; 408 			case 3: // VALOR ZERO
2930                     ; 409 				gestor->Dispositivos.Hx711->Config.ValorZero = gestor->Dispositivos.Hx711->Tarar( gestor->Dispositivos.Hx711 );
2932  012d 1609          	ldw	y,(OFST-1,sp)
2933  012f 90ee09        	ldw	y,(9,y)
2934  0132 ee09          	ldw	x,(9,x)
2935  0134 90ee1a        	ldw	y,(26,y)
2936  0137 90fd          	call	(y)
2938  0139 cd0000        	call	c_uitolx
2940  013c 1e09          	ldw	x,(OFST-1,sp)
2941  013e ee09          	ldw	x,(9,x)
2942  0140 1c000b        	addw	x,#11
2943  0143 cd0000        	call	c_rtol
2945                     ; 410 				gestor->ordenHX711.Ejecutada = true;
2947  0146               LC005:
2949  0146 1e09          	ldw	x,(OFST-1,sp)
2950  0148 e604          	ld	a,(4,x)
2951  014a aa01          	or	a,#1
2952                     ; 411 			break;
2954  014c 2004          	jp	LC003
2955  014e               L1302:
2956                     ; 412 			case 4:
2956                     ; 413 				gestor->ordenHX711.Ejecutada = false;
2957                     ; 414 			break;
2959                     ; 415 			case 5:
2959                     ; 416 				gestor->ordenHX711.Ejecutada = false;
2960                     ; 417 			break;
2962                     ; 418 			case 6:
2962                     ; 419 				gestor->ordenHX711.Ejecutada = false;
2963                     ; 420 			break;
2965                     ; 421 			case 7:
2965                     ; 422 				gestor->ordenHX711.Ejecutada = false;
2966                     ; 423 			break;
2968                     ; 424 			case 8:
2968                     ; 425 				gestor->ordenHX711.Ejecutada = false;
2969                     ; 426 			break;
2971                     ; 427 			case 9:
2971                     ; 428 				gestor->ordenHX711.Ejecutada = false;
2979  014e e604          	ld	a,(4,x)
2980  0150 a4fe          	and	a,#254
2981  0152               LC003:
2982  0152 e704          	ld	(4,x),a
2983                     ; 429 			break;
2985  0154               L5402:
2986                     ; 478 		if( gestor->DatosEnvio.Dht11.EnvioPreparado == true )
2988  0154 e60d          	ld	a,(13,x)
2989  0156 a501          	bcp	a,#1
2990  0158 2732          	jreq	L7712
2991                     ; 480 			gestor->rs485->Buffer.Tx.buffer[0] = NUMERO_NODO_COMUNICACION;
2993  015a ee18          	ldw	x,(24,x)
2994  015c a601          	ld	a,#1
2995  015e e712          	ld	(18,x),a
2996                     ; 481 			gestor->rs485->Buffer.Tx.buffer[1] = gestor->DatosEnvio.Dht11.T_Entero;
2998  0160 1e09          	ldw	x,(OFST-1,sp)
2999  0162 e60e          	ld	a,(14,x)
3000  0164 ee18          	ldw	x,(24,x)
3001  0166 e713          	ld	(19,x),a
3002                     ; 482 			gestor->rs485->Buffer.Tx.buffer[2] = gestor->DatosEnvio.Dht11.T_Decimal;
3004  0168 1e09          	ldw	x,(OFST-1,sp)
3005  016a e60f          	ld	a,(15,x)
3006  016c ee18          	ldw	x,(24,x)
3007  016e e714          	ld	(20,x),a
3008                     ; 483 			gestor->rs485->Buffer.Tx.buffer[3] = gestor->DatosEnvio.Dht11.H_Entero;
3010  0170 1e09          	ldw	x,(OFST-1,sp)
3011  0172 e610          	ld	a,(16,x)
3012  0174 ee18          	ldw	x,(24,x)
3013  0176 e715          	ld	(21,x),a
3014                     ; 484 			gestor->rs485->Buffer.Tx.buffer[4] = gestor->DatosEnvio.Dht11.H_Decimal;
3016  0178 1e09          	ldw	x,(OFST-1,sp)
3017  017a e611          	ld	a,(17,x)
3018  017c ee18          	ldw	x,(24,x)
3019  017e e716          	ld	(22,x),a
3020                     ; 486 			gestor->rs485->Flags.bit.EnvioPreparado = 1;
3022  0180 1e09          	ldw	x,(OFST-1,sp)
3023  0182 ee18          	ldw	x,(24,x)
3024  0184 e621          	ld	a,(33,x)
3025  0186 aa10          	or	a,#16
3026  0188 e721          	ld	(33,x),a
3028  018a 2016          	jra	L1022
3029  018c               L7712:
3030                     ; 490 			gestor->rs485->Buffer.Tx.buffer[1] = 0;
3032  018c ee18          	ldw	x,(24,x)
3033  018e 6f13          	clr	(19,x)
3034                     ; 491 			gestor->rs485->Buffer.Tx.buffer[2] = 0;
3036  0190 1e09          	ldw	x,(OFST-1,sp)
3037  0192 ee18          	ldw	x,(24,x)
3038  0194 6f14          	clr	(20,x)
3039                     ; 492 			gestor->rs485->Buffer.Tx.buffer[3] = 0;
3041  0196 1e09          	ldw	x,(OFST-1,sp)
3042  0198 ee18          	ldw	x,(24,x)
3043  019a 6f15          	clr	(21,x)
3044                     ; 493 			gestor->rs485->Buffer.Tx.buffer[4] = 0;
3046  019c 1e09          	ldw	x,(OFST-1,sp)
3047  019e ee18          	ldw	x,(24,x)
3048  01a0 6f16          	clr	(22,x)
3049  01a2               L1022:
3050                     ; 496 		if( gestor->DatosEnvio.Hx711.EnvioPreparado == true )
3052  01a2 1e09          	ldw	x,(OFST-1,sp)
3053  01a4 e612          	ld	a,(18,x)
3054  01a6 a501          	bcp	a,#1
3055  01a8 2722          	jreq	L3022
3056                     ; 498 			gestor->rs485->Buffer.Tx.buffer[0] = NUMERO_NODO_COMUNICACION;
3058  01aa ee18          	ldw	x,(24,x)
3059  01ac a601          	ld	a,#1
3060  01ae e712          	ld	(18,x),a
3061                     ; 499 			gestor->rs485->Buffer.Tx.buffer[5] = gestor->DatosEnvio.Hx711.Bytes.alto;
3063  01b0 1e09          	ldw	x,(OFST-1,sp)
3064  01b2 e613          	ld	a,(19,x)
3065  01b4 ee18          	ldw	x,(24,x)
3066  01b6 e717          	ld	(23,x),a
3067                     ; 500 			gestor->rs485->Buffer.Tx.buffer[6] = gestor->DatosEnvio.Hx711.Bytes.bajo;
3069  01b8 1e09          	ldw	x,(OFST-1,sp)
3070  01ba e614          	ld	a,(20,x)
3071  01bc ee18          	ldw	x,(24,x)
3072  01be e718          	ld	(24,x),a
3073                     ; 502 			gestor->rs485->Flags.bit.EnvioPreparado = 1;
3075  01c0 1e09          	ldw	x,(OFST-1,sp)
3076  01c2 ee18          	ldw	x,(24,x)
3077  01c4 e621          	ld	a,(33,x)
3078  01c6 aa10          	or	a,#16
3079  01c8 e721          	ld	(33,x),a
3081  01ca 2039          	jra	L1502
3082  01cc               L3022:
3083                     ; 506 			gestor->rs485->Buffer.Tx.buffer[5] = 0;
3085  01cc ee18          	ldw	x,(24,x)
3086  01ce 6f17          	clr	(23,x)
3087                     ; 507 			gestor->rs485->Buffer.Tx.buffer[6] = 0;
3089  01d0 1e09          	ldw	x,(OFST-1,sp)
3090  01d2 ee18          	ldw	x,(24,x)
3091  01d4 6f18          	clr	(24,x)
3092  01d6 202d          	jra	L1502
3093  01d8               L5412:
3094                     ; 105 	gestor->nNodo = 0;
3097  01d8 7f            	clr	(x)
3098                     ; 107 	gestor->ordenDHT11.Ejecutada = false;
3100  01d9 e601          	ld	a,(1,x)
3101  01db a4fe          	and	a,#254
3102  01dd e701          	ld	(1,x),a
3103                     ; 108 	gestor->ordenDHT11.Orden.Funcion = 0;
3105  01df 6f02          	clr	(2,x)
3106                     ; 109 	gestor->ordenDHT11.Orden.Comando = 0;
3108  01e1 6f03          	clr	(3,x)
3109                     ; 110 	gestor->ordenHX711.Ejecutada = false;
3111  01e3 e604          	ld	a,(4,x)
3112  01e5 a4fe          	and	a,#254
3113  01e7 e704          	ld	(4,x),a
3114                     ; 111 	gestor->ordenHX711.Orden.Funcion = 0;
3116  01e9 6f05          	clr	(5,x)
3117                     ; 112 	gestor->ordenHX711.Orden.Comando = 0;
3119  01eb 6f06          	clr	(6,x)
3120                     ; 114 	gestor->DatosEnvio.Dht11.EnvioPreparado = false;
3122  01ed e60d          	ld	a,(13,x)
3123  01ef a4fe          	and	a,#254
3124  01f1 e70d          	ld	(13,x),a
3125                     ; 115 	gestor->DatosEnvio.Dht11.T_Entero = 0;
3127  01f3 6f0e          	clr	(14,x)
3128                     ; 116 	gestor->DatosEnvio.Dht11.T_Decimal = 0;
3130  01f5 6f0f          	clr	(15,x)
3131                     ; 117 	gestor->DatosEnvio.Dht11.H_Entero = 0;
3133  01f7 6f10          	clr	(16,x)
3134                     ; 118 	gestor->DatosEnvio.Dht11.H_Decimal = 0;
3136  01f9 6f11          	clr	(17,x)
3137                     ; 119 	gestor->DatosEnvio.Hx711.EnvioPreparado = false;
3139  01fb e612          	ld	a,(18,x)
3140  01fd a4fe          	and	a,#254
3141  01ff e712          	ld	(18,x),a
3142                     ; 120 	gestor->DatosEnvio.Hx711.Medida = 0;
3144  0201 905f          	clrw	y
3145  0203 ef13          	ldw	(19,x),y
3146  0205               L1502:
3147                     ; 553 }
3150  0205 5b0c          	addw	sp,#12
3151  0207 81            	ret	
3164                     	xdef	_GO_evRecepcion
3165                     	xdef	_GO_Init
3166                     	xref.b	_GestorRS485
3167                     	xref	_Observador_Init
3168                     	xref.b	c_x
3187                     	xref	c_rtol
3188                     	xref	c_uitolx
3189                     	xref	c_xymov
3190                     	end

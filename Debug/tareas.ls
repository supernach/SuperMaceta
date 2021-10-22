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
1540                     ; 289 void Tareas_Init( Tareas_t_ptr tareas )
1540                     ; 290 {
1542                     .text:	section	.text,new
1543  0000               _Tareas_Init:
1545  0000 89            	pushw	x
1546  0001 88            	push	a
1547       00000001      OFST:	set	1
1550                     ; 291 	uint8_t auxiliar = 0;
1552  0002 0f01          	clr	(OFST+0,sp)
1554                     ; 251 	Timer_Config_Init( &timerTick.Config, TIMER2, SINCANAL, COUNTERUP, SI, 1000 );
1557  0004 ae03e8        	ldw	x,#1000
1558  0007 89            	pushw	x
1559  0008 4b00          	push	#0
1560  000a 4b00          	push	#0
1561  000c 4b00          	push	#0
1562  000e 4b01          	push	#1
1563  0010 ae0000        	ldw	x,#L111_timerTick
1564  0013 cd0000        	call	_Timer_Config_Init
1566  0016 5b06          	addw	sp,#6
1567                     ; 252 	Timer_Init( &timerTick );
1569  0018 ae0000        	ldw	x,#L111_timerTick
1570  001b cd0000        	call	_Timer_Init
1572                     ; 295 	tareas->NumeroTareas = 0;
1574  001e 1e02          	ldw	x,(OFST+1,sp)
1575  0020 7f            	clr	(x)
1577  0021 201c          	jra	L1121
1578  0023               L5021:
1579                     ; 299 		tareas->Tareas[auxiliar].Tiempo.Actual = 0;
1581  0023 97            	ld	xl,a
1582  0024 a608          	ld	a,#8
1583  0026 42            	mul	x,a
1584  0027 72fb02        	addw	x,(OFST+1,sp)
1585  002a 905f          	clrw	y
1586  002c ef01          	ldw	(1,x),y
1587                     ; 300 		tareas->Tareas[auxiliar].Tiempo.Ejecucion = 0;
1589  002e 7b01          	ld	a,(OFST+0,sp)
1590  0030 97            	ld	xl,a
1591  0031 a608          	ld	a,#8
1592  0033 42            	mul	x,a
1593  0034 72fb02        	addw	x,(OFST+1,sp)
1594                     ; 301 		tareas->Tareas[auxiliar].TipoTarea = TAREA_NULL;
1596  0037 6f05          	clr	(5,x)
1597  0039 ef03          	ldw	(3,x),y
1598                     ; 302 		tareas->Tareas[auxiliar].Tarea.Dispositivo = NULL;
1600  003b ef07          	ldw	(7,x),y
1601                     ; 303 		auxiliar++;
1603  003d 0c01          	inc	(OFST+0,sp)
1605  003f               L1121:
1606                     ; 297 	while( auxiliar < TAREAS_MAX )
1608  003f 7b01          	ld	a,(OFST+0,sp)
1609  0041 a104          	cp	a,#4
1610  0043 25de          	jrult	L5021
1611                     ; 305 }
1614  0045 5b03          	addw	sp,#3
1615  0047 81            	ret	
1691                     ; 342 void Tareas_Registrar( Tareas_t_ptr tareas, Tarea_Dispositivo_u dispositivo, uint16_t tiempo, Tarea_Tipo_e tipoTarea, Tarea_Tipo_Dispositivo_e tipoDispositivo )
1691                     ; 343 {
1692                     .text:	section	.text,new
1693  0000               _Tareas_Registrar:
1695  0000 89            	pushw	x
1696       00000000      OFST:	set	0
1699                     ; 344 	if( tareas->NumeroTareas < TAREAS_MAX )
1701  0001 f6            	ld	a,(x)
1702  0002 a104          	cp	a,#4
1703  0004 2444          	jruge	L5621
1704                     ; 346 		if( dispositivo.Dispositivo != NULL )
1706  0006 1e05          	ldw	x,(OFST+5,sp)
1707  0008 2740          	jreq	L5621
1708                     ; 348 			if( tareas->Tareas[tareas->NumeroTareas].Tarea.Dispositivo == NULL )
1710  000a 1e01          	ldw	x,(OFST+1,sp)
1711  000c f6            	ld	a,(x)
1712  000d 97            	ld	xl,a
1713  000e a608          	ld	a,#8
1714  0010 42            	mul	x,a
1715  0011 72fb01        	addw	x,(OFST+1,sp)
1716  0014 e608          	ld	a,(8,x)
1717  0016 ea07          	or	a,(7,x)
1718  0018 2630          	jrne	L5621
1719                     ; 350 				tareas->Tareas[tareas->NumeroTareas].TipoDispositivo = tipoDispositivo;
1721  001a 7b0a          	ld	a,(OFST+10,sp)
1722  001c e706          	ld	(6,x),a
1723                     ; 352 				switch( tipoDispositivo )
1726                     ; 368 					break;
1727  001e 270d          	jreq	L3221
1728  0020 4a            	dec	a
1729  0021 2706          	jreq	L5121
1730  0023 4a            	dec	a
1731  0024 2703          	jreq	L5121
1732  0026 4a            	dec	a
1733  0027 2608          	jrne	L5721
1734  0029               L5121:
1735                     ; 354 					case HX711:
1735                     ; 355 						tareas->Tareas[tareas->NumeroTareas].Tarea.Tarea_HX711 = dispositivo.Tarea_HX711;
1736                     ; 356 					break;
1738                     ; 358 					case DHT11:
1738                     ; 359 						tareas->Tareas[tareas->NumeroTareas].Tarea.Tarea_DHT11 = dispositivo.Tarea_DHT11;
1742  0029 1605          	ldw	y,(OFST+5,sp)
1743                     ; 360 					break;
1745  002b 2002          	jp	LC001
1746                     ; 362 					case LED:
1746                     ; 363 						tareas->Tareas[tareas->NumeroTareas].Tarea.Tarea_LedCheck = dispositivo.Tarea_LedCheck;
1747                     ; 364 					break;
1749  002d               L3221:
1750                     ; 366 					case NODISP:
1750                     ; 367 						tareas->Tareas[tareas->NumeroTareas].Tarea.Dispositivo = NULL;
1752  002d 905f          	clrw	y
1753  002f               LC001:
1754  002f ef07          	ldw	(7,x),y
1755                     ; 368 					break;
1757  0031               L5721:
1758                     ; 371 				tareas->Tareas[tareas->NumeroTareas].Tiempo.Ejecucion = tiempo;
1760  0031 1e01          	ldw	x,(OFST+1,sp)
1761  0033 f6            	ld	a,(x)
1762  0034 97            	ld	xl,a
1763  0035 a608          	ld	a,#8
1764  0037 42            	mul	x,a
1765  0038 72fb01        	addw	x,(OFST+1,sp)
1766  003b 1607          	ldw	y,(OFST+7,sp)
1767  003d ef03          	ldw	(3,x),y
1768                     ; 372 				tareas->Tareas[tareas->NumeroTareas].Tiempo.Actual = 0;
1770  003f 905f          	clrw	y
1771  0041 ef01          	ldw	(1,x),y
1772                     ; 373 				tareas->Tareas[tareas->NumeroTareas].TipoTarea = tipoTarea;
1774  0043 7b09          	ld	a,(OFST+9,sp)
1775  0045 e705          	ld	(5,x),a
1776                     ; 374 				tareas->NumeroTareas = tareas->NumeroTareas + 1;
1778  0047 1e01          	ldw	x,(OFST+1,sp)
1779  0049 7c            	inc	(x)
1780  004a               L5621:
1781                     ; 378 }
1784  004a 85            	popw	x
1785  004b 81            	ret	
1860                     ; 415 void Tareas_Run( Tareas_t_ptr tareas )
1860                     ; 416 {
1861                     .text:	section	.text,new
1862  0000               _Tareas_Run:
1864  0000 89            	pushw	x
1865  0001 5208          	subw	sp,#8
1866       00000008      OFST:	set	8
1869                     ; 417 	uint8_t auxiliar = 0;
1871  0003 0f08          	clr	(OFST+0,sp)
1873                     ; 419 	if( getFlagTimer2( ) > 0 ) // compruebo cuantos ticks ha habido
1875  0005 cd0000        	call	_getFlagTimer2
1877  0008 5d            	tnzw	x
1878  0009 2603cc013f    	jreq	L3731
1880  000e 2020          	jra	L5631
1881  0010               L3631:
1882                     ; 423 			tareas->Tareas[auxiliar].Tiempo.Actual = tareas->Tareas[auxiliar].Tiempo.Actual + getFlagTimer2( );
1884  0010 cd0000        	call	_getFlagTimer2
1886  0013 7b08          	ld	a,(OFST+0,sp)
1887  0015 905f          	clrw	y
1888  0017 9097          	ld	yl,a
1889  0019 9058          	sllw	y
1890  001b 9058          	sllw	y
1891  001d 9058          	sllw	y
1892  001f 72f909        	addw	y,(OFST+1,sp)
1893  0022 01            	rrwa	x,a
1894  0023 90eb02        	add	a,(2,y)
1895  0026 01            	rrwa	x,a
1896  0027 90e901        	adc	a,(1,y)
1897  002a 01            	rrwa	x,a
1898  002b 90ef01        	ldw	(1,y),x
1899                     ; 424 			auxiliar = auxiliar + 1;
1901  002e 0c08          	inc	(OFST+0,sp)
1903  0030               L5631:
1904                     ; 421 		while( auxiliar <  tareas->NumeroTareas )// sumo ticks
1906  0030 1e09          	ldw	x,(OFST+1,sp)
1907  0032 f6            	ld	a,(x)
1908  0033 1108          	cp	a,(OFST+0,sp)
1909  0035 22d9          	jrugt	L3631
1910                     ; 426 		auxiliar = 0;
1912  0037 0f08          	clr	(OFST+0,sp)
1914                     ; 427 		setFlagTimer2( 0 );
1916  0039 5f            	clrw	x
1917  003a cd0000        	call	_setFlagTimer2
1919  003d cc013f        	jra	L3731
1920  0040               L1731:
1921                     ; 432 		if( tareas->Tareas[auxiliar].Tiempo.Actual >= tareas->Tareas[auxiliar].Tiempo.Ejecucion ) //ejecutar tarea
1923  0040 7b08          	ld	a,(OFST+0,sp)
1924  0042 97            	ld	xl,a
1925  0043 a608          	ld	a,#8
1926  0045 42            	mul	x,a
1927  0046 72fb09        	addw	x,(OFST+1,sp)
1928  0049 7b08          	ld	a,(OFST+0,sp)
1929  004b 905f          	clrw	y
1930  004d 9097          	ld	yl,a
1931  004f 9058          	sllw	y
1932  0051 9058          	sllw	y
1933  0053 9058          	sllw	y
1934  0055 72f909        	addw	y,(OFST+1,sp)
1935  0058 ee01          	ldw	x,(1,x)
1936  005a 90e303        	cpw	x,(3,y)
1937  005d 2403cc013d    	jrult	L7731
1938                     ; 434 			switch (  tareas->Tareas[auxiliar].TipoTarea )
1940  0062 97            	ld	xl,a
1941  0063 a608          	ld	a,#8
1942  0065 42            	mul	x,a
1943  0066 72fb09        	addw	x,(OFST+1,sp)
1944  0069 e605          	ld	a,(5,x)
1946                     ; 448 				break;
1947  006b 27f2          	jreq	L7731
1948  006d 4a            	dec	a
1949  006e 2706          	jreq	L3031
1950  0070 4a            	dec	a
1951  0071 276e          	jreq	L5131
1952  0073 cc013d        	jra	L7731
1953  0076               L3031:
1954                     ; 441 					Tarea_Lectura( tareas, auxiliar );
1957  0076 1e09          	ldw	x,(OFST+1,sp)
1958  0078 1f06          	ldw	(OFST-2,sp),x
1960                     ; 145 	switch( tareas->Tareas[indice].TipoDispositivo )
1962  007a 7b08          	ld	a,(OFST+0,sp)
1963  007c 97            	ld	xl,a
1964  007d a608          	ld	a,#8
1965  007f 42            	mul	x,a
1966  0080 72fb06        	addw	x,(OFST-2,sp)
1967  0083 e606          	ld	a,(6,x)
1969                     ; 155 		case NODISP:
1969                     ; 156 		break;
1970  0085 4a            	dec	a
1971  0086 2706          	jreq	L5031
1972  0088 4a            	dec	a
1973  0089 2732          	jreq	L7031
1974  008b cc012e        	jra	LC004
1975  008e               L5031:
1976                     ; 147 		case HX711:
1976                     ; 148 			tareas->Tareas[indice].Tarea.Tarea_HX711->Datos.UltimaLectura = tareas->Tareas[indice].Tarea.Tarea_HX711->Lectura( tareas->Tareas[indice].Tarea.Tarea_HX711 );
1978  008e ee07          	ldw	x,(7,x)
1979  0090 7b08          	ld	a,(OFST+0,sp)
1980  0092 905f          	clrw	y
1981  0094 9097          	ld	yl,a
1982  0096 9058          	sllw	y
1983  0098 9058          	sllw	y
1984  009a 9058          	sllw	y
1985  009c 72f906        	addw	y,(OFST-2,sp)
1986  009f 90ee07        	ldw	y,(7,y)
1987  00a2 90ee18        	ldw	y,(24,y)
1988  00a5 90fd          	call	(y)
1990  00a7 cd0000        	call	c_uitolx
1992  00aa 7b08          	ld	a,(OFST+0,sp)
1993  00ac 97            	ld	xl,a
1994  00ad a608          	ld	a,#8
1995  00af 42            	mul	x,a
1996  00b0 72fb06        	addw	x,(OFST-2,sp)
1997  00b3 ee07          	ldw	x,(7,x)
1998  00b5 1c0011        	addw	x,#17
1999  00b8 cd0000        	call	c_rtol
2001                     ; 149 		break;
2002                     ; 442 					tareas->Tareas[auxiliar].Tiempo.Actual = 1;
2003                     ; 443 				break;
2005  00bb 2071          	jp	LC004
2006  00bd               L7031:
2007                     ; 151 		case DHT11:
2007                     ; 152 			tareas->Tareas[indice].Tarea.Tarea_DHT11->Datos.UltimaLectura = tareas->Tareas[indice].Tarea.Tarea_DHT11->Lectura( tareas->Tareas[indice].Tarea.Tarea_DHT11 );
2009  00bd ee07          	ldw	x,(7,x)
2010  00bf 89            	pushw	x
2011  00c0 7b0a          	ld	a,(OFST+2,sp)
2012  00c2 97            	ld	xl,a
2013  00c3 a608          	ld	a,#8
2014  00c5 42            	mul	x,a
2015  00c6 72fb08        	addw	x,(OFST+0,sp)
2016  00c9 ee07          	ldw	x,(7,x)
2017  00cb 1c0004        	addw	x,#4
2018  00ce 89            	pushw	x
2019  00cf 7b0c          	ld	a,(OFST+4,sp)
2020  00d1 97            	ld	xl,a
2021  00d2 a608          	ld	a,#8
2022  00d4 42            	mul	x,a
2023  00d5 72fb0a        	addw	x,(OFST+2,sp)
2024  00d8 ee07          	ldw	x,(7,x)
2025  00da ee0c          	ldw	x,(12,x)
2026  00dc fd            	call	(x)
2028  00dd 5b04          	addw	sp,#4
2029                     ; 153 		break;
2031  00df 204d          	jra	LC004
2032                     ; 155 		case NODISP:
2032                     ; 156 		break;
2034  00e1               L5131:
2035                     ; 446 					Tarea_Led_Toggle( tareas, auxiliar );
2038  00e1 1e09          	ldw	x,(OFST+1,sp)
2039  00e3 1f06          	ldw	(OFST-2,sp),x
2041                     ; 197 	if( tareas->Tareas[indice].Tarea.Tarea_LedCheck->Estado.bitEstado.ComandoRecibido == true )
2043  00e5 7b08          	ld	a,(OFST+0,sp)
2044  00e7 97            	ld	xl,a
2045  00e8 a608          	ld	a,#8
2046  00ea 42            	mul	x,a
2047  00eb 72fb06        	addw	x,(OFST-2,sp)
2048  00ee ee07          	ldw	x,(7,x)
2049  00f0 f6            	ld	a,(x)
2050  00f1 a504          	bcp	a,#4
2051  00f3 2714          	jreq	L1141
2052                     ; 199 		if( tareas->Tareas[indice].Tarea.Tarea_LedCheck->Estado.bitEstado.Encendido == true )
2054  00f5 7b08          	ld	a,(OFST+0,sp)
2055  00f7 97            	ld	xl,a
2056  00f8 a608          	ld	a,#8
2057  00fa 42            	mul	x,a
2058  00fb 72fb06        	addw	x,(OFST-2,sp)
2059  00fe ee07          	ldw	x,(7,x)
2060  0100 f6            	ld	a,(x)
2061  0101 a501          	bcp	a,#1
2062                     ; 201 			tareas->Tareas[indice].Tarea.Tarea_LedCheck->SetLed( tareas->Tareas[indice].Tarea.Tarea_LedCheck, true );
2065  0103 2604          	jrne	L1141
2066                     ; 205 			tareas->Tareas[indice].Tarea.Tarea_LedCheck->SetLed( tareas->Tareas[indice].Tarea.Tarea_LedCheck, false );
2068  0105 4b00          	push	#0
2070  0107 2002          	jra	L7131
2071  0109               L1141:
2072                     ; 210 		tareas->Tareas[indice].Tarea.Tarea_LedCheck->SetLed( tareas->Tareas[indice].Tarea.Tarea_LedCheck, true );
2075  0109 4b01          	push	#1
2077  010b               L7131:
2078  010b 7b09          	ld	a,(OFST+1,sp)
2079  010d 97            	ld	xl,a
2080  010e a608          	ld	a,#8
2081  0110 42            	mul	x,a
2082  0111 72fb07        	addw	x,(OFST-1,sp)
2083  0114 7b09          	ld	a,(OFST+1,sp)
2084  0116 ee07          	ldw	x,(7,x)
2085  0118 905f          	clrw	y
2086  011a 9097          	ld	yl,a
2087  011c 9058          	sllw	y
2088  011e 9058          	sllw	y
2089  0120 9058          	sllw	y
2090  0122 72f907        	addw	y,(OFST-1,sp)
2091  0125 90ee07        	ldw	y,(7,y)
2092  0128 90ee05        	ldw	y,(5,y)
2093  012b 90fd          	call	(y)
2094  012d 84            	pop	a
2095                     ; 447 					tareas->Tareas[auxiliar].Tiempo.Actual = 1;
2097  012e               LC004:
2099  012e 7b08          	ld	a,(OFST+0,sp)
2100  0130 97            	ld	xl,a
2101  0131 a608          	ld	a,#8
2102  0133 42            	mul	x,a
2103  0134 72fb09        	addw	x,(OFST+1,sp)
2104  0137 90ae0001      	ldw	y,#1
2105  013b ef01          	ldw	(1,x),y
2106                     ; 448 				break;
2108  013d               L7731:
2109                     ; 451 		auxiliar = auxiliar + 1;
2111  013d 0c08          	inc	(OFST+0,sp)
2113  013f               L3731:
2114                     ; 430 	while( auxiliar < tareas->NumeroTareas )
2116  013f 1e09          	ldw	x,(OFST+1,sp)
2117  0141 f6            	ld	a,(x)
2118  0142 1108          	cp	a,(OFST+0,sp)
2119  0144 2303cc0040    	jrugt	L1731
2120                     ; 453 	auxiliar = 0;
2122                     ; 454 }
2125  0149 5b0a          	addw	sp,#10
2126  014b 81            	ret	
2139                     	xdef	_Tareas_Run
2140                     	xdef	_Tareas_Registrar
2141                     	xdef	_Tareas_Init
2142                     	switch	.ubsct
2143  0000               L111_timerTick:
2144  0000 000000000000  	ds.b	6
2145                     	xref	_Timer_Config_Init
2146                     	xref	_Timer_Init
2147                     	xref	_setFlagTimer2
2148                     	xref	_getFlagTimer2
2168                     	xref	c_rtol
2169                     	xref	c_uitolx
2170                     	end

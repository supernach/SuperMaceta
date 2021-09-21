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
1664                     ; 162 int main()
1664                     ; 163 {
1666                     .text:	section	.text,new
1667  0000               _main:
1671                     ; 57 	GPIO_DeInit(GPIOA);
1675  0000 ae5000        	ldw	x,#20480
1676  0003 cd0000        	call	_GPIO_DeInit
1678                     ; 58 	GPIO_DeInit(GPIOB);
1680  0006 ae5005        	ldw	x,#20485
1681  0009 cd0000        	call	_GPIO_DeInit
1683                     ; 59 	GPIO_DeInit(GPIOC);
1685  000c ae500a        	ldw	x,#20490
1686  000f cd0000        	call	_GPIO_DeInit
1688                     ; 60 	GPIO_DeInit(GPIOD);
1690  0012 ae500f        	ldw	x,#20495
1691  0015 cd0000        	call	_GPIO_DeInit
1693                     ; 107 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
1696  0018 ae0080        	ldw	x,#128
1697  001b cd0000        	call	_Clock_HSI_Init
1699                     ; 74 	SensorTempHum.Config.HW.Puerto = GPIOA;
1703  001e ae5000        	ldw	x,#20480
1704  0021 bf4e          	ldw	_SensorTempHum,x
1705                     ; 75 	SensorTempHum.Config.HW.Pin = GPIO_PIN_3;
1707  0023 35080050      	mov	_SensorTempHum+2,#8
1708                     ; 78 	SensorPesaje.Config.DOUT.Puerto = GPIOD;
1710  0027 ae500f        	ldw	x,#20495
1711  002a bf32          	ldw	_SensorPesaje,x
1712                     ; 79 	SensorPesaje.Config.DOUT.Pin = GPIO_PIN_2;
1714  002c 35040034      	mov	_SensorPesaje+2,#4
1715                     ; 81 	SensorPesaje.Config.PD_SCK.Puerto = GPIOD;
1717  0030 bf36          	ldw	_SensorPesaje+4,x
1718                     ; 82 	SensorPesaje.Config.PD_SCK.Pin = GPIO_PIN_3;
1720  0032 35080038      	mov	_SensorPesaje+6,#8
1721                     ; 118 	Timer_Config_Init( &timer_Timeout.Config, TIMER1, CANAL1, COUNTERUP, SI, 1 );
1724  0036 ae0001        	ldw	x,#1
1725  0039 89            	pushw	x
1726  003a 4b00          	push	#0
1727  003c 4b00          	push	#0
1728  003e 4b00          	push	#0
1729  0040 4b00          	push	#0
1730  0042 ae002c        	ldw	x,#_timer_Timeout
1731  0045 cd0000        	call	_Timer_Config_Init
1733  0048 5b06          	addw	sp,#6
1734                     ; 119 	Timeout_Init( &Timeout, &timer_Timeout, &getFlagTimer1, &setFlagTimer1 );
1736  004a ae0000        	ldw	x,#_setFlagTimer1
1737  004d 89            	pushw	x
1738  004e ae0000        	ldw	x,#_getFlagTimer1
1739  0051 89            	pushw	x
1740  0052 ae002c        	ldw	x,#_timer_Timeout
1741  0055 89            	pushw	x
1742  0056 ae0023        	ldw	x,#_Timeout
1743  0059 cd0000        	call	_Timeout_Init
1745  005c 5b06          	addw	sp,#6
1746                     ; 121 	RS485_Init( &Comunicacion );
1748  005e ae0000        	ldw	x,#_Comunicacion
1749  0061 cd0000        	call	_RS485_Init
1751                     ; 123 	DHT11_Init( &SensorTempHum, &dht11_Lectura, &Timeout );
1753  0064 ae0023        	ldw	x,#_Timeout
1754  0067 89            	pushw	x
1755  0068 ae0000        	ldw	x,#_dht11_Lectura
1756  006b 89            	pushw	x
1757  006c ae004e        	ldw	x,#_SensorTempHum
1758  006f cd0000        	call	_DHT11_Init
1760  0072 5b04          	addw	sp,#4
1761                     ; 124 	HX711_Init( &SensorPesaje, &hx711_Lectura, &hx711_Tarar, &Timeout );
1763  0074 ae0023        	ldw	x,#_Timeout
1764  0077 89            	pushw	x
1765  0078 ae0000        	ldw	x,#_hx711_Tarar
1766  007b 89            	pushw	x
1767  007c ae0000        	ldw	x,#_hx711_Lectura
1768  007f 89            	pushw	x
1769  0080 ae0032        	ldw	x,#_SensorPesaje
1770  0083 cd0000        	call	_HX711_Init
1772  0086 5b06          	addw	sp,#6
1773  0088               L7221:
1774                     ; 169 		if( getFlagUartRXNE( ) > 0 )
1776  0088 cd0000        	call	_getFlagUartRXNE
1778  008b 4d            	tnz	a
1779  008c 27fa          	jreq	L7221
1780                     ; 171 			Comunicacion.Buffer.Rx.nNodo = UART1_ReceiveData8( );
1782  008e cd0000        	call	_UART1_ReceiveData8
1784  0091 b71e          	ld	_Comunicacion+30,a
1785                     ; 172 			setFlagUartRXNE( 0 );
1787  0093 4f            	clr	a
1788  0094 cd0000        	call	_setFlagUartRXNE
1790  0097 20ef          	jra	L7221
1803                     	xdef	_main
1804                     	switch	.ubsct
1805  0000               _Comunicacion:
1806  0000 000000000000  	ds.b	35
1807                     	xdef	_Comunicacion
1808  0023               _Timeout:
1809  0023 000000000000  	ds.b	9
1810                     	xdef	_Timeout
1811  002c               _timer_Timeout:
1812  002c 000000000000  	ds.b	6
1813                     	xdef	_timer_Timeout
1814  0032               _SensorPesaje:
1815  0032 000000000000  	ds.b	28
1816                     	xdef	_SensorPesaje
1817  004e               _SensorTempHum:
1818  004e 000000000000  	ds.b	14
1819                     	xdef	_SensorTempHum
1820                     	xref	_RS485_Init
1821                     	xref	_hx711_Tarar
1822                     	xref	_hx711_Lectura
1823                     	xref	_HX711_Init
1824                     	xref	_dht11_Lectura
1825                     	xref	_DHT11_Init
1826                     	xref	_Timeout_Init
1827                     	xref	_Timer_Config_Init
1828                     	xref	_Clock_HSI_Init
1829                     	xref	_UART1_ReceiveData8
1830                     	xref	_setFlagUartRXNE
1831                     	xref	_getFlagUartRXNE
1832                     	xref	_setFlagTimer1
1833                     	xref	_getFlagTimer1
1834                     	xref	_GPIO_DeInit
1854                     	end

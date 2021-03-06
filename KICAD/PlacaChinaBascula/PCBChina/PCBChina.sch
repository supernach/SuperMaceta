EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 3650 3700 0    50   Input ~ 0
U3_P1
Text GLabel 3650 3900 0    50   Input ~ 0
U3_P2
Text GLabel 3650 4100 0    50   Input ~ 0
U3_P3
Text GLabel 3650 4300 0    50   Input ~ 0
U3_P4
Text GLabel 3650 4500 0    50   Input ~ 0
U3_P5
Text GLabel 3650 4700 0    50   Input ~ 0
U3_P6
Text GLabel 3650 4900 0    50   Input ~ 0
U3_P7
Text GLabel 3650 5100 0    50   Input ~ 0
U3_P8
Text GLabel 4800 5100 2    50   Input ~ 0
U3_P9
Text GLabel 4800 4900 2    50   Input ~ 0
U3_P10
Text GLabel 4800 4700 2    50   Input ~ 0
U3_P11
Text GLabel 4800 4500 2    50   Input ~ 0
U3_P12
Text GLabel 4800 4300 2    50   Input ~ 0
U3_P13
Text GLabel 4800 4100 2    50   Input ~ 0
U3_P14
Text GLabel 4800 3900 2    50   Input ~ 0
U3_P15
Text GLabel 4800 3700 2    50   Input ~ 0
U3_P16
$Comp
L Switch:SW_DIP_x01 SW?
U 1 1 616C6043
P 2200 3050
F 0 "SW?" H 2200 3317 50  0000 C CNN
F 1 "UNIT" H 2200 3226 50  0000 C CNN
F 2 "" H 2200 3050 50  0001 C CNN
F 3 "~" H 2200 3050 50  0001 C CNN
	1    2200 3050
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DIP_x01 SW?
U 1 1 616C7428
P 2200 2550
F 0 "SW?" H 2200 2817 50  0000 C CNN
F 1 "TARE" H 2200 2726 50  0000 C CNN
F 2 "" H 2200 2550 50  0001 C CNN
F 3 "~" H 2200 2550 50  0001 C CNN
	1    2200 2550
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DIP_x01 SW?
U 1 1 616C78C4
P 2200 2100
F 0 "SW?" H 2200 2367 50  0000 C CNN
F 1 "ONOFF" H 2200 2276 50  0000 C CNN
F 2 "" H 2200 2100 50  0001 C CNN
F 3 "~" H 2200 2100 50  0001 C CNN
	1    2200 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 616C979D
P 2800 3050
F 0 "R?" V 2593 3050 50  0000 C CNN
F 1 "1K" V 2684 3050 50  0000 C CNN
F 2 "" V 2730 3050 50  0001 C CNN
F 3 "~" H 2800 3050 50  0001 C CNN
	1    2800 3050
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 616CB7ED
P 2800 2550
F 0 "R?" V 2593 2550 50  0000 C CNN
F 1 "1K" V 2684 2550 50  0000 C CNN
F 2 "" V 2730 2550 50  0001 C CNN
F 3 "~" H 2800 2550 50  0001 C CNN
	1    2800 2550
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 616CBAB2
P 2800 2100
F 0 "R?" V 2593 2100 50  0000 C CNN
F 1 "1K" V 2684 2100 50  0000 C CNN
F 2 "" V 2730 2100 50  0001 C CNN
F 3 "~" H 2800 2100 50  0001 C CNN
	1    2800 2100
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 616CBB53
P 3200 1900
F 0 "C?" H 3315 1946 50  0000 L CNN
F 1 "C" H 3315 1855 50  0000 L CNN
F 2 "" H 3238 1750 50  0001 C CNN
F 3 "~" H 3200 1900 50  0001 C CNN
	1    3200 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 616CD203
P 3200 2350
F 0 "C?" H 3315 2396 50  0000 L CNN
F 1 "C" H 3315 2305 50  0000 L CNN
F 2 "" H 3238 2200 50  0001 C CNN
F 3 "~" H 3200 2350 50  0001 C CNN
	1    3200 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 616CD5D2
P 3200 2850
F 0 "C?" H 3315 2896 50  0000 L CNN
F 1 "C" H 3315 2805 50  0000 L CNN
F 2 "" H 3238 2700 50  0001 C CNN
F 3 "~" H 3200 2850 50  0001 C CNN
	1    3200 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 2100 2650 2100
Wire Wire Line
	2950 2100 3200 2100
Wire Wire Line
	3200 2100 3200 2050
Wire Wire Line
	2500 2550 2650 2550
Wire Wire Line
	2950 2550 3200 2550
Wire Wire Line
	3200 2550 3200 2500
Wire Wire Line
	2500 3050 2650 3050
Wire Wire Line
	2950 3050 3200 3050
Wire Wire Line
	3200 3050 3200 3000
Wire Wire Line
	3200 3050 3750 3050
Wire Wire Line
	3750 3050 3750 3700
Wire Wire Line
	3750 3700 3650 3700
Connection ~ 3200 3050
Wire Wire Line
	3200 2550 3850 2550
Wire Wire Line
	3850 2550 3850 3900
Wire Wire Line
	3850 3900 3650 3900
Connection ~ 3200 2550
Wire Wire Line
	3200 2100 3950 2100
Wire Wire Line
	3950 2100 3950 4100
Wire Wire Line
	3950 4100 3650 4100
Connection ~ 3200 2100
Text GLabel 3450 1750 2    50   Input ~ 0
GND
Text GLabel 3450 2200 2    50   Input ~ 0
GND
Text GLabel 3400 2700 2    50   Input ~ 0
GND
Wire Wire Line
	3200 1750 3450 1750
Wire Wire Line
	3200 2200 3450 2200
Wire Wire Line
	3200 2700 3400 2700
$Comp
L Regulator_Linear:ME6211A_SOT89-3 U2
U 1 1 616D5E6C
P 8900 1450
F 0 "U2" H 9078 1263 50  0000 L CNN
F 1 "ME6211A_SOT89-3" H 9078 1172 50  0000 L CNN
F 2 "" H 8900 1450 50  0001 C CNN
F 3 "" H 8900 1450 50  0001 C CNN
	1    8900 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C9
U 1 1 616D9878
P 9500 2100
F 0 "C9" H 9615 2146 50  0000 L CNN
F 1 "C" H 9615 2055 50  0000 L CNN
F 2 "" H 9538 1950 50  0001 C CNN
F 3 "~" H 9500 2100 50  0001 C CNN
	1    9500 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 1850 9500 1850
Wire Wire Line
	9500 1850 9500 1950
$Comp
L Device:C C2
U 1 1 616DA989
P 8800 2800
F 0 "C2" H 8915 2846 50  0000 L CNN
F 1 "C" H 8915 2755 50  0000 L CNN
F 2 "" H 8838 2650 50  0001 C CNN
F 3 "~" H 8800 2800 50  0001 C CNN
	1    8800 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 616DAE6E
P 9150 2800
F 0 "C8" H 9265 2846 50  0000 L CNN
F 1 "C" H 9265 2755 50  0000 L CNN
F 2 "" H 9188 2650 50  0001 C CNN
F 3 "~" H 9150 2800 50  0001 C CNN
	1    9150 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 1850 8900 2200
Wire Wire Line
	8900 2650 8800 2650
Wire Wire Line
	9150 2650 8900 2650
Connection ~ 8900 2650
Wire Wire Line
	9500 2950 9150 2950
Wire Wire Line
	9500 2250 9500 2950
Wire Wire Line
	9150 2950 8800 2950
Connection ~ 9150 2950
Wire Wire Line
	8800 2950 8500 2950
Wire Wire Line
	8500 2950 8500 1850
Wire Wire Line
	8500 1850 8800 1850
Connection ~ 8800 2950
$Comp
L power:+4V #PWR?
U 1 1 616DEBB7
P 9900 1800
F 0 "#PWR?" H 9900 1650 50  0001 C CNN
F 1 "+4V" H 9915 1973 50  0000 C CNN
F 2 "" H 9900 1800 50  0001 C CNN
F 3 "" H 9900 1800 50  0001 C CNN
	1    9900 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 1850 9900 1850
Wire Wire Line
	9900 1850 9900 1800
Connection ~ 9500 1850
Text GLabel 9000 2200 2    50   Input ~ 0
3V3
Wire Wire Line
	9000 2200 8900 2200
Connection ~ 8900 2200
Wire Wire Line
	8900 2200 8900 2650
Text GLabel 8500 1750 1    50   Input ~ 0
3V3
Wire Wire Line
	8500 1750 8500 1850
Connection ~ 8500 1850
$EndSCHEMATC

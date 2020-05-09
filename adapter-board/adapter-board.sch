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
$Comp
L Device:LED D1
U 1 1 5EB73B76
P 2800 1900
F 0 "D1" V 2747 1978 50  0000 L CNN
F 1 "LED" V 2838 1978 50  0000 L CNN
F 2 "" H 2800 1900 50  0001 C CNN
F 3 "~" H 2800 1900 50  0001 C CNN
	1    2800 1900
	0    1    1    0   
$EndComp
$Comp
L Relay_SolidState:TLP222A U1
U 1 1 5EB748A4
P 3350 1750
F 0 "U1" H 3350 2075 50  0000 C CNN
F 1 "AQY212EH" H 3350 1984 50  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm" H 3150 1550 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=17036&prodName=TLP222A" H 3350 1750 50  0001 L CNN
	1    3350 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5EB7810A
P 2200 1950
F 0 "R1" V 1993 1950 50  0000 C CNN
F 1 "1K" V 2084 1950 50  0000 C CNN
F 2 "" V 2130 1950 50  0001 C CNN
F 3 "~" H 2200 1950 50  0001 C CNN
	1    2200 1950
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5EB78BC4
P 2200 2300
F 0 "R2" V 1993 2300 50  0000 C CNN
F 1 "1K" V 2084 2300 50  0000 C CNN
F 2 "" V 2130 2300 50  0001 C CNN
F 3 "~" H 2200 2300 50  0001 C CNN
	1    2200 2300
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J1
U 1 1 5EB7981A
P 1550 1750
F 0 "J1" H 1442 1425 50  0000 C CNN
F 1 "Doorbell" H 1442 1516 50  0000 C CNN
F 2 "" H 1550 1750 50  0001 C CNN
F 3 "~" H 1550 1750 50  0001 C CNN
	1    1550 1750
	-1   0    0    1   
$EndComp
Wire Wire Line
	1750 1650 2800 1650
Wire Wire Line
	3050 1850 3050 2100
Wire Wire Line
	3050 2100 2800 2100
Wire Wire Line
	2800 2050 2800 2100
Wire Wire Line
	2800 1750 2800 1650
Connection ~ 2800 1650
Wire Wire Line
	2800 1650 3050 1650
$Comp
L Connector:Conn_01x02_Female J2
U 1 1 5EB81A45
P 3950 1650
F 0 "J2" H 3978 1626 50  0000 L CNN
F 1 "Interrupt Pins Pi" H 3978 1535 50  0000 L CNN
F 2 "" H 3950 1650 50  0001 C CNN
F 3 "~" H 3950 1650 50  0001 C CNN
	1    3950 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 1650 3750 1650
Wire Wire Line
	3750 1750 3750 1850
Wire Wire Line
	3750 1850 3650 1850
Wire Wire Line
	2000 2300 2050 2300
Wire Wire Line
	2350 1950 2400 1950
Wire Wire Line
	2400 1950 2400 2100
Wire Wire Line
	2400 2100 2800 2100
Connection ~ 2800 2100
Wire Wire Line
	2400 2300 2400 2100
Connection ~ 2400 2100
Wire Wire Line
	2400 2300 2350 2300
Wire Wire Line
	2000 2300 2000 1950
Wire Wire Line
	2000 1750 1750 1750
Wire Wire Line
	2050 1950 2000 1950
Connection ~ 2000 1950
Wire Wire Line
	2000 1950 2000 1750
$EndSCHEMATC
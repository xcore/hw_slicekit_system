Slicekit Testing Procedure
==========================

Starter Kits
------------

+-----+------------------------+-------------------------------------------------------+
| 1   |  Loopback Test         | Loopback Slices                                       |
+-----+------------------------+-------------------------------------------------------+   
| **Setup**                                                                            |
| cd hw_slicekit_system/app_coreboard_test                                             |
| make all                                                                             |
| xrun --io bin/Release/app_coreboard_test.xe                                          |
+--------------------------------------------------------------------------------------+
| **Output**                                                                           |
| Both cores pass loopback test, P8D LEDs flash (x4), reset LED< clk led and pwr       |
| led all lit                                                                          |
+------------------------------+-------------------------------------------------------+
| 2   |  Ethernet Test         | Ethernet Slice in Circle                              |
+-----+------------------------+-------------------------------------------------------+   
| **Setup**                                                                            |
| Remove loopback slices
| Plug ethernet slice to circle slot                                                   |
| Connect Cat5 to laptop
| cd hw_slicekit_system/app_coreboard_ethernet_test                                    |
| make all
| 
+--------------------------------------------------------------------------------------+



slicekit core board serial numbers 33000001 onwards
slicekit core board board ID :
vendor = XMOS 0x00 04 01 20 
board family = 0x08 (slicekit)
board name = XK-SKC-L2 (L2 core board) = 0x0
mjor rev = 0x1
minor rev = 0x1

--serial-number = 1F78A90 (33000001 onwards)
--board-id = 0x00080011
--mac-address = 00:00:00:22:97:00:50:00 
--mac-address = 00:00:00:22:97:00:50:01 
--mac-address = 00:00:00:22:97:00:50:02 
--mac-address = 00:00:00:22:97:00:50:03 

 
e.g. 

xburn --xmos --board-id = 0x00080011 --serialnumber=33000001 --mac-address=00:00:00:22:97:00:50:00 --mac-address=00:00:00:22:97:00:50:01  --mac-address=00:00:00:22:97:00:50:02 --mac-address=00:00:00:22:97:00:50:03 

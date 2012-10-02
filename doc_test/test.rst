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




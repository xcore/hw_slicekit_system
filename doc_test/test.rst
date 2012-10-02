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
+-----+------------------------+-------------------------------------------------------+
| 2   |  Ethernet Test         | Ethernet Slice in Circle                              |
+-----+------------------------+-------------------------------------------------------+   
| **Setup**                                                                            |
| Remove loopback slices
| Plug ethernet slice to circle slot                                                   |
| Connect Cat5 to laptop
| cd hw_slicekit_system/app_coreboard_ethernet_test                                    |
| make all
| xflash  bin/full/app_ethernet_demo_full.xe
| remove xtag2 and power cycle board                                                   |
| on laptop: PING
+--------------------------------------------------------------------------------------+
| **Output**                                                                           |
| Reply from blah blah
+-----+------------------------+-------------------------------------------------------+
| 3   | GPIO Buttons Test
+-----+------------------------+-------------------------------------------------------+   
| **Setup**
| Unplug ethernet slice and plug gpio into Square
| replug xtag2
| cd sw_gpio_examples/app_sk_simple_gpio_demo
| xrun --io bin/Release/app_sk_gpio_simple_demo.xe
+--------------------------------------------------------------------------------------
| **Output**                                                                           |
| Press button 1: Temp is output to console
| press button 2: "button 2 pressed" 
+-----+------------------------+-------------------------------------------------------+
| 4   | GPIO UART Test
+-----+------------------------+-------------------------------------------------------+   
| **Setup**
| cd sw_gpio_examples/app_sk_gpio_com_demo
| open hercules on laptop. Configure even parity, 115200 baud, data size 8
| right click in hercules - disable CR/LF enable
| set transmit EOl to CR (mac)
| click open device
| xrun --io bin/Release/app_sk_gpio_com_demo.xe
+--------------------------------------------------------------------------------------
| **Output**                                                                           |
| Check wlecome message is displayed
| type chars in input window, click send, check chars are echoed back
+-----+------------------------+-------------------------------------------------------+
| 4   | Chain Test             |                                                       |
+-----+------------------------+-------------------------------------------------------+   
+-----+------------------------+-------------------------------------------------------+
| 4   | OTP program            |                                                       |
+-----+------------------------+-------------------------------------------------------+     

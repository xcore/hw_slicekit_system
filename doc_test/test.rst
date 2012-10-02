Slicekit Testing Procedure
==========================

Starter Kits
------------

+-----+------------------------+-------------------------------------------------------+
| 1.1 |  Loopback Test         | Loopback Slices                                       |
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
| 1.2 |  Ethernet Test         | Ethernet Slice in Circle                              |
+-----+------------------------+-------------------------------------------------------+   
| **Setup**                                                                            |
| Remove loopback slices                                                               |
| Plug ethernet slice to circle slot                                                   |
| Connect Cat5 to laptop                                                               |
| cd hw_slicekit_system/app_coreboard_ethernet_test                                    |
| make all                                                                             |
| xflash  bin/full/app_ethernet_demo_full.xe                                           |
| remove xtag2 and power cycle board                                                   |
| on laptop: PING                                                                      |
+--------------------------------------------------------------------------------------+
| **Output**                                                                           |
| Reply from blah blah                                                                 |
+-----+------------------------+-------------------------------------------------------+
| 1.3 | GPIO Buttons Test      |                                                       |
+-----+------------------------+-------------------------------------------------------+   
| **Setup**                                                                            |
| Unplug ethernet slice and plug gpio into Square                                      |
| replug xtag2                                                                         |
| cd sw_gpio_examples/app_sk_simple_gpio_demo                                          |
| xrun --io bin/Release/app_sk_gpio_simple_demo.xe                                     |
+--------------------------------------------------------------------------------------+
| **Output**                                                                           |
| Press button 1: Temp is output to console                                            |
| press button 2: "button 2 pressed"                                                   |
+-----+------------------------+-------------------------------------------------------+
| 1.4 | GPIO UART Test         |                                                       |
+-----+------------------------+-------------------------------------------------------+   
| **Setup**                                                                            |
| cd sw_gpio_examples/app_sk_gpio_com_demo                                             |
| open hercules on laptop. Configure even parity, 115200 baud, data size 8             |
| right click in hercules - disable CR/LF enable                                       |
| set transmit EOl to CR (mac)                                                         |
| click open device                                                                    | 
| xrun --io bin/Release/app_sk_gpio_com_demo.xe                                        |
+--------------------------------------------------------------------------------------+
| **Output**                                                                           |
| Check wlecome message is displayed                                                   |
| type chars in input window, click send, check chars are echoed back                  |
+-----+------------------------+-------------------------------------------------------+
| 2   | Chain Test             |                                                       |
+-----+------------------------+-------------------------------------------------------+
| Take two passin gunits from stage 1 and cross check them against each other          |   
+-----+------------------------+-------------------------------------------------------+
| 3   | OTP program            |                                                       |
+-----+------------------------+-------------------------------------------------------+   
| **Setup**                                                                            |
| Ensure xtag2 is connected.                                                           |
| power cycle board                                                                    |
| xburn --xmos --board-id = 0x00080011 --serialnumber=33000001                         |
| --mac-address=00:00:00:22:97:00:50:00 --mac-address=00:00:00:22:97:00:50:01          |
| --mac-address=00:00:00:22:97:00:50:02 --mac-address=00:00:00:22:97:00:50:03          |                                                                 |  
|                                                                                      |
| serial number should increment by 1 each time (number is decimal)                    |
| last digit of mac address should increment by 1 each time (number is hexadecimal)    |
| * slicekit core board serial numbers 33000001 onwards                                |
| *slicekit core board board ID :                                                      |
| vendor = XMOS 0x00                                                                   |
| board family = 0x08 (slicekit)                                                       |
| board name = XK-SKC-L2 (L2 core board) = 0x0                                         |
| major rev = 0x1                                                                      |
| minor rev = 0x1                                                                      |
+--------------------------------------------------------------------------------------+
| **Output**                                                                           |
| Check wlecome message is displayed                                                   |
+--------------------------------------------------------------------------------------+



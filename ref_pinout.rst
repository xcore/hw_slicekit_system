
Slicekit System Pins
++++++++++++++++++++

These system functions are common between all slices regardless of type, acces to this functionality varies depending on which slot is employed.

=================== ========  ======== ======== ======== ======================================
Function            STAR      TRIANGLE SQUARE   CIRCLE   Description
=================== ========  ======== ======== ======== ======================================
DEBUG               NC        NC       B1       NC       DEBUG pin from XTAG 
TCK                 NC        NC       B2       NC       JTAG clock from XTAG
TMS                 NC        NC       A3       NC       JTAG test mode select from XTAG
TDO                 NC        NC       A4       NC       JTAG chain from XTAG
TDI                 NC        NC       B4       NC       JTAG chain from XTAG
MSEL                NC        NC       A1       NC       Boot Mode Select from XTAG
RST_N               A16       A16      A16      A16      System Reset supplied from Core Board
CLK                 B14       B14      B14      B14      20 MHz clock Supplied from Core Board
5V                  A2        A2       A2       A2       5 Volts supplied from Core Board
3V3                 B5        B5       B5       B5       3 Volts supplied from Core Board 
GND                 B3        B3       B3       B3       Ground supplied from Core Board 
GND                 A5        A5       A5       A5       Ground supplied from Core Board  
GND                 B8        B8       B8       B8       Ground supplied from Core Board  
GND                 A10       A10      A10      A10      Ground supplied from Core Board  
GND                 B16       B16      B16      B16      Ground supplied from Core Board  
GND                 A14       A14      A14      A14      Ground supplied from Core Board 
=================== ========  ======== ======== ======== ======================================

Generic Slice Pinout Options
++++++++++++++++++++++++++++

This table shows the port mapping for each of the Slice Card Signal IO, and the Slicekit Slot connector pin it is located on.

=================== ========= ======== ======== ======== ====== ===============================
Function            STAR      TRIANGLE SQUARE   CIRCLE   PIN    Description
=================== ========= ======== ======== ======== ====== ===============================
1 bit               NC        1A       NC       1A       B2     
1 bit               NC        1D       NC       1D       B4     
1 bit               NC        1E       NC       1E       A3     
1 bit               NC        1H       NC       1H       A4     
1 bit               1C        1K       1C       1K       B10     
1 bit               1B        1J       1B       1J       A8     
1 bit               1G        1I       1G       1I       B15     
1 bit               1F        1L       1F       1L       A15    
------------------- --------- -------- -------- -------- ------
8 bit               8A0       8C0      8A0      8C0      B6       
8 bit               8A1       8C1      8A1      8C1      B7
8 bit               8A2       8C2      8A2      8C2      B9
8 bit               8A3       8C3      8A3      8C3      B11
8 bit               8A4       8C4      8A4      8C4      A9
8 bit               8A5       8C5      8A5      8C5      A11
8 bit               8A6       8C6      8A6      8C6      A6
8 bit               8A7       8C7      8A7      8C7      A7
4 bit               4A0       4E0      4A0      4E0      B6       
4 bit               4A1       4E1      4A1      4E1      B7
4 bit               4B0       4F0      4B0      4F0      B9
4 bit               4B1       4F1      4B1      4F1      B11
4 bit               4B2       4F2      4B2      4F2      A9
4 bit               4B3       4F3      4B3      4F3      A11
4 bit               4A2       4E2      4A2      4E2      A6
4 bit               4A3       4E3      4A3      4E3      A7
------------------- --------- -------- -------- -------- ------
8 bit               8B0       8D0      8B0               B12       
8 bit               8B1       8D1      8B1               B13
8 bit               8B2       8D2      8B2               B17
8 bit               8B3       8D3      8B3               B18
8 bit               8B4       8D4      8B4               A17
8 bit               8B5       8D5      8B5               A18
8 bit               8B6       8D6      8B6               A12
8 bit               8B7       8D7      8B7               A13
4 bit               4C0                4C0               B12       
4 bit               4C1                4C1               B13
4 bit               4D0                4D0               B17
4 bit               4D1                4D1               B18
4 bit               4D2                4D2               A17
4 bit               4D3                4D3               A18
4 bit               4C2                4C2               A12
4 bit               4C3                4C3               A13
1 bit                         1M                1M       B12 
1 bit                         1N                1N       B13
1 bit                         1O                1O       B17
1 bit                         1P                1P       B18
------------------- --------- -------- -------- -------- ------
16 bit              16A0      16B0     16A0              B6       
16 bit              16A1      16B1     16A1              B7
16 bit              16A2      16B2     16A2              B9
16 bit              16A3      16B3     16A3              B11
16 bit              16A4      16B4     16A4              A9
16 bit              16A5      16B5     16A5              A11
16 bit              16A6      16B6     16A6              A6
16 bit              16A7      16B7     16A7              A7
16 bit              16A8      16B8     16A8              B12       
16 bit              16A9      16B9     16A9              B13
16 bit              16A10     16B10    16A10             B17
16 bit              16A11     16B11    16A11             B18
16 bit              16A12     16B12    16A12             A17
16 bit              16A13     16B13    16A13             A18
16 bit              16A14     16B14    16A14             A12
16 bit              16A15     16B15    16A15             A13
=================== ========= ======== ======== ======== ====== ===============================


   

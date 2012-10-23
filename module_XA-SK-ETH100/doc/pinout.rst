
XA-SK-GPIO Functional Pins
++++++++++++++++++++++++++

This table shows the port mapping for each of the Slice Card Signal IO, and the Slicekit Slot connector pin it is located on.

Note that when in the CIRCLE slot, it will not be possible to access the phy via teh SMI interface.

=================== ========= ======== ======== ======== ====== ===============================
Function            STAR      TRIANGLE SQUARE   CIRCLE   PIN    Description
=================== ========= ======== ======== ======== ====== ===============================
RX_DV               1C        1K       1C       1K       B10    Phy RX Data Valid
RX_CLK              1B        1J       1B       1J       A8     Phy RX CLK (input to XMOS)
TX_CLK              1G        1I       1G       1I       B15    Phy TX CLK (output from XMOS)
TX_EN               1F        1L       1F       1L       A15    TX Data Enable 
RXD0                8A0       8C0      8A0      8C0      B6     Phy RX Data  
RXD1                8A1       8C1      8A1      8C1      B7     Phy RX Data
TXD0                8A2       8C2      8A2      8C2      B9     Phy TX Data
TXD1                8A3       8C3      8A3      8C3      B11    Phy TX Data
TXD2                8A4       8C4      8A4      8C4      A9     Phy TX Data
TXD3                8A5       8C5      8A5      8C5      A11    Phy TX Data
RXD2                8A6       8C6      8A6      8C6      A6     Phy RX Data
RXD3                8A7       8C7      8A7      8C7      A7     Phy RX Data
MDIO                8B0       8D0      8B0               B12    MDIO not available in CIRCLE   
MDC                 8B1       8D1      8B1               B13    MDIO not available in CIRCLE 
INT_N               8B2       8D2      8B2               B17    MDIO not available in CIRCLE 
RXERR               8B3       8D3      8B3               B18    RXERR not used in software
=================== ========= ======== ======== ======== ====== ===============================

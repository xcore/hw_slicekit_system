Slice Card Overview
===================

Pack Contents
-------------

   * One XA-SK-UART-8 Slice Card
   * One RS232 parallel cable with DB9 connector

.. image:: images/serial320.png
    
RS232 Capability
----------------

8 Uarts are provided on two 8-bit ports. An RS232 signalling level optn is provided by four SP3222EB RS232 transceivers, each handling 4 tx or 4 rx lines. The EN_N enable pins of the transceivers are controlled by populating a jumper between pins 25 and 26 of header J3. If that jumper is populated then RS232 is disabled and TTL inputs/outputs for all uarts can be accessed via J3, otherwise RS232 inputs/outputs for all uarts can be accessed via J4. 

Fixed Oscillator 
-----------------

A 1.8432 MHZ oscillator provides a fixed master reference frequency which is input into the XCore on a 1-bit port to allow the sc_multi_uart transmitter module software to obtain precise timing against standard UART baud rates. 

DB9 Connector
-------------

Uart channel 0 (RX and TX) can be accessed either via pins 1 and 2 of J3 or J4, or via the DB9 connector. In the latter case, RS232 mode needs to be enabled as above.





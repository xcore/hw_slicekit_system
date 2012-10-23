Slice Card Overview
===================

Pack Contents
-------------

   * One XA-SK-SDRAM Slice Card

Random Access Memory
--------------------

This slice provides 8 Megebytes of random access memory via an ISSI 6400 Synchronous DRAM. It is suitable for burst access only, random access is possible but performance will be very significantly degraded. The associated SDRAM Controll xSOFTip component can operate this memory at clock speeds up to 40 MHz, yielding an aggregate performance of 80 MBytes/sec.

Reduced Pinout
--------------

The SDRAM slice uses a technique of reusing the same XCore GPIO pins for both Address and Data. This optimisation is made possible tahnks to the soft nature of the associated xSOFTip sdram controller component. In addition, a NOR gate on the slice generates the data strobes (UDQM and LDQM on the memory chip) from CAS# and WE#. These features are described more fully in the SDRAM Controller xSOFTip component documentation.

Taken together, these features permit the addition of a high performance SDRAM subsystem to any XCore application using only 20 pins.


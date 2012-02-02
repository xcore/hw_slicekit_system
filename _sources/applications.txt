Applications
============

Single-slot slices may be compatible with only slot 0, or with slots 0 and 1, with the latter type being the most flexible.

A range of slice card pinouts has been investigated and they break down as follows:

Single Slot Slices
------------------

================== =========== ======
Slice              compatible  Form
================== =========== ======
Full Speed USB     0 or 1      A
10/100 Ethernet    0 or 1      A
Bluetooth          0 or 1      A
Zigbee             0 or 1      A
Wifi               0 or 1      A
CANbus             0 or 1      A
Image Sensor       1 only      B
Basic Audio        0 or 1      B
Transport Stream   0 or 1      A
Octo uart          1 only      B
Ethercat HIF       1 only      A
Flexray            0 or 1      B
================== =========== ======

Double Slot slices
------------------

================== ======
Slice              Form
================== ======
High Speed USB     D
Dual Port Ethernet E
SDRAM              D
LCD connector      D
Dual Axis PMSM     E
================== ======

Example Apps
------------

=============================== ========== =======================================================
App                             Core Board Slices
=============================== ========== =======================================================
L1 AVB Audio Endpoint           L1         Basic Audio, Ethernet
L1 AVB Video Endpoint           L1         Transport Stream, Ethernet
L1 Automotive Ethernet Endpoint L1         Basic Audio, Broadreach Ethernet
Ethernet-Serial Bridging        L1         OctoUart, Ethernet
AVB-flexray bridge              L1         Broadreach Ethernet, Flexray
Dual Port AVB AV Endpoint       L2         Dual Port Ethernet, Basic Audio, Transport Stream
EtherCat Motor Controller       L2         Dual Port Ethernet, Dual Axis Motor Control 
EtherCat Slave                  L2         Dual Port Ethernet, Ethercat Host Interface
=============================== ========== =======================================================

Other Documents
===============

Refer to the detailed Slicekit Hardware Specificiation documentation for design details and full connector pinouts. Design files and information sufficient for independant development of compatible slicecards is planned for the very near future.

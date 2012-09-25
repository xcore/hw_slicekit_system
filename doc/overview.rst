Slicekit Overview
=================

Introduction
------------

This document covers the hardware design of the Slicekit Modular Development System, consisting of the Core Board, Slice Cards and XTAG adaptor.

The Core Board contains a fully pinned out 16-core xCore Processor, with its GPIOs connected to four expansion connectors (termed ``Slots``) to interface with expansion cards called Slice Cards which plug into the slots. The Core Board also contains all circuitry necessary for operating and debugging the XMOS system. Multiple Slicekit Core Boards can be interconnected to form a multi XMOS device system with dual 5-bit XMOS Links being present between the boards.

Slicekit system layout
----------------------

.. image:: images/slicekitlayout.svg

The diagram above shows an overview of the layout of the core board with slice boards attached. Each of the four slots has a specific label - ``Star``, ``Triange``, ``Square`` and ``Circle``, printed on the Core Board silkscreen.  ``Triangle`` and ``Circle`` Slice Cards contain 24 XCore IOs and ``Star`` and ``Square`` Slice Cards 20 XCore IOs (usable as GPIO or two 5-wire XMOS links). The label denotes which Slice Cards are compatible with which Core Board Slots. The Slice Cards are also marked with one or more of these labels to identify the slot type(s) they function correctly with.

The final type of connector is on the bottom left of the Core Board and is marked with a hollow square symbol with an X through it. This is for connecting multiple Core Boards together to form systems of 32 logical cores or more. It is termed the ``chain`` slot.

All Slots are 36 pin PCI express style connectors in either socket or edge finger (plug) types.

Star and Triange Slots are pinned out from Tile 0 of the L2 xCore and the Circle and Square Slots from Tile 1.






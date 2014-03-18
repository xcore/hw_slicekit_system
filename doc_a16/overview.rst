A16 sliceKIT Overview
=====================

Introduction
------------

This document covers the hardware design of the sliceKIT Modular Development System, consisting of the A16 Core Board, Slice Cards and XSYS adaptor.

The Core Board contains a fully pinned out 16-core xCore Processor, with its GPIOs connected to four expansion connectors (termed ``Slots``) to interface with expansion cards called Slice Cards which plug into the slots. The Core Board also contains all circuitry necessary for operating and debugging the XMOS system. Multiple sliceKIT Core Boards can be interconnected to form a multi XMOS device system with dual 5-bit XMOS Links being present between the boards.

|newpage|

sliceKIT system layout
----------------------

.. only:: latex

   .. figure:: images/slicekitlayout.pdf
      :width: 100%
      :align: center
   
      sliceKIT Layout
	  
.. only:: html
   
   .. figure:: images/slicekitlayout.svg
      :width: 600
         
      sliceKIT Layout
   
The diagram above shows an overview of the layout of the core board with slice boards attached. Each of the four slots has a specific label - ``Star``, ``Triangle``, ``Square`` and ``Circle``, printed on the Core Board silkscreen.  ``Triangle`` and ``Circle`` Slice Cards contain 24 XCore IOs and ``Star`` and ``Square`` Slice Cards 20 xCore IOs (usable as GPIO or two 5-wire XMOS links). The label denotes which Slice Cards are compatible with which Core Board Slots. The Slice Cards are also marked with one or more of these labels to identify the slot type(s) they function correctly with.

In addition to the four standard Slice Card slots there is a mixed signal slot, labelled ``A``, this slot has access to the 8 ADC channels available on the A16 device, along with 4 xCore I/Os and the wake pin. The xCore I/Os available on the mixed signal slot overlap with the ``Star`` slot, meaning that if the mixed signal I/Os are used then a Slice Card used in the ``Star`` slot may not function.

The final type of connector is on the bottom left of the Core Board and is marked with a hollow square symbol with an X through it. This is for connecting multiple Core Boards together to form systems of 32 logical cores or more. It is termed the ``chain`` slot.

All Slots are 36 pin PCI express style connectors in either socket or edge finger (plug) types.

``Star``, ``Triangle`` and ``A`` Slots are pinned out from Tile 0 of the L2 xCore and the Circle and Square Slots from Tile 1.


xCORE-Analog sliceKIT Overview
===============================

Introduction
------------

This document covers the hardware design of the sliceKIT Modular Development System, consisting of the xCORE-Analog Core Board, sliceCARDs and XSYS adaptor.

The Core Board contains a fully pinned out 16-core xCORE Processor, with its GPIOs connected to four expansion connectors (termed ``Slots``) to interface with expansion cards called sliceCARDs which plug into the slots. The Core Board also contains all circuitry necessary for operating and debugging the XMOS system. Multiple sliceKIT Core Boards can be interconnected to form a multi XMOS device system with dual 5-bit xCONNECT Links being present between the boards.

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
   
The diagram above shows an overview of the layout of the core board with slice boards attached. Each of the four slots has a specific label - ``Star``, ``Triangle``, ``Square`` and ``Circle``, printed on the Core Board silkscreen.  ``Triangle`` and ``Circle`` sliceCARDs contain 24 xCORE I/Os and ``Star`` and ``Square`` sliceCARDs 20 xCORE I/Os (usable as GPIO or two 5-wire XMOS links). The label denotes which sliceCARDs are compatible with which Core Board Slots. The sliceCARDs are also marked with one or more of these labels to identify the slot type(s) they function correctly with.

In addition to the four standard sliceCARD slots there is a ``Mixed Signal`` slot, labelled A, this slot has access to the 8 ADC channels available on the XS1-A16 device, along with 4 xCORE I/Os and the wake pin. The xCORE I/Os available on the ``Mixed Signal`` slot overlap with the ``Star`` slot, meaning that if the ``Mixed Signal`` I/Os are used then a sliceCARD used in the ``Star`` slot may not function.

The final type of connector is on the bottom left of the Core Board and is marked with a hollow square symbol with an X through it. This is for connecting multiple Core Boards together to form systems of 32 logical cores or more. It is termed the ``chain`` slot.

All Slots are 36 pin PCI express style connectors in either socket or edge finger (plug) types.

``Star``, ``Triangle`` and ``Mixed Signal`` Slots are pinned out from Tile 0 of the XS1-A16 device and the ``Circle`` and ``Square`` Slots from Tile 1.


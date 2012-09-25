Slicekit Overview
=================

Introduction
------------

This document specifies the hardware design of the Slicekit Core Board and Slice Cards.

The Slicekit Core Board contains a fully pinned out XMOS L2, 16 core, xCore Processor, connected to expansion connectors (Slots) to interface with Slice Cards.
The Slicekit Core Board contains all circuitry necessary for operating and debugging the XMOS system with the interface to the outside world being made via the Slice Cards.

Multiple Slicekit Core Boards can be interconnected to form a multi XMOS device system with dual 5-bit XMOS Links being present between the boards.
A Slicekit Core Board at the start of a chain (no connected board on the Chain Connector) is a Master board. Core boards connected through the Chain Connector are slave boards.

Four types of Slice Cards are supported - Star, Triange, Square and Circle. Triange and Circle Slice Cards contain 24 XCore IOs and Star and Square Slice Cards 20 XCore IOs.

Slice Cards are marked with one or more symbols to identify the slot type(s) they function correctly with.

Slicekit system layout
----------------------

The diagram below shows an overview of the layout of the core board with slice boards attached.

.. image:: images/slicekitlayout.svg

Each Slot is identified by a symbol on the silkscreen of the board, the Star and Triange Slots are pinned out to Tile 0 and the Circle and Square Slots to Tile 1.

All Slots are 36 pin PCI express style connectors in either socket or edge finger (plug) types.
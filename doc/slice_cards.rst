Slice Cards and Slots
=====================

Slicekit Slice Cards are used to implement peripheral circuitry as part of the Slicekit platform.


Existing Slice Cards may connect to some or all of the ``Star``, ``Triangle``, ``Square`` and ``Circle`` slots. Their compatibility with each slot is indicated by the range of symbols printed on the Slice Card silkscreen. A Card havnig all four symbols is compatible with all slots, a subset of symbols indicates that some slots don't have sufficient IO or suitable IO resources to work with that Card.

``Star`` and ``Square`` Slice Cards have 20 xCore Processor IOs including four 1-bit ports.

``Triangle`` Slice Cards have 24 xCore Processor IOs including twelve 1-bit ports.

``Circle`` Slice Cards have 20 xCore Processor IOs including twelve 1-bit ports.

A Double Slice Card is a board with two Slice Card finger connectors and connects to all of the IO on one Tile (e.g. to ``Star`` + ``Triangle`` or to ``Circle``  + ``Square``.

.. warning:: Note that Slice Cards compatible with a given slot may still have restrictions when used in that slot (typically less common or popular functionality may be disabled), so be sure to check the Slice Card documents for details.


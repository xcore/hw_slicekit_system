sliceCARDs and Slots
=====================

sliceKIT sliceCARDs are used to implement peripheral circuitry as part of the sliceKIT platform.

Existing sliceCARDs may connect to some or all of the ``Star``, ``Triangle``, ``Square`` and ``Circle`` slots. Their compatibility with each slot is indicated by the range of symbols printed on the sliceCARD silkscreen. A Card having all four symbols is compatible with all slots, a subset of symbols indicates that some slots don't have sufficient I/O or suitable I/O resources to work with that Card.

``Star`` and ``Square`` sliceCARDs have 20 xCORE Processor I/Os including four 1-bit ports.

``Triangle`` and ``Circle`` sliceCARDs have 24 xCORE Processor I/Os including twelve 1-bit ports.

A Double sliceCARD is a board with two sliceCARD finger connectors and connects to all of the I/O on one Tile (e.g. to ``Star`` + ``Triangle`` or to ``Circle``  + ``Square``).

.. warning:: Note that sliceCARDs compatible with a given slot may still have restrictions when used in that slot (typically less common or popular functionality may be disabled), so be sure to check the sliceCARD documents for details).


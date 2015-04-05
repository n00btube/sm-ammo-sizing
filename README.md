# Ammo Sizing

Per-item sizes for ammo pickups in Super Metroid (Missiles, Super Missiles, Power Bombs)

# Description

The original game uses a PLM argument as the value for ammo expansions.
Meaning, the pickup sizes are based on whether the item is
in the open, in a Chozo ball, or hidden in the scenery.

This patch lets the ‘high’ byte in SMILE set the ammo count granted by the
pickup, per-pickup.  (Only bits 0-6, bit 7 is still normal/returning.)
So any individual pickup may carry from 1-127 units.
0 uses the default value from the PLM argument,
so your pickups still “do stuff” even if you haven’t set a specific count.

Uses some free space in bank $84 (PLMs).
Would limit the max item index to $FF, except that the game’s limit is $AF.

# Credits

* Kejardon - PLM documentation
* pjboy - ongoing ROM disassembly
* Scyzer - updated RAM map that I use all the time
* [MetConst](http://metroidconstruction.com) - bringing us all together

# Author

Adamf.

# License

MIT.

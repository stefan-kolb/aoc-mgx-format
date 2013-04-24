Aktion: Build
----------------------------------------------

Aufbau:
----------------------------------------------
Länge (Bytes): var Bytes
----------------------------------------------
66          -> typ
03          -> vills
01 00       -> player 
00 00 62 42 -> x
00 00 CC 41 -> y
65 00 00 00 -> objid
FF FF FF FF -> const?
00 00 00 00 -> ??? nicht immer null!
3E 08 00 00 -> vill id
42 08 00 00 -> vill id
25 08 00 00 -> vill id
----------------------------------------------
66 	    -> cmd typ
01          -> anzahl vills
02 00       -> player id /gebäude typ???
00 00 81 42 -> x
00 00 B3 42 -> y
57 00 00 00 -> object typ
FF FF FF FF -> const?
00 00 00 00 -> ???
46 08 00 00 -> vill id
00 46 A0 5B -> ? vill x?
7E 48 F5 03 -> ? vill y? 3 mehr bei anderem player scheinbar
00 08 00 00 -> ?
-----------------------------------------------

66 01 01 00 00 00 88 42 00 00 E0 40 32 02 00 00 FF FF FF FF 00 00 00 00 29 08 00 00

66 01 02 00 00 00 78 42 00 00 E2 42 32 02 00 00 FF FF FF FF 00 00 00 00 2A 08 00 00 00 66 87 56 41 77 EF 03 00 00 00 00

Achtung andere Build Struktur bei anderen Playern!!!!!
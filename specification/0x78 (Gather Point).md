Aktion: Gather
----------------------------------------------

Aufbau:
----------------------------------------------
Länge (Bytes): var Bytes
----------------------------------------------
78          -> cmd typ
01          -> anzahl selected
00 00       -> zero short
02 00 00 00 -> setze auf id
52 02 00 00 -> typ der id?
00 00 8B 42 -> x
00 00 8B 42 -> y
03 00 00 00 -> ausgewähltes gebäude
xx xx xx xx -> ""
----------------------------------------------
78          -> cmd typ
02          -> anzahl selected
00 00       -> zero short
FF FF FF FF -> const
FF FF 00 00 -> ???
AB FA 81 42 -> x
55 A5 89 42 -> y
03 00 00 00 -> id selected?!
01 00 00 00 -> id
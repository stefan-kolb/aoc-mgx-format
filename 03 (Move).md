Move
====

int8 => command
int8 => player_id
int16 => unknown
int32 => -1
int32 => units_selected_count
float => x_coordinate
float => y_coordinate
array[int32] => unit_ids_selected; length => units_selected_count; only_if => units_selected_count != 255

Aufbau:
----------------------------------------------
L�nge (Bytes): var Bytes
----------------------------------------------
03 	    -> cmd typ
01 00 00    -> player id
FF FF FF FF -> const
01 00 00 00 -> anzahl selected
AB CA 33 42 -> x
AB EA 98 41 -> y
66 07 00 00 -> selected
xx xx xx xx -> ids
----------------------------------------------
03          -> typ
01 00 00    -> player id
FF FF FF FF -> const
FF 00 00 00 -> selected = 0xFF = same as before
AB 1A A1 42 -> x
00 F0 84 42 -> y
----------------------------------------------

Player 2:
----------------------------------------------
03 
02 00 00 
FF FF FF FF 
01 00 00 00 
AB AA AA 40 
AB AA A6 40 
01 00 00 00 

00 00 00 00 
98 20 23 06 
76 2D 1B 00

03 
02 00 00 
FF FF FF FF 
FF 00 00 00 
00 00 C0 3E 
AB AA 0A 3F
 
00 01 00 00   Sync Info oderso?
00 00 00 00 
6F FA 02 E6

Aktion: Attack
----------------------------------------------

Aufbau:
----------------------------------------------
Länge (Bytes): var Bytes
----------------------------------------------
00          -> cmd typ  
01 00 00    -> player id  
D2 07 00 00 -> attacked  
01 00 00 00 -> anzahl selected units (0xFF falls selbe gruppe)  
00 00 5A 42 -> x  
00 00 F0 40 -> y  
62 07 00 00 -> attacker  
----------------------------------------------
00  
01 00 00   
D2 07 00 00   
FF 00 00 00 -> selbe gruppe  
00 00 5A 42 -> x  
00 00 F0 40 -> y  
----------------------------------------------
Bei anderen playern wieder 3 Bytes länger??? y!!

Attack auch gegen Bäume?! Alles wo man was anklickt!(Eat,Repair,bekehren,etc)
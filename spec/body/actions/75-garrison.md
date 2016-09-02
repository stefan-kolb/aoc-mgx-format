Aktion: Einquartieren
----------------------------------------------

75          -> cmd typ
03 00 00    -> Anzahl units
04 00 00 00 -> gebäude id
05 00 00 00 -> ??? wegen ausquartieren später speicher???
00 00 80 BF -> x-geb?
00 00 80 BF -> y-geb?
FF FF FF FF -> const
03 00 00 00 -> unit ids
02 00 00 00 -> ""
01 00 00 00 -> ""
----------------------------------------------
kein selbe gruppe?

05 00 00 00 
00 00 80 BF 
00 00 80 BF

05 00 00 00 
00 00 80 BF 
00 00 80 BF
 
05 00 00 00 
00 00 80 BF 
00 00 80 BF 


Tribock packen = einquartieren???!!!
75 
01 00 00 
FF FF FF FF 
01 00 00 00 
00 00 00 00 
00 00 00 00 
FF FF FF FF 
03 00 00 00

entpacken
75 
01 00 00 
FF FF FF FF 
02 00 00 00 
00 00 80 BF 
00 00 80 BF 
FF FF FF FF 
03 00 00 00
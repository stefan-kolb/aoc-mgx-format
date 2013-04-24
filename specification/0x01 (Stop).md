Aufbau:
----------------------------------------------
01          -> cmd typ
0F          -> anzahl selected
09 00 00 00 -> unit ids
0D 00 00 00 
0C 00 00 00 
08 00 00 00 
0A 00 00 00 
0B 00 00 00 
0E 00 00 00 
05 00 00 00 
06 00 00 00 
07 00 00 00 
00 00 00 00 
04 00 00 00 
01 00 00 00 
02 00 00 00 
03 00 00 00 
2F 3E 00 00 -> end const
----------------------------------------------
Fehler: (3 mehr am Ende) gegner!
----------------------------------------------
01 
07 
36 0A 00 00 
D0 08 00 00 
F2 08 00 00 
64 09 00 00 
28 09 00 00 
8E 09 00 00 
38 0A 00 00 
00 00 64 09 
00 00 28 09 
00 00 8E 09
-----------------------------------------------

Stop Struktur auch für tech abbruch!!! zB feud click

01          -> player id
01          -> anzahl selected
73 06 00 00 -> gebäude id

# Stop

Description  
Stop Struktur auch für tech abbruch!!! zB feud click?! unit abbruch?

## Definition

```ruby
def Resign
	int8 :command 
	int8 :selected_count
	int8 :player_number
	int8 :zero
end
```

## Description

*:command*  
The command identifier for the action attack will always be `0x0B`.

*:player_id*  
The *player_id* may range from `0x01` - `0x08`.

*:player_number*  
The *player_number* may range from `0x00` - `0x08`.
It may be different from *player_id* when someone is cooping another player. For example, one player is cooping in a 1v1. There will be the *player_id*s `0x01` and `0x02`, still the *player_number*s will reach from `0x01` - `0x03`.

> Player 1 = { player_id: 0x01, player_number: 0x01 }  
> Player 2 = { player_id: 0x02, player_number: 0x02 }  
> Player 3 = { player_id: 0x02, player_number: 0x03 }  

*:zero*  
The byte following the *:player_nr* should always be unused `0x00`.

## Examples

Standard

>`0B` &mdash; command  
>`01` &mdash; player id  
>`01` &mdash; player_number  
>`00` &mdash; zero

Cooperation

>`0B` &mdash; command  
>`01` &mdash; player id  
>`03` &mdash; player_number  
>`00` &mdash; zero 
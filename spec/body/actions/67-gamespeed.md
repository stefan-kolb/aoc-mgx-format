# Gamespeed

Aktion: Change Options? Gamespeed? Kommt oft vor auch wenn man nix macht
gamespeed auch cheats?!
evtl auch beim trade resourcen!

## Definition

```ruby
def Resign
	int8 :command 
	int8 :player_id
	float :gamespeed
	int8 :unknown
end
```

int	unknown2	4	
float	gamespeed	4	1.0=slow, 1.5 normal, 2.0 fast
int	zero	4	
int	unknown3	4	

## Description

*:command*  
The command identifier for the action will always be `0x67`.

*:gamespeed*  
The current speed of the game, either `1.0 (slow), 1.5 (normal), 2.0 (fast)`

*:player_number*  
The *player_number* may range from `0x00` - `0x08`.
It may be different from *player_id* when someone is cooping another player. For example, one player is cooping in a 1v1. 
There will be the *player_ids* `0x01` and `0x02`, still the *player_numbers* will reach from `0x01` - `0x03`.
This value should be equivalent to the player color ids.

> Player 1 = { player_id: `0x01`, player_number: `0x01` }  
> Player 2 = { player_id: `0x02`, player_number: `0x02` }  
> Player 3 = { player_id: `0x02`, player_number: `0x03` }  

*:unknown*  
The byte following the *:player_number* should always be `0x00` or `0x01`.

## Examples

>`67` &mdash; command  
>`01` &mdash; player id  
>`01` &mdash; player_number  
>`00` &mdash; zero

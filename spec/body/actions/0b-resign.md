# Resign

This structure will be present if a player resigns from the game.
Resign can happen multiple times for the same player. This only happens when *:disconnect* is 0x01.

## Definition

```ruby
def Resign
  int8 :command 
  int8 :player_id
  int8 :player_number
  int8 :disconnect
end
```

## Description

*:command*  
The command identifier for the action will always be `0x0B`.

*:player_id*  
The *player_id* may range from `0x01` - `0x08`.

*:player_number*  
The *player_number* may range from `0x00` - `0x08`.
It may be different from *player_id* when someone is cooping another player. For example, one player is cooping in a 1v1. 
There will be the *player_ids* `0x01` and `0x02`, still the *player_numbers* will reach from `0x01` - `0x03`.
This value should be equivalent to the player color ids.

> Player 1 = { player_id: `0x01`, player_number: `0x01` }  
> Player 2 = { player_id: `0x02`, player_number: `0x02` }  
> Player 3 = { player_id: `0x02`, player_number: `0x03` }  

*:disconnect*  
This value is `0x01` if a player has been disconnected.

## Examples

>`0B` &mdash; command  
>`01` &mdash; player id  
>`01` &mdash; player_number  
>`00` &mdash; disconnect  

# Resign

This structure will be present if a player resigns from the game.
Resign can happen multiple times for the same player. This only happens when *:disconnect* is 0x01.

## Definition

```ruby
def Resign
  int8 :action_identifier
  int8 :player_number
  int8 :player_id
  int32 :disconnect
end
```

### Description

*:action_identifier*  
Always has the value `0x0b`.

*:player_number*  
The player's number which can be changed in the lobby. Is only different from *:player_id* if playing in coop mode.

*:player_id*  
The ID of the player.

*:disconnect*  
Determines whether the player gave up himself (`0x00`) or was disconnected (`0x01`).

### Examples

`0b 02 03 00`

>`0b` &mdash; action_identifier  
>`02` &mdash; player_number  
>`03` &mdash; player_id  
>`00` &mdash; disconnect

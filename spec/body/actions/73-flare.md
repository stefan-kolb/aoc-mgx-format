# Flare

Used for launching a flare.

## Definition

```ruby
def Flare
  int8 :action_identifier
  byte24 :zero
  int32 :const
  int8 :zero2
  array :receiving,
        type => :int8,
        initial_length => 8
  byte24 :zero3
  float :x_coord
  float :y_coord
  int8 :player_number
  int8 :player_id
  int16 :zero4
end
```

## Description

*:action_identifier*  
Always has the value `0x0b`.

*:zero*  
The 3 bytes after *:action_identifier* are always zero.

*:const*  
These 4 bytes are always `0xFFFFFFFF`.

*:zero2*  
The one byte after *:player_id* is always zero. Could also represent "Gaia" in *:receiving* or be a counter of some sorts that is never used.

*:receiving*  
Every byte in this array represents a player number (first byte: player 1, second byte: player 2, ...). If the value of byte X is `0x01`, player X will see the flare. If the value of byte X is `0x00`, player X won't see the flare.

*:zero3*  
The 3 bytes after *:receiving* are always zero.

*:x_coord*  
The x-coordinate of the targeted position.

*:y_coord*  
The y-coordinate of the targeted position.

*:player_number*  
The player's number which can be changed in the lobby. Is only different from *:player_id* if playing in coop mode.

*:player_id*  
The ID of the player.

*:zero4*  
The 3 bytes after *:player_id* are always zero.

## Examples

`73 00 00 00 ff ff ff ff 00 01 01 01 00 00 00 00 00 00 00 00 00 00 c7 42 00 80 33 43 03 04 00 00`

>`73` &mdash; action_identifier  
>`00 00 00` &mdash; zero  
>`ff ff ff ff` &mdash; const  
>`00` &mdash; zero2  
>`01` &mdash; receiving_p1  
>`01` &mdash; receiving_p2  
>`01` &mdash; receiving_p3  
>`00` &mdash; receiving_p4  
>`00` &mdash; receiving_p5  
>`00` &mdash; receiving_p6  
>`00` &mdash; receiving_p7  
>`00` &mdash; receiving_p8  
>`00 00 00` &mdash; zero3  
>`00 00 c7 42` &mdash; x_coord  
>`00 80 33 43` &mdash; y_coord  
>`03` &mdash; player_number  
>`04` &mdash; player_id  
>`00` &mdash; disconnect

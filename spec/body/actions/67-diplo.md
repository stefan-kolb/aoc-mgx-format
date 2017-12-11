# Multi-Purpose

Used for diplomacy, cheating and changing the game's speed.

## Definition

```ruby
def Diplomacy
  int8 :action_identifier
  int8 :action_type
  int8 :source_player_number
  int8 :zero
  int8 :option
  byte24 :zero2
  float :option2
  int8 :diplomatic_stance
  byte24 :zero3
end
```

## Description

*:action_identifier*  
Always has the value `0x67`.

*:action_type*  
Represents the specific action that was taken (diplomatic, changing speed or cheating).

Hex Value | Action
----------|-------
0x00      | Diplomacy
0x01      | Change Game Speed
0x04      | Cheat Response (if cheat is activated for all players; only "aegis")
0x05      | Allied Victory
0x06      | Cheat
0x0a      | Research Treason (only Regicide)
0x0b      | AI policy

*:source_player_number*  
The player number of the player who has executed the action. In Cheat Responses, the value is `0x01` when "aegis" was turned on and `0x00` when it is turned off.

*:zero*  
The byte after *:source_player_number* is always zero.

*:option*  
Only used for diplomacy and cheats. Stays at `0x00` for game speed. The purpose of the option depends on the action. For diplomacy, this value represents the player number of the player who is targeted by the diplomatic action (which can be the same player number as *:source_player_number* when selecting "Allied Victory"). When changing the game speed, this value is always `0x00`. If the action is a cheat (`0x06`), then this field has the value of the `CheatID`, while for a cheat response the value is always `0x00`.

*:zero2*  
The 3 bytes after *:option* are always zero.

*:option2*  
Only used for diplomacy and changing game speed. Stays at `0x00000000` for cheats.

Hex Value  | Float  | Diplomatic Stance
-----------|--------|------------------
0x00000000 | 0.0f   | Allied
0x3f800000 | 1.0f   | Neutral
0x40400000 | 3.0f   | Enemy

Hex Value  | Float  | Game Speed
-----------|--------|------------------
0x3f800000 | 1.0f   | Slow
0x3fc00000 | 1.5f   | Normal
0x40000000 | 2.0f   | Fast

*:diplomatic_stance*  
Only used for diplomacy. Changes depending on the diplomatic stance that was selected.

Hex Value | Diplomatic Stance
----------|------------------
0x00      | Allied
0x01      | Neutral
0x03      | Enemy

*:zero3*  
The 3 bytes after *:diplomatic_stance* are always zero.

## Examples

Diplomacy.

`67 00 01 00 02 00 00 00 00 00 80 3f 01 00 00 00`

>`67` &mdash; action_identifier  
>`00` &mdash; action_type  
>`01` &mdash; source_player_number  
>`00` &mdash; zero  
>`02` &mdash; option  
>`00 00 00` &mdash; zero2  
>`00 00 80 3f` &mdash; option2  
>`01` &mdash; diplomatic_stance  
>`00 00 00` &mdash; zero3

Changing the game speed.

`67 01 01 00 00 00 00 00 00 00 c0 3f 00 00 00 00`

>`67` &mdash; action_identifier  
>`01` &mdash; action_type  
>`01` &mdash; source_player_number  
>`00` &mdash; zero  
>`00` &mdash; option  
>`00 00 00` &mdash; zero2  
>`00 00 c0 3f` &mdash; option2  
>`00` &mdash; diplomatic_stance  
>`00 00 00` &mdash; zero3

Cheating.

`67 06 01 00 68 00 00 00 00 00 00 00 00 00 00 00`

>`67` &mdash; action_identifier  
>`06` &mdash; action_type  
>`01` &mdash; source_player_number  
>`00` &mdash; zero  
>`68` &mdash; option  
>`00 00 00` &mdash; zero2  
>`00 00 00 00` &mdash; option2  
>`00` &mdash; diplomatic_stance  
>`00 00 00` &mdash; zero3

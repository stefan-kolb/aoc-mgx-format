# Military Formation

A player is able to select the military formation of a group of units.

## Definition

```ruby
def Formation
  int8 :action_identifier
  int8 :selection_count
  int8 :player_number
  int8 :zero
  int8 :formation_type
  byte24 :zero2
  array :selected_ids,
    type => :int32,
    initial_length => :selection_count
end
```

## Description

*:action_identifier*  
Always has the value `0x17`.

*:selection_count*  
The number of selected units.

*:player_number*  
The number of the player for whom the formation is changed (`0x01` - `0x08`).

*:zero*  
The byte after *:player_number* is always zero.

*:formation_type*  
The formation type that is selected. AoC supports 4 formation types.

Hex Value | Formation
----------|-------
0x02      | Line
0x04      | Staggered
0x07      | Box
0x08      | Split

*:zero2*  
The 3 bytes after *:formation_type* are always zero.

*:selected_ids*  
The IDs of the units whos formation type are changed.

## Examples

`17 02 02 00 07 00 00 00 40 18 00 00 43 18 00 00`

>`17` &mdash; action_identifier  
>`02` &mdash; selection_count  
>`02` &mdash; player_number  
>`00` &mdash; zero  
>`07` &mdash; formation_type  
>`00 00 00` &mdash; zero2  
>`40 18 00 00` &mdash; selected_id  
>`43 18 00 00` &mdash; selected_id

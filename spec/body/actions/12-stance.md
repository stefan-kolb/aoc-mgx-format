# Stance

This structure will mark all changes in the stance of military units.  

## Definition

```ruby
def Stance
  int8 :action_identifier
  int8 :selection_count
  int8 :stance
  array :selected_ids,
    type => :int32,
    initial_length => :selection_count
end
```

## Description

*:action_identifier*  
Always has the value `0x12`.

*:selection_count*  
The number of selected units.

*:stance*  
Represents which stance the units are going to take. AoC supports 4 stances.

Hex Value | Stance
----------|-------
0x00      | Aggressive
0x01      | Defensive
0x02      | Stand Ground
0x03      | Passive

*:selected_ids*  
The IDs of the selected units.

## Examples

`12 01 02 4b 15 00 00`

>`12` &mdash; action_identifier  
>`01` &mdash; selection_count  
>`02` &mdash; stance  
>`4b 15 00 00` &mdash; selected_id

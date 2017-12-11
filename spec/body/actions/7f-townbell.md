# Townbell

The townbell can be used to automatically garrison villagers in range of towncenter (23 tiles starting from the borders of the building).
If it stops ringing, i.e., is clicked again, all villagers go back to work.

## Definition

```ruby
def Townbell
  int8 :action_identifier
  byte24 :zero
  int32 :building_id
  int8 :active
  byte24 :zero2
end
```

## Description

*:action_identifier*  
Always has the value `0x7f`.

*:zero*  
The 3 bytes after *:action_identifier* are always zero.

*:building_id*  
The ID of the town center where the bell is rung.

*:active*  
Represents whether the townbell is set to active (`0x01`) or not active (`0x00`).

*:zero2*  
The 3 bytes after *:active* are always zero.

## Examples

`7f 00 00 00 68 17 00 00 01 00 00 00`

>`7f` &mdash; action_identifier  
>`00 00 00` &mdash; zero  
>`68 17 00 00` &mdash; building_id  
>`01` &mdash; active  
>`00 00 00` &mdash; zero2

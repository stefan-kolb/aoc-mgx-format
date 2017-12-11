# Training unit (human player)

Used for training units with human player.

## Definition

```ruby
def TrainHM
  int8 :action_identifier
  byte24 :zero
  int32 :building_id
  int16 :unit_id
  int16 :train_count
end
```

## Description

*:action_identifier*  
Always has the value `0x77`.

*:zero*  
The 3 bytes after *:action_identifier* are always zero.

*:building_id*  
The ID of the building where the units are trained.

*:unit_id*  
The `UnitID` (`LineID` for villagers) of the unit which is trained.

*:train_count*  
The number of trained units.

## Examples

`77 00 00 00 4d 1a 00 00 5d 00 05 00`

>`77` &mdash; action_identifier  
>`00 00 00` &mdash; zero  
>`4d 1a 00 00` &mdash; building_id  
>`5d 00` &mdash; unit_id  
>`05 00` &mdash; train_count

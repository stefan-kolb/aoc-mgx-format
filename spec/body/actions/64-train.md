# Training unit (AI player)

Used for training unit with AI player.

## Definition

```ruby
def TrainAI
  int8 :action_identifier
  byte24 :zero
  int32 :building_id
  int16 :player_id
  int16 :unit_id
  int32 :const
end
```

## Description

*:action_identifier*  
Always has the value `0x64`.

*:zero*  
The 3 bytes after *:action_identifier* are always zero.

*:building_id*  
The ID of the building where the units are trained.

*:player_number*  
The number of the AI player who trains the unit (`0x01` - `0x08`).

*:unit_id*  
The `UnitID` (`LineID` for villagers) of the unit which is trained.

*:const*  
The value is always `0xFFFFFFFF`.

## Examples

`64 00 00 00 ae 1a 00 00 03 00 27 00 ff ff ff ff`

>`64` &mdash; action_identifier  
>`00 00 00` &mdash; zero  
>`ae 1a 00 00` &mdash; building_id  
>`03 00` &mdash; player_id  
>`27 00` &mdash; unit_id  
>`ff ff ff ff` &mdash; const

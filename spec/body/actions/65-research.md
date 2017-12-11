# Research

This structure is used when researching upgrades and technologies.

## Definition

```ruby
def Research
  int8 :action_identifier
  int24 :zero
  int32 :building_id
  int8 :player_number
  int8 :zero2
  int16 :technology_id
  int32 :const
end
```

## Description

*:action_identifier*  
Always has the value `0x65`.

*:zero*  
The 3 bytes after *:action_identifier* are always zero.

*:building_id*  
The ID of the building where the technology is researched.

*:player_number*  
The number of the player for whom the technology is researched (`0x01` - `0x08`).

*:zero2*  
The byte after *:player_number* is always zero.

*:technology_id*  
The [ID of the technology](technology_ids.md) that is researched.

*:const*  
This value is always `0xFFFFFFFF`.

## Examples

`65 00 00 00 63 1a 00 00 01 00 d9 00 ff ff ff ff`

>`65` &mdash; action_identifier  
>`00 00 00` &mdash; zero  
>`63 1a 00 00` &mdash; building_id  
>`01` &mdash; player_number  
>`00` &mdash; zero2  
>`d9 00` &mdash; technology_id  
>`ff ff ff ff` &mdash; const

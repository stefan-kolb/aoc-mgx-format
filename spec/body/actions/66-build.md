# Build action

Used for building everything except walls.

## Definition

```ruby
def Build
  int8 :action_identifier
  int8 :selection_count
  int8 :player_number
  int8 :zero
  float :x_coord
  float :y_coord
  int16 :building_id
  int16 :zero2
  int32 :const
  int32 :sprite_id
  array :selected_ids,
        type => :int32,
        initial_length => :selection_count
end
```

## Description

*:action_identifier*  
Always has the value `0x66`.

*:selection_count*  
The number of selected units.

*:player_number*  
The number of the player who the building belongs to (`0x01` - `0x08`).

*:zero*  
The byte after *:player_number* is always zero.

*:x_coord*  
The x-coordinate of the construction site.

*:y_coord*  
The y-coordinate of the construction site.

*:building_id*  
The `UnitID` of the building.

*:zero2*  
The two bytes after *:building_id* are always zero.

*:const*  
This value is always `0xFFFFFFFF`.

*:sprite_id*  
Represents which sprite is used for the building (only used for houses, which have several variations per civ).

*:selected_ids*  
The IDs of the selected builders.

## Examples

`66 02 01 00 00 00 10 43 00 00 88 42 46 00 00 00 ff ff ff ff 02 00 00 00 6e 17 00 00 6c 17 00 00`

>`65` &mdash; action_identifier  
>`02` &mdash; selection_count  
>`01` &mdash; player_number  
>`00` &mdash; zero  
>`00 00 10 43` &mdash; x_coord  
>`00 00 88 42` &mdash; y_coord  
>`46 00` &mdash; building_id  
>`00 00` &mdash; zero2  
>`ff ff ff ff` &mdash; const  
>`02 00 00 00` &mdash; sprite_id  
>`6e 17 00 00` &mdash; selected_id  
>`6c 17 00 00` &mdash; selected_id

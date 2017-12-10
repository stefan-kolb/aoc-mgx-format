# Wall

bauen von palisade und wall, evtl wegen positionsziehen! auch wenn nicht gezogen wird?

## Definition

```ruby
def BuildWall
  int8 :action_identifier
  int8 :selection_count
  int8 :player_number
  int8 :start_x_coord
  int8 :start_y_coord
  int8 :end_x_coord
  int8 :end_y_coord
  int8 :zero
  int16 :building_id
  int16 :zero2
  int32 :const
  array :selected_ids,
        type => :int32,
        initial_length => :selection_count
end
```

## Description

*:action_identifier*  
Always has the value `0x69`.

*:selection_count*  
The number of selected units.

*:player_number*  
The number of the player who the wall belongs to (`0x01` - `0x08`).

*:zero*  
The byte after *:player_number* is always zero.

*:start_x_coord*  
The x-coordinate of the starting tile of the wall.

*:start_y_coord*  
The y-coordinate of the starting tile of the wall.

*:end_x_coord*  
The x-coordinate of the end tile of the wall.

*:end_y_coord*  
The y-coordinate of the end tile of the wall.

*:building_id*  
The `UnitID` of the wall.

*:zero2*  
The two bytes after *:building_id* are always zero.

*:const*  
This value is always `0xFFFFFFFF`.

*:selected_ids*  
The IDs of the selected builders.

## Examples

`69 02 01 a0 4a ac 47 00 48 00 00 00 ff ff ff ff 6c 17 00 00 6e 17 00 00`

>`69` &mdash; action_identifier  
>`02` &mdash; selection_count  
>`01` &mdash; player_number  
>`a0` &mdash; start_x_coord  
>`4a` &mdash; start_y_coord  
>`ac` &mdash; end_x_coord  
>`47` &mdash; end_y_coord  
>`00` &mdash; zero  
>`48 00` &mdash; building_id  
>`00 00` &mdash; zero2  
>`ff ff ff ff` &mdash; const  
>`6c 17 00 00` &mdash; selected_id  
>`6e 17 00 00` &mdash; selected_id

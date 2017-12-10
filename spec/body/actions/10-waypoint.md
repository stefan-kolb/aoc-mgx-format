# Waypoint

This structure will be present when a player sets waypoints for any of its units.

## Definition

```ruby
def Waypoint
  int8 :action_identifier
  int8 :player_id
  int8 :selection_count
  int8 :x_coord
  int8 :y_coord
  array :selected_ids,
        type :int32,
        only_if => :selection_count < 0xFF
end
```

## Description

*:action_identifier*  
Always has the value `0x10`.

*:player_id*  
The ID of the player who the unit belongs to (`0x01` - `0x08`).

*:selection_count*  
The number of selected units. When the value of this field is `0xFF`, the action is executed for the units referenced in the previous command.

*:x_coord*  
The x-coordinate on the AoC grid.

*:y_coord*  
The y-coordinate on the AoC grid.

*:selected_ids*  
The IDs of the selected units. Can also be the ID of a building.

## Examples

Set a waypoint.

`10 01 01 34 16 a0 06 00 00`

>`10` &mdash; action_identifier  
>`01` &mdash; player_id  
>`01 `&mdash; selection_count  
>`34` &mdash; x_coord  
>`16` &mdash; y_coord  
>`a0 06 00 00` &mdash; selected_id

Set consecutive waypoints.

`10 01 ff 31 17`

>`10` &mdash; action_identifier  
>`01` &mdash; player_id  
>`ff `&mdash; selection_count  
>`31` &mdash; x_coord  
>`17` &mdash; y_coord

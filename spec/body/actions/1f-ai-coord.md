# Waypoints (AI player)

Used for setting multiple waypoints for AI units.

## Definition

```ruby
def WaypointsAI
  int8 :action_identifier
  int8 :selection_count
  int8 :waypoint_count
  array :selected_ids,
        type => :int32,
        initial_length => :selection_count
  array :x_coords,
        type => :int8,
        initial_length => :waypoint_count
  array :y_coords,
        type => :int8,
        initial_length => :waypoint_count
end
```

## Description

*:action_identifier*  
Always has the value `0x1f`.

*:selection_count*  
The number of units selected by the AI.

*:waypoint_count*  
The number of waypoints.

*:selected_ids*  
The IDs of the selected units.

*:x_coords*  
The x-coordinates on the AoC grid.

*:y_coords*  
The y-coordinates on the AoC grid.

## Examples

`1f 04 09 84 21 00 00 bd 20 00 00 a4 21 00 00 bb 21 00 00 6e 6a 68 67 67 64 64 64 5f 99 a0 a4 a7 a8 b0 b4 b8 be`

>`1f` &mdash; action_identifier  
>`04` &mdash; selection_count  
>`09` &mdash; waypoint_count    
>`84 21 00 00` &mdash; selected_id    
>`bd 20 00 00` &mdash; selected_id    
>`a4 21 00 00` &mdash; selected_id    
>`bb 21 00 00` &mdash; selected_id    
>`6e` &mdash; x_coord1  
>`6a` &mdash; x_coord2  
>`68` &mdash; x_coord3  
>`67` &mdash; x_coord4  
>`67` &mdash; x_coord5  
>`64` &mdash; x_coord6  
>`64` &mdash; x_coord7  
>`64` &mdash; x_coord8  
>`5f` &mdash; x_coord9  
>`99` &mdash; y_coord1  
>`a0` &mdash; y_coord2  
>`a4` &mdash; y_coord3  
>`a7` &mdash; y_coord4  
>`a8` &mdash; y_coord5  
>`b0` &mdash; y_coord6  
>`b4` &mdash; y_coord7  
>`b8` &mdash; y_coord8  
>`be` &mdash; y_coord9

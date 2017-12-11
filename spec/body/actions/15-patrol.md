# Patrol

Used for patrolling units.

## Definition

```ruby
def Patrol
  int8 :action_identifier
  int8 :selection_count
  int8 :patrol_waypoint_count
  int8 :zero
  array :x_coords,
    type => :int32,
    length => 10
  array :y_coords,
    type => :int32,
    length => 10
  array :selection_ids,
    type => :int32,
    initial_length => :selection_count
end
```

## Description

*:action_identifier*  
Always has the value `0x15`.

*:selection_count*  
Number of selected units.

*:patrol_waypoint_count*  
Number of waypoints set (with `SHIFT + Mouse-Button`).

*:zero*  
The byte after *:patrol_waypoint_count* is always zero.

*:x_coords*  
The x-coordinates of the patrol waypoints. Always has a length of 10 which is also the maximum number of patrol waypoints. For every waypoint that is not set, a placeholder value of `0x00000000` is used.

*:y_coords*  
The x-coordinates of the patrol waypoints. Always has a length of 10 which is also the maximum number of patrol waypoints. For every waypoint that is not set, a placeholder value of `0x00000000` is used.

*:selection_ids*  
The IDs of the units that are patrolling.

## Examples

```
0000   15 02 03 00 00 f8 2c 43 55 65 2c 43 00 88 2b 43
0010   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0020   00 00 00 00 00 00 00 00 00 00 00 00 55 0d 46 43
0030   00 70 48 43 00 48 45 43 00 00 00 00 00 00 00 00
0040   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0050   00 00 00 00 43 18 00 00 40 18 00 00
```

>`15` &mdash; action_identifier  
>`02` &mdash; selection_count  
>`03` &mdash; patrol_waypoint_count  
>`00 00` &mdash; zero  
>`00 f8 2c 43` &mdash; x_coord1  
>`55 65 2c 43` &mdash; x_coord2  
>`00 88 2b 43` &mdash; x_coord3  
>`00 00 00 00` &mdash; x_coord4  
>`00 00 00 00` &mdash; x_coord5  
>`00 00 00 00` &mdash; x_coord6  
>`00 00 00 00` &mdash; x_coord7  
>`00 00 00 00` &mdash; x_coord8  
>`00 00 00 00` &mdash; x_coord9  
>`00 00 00 00` &mdash; x_coord10  
>`55 0d 46 43` &mdash; y_coord1  
>`00 70 48 43` &mdash; y_coord2  
>`00 48 45 43` &mdash; y_coord3  
>`00 00 00 00` &mdash; y_coord4  
>`00 00 00 00` &mdash; y_coord5  
>`00 00 00 00` &mdash; y_coord6  
>`00 00 00 00` &mdash; y_coord7  
>`00 00 00 00` &mdash; y_coord8  
>`00 00 00 00` &mdash; y_coord9  
>`00 00 00 00` &mdash; y_coord10  
>`43 18 00 00` &mdash; selected_id  
>`40 18 00 00` &mdash; selected_id

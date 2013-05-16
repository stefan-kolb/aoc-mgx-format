# Wall

bauen von palisade und wall, evtl wegen positionsziehen!

## Definition

```ruby
class Wall
  int8 :command 
  int8 :selected_count
  int8 :player_id
  float :x_coordinate
  float _y_coordinate
  int32 :obj_id
  int32 :constant
	array :unit_ids,
		:type => :int32
		:length => :selected_count
end
```

## Description

*:command*  
The command identifier for the action attack will always be `0x69`.

*:selected_count*  

*obj_ids*  


## Examples

Stop a bunch of (moving) units.

>`01` &mdash; command  
>`03` &mdash; selected_count  
>`09 00 00 00` &mdash; obj_id   
>`0D 00 00 00` &mdash; obj_id  
>`0C 00 00 00` &mdash; obj_id  

69          -> typ
03          -> vills
01        -> player
62 42 -> x
CC 41 -> y
48 00 00 00 -> objid palisade
FF FF FF FF -> const
3E 08 00 00 -> vill id
42 08 00 00 -> vill id
25 08 00 00 -> vill id  

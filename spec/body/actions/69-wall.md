# Wall

bauen von palisade und wall, evtl wegen positionsziehen! auch wenn nicht gezogen wird?

## Definition

```ruby
class Wall
  int8 :command 
  int8 :selected_count
  int8 :player_id
  float :x_coordinate
  float :y_coordinate
  int32 :obj_id
  int32 :constant
	array :unit_ids,
		:type => :int32
		:length => :selected_count
end
```

## Description

*:command*  
The command identifier for the action will always be `0x69`.

*:selected_count*  

*obj_ids*  


## Examples

>`69` &mdash; command  
>`03` &mdash; selected_count  
>`01` &mdash; player_id  
>`62 42` &mdash; x_coordinate  
>`CC 41` &mdash; y_coordinate  
>`48 00 00 00` &mdash; palisade   
>`FF FF FF FF` &mdash; constant  
>`0D 00 00 00` &mdash; unit_id  
>`0C 00 00 00` &mdash; unit_id  
>`0E 00 00 00` &mdash; unit_id

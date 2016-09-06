# Stop

This structure is responsible for stopping actions of the game. Besides stopping moving units, the action can also apply to technology researches and dequeuing of units.

## Definition

```ruby
class Stop
  int8 :command 
  int8 :selection_count
  array :obj_ids, type: :int32, initial_length: :selection_count
end
```

## Description

*:command*  
The command identifier for the action attack will always be `0x01`.

*:selection_count*  
The number of selected objects. If the action stops researches this will only be a single object. 

*obj_ids*  
The ids of the selected objects. This can be a unit ids, technology id or the id of a building.

## Examples

Stop a bunch of (moving) units.

>`01` &mdash; command  
>`03` &mdash; selected_count  
>`09 00 00 00` &mdash; obj_id   
>`0D 00 00 00` &mdash; obj_id  
>`0C 00 00 00` &mdash; obj_id  

Stop a technology research from the building queue.

>`01` &mdash; command  
>`01` &mdash; selected_count  
>`73 06 00 00` &mdash; tech_id   

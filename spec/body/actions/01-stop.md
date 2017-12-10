# Stop

This structure is responsible for stopping actions of the game. Besides stopping moving units, the action can also apply to technology researches and dequeuing of units.

## Definition

```ruby
def Stop
  int8 :action_identifier
  int8 :selection_count
  array :selected_ids,
        type => :int32,
        initial_length => :selection_count
end
```

### Description

*:action_identifier*  
Always has the value `0x01`.

*:selection_count*  
The number of selected units. Is always `0x01` when stopping research in buildings, since AoC doesn't show the building queue when multiple buildings are selected.

*selected_ids*  
The IDs of the selected units. When stopping research, this is the ID of the building where the research is queued.

### Examples

Stop a bunch of (moving) units.

`01 03 99 06 00 00 98 06 00 00 97 06 00 00`

>`01` &mdash; action_identifier  
>`03` &mdash; selection_count  
>`99 06 00 00` &mdash; selected_id  
>`98 06 00 00` &mdash; selected_id  
>`97 06 00 00` &mdash; selected_id  

Stop a technology research from the building queue.

`01 01 5b 07 00 00`

>`01` &mdash; action_identifier  
>`01` &mdash; selection_count  
>`5b 07 00 00` &mdash; building_id

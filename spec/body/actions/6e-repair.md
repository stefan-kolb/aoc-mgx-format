## Repair

Used for repairing buildings and siege.

## Definition

```ruby
def Repair
  int8 :action_identifier
  int8 :selection_count
  int16 :zero
  int32 :repaired_id
  array :selected_ids,
        type => :int32,
        initial_length => :selection_count
end
```

## Description

*:action_identifier*  
Always has the value `0x6e`.

*:selection_count*  
The number of selected units.

*:zero*  
The 2 bytes after *:selection_count* are always zero.

*:repaired_id*  
The ID of the building or siege that is repaired.

*:selected_ids*  
The IDs of the selected repairmen.

## Examples

`6e 02 00 00 70 1a 00 00 a0 1a 00 00 9f 1a 00 00`

>`6e` &mdash; action_identifier  
>`02` &mdash; selection_count  
>`00 00` &mdash; zero  
>`70 1a 00 00` &mdash; repaired_id  
>`a0 1a 00 00` &mdash; selected_id  
>`9f 1a 00 00` &mdash; selected_id

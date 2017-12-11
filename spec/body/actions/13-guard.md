# Guard

Military units can be advised to automatically guard other units.  

## Definition

```ruby
def Guard
  int8 :action_identifier
  int8 :selection_count
  int16 :zero
  int32 :guarded_id
  array :selected_ids,
    type => :int32,
    initial_length => :selection_count
end
```

## Description

*:action_identifier*  
Always has the value `0x13`.

*:selection_count*  
The number of selected units that are put on guard.

*:zero*  
The two bytes after *:selection_count* are always zero.

*:guarded_id*  
The ID of the unit that will be guarded.

*:selected_ids*  
The IDs of the guarding units.

## Examples

`13 03 00 00 41 15 00 00 44 18 00 00 4b 15 00 00 42 18 00 00`

>`13` &mdash; action_identifier   
>`03` &mdash; selection_count  
>`00 00` &mdash; zero  
>`41 15 00 00` &mdash; guarded_id  
>`44 18 00 00` &mdash; selected_id  
>`4b 15 00 00` &mdash; selected_id  
>`42 18 00 00` &mdash; selected_id

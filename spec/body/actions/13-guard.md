# Guard

Military units can be advised to automatically guard other units.  

## Definition

```ruby
def Guard
  int8 :command 
  int8 :selected_units_count
  int16 :zero
  int32 :guarded_unit
  array :units, type: :int32, initial_length: :selected_units_count
end
```

## Description

*:command*  
The command identifier for the action will always be `0x13`.

*:selected_units_count*  
The number of selected units including the guarded unit.

*:zero*  
These two bytes are unused.

*:guarded_unit*  
The id of the unit that will be guarded.  

*:unit_ids*  
The ids of the selected units.

## Examples

>`13` &mdash; command   
>`02` &mdash; selected_units_count  
>`00 00` &mdash; zero  
>`06 00 00 00` &mdash; guarded_unit  
>`08 00 00 00` &mdash; unit_ids

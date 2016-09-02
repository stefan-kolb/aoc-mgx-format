# Guard

Military units can be advised to automatically guard other units.  

## Definition

```ruby
def Guard
	int8 :command 
	int16 :zero
	int32 :selected_units_count
	int32 :guarded_unit
	array :unit_ids,
		:type => int32
		:length => :selected_units_count
end
```

## Description

*:command*  
The command identifier for the action will always be `0x13`.

*:zero*  
These two bytes should be zero.

*:selected_units_count*  
The number of selected units including the guarded unit.

*:guarded_unit*  
The id of the unit that will be guarded.  

*:unit_ids*  
The ids of the selected units.

## Examples

>`13` &mdash; command  
>`00 00` &mdash; zero  
>`02` &mdash; selected_units_count  
>`06 00 00 00` &mdash; guarded_unit  
>`08 00 00 00` &mdash; unit_ids

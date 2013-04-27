# Guard

Description  

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
The command identifier for the action attack will always be `0x13`.

*:zero*

*:selected_units_count*  

*:guarded_unit*  
The unit_id that will be guarded.  

*:unit_ids*  
The identifier of the selected units.

## Examples

Standard

>`13` &mdash; command  
>`00 00` &mdash; zero  
>`02` &mdash; selected_units_count  
>`06 00 00 00` &mdash; guarded_unit  
>`08 00 00 00` &mdash; unit_ids
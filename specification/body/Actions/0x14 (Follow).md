# Follow

Description  

## Definition

```ruby
def Guard
	int8 :command 
	int8 :selected_units_count
	int16 :zero
	int32 :selected_unit
	array :unit_ids,
		:type => int32
		:length => :selected_units_count
end
```

## Description

*:command*  
The command identifier for the action attack will always be `0x14`.

*:zero*

*:selected_units_count*  

*:selected_unit*  
The unit_id that will be guarded.  

*:unit_ids*  
The identifier of the selected units.

## Examples

Standard

>`14` &mdash; command  
>`02` &mdash; selected_units_count  
>`00 00`&mdash; zero  
>`06 00 00 00` &mdash; selected_unit  
>`08 00 00 00` &mdash; unit_ids
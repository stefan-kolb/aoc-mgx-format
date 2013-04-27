# Military Formations

Description  

## Definition

```ruby
def Formations
	int8 :command 
	int8 :selected_units_count
	int16 :player_id?
	int32 :formation
	array :unit_ids,
		:type => int32,
		:length => :selected_units_count
end
```

## Description

*:command*  
The command identifier for the action attack will always be `0x17`.

*:selected_units_count*  

*:formations*  
The military formation of the selected units. 
> `0x04`=> kasten  
> `0x07`=> staffel  
> `0x08`=> flank  
> `0x02`=> line  

*:unit_ids*  
The identifier of the selected units.

## Examples

Standard

>`12` &mdash; command  
>`02` &mdash; selected_units_count  
>`01 00` &mdash; player_id
>`04 00 00 00` &mdash; formation  
>`08 00 00 00` &mdash; unit_id  
>`09 00 00 00` &mdash; unit_id
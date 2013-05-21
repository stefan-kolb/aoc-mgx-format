# Military Formation

A player is able to select the military formation of a group of units.

## Definition

```ruby
def Formation
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
The number of selected units.

*:formation*  
The [military formation](../../constants/Military%20Formations.md) of the selected units. 

*:unit_ids*  
The ids of the selected units.

## Examples

>`12` &mdash; command  
>`02` &mdash; selected_units_count  
>`01 00` &mdash; player_id  
>`04 00 00 00` &mdash; box formation  
>`08 00 00 00` &mdash; unit_id  
>`09 00 00 00` &mdash; unit_id

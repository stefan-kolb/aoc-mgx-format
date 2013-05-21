# Stance

This structure will mark all changes in the stance of military units.  

## Definition

```ruby
def Stance
	int8 :command 
	int8 :selected_units_count
	int8 :stance
	array :units, 
		:type => int32, 
		:length => :selected_units_count
end
```

## Description

*:command*  
The command identifier for the action attack will always be `0x12`.

*:selected_units_count*  

*:stance*  
The military [stance](../../constants/Stance.md) of the selected units. 

*:unit_ids*  
The identifier of the selected units.

## Examples

Standard

>`12` &mdash; command  
>`02` &mdash; selected_units_count  
>`01` &mdash; defensive stance  
>`06 00 00 00` &mdash; unit_id  
>`08 00 00 00` &mdash; unit_id  

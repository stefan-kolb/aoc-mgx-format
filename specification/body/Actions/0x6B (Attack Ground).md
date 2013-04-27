# Attack Ground

Description  
kein selbe gruppe?
wo sind die units?
eig alles unknown nach selected

## Definition

```ruby
def AttackGround
	int8 :command 
	int8 :selected_units_count
	int16 :zero
	float :x_coordinate  ?
	float :y_coordinate ?
	array :unit_ids, ?
		:type => int32,		
		:length => :selected_units_count
end
```

## Description

*:command*  
The command identifier for the action attack will always be `0x6B`.

*:player_id*  
The *player_id* may range from `0x01` - `0x08`.

## Examples

Standard

>`6B` &mdash; command  
>`02` &mdash; selected_units_count  
>`00 00` &mdash; zero  
>`00 60 93 42` &mdash; x_coordinate  
>`AB 6A 60 42` &mdash; y_coordinate  
>`02 00 00 00` &mdash; unit_id  
>`52 00 00 00` &mdash; unit_id
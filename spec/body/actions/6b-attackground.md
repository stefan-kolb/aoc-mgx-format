# Attack Ground

Used for the "attack ground" action of mangonels, onagers, trebuchets.

## Definition

```ruby
def AttackGround
	int8 :action_identifier
	int8 :selection_count
	int16 :zero
	float :x_coord
	float :y_coord
	array :selected_ids,
		:type => int32,
		:length => :selection_count
end
```

## Description

*:action_identifier*  
Always has the value `0x6b`.

*:selection_count*  
The number of selected units.

*:zero*  
The 2 bytes following *:selection_count* are unused.

*:x_coord*  
The x-coordinate represented as a 32-bit float. Values have to be read backwards, so `ab 0a d3 41` translates to `0x41d30aab` or `26.3802f`.

*:y_coord*  
The y-coordinate represented as a 32-bit float. Values have to be read backwards, so `ab 3e 22 43` translates to `0x43223eab` or `162.245f`.

*selected_ids*  
The IDs of the selected units.

## Examples

`6b 02 00 00 ab 0a d3 41 ab 3e 22 43 3d 1a 00 00 42 1a 00 00`

>`6b` &mdash; action_identifier  
>`02` &mdash; selection_count  
>`00 00` &mdash; zero  
>`ab 0a d3 41` &mdash; x_coord  
>`ab 3e 22 43` &mdash; y_coord  
>`3d 1a 00 00` &mdash; selected_id  
>`42 1a 00 00` &mdash; selected_id

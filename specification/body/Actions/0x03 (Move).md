# Move

Description

## Definition

```ruby
def Move
	int8 :command
	int8 :player_id
	int16 :zero
	int32 :constant
	int32 :selected_units_count
	double :x_coordinate
	double :y_coordinate
	array :unit_id, 
		:length => :selected_units_count, 
 		:only_if => :selected_units_count < 0xFF
end
```

## Description

*:command*  
The command identifier for the action attack will always be `0x03`.

*:player_id*  
The *player_id* may range from `0x00` - `0x08`.
`0x00` will be Gaia move like wolves?

*:zero*  
The two bytes following the *:player_id* should always be unused `0x00`.

*:constant*  
The constant should always be `0xFFFFFFFF`. This field is the equivalent to *target_id* in Attack (0x00).

*:selected_units_count*  
The number of selected units. Will be `0xFF` if the same group of units attacks again.  

*:x_coordinate*  
The x-coordinate of the attack.

*:y_coordinate*  
The y-coordinate of the attack.

*:unit_ids*  
The identifier of the attacker units. If *:selected_units_count* is `0xFF`, then this structure will not be present.

## Examples

Standard

>`03` &mdash; command  
>`01` &mdash; player id  
>`00 00` &mdash; zero  
>`FF FF FF FF` &mdash; constant    
>`02 00 00 00` &mdash; selected_units_count  
>`AB CA 33 42` &mdash; x_coordinate  
>`AB EA 98 41` &mdash; y_coordinate  
>`66 07 00 00` &mdash; unit_id  
>`67 07 00 00` &mdash; unit_id

Same group

>`03` &mdash; command  
>`01` &mdash; player id  
>`00 00` &mdash; zero  
>`FF FF FF FF` &mdash; constant    
>`0F 00 00 00` &mdash; selected_units_count  
>`AB CA 33 42` &mdash; x_coordinate  
>`AB EA 98 41` &mdash; y_coordinate

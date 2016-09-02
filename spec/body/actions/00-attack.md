# Attack

This structure represents units "attacking" other units, structures or the environment.
Actions also include all villager gathering actions and repairing. 
Moreover, monks converting and healing other units is also considered as attack move.

## Definition

```ruby
def Attack
	int8 :command 
	int8 :player_id
	int16 :zero
	int32 :target_id
	int32 :selected_unit_count
	double :x_coordinate
	double :y_coordinate
	array :attacker_id, 
			:type => :int32, 
 			:length => :selected_unit_count, 
 			:onlyif => :selected_unit_count < 0xFF
end
```

## Description

*:command*  
The command identifier for the action attack will always be `0x00`.

*:player_id*  
The *player_id* may range from `0x00` - `0x08`.
`0x00` will be Gaia attacks like wolves?

*:zero*  
The two bytes following the *:player_id* should always be unused `0x00`.

*:target_id*  
The identifier of the attacked unit or object.

*:selected_units_count*  
The number of selected units. Will be `0xFF` if the same group of units attacks again.  

*:x_coordinate*  
The x-coordinate of the attack.

*:y_coordinate*  
The y-coordinate of the attack.

*:attacker_id*  
The identifier of the attacker units. If *:selected_units_count* is `0xFF` then this structure will not be present.

## Examples

Standard

>`00` &mdash; command  
>`01` &mdash; player id  
>`00 00` &mdash; zero  
>`D2 07 00 00` &mdash; target id  
>`02 00 00 00` &mdash; selected units count  
>`00 00 5A 42` &mdash; x-coordinate  
>`00 00 F0 40` &mdash; y-coordinate    
>`62 07 00 00` &mdash; attacker id  
>`63 07 00 00` &mdash; attacker id

Same attack group

>`00` &mdash; command  
>`01` &mdash; player id  
>`00 00` &mdash; zero   
>`D2 07 00 00` &mdash; target id   
>`FF 00 00 00` &mdash; selected units count  
>`00 00 5A 42` &mdash; x-coordinate    
>`00 00 F0 40` &mdash; y-coordinate    


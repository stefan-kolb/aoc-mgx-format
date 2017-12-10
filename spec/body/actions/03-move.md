# Move

The action encodes unit movements.

## Definition

```ruby
def Move
	int8 :action_identifier
	int8 :player_id
	int16 :zero
	int32 :const
	int32 :selection_count
	float :x_coord
	float :y_coord
	array :selected_ids,
		:length => :selection_count,
 		:only_if => :selection_count < 0xFF
end
```

## Description

*:action_identifier*  
Always has the value `0x03`.

*:player_id*  
The ID of the player who moves his units (`0x01` - `0x08`).

*:zero*  
The two bytes following the *:player_id* are unused.

*:const*  
Always has the value `0xFFFFFFFF`.

*:selection_count*  
The number of selected units. When the value of this field is `0xFF`, the action is executed for the units referenced in the previous command.

*:x_coord*  
The x-coordinate of the targeted position.

*:y_coord*  
The y-coordinate of the targeted position.

*:selected_ids*  
The IDs of the selected units.

## Examples

Movement command with *:selected_ids* present.

`03 02 00 00 ff ff ff ff 02 00 00 00 00 40 22 43 ab aa 51 43 62 1a 00 00 5e 1a 00 00`

>`03` &mdash; action_identifier  
>`02` &mdash; player_id  
>`00 00` &mdash; zero  
>`ff ff ff ff` &mdash; const  
>`02 00 00 00` &mdash; selection_count  
>`00 40 22 43` &mdash; x_coord  
>`ab aa 51 43` &mdash; y_coord  
>`62 1a 00 00` &mdash; selected_id  
>`5e 1a 00 00` &mdash; selected_id

Consecutive movement command.

`03 02 00 00 ff ff ff ff ff 00 00 00 00 78 27 43 55 cd 39 43`

>`03` &mdash; action_identifier  
>`02` &mdash; player id  
>`00 00` &mdash; zero  
>`ff ff ff ff` &mdash; const  
>`ff 00 00 00` &mdash; selection_count  
>`00 78 27 43` &mdash; x_coord  
>`55 cd 39 43` &mdash; y_coord

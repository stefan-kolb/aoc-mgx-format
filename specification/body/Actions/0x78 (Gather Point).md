# Gather

Sets gather points for units. Gather points can be set on coordinates or objects and resources that should be attacked after unloading or creation (e.g. deer, castle).  

## Definition

```ruby
def Gather
	int8 :command 
	int8 :selected_count
	int16 :zero
	int32 :target_id
	int32 :target_type
	float :x_coordinate
	float :y_coordinate
	array :objects,
		:type => :int32,
		:length => :selected_count
end
```

## Description

*:command*  
The command identifier for the action will always be `0x80`.

*:selected_count*  
The number of selected objects for which the gather point will be set.

*:zero*  
The following two bytes should be zero.

*:target_id*  
The id of an optional target. Will be `0xFFFFFFFF` if no target is selected.

*:target_type*  
The type id of the target. Will be `0xFFFF0000` if no target is selected.

*:x_coordinate*  
The x-coordinate of the gather point.

*:y_coordinate*  
The y-coordinate of the gather point.

*:objects*  
The ids of the selected objects for which the gather point will be set.

## Examples

Set gather point on coordinates

>`78` &mdash; command  
>`01` &mdash; selected_count  
>`00 00` &mdash; zero  
>`02 00 00 00` &mdash; target_id  
>`52 02 00 00` &mdash; target_type  
>`00 00 8B 42` &mdash; x_coordinate  
>`00 00 8B 42` &mdash; y_coordinate  
>`03 00 00 00` &mdash; object_id  

Set gather point on unit

>`78` &mdash; command  
>`02` &mdash; selected_count  
>`00 00` &mdash; zero  
>`FF FF FF FF` &mdash; target_id  
>`FF FF 00 00` &mdash; target_type  
>`AB FA 81 42` &mdash; x_coordinate  
>`55 A5 89 42` &mdash; y_coordinate  
>`03 00 00 00` &mdash; object_id  
>`01 00 00 00` &mdash; object_id  
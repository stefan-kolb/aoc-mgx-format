# Stop

Description  
Stop Struktur auch für tech abbruch!!! zB feud click?! unit abbruch?

## Definition

```ruby
class Stop
	int8 :command 
	int8 :selected_count
	array :obj_id,
		:type => :int32
		:length => :selected_count
end
```

## Description

*:command*  
The command identifier for the action attack will always be `0x01`.

*:selected_count*  

*obj_ids*  


## Examples

Stop a bunch of (moving) units.

>`01` &mdash; command  
>`03` &mdash; selected_count  
>`09 00 00 00` &mdash; obj_id   
>`0D 00 00 00` &mdash; obj_id  
>`0C 00 00 00` &mdash; obj_id  

Stop a technology research from the building queue.

>`01` &mdash; command  
>`01` &mdash; selected_count  
>`73 06 00 00` &mdash; obj_id   
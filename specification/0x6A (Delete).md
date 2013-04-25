# Delete

Description  

## Definition

```ruby
def Delete
	int8 :command 
	int24 :zero
	int32 :object_id
	int32 :player_id
end
```

## Description

*:command*  
The command identifier for the action attack will always be `0x0B`.

*:zero*  
The 3 byte following the *:command* should always be `0x00`.

*:object_id*  
The *object_id* of a unit or building.

*:player_id*  
The *player_id* may range from `0x00` - `0x08`.

## Examples

Standard

>`6A` &mdash; command  
>`00 00 00` &mdash; zero  
>`09 00 00 00` &mdash; object_id  
>`01 00 00 00` &mdash; player_id

Cooperation

>`0B` &mdash; command  
>`01` &mdash; player id  
>`03` &mdash; player_number  
>`00` &mdash; zero  
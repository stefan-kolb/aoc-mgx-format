# Back To Work

Sends garrisoned villagers back to work.  

## Definition

```ruby
def BackToWork
	int8 :command 
	int24 :zero
end
```

## Description

*:command*  
The command identifier for the action attack will always be `0x80`.

## Examples

Standard

>`80` &mdash; command  
>`00 00 00` &mdash; zero  
>`04 00 00 00` &mdash; obj_id
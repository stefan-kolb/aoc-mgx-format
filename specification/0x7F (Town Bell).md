# TownBell

Description  

## Definition

```ruby
def TownBell
	int8 :command 
	int24 :zero
	int8 :obj_id
	int32 :active
end
```

## Description

*:command*  
The command identifier for the action attack will always be `0x7E`.

*:active*  
If the bell is ringing the value is `0x01`, else `0x00`.

## Examples

Standard

>`7F` &mdash; command  
>`00 00 00` &mdash; zero  
>`04 00 00 00` &mdash; obj_id  
>`01 00 00 00` &mdash; active
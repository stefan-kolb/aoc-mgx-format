# Townbell

The townbell can be used to automatically garrison villagers in range of towncenter (24 tiles starting from the borders of the building). If it stops ringing (i.e. is clicked again) all villagers go back to work.

## Definition

```ruby
def Townbell
	int8 :command 
	int24 :zero
	int32 :obj_id
	int32 :active
end
```

## Description

*:command*  
The command identifier for the action will always be `0x7F`.

*:zero*  
The following three bytes should be zero.

*:obj_id*  
The id of the towncenter sending the command. Relevant because only villagers in range will react to the command.

*:active*  
If the bell is ringing the value is `0x01`. If it stopped ringing it is `0x00`.

## Examples

>`7F` &mdash; command  
>`00 00 00` &mdash; zero  
>`04 00 00 00` &mdash; obj_id  
>`01 00 00 00` &mdash; active

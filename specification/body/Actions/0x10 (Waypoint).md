# Waypoint

This structure will be present when a player sets waypoints for any of its units.

## Definition

```ruby
def Waypoint
	int8 :command 
	structure :todo
end
```

## Description

*:command*  
The command identifier for the action will always be `0x10`.

## Examples

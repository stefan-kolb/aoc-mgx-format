# Waypoint

Description  

## Definition

```ruby
def Resign
  int8 :command 
	int8 :player_id
	int8 :selected_units_count
	float :x_coordinate
  float :y_coordinate
  array :units, 
    :length => :selected_units_count, 
    :onlyif =>:selected_units_count < 0xFF
end
```

## Description

*:command*  
The command identifier for the action attack will always be `0x10`.

*:player_id*  
The *player_id* may range from `0x01` - `0x08`.

## Examples

Standard

>`10` &mdash; command  
>`01` &mdash; player id  
>`01` &mdash; player_number  
>`42` &mdash; x

Cooperation

>`10` &mdash; command  
>`01` &mdash; player id  
>`FF` &mdash; player_number  
>`00` &mdash; zero  

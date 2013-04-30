# Unload

Description

## Definition

```ruby
class Unload
	int8 :command
	int8 :player_id_from
	int8 :player_id_to
	int8 :resource_type
	float :amount
end
```

## Description

*:command*  
The command identifier for the action will always be `0x6F`.

*:player_id*  
The *player_id* may range from `0x01` - `0x08`.

## Examples

Standard

>`6F` &mdash; command  
>`01 00` &mdash; player_id   
>`00 00` &mdash; zero
>`00 00 80 BF` &mdash; x_coordinate? const?    
>`00 00 80 BF` &mdash; y_coordinate? const?  
>`00 00 00 00` &mdash; ???  
>`FF FF FF FF` &mdash; constant? no maybe unit id and FF = all?  
>`04 00 00 00` &mdash; obj_id?        
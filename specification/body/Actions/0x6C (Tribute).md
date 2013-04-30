# Tribute

Description

## Definition

```ruby
def Tribute
	int8 :command
	int8 :player_id_from
	int8 :player_id_to
	int8 :resource_type
	float :amount
end
```

## Description

*:command*  
The command identifier for the action will always be `0x6C`.

*:player_id*  
The *player_id* may range from `0x01` - `0x08`.

*:resource*  
`00x0` = Food, `00x1` = Wood, `00x2` = Stone, `00x3` = Gold.
Check resurce Types in scx format! TODO check if correct.

*:amount*  
Technically: value of *:amount* * 100; practically only two values exist: 
`00x1` = 100, `00x5` = 500 (Shift-Click).

## Examples

Standard

>`6C` &mdash; command  
>`01` &mdash; player_id_from  
>`02` &mdash; player_id_to  
>`02` &mdash; resource (wood?)  
>`01` &mdash; amount = 100      
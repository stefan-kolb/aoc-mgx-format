# Sell

Description
object id vll auch wenn beim traden was rein kommt?

## Definition

```ruby
def Sell
	int8 :command
	int8 :player_id
	int8 :resource_type
	int8 :amount
	int16 :object_id
	int8 :zero
end
```

## Description

*:command*  
The command identifier for the action will always be `0x7A`.

*:player_id*  
The *player_id* may range from `0x01` - `0x08`.

*:resource*  
`00x0` = Food, `00x1` = Wood, `00x2` = Stone, `00x3` = Gold.
Check resurce Types in scx format! TODO check if correct.

*:amount*  
Technically value of *:amount* * 100. practically only two values exist: 
`00x1` = 100, `00x5` = 500 (Shift-Click).

*:zero*  
The four bytes following the *:amount* should always be unused `0x00`.

## Examples

Standard

>`7A` &mdash; command  
>`01` &mdash; player id  
>`02` &mdash; resource (wood?)  
>`01` &mdash; amount = 100    
>`00 00 00 00` &mdash; zero?  

Shift-Sell

>`7A` &mdash; command  
>`01` &mdash; player id  
>`02` &mdash; resource (wood?)  
>`05` &mdash; amount = 500    
>`00 00 00 00` &mdash; zero? 
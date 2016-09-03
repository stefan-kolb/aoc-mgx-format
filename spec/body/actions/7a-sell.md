# Sell

Utilized when the player sells resources from the market.

## Definition

```ruby
def Sell
  int8 :command
  int8 :player_id
  int8 :resource_type
  int8 :amount
  int32 :object_id
end
```

## Description

*:command*  
The command identifier for the action will always be `0x7A`.

*:player_id*  
The *player_id* may range from `0x01` - `0x08`.

*:resource*  
`00x0` = Food, `00x1` = Wood, `00x2` = Stone, `00x3` = Gold.

*:amount*  
Technically value of *:amount* * 100. Practically only two values exist: 
`0x01` = 100, `0x05` = 500 (Shift-Click).

*:object_id*  
The id of the market.

## Examples

Standard

>`7A` &mdash; command  
>`01` &mdash; player id  
>`02` &mdash; stone
>`01` &mdash; amount = 100    
>`24 00 00 00` &mdash; object id  

Shift-Sell

>`7A` &mdash; command  
>`01` &mdash; player id  
>`01` &mdash; wood
>`05` &mdash; amount = 500    
>`00 00 00 00` &mdash; object id
 
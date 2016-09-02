# Buy

Utilized when the player buys resources from the market.

## Definition

```ruby
def Buy
  int8 :command
  int8 :player_id
  int8 :resource_type
  int32 :amount
end
```

## Description

*:command*  
The command identifier for the action will always be `0x7B`.

*:player_id*  
The *player_id* may range from `0x01` - `0x08`.

*:resource*  
`00x0` = Food, `00x1` = Wood, `00x2` = Stone, `00x3` = Gold.

*:amount*  
Technically value of *:amount* * 100. Practically only two values exist: 
`00x1` = 100, `00x5` = 500 (Shift-Click).

## Examples

Standard

>`7B` &mdash; command  
>`01` &mdash; player id  
>`02` &mdash; stone  
>`01 00 00 00` &mdash; amount = 100    

Shift-Buy

>`7B` &mdash; command  
>`01` &mdash; player id  
>`02` &mdash; stone  
>`05 00 00 00` &mdash; amount = 500    

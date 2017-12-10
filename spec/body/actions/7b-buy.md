# Buy

Utilized when the player buys resources from the market.

## Definition

```ruby
def Buy
  int8 :action_identifier
  int8 :player_number
  int8 :resource_type
  int8 :amount
  int32 :market_id
end
```

## Description

*:action_identifier*  
Always has the value `0x7b`.

*:player_number*  
The ID of the player who buys the resources (`0x01` - `0x08`).

*:resource_type*  
The resource type that is sold.

Hex Value | Resource
----------|---------
0x00      | Food
0x01      | Wood
0x02      | Stone

*:amount*  
The amount being bought in hundreds. Can be either `0x01` or `0x05`.

*:market_id*  
The ID of the market.

## Examples

`7b 01 01 05 46 1a 00 00`

>`7b` &mdash; action_identifier  
>`01` &mdash; player_id  
>`01` &mdash; resource_type  
>`05` &mdash; amount    
>`46 1a 00 00` &mdash; market_id

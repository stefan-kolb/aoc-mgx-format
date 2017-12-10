# Tribute

This structure represents tributes between players. A separate tribute is saved for every resource even when a player selects tributes for more than one resource type at once.

## Definition

```ruby
def Tribute
  int8 :action_identifier
  int8 :source_player_number
  int8 :target_player_number
  int8 :resource_type
  float :amount
  float :transaction_fee
end
```

## Description

*:action_identifier*  
Always has the value `0x6c`.

*:source_player_number*  
The number of the player who sends the resources.

*:target_player_number*  
The number of the player who receives the resources.

*:resource_type*  
The resource type that is send.

Hex Value | Resource
----------|---------
0x00      | Food
0x01      | Wood
0x02      | Stone

*:amount*  
The amount of resources being transferred.

*:transaction_fee*  
The transaction fee.

## Examples

`6c 03 01 03 00 00 c8 42 cd cc 4c 3e`

>`6c` &mdash; action_identifier  
>`03` &mdash; source_player_number  
>`01` &mdash; target_player_number  
>`03` &mdash; resource_type  
>`00 00 c8 42` &mdash; amount  
>`cd cc 4c 3e` &mdash; transaction_fee = 0.2

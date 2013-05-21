# Tribute

This structure represents tributes between players. A separate tribute is saved for every resource even when a player selects tributes for more than one resource type at once. 

## Definition

```ruby
def Tribute
	int8 :command
	int8 :player_id_from
	int8 :player_id_to
	int8 :resource_type
	float :market_fee  
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
TODO check if correct.

*:market_fee*
The deducted market fee for the tributes. Can be greater equals '0x00'. The sum of *amount* and *market_fee* is the total resource count subtracted from the tributing player.

*:amount*  
The actually sent amount of resources.

## Examples

>`6C` &mdash; command  
>`01` &mdash; player_id_from  
>`02` &mdash; player_id_to  
>`02` &mdash; resource = stone  
>`00 00` &mdash; market_fee  
>`C8 42` &mdash; amount = 100      
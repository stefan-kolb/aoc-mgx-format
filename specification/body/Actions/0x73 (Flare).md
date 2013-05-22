# Flare

A player may signal actions on the battlefield by sending a flare that will appear on the minimap of players to whom he has activated the chat.

## Definition

```ruby
def Flare
  int8 :command 
  int8 :zero1
	int8 :zero2
	int8 :zero3
	int32 :const
	array :send_to_player, :type => :int8, :initial_length => 9

	int8 :zero4
	int8 :zero5
	int8 :zero6
	float :x_coordinate
	float :y_coordinate
	int8 :player_id
	int8 :player_number
  int8 :zero7
	int8 :zero8
end
```

## Description

*command*
The *command* for the action will always be '0x73'.

## Examples
73   
00 00 00   
FF FF FF FF -> const?  
00          -> ? gaia?  
01          -> chat-p1?  
01 	  
01   
01   
01   
01   
01   
01          -> chat-p8?  
00 00 00    -> ?   
55 D5 F4 41 -> x  
00 40 10 42 -> y  ?,x,y struktur ist nicht immer gleich lang mal 11 mal 12 mal weniger
01    -> player index?   
01    -> player id?     scheinen meist gleich h�chstens bei coop vershcieden...  
00 00 -> 
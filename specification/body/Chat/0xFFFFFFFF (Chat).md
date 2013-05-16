# Chat

This structure describes the *in-game* chat messages. Both, players and the game itself (Gaia) can emit in-game messages. 

## Definition

```ruby
class Chat
	int32 :command 
	int32 :chat_len
	stringz :message,
		:length => :chat_len
end
```

## Description

*:command*  
The command identifier will always be `0xFFFFFFFF`.

*:chat_length*  
The *chat_length* should be greater than `0x00`.

*:message*  
The format of the message is "@#"+ *player_number* + chat message.
The *player_number* may range from `0x00`(Gaia) to `0x08`.
The message should always be a zero ended string (`0x00`).

## Examples

>`FF FF FF FF` &mdash; command  
>`16 00 00 00` &mdash; chat_len  
>`40 23 36 5B 6B 4C 75 5D` &mdash; @#6[kLu]    
>`5F 77 69 4E 4E 65 52 3A` &mdash; _wiNNeR:  
>`69 62 69 7A 61` &mdash; ibiza  
>`00` &mdash; *zero*

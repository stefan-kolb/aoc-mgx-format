# Chat

This structure describes the in-game chat messages.

0 length chat should exist, not always null termination. at least in pregame chat. didnt find it yet in normal games > 1500 chat messages analyzed.

## Definition

```ruby
def Chat
	int32 :command 
	int32 :chat_len
	stringz :message,
		:length => :chat_len
end
```

## Description

*:command*  
The command identifier for the action will always be `0xFFFFFFFF`.

*:chat_length*  
The *chat_length* should be > `0x00`.

*:message*  
The format of the message is "@#"+ *player_number* + chat message.
The *player_number* may range from `0x00`(Gaia) to `0x08`.
Should usually be a zero ended string (`0x00`).

## Examples

>`FF FF FF FF` &mdash; command  
>`16 00 00 00` &mdash; chat_len  
>`40 23 36 5B 6B 4C 75 5D` &mdash; @#6[kLu]    
>`5F 77 69 4E 4E 65 52 3A` &mdash; _wiNNeR:  
>`20 62 69 7A 61` &mdash;  biza  
>`00` &mdash; zero
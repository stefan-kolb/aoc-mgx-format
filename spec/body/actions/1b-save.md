# Save game

Used for saving the game.

## Definition

```ruby
def Save
  int8 :action_identifier
  int8 :exit
  int8 :player_id
  array :filename,
        type => :int8
  unknown :memory
  int32 :checksum
end
```

## Description

*:action_identifier*  
Always has the value `0x1b`.

*:exit*  
Represents whether this action is a normal Save (`0x00`) or a Save & Exit (`0x01`).

*:player_id*  
The ID of the player saving the game.

*:filename*  
The filename of the savegame in ASCII characters.

*:memory*  
The space between filename and checksum is filled with uninitialized memory.

*:checksum*  
The last 4 bytes are a checksum.

## Examples

```
0000   1b 00 01 78 79 7a 2e 6d 73 78 00 7b 78 79 7a 00
0010   00 00 00 00 7e cd 83 7b 5b f3 83 7b 00 8c ff 3f
0020   00 00 00 80 03 00 00 00 b0 d7 32 00 03 00 00 00
0030   80 00 00 00 00 00 00 00 00 00 00 00 03 00 00 00
0040   b0 d7 32 00 03 00 00 00 00 00 00 80 00 00 00 00
0050   06 f3 83 7b 88 d7 32 00 09 00 00 00 80 00 00 00
0060   ff ff ff ff cc d7 32 00 63 51 61 00 00 00 00 00
0070   63 51 61 00 3c d8 32 00 00 00 00 80 03 00 00 00
0080   b0 d7 32 00 03 00 00 00 87 51 61 00 02 00 00 00
0090   d2 ed 66 00 01 00 00 00 00 00 00 00 0c 00 00 00
00a0   00 00 00 00 01 00 00 00 03 00 00 00 00 00 00 80
00b0   03 00 00 00 16 00 00 00 f8 d7 32 00 9d 94 61 00
00c0   3c d8 32 00 00 80 00 00 40 00 00 00 a4 01 00 00
00d0   54 6d 14 0b 50 65 14 0b 58 6e 14 0b 00 00 00 00
00e0   00 00 00 00 b0 d7 79 0c 9d 39 61 00 3c d8 32 00
00f0   d0 ed 66 00 40 00 00 00 08 1b 68 00 b0 39 61 00
0100   3c d8 32 00 d0 ed 66 00 2c 00 00 00
```

>`1b` &mdash; action_identifier  
>`00` &mdash; exit  
>`01` &mdash; player_id  
> `78 79 7a 2e 6d 73 78`  &mdash; filename  
> memory  
> `2c 00 00 00`  &mdash; checksum  

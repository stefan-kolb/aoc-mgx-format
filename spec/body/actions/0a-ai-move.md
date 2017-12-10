## Move (AI player)

Used for moving and attacking. If that is the only purpose is unknown.

### Definition

```ruby
def PrimaryActionAI
    int8 :action_identifier
    int8 :selection_count
    int8 :player_number
    int8 :player_id
    int32 :unknown_id
    int32 :unknown_bytes
    int32 :target_id
    int8 :unknown_count
    byte24 :zero
    float :unknown_x_coord
    float :unknown_y_coord
    float :unknown_float
    float :unknown_float2
    int32 :unknown_bytes2
    array :selected_ids,
      type => :int32,
      length => :selection_count,
      onlyif => :selection_count > 0x01
end
```

### Description

*:action_identifier*  
Always has the value `0x0a`.

*:selection_count*  
The number of selected units.

*:player_number*  
The player's number which can be changed in the lobby. Is only different from *:player_id* if playing in coop mode.

*:player_id*  
The ID of the player.

*:unknown_id*  
The ID of a unit that is able to move.

*:unknown_bytes*  
*Purpose unknown.*

*:target_id*  
The ID of a target. Is `0xFFFFFFFF` if no target is selected.

*:unknown_count*  
Could be the number of targets, but is never greater than `0x01`. Is `0xFF` if no target is selected.

*:zero*  
The 3 bytes after *:unknown_count* are always zero.

*:unknown_x_coord*  
Presumably an x-coordinate, that could describe the position of a target.

*:unknown_y_coord*  
Presumably an y-coordinate, that could describe the position of a target.

*:unknown_float*  
A float value that can be `1.0f` or `-1.0f`.

*:unknown_float2*  
A float value that can be `1.0f` or `-1.0f`.

*:unknown_bytes2*  
*Purpose unknown.*

*:selected_ids*  
The IDs of the selected units. Only present if *:selection_count* is greater than `0x01`. Always contains *:unknown_id*.

### Examples

`0a 01 03 03 1b 17 00 00 c1 02 01 00 ff ff ff ff ff 00 00 00 00 00 09 43 00 00 4a 43 00 00 80 bf 00 00 80 3f 01 00 00 00`

>`0a` &mdash; action_identifier  
>`01` &mdash; selection_count  
>`03` &mdash; player_number  
>`03` &mdash; player_id  
>`1b 17 00 00` &mdash; unknown_id  
>`c1 02 01 00` &mdash; unknown_bytes  
>`ff ff ff ff` &mdash; target_id  
>`ff` &mdash; unknown_count  
>`00 00 00` &mdash; zero  
>`00 00 09 43` &mdash; unknown_x_coord  
>`00 00 4a 43` &mdash; unknown_y_coord  
>`00 00 80 bf` &mdash; unknown_float  
>`00 00 80 3f` &mdash; unknown_float2  
>`01 00 00 00` &mdash; unknown_bytes2

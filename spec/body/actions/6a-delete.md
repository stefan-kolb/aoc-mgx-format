# Delete

The action is used when deleting units and buildings.  

## Definition

```ruby
def Delete
  int8 :action_identifier
  byte24 :zero
  int32 :object_id
  int8 :player_number
  byte24 :zero
end
```

## Description

*:action_identifier*  
Always has the value `0x6a`.

*:zero*  
The 3 bytes following *:action_identifier* and *player_id* are unused.

*:object_id*  
ID of the unit or building that will be deleted.

*:player_number*  
The number of the player who the unit belongs to (`0x01` - `0x08`).

## Examples

`6a 00 00 00 9f 06 00 00 02 00 00 00`

>`6a` &mdash; action_identifier  
>`00 00 00` &mdash; zero  
>`9f 06 00 00` &mdash; object_id  
>`02` &mdash; player_number  
>`00 00 00` &mdash; zero

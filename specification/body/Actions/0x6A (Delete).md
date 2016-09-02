# Delete

The action is used when deleting units and buildings.  

## Definition

```ruby
def Delete
  int8 :command 
  byte24 :zero
  int32 :object_id
  int32 :player_id
end
```

## Description

*:command*  
The command identifier for the action attack will always be `0x6A`.

*:zero*  
The 3 bytes following the *:command* are unused.

*:object_id*  
The *object_id* of a unit or building.

*:player_id*  
The *player_id* may range from `0x01` - `0x08`.

## Examples

>`6A` &mdash; command  
>`00 00 00` &mdash; zero  
>`09 00 00 00` &mdash; object_id  
>`01 00 00 00` &mdash; player_id

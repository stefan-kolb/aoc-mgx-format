# Back To Work

Sends garrisoned villagers back to work.  

## Definition

```ruby
def BackToWork
  int8 :action_identifier
  byte24 :zero
  int32 :building_id
end
```

### Description

*:action_identifier*  
Always has the value `0x80`.

*:zero*  
The 3 bytes after *:action_identifier* are always zero.

*:building_id*  
The ID of the building from which the villagers are released.

### Examples

`80 00 00 00 68 17 00 00`

>`80` &mdash; action_identifier  
>`00 00 00` &mdash; zero  
>`68 17 00 00` &mdash; building_id

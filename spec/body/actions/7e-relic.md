# Drop relic

Dropping a relic on the ground.

## Definition

```ruby
def DropRelic
  int8 :action_identifier
  byte24 :zero
  int32 :monk_id
end
```

## Description

*:action_identifier*  
Always has the value `0x7e`.

*:zero*  
The 3 bytes following *:action_identifier* are unused.

*:monk_id*  
The ID of the monk who will drop the relic.

## Examples

`7e 00 00 00 17 1b 00 00`

>`7e` &mdash; action_identifier  
>`00 00 00` &mdash; zero  
>`17 1b 00 00` &mdash; monk_id

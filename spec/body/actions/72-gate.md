# Toggle gate action

Used for setting a gate to closed/open.

## Definition

```ruby
def ToggleGate
  int8 :action_identifier
  byte24 :zero
  int32 :gate_id
end
```

## Description

*:action_identifier*  
Always has the value `0x72`.

*:zero*  
The 3 bytes after *:action_identifier* are always zero.

*:gate_id*  
The ID of the gate.

## Examples

`72 00 00 00 bf 1a 00 00`

>`72` &mdash; action_identifier  
>`00 00 00` &mdash; zero  
>`bf 1a 00 00` &mdash; gate_id

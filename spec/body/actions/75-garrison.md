# Garrison

Units can be garrisoned into buildings. Also packing and unpacking of trebuchets is handled as garrison.

## Definition

```ruby
def Garrison
  int8 :command 
end
```

## Description

*:command*  
The command identifier for the action will always be `0x75`.

*:selected_units_count*  
The number of selected units including the guarded unit.

*:zero*  
These two bytes are unused.

*:object_id*  
The id of the object the units will be garrisoned to or `0xFFFFFFFF` if it is a unit itself. 

*:const*  
Divider constant.

*:unit_ids*  
The ids of the selected units.

## Examples

>`13` &mdash; command   
>`02` &mdash; selected_units_count  
>`00 00` &mdash; zero  
>`06 00 00 00` &mdash; object_id  
>`08 00 00 00` &mdash; unit_ids

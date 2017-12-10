# Follow

Used for following a unit.

## Definition

```ruby
def Follow
  int8 :action_identifier
  int8 :selection_count
  int16 :zero
  int32 :followed_id
  array :selection_ids,
    type => :int32,
    initial_length => :selection_count
end
```

## Description

*:action_identifier*  
Always has the value `0x14`.

*:selection_count*  
Number of selected units.

*:zero*
The two bytes after *:selection_count* are always zero.

*:followed_id*  
The ID of the unit that will be followed.

*:selection_ids*  
The IDs of the units that are following the unit with *:followed_id*.

## Examples

`14 02 00 00 40 18 00 00 44 18 00 00 42 18 00 00`

>`14` &mdash; action_identifier  
>`02` &mdash; selection_count  
>`00 00` &mdash; zero  
>`40 18 00 00` &mdash; followed_id  
>`44 18 00 00` &mdash; selected_id  
>`42 18 00 00` &mdash; selected_id

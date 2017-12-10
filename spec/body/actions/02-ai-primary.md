# Primary action (AI player)

Used by the AI to interact with objects in the game world.

## Definition

```ruby
def PrimaryActionAI
    int8 :action_identifier
    byte24 :zero
    int32 :target_id
    int8 :selection_count
    byte24 :zero2
    float :x_coord
    float :y_coord
    array :selected_ids,
      type => :int32,
      length => :selection_count,
      onlyif => :selection_count < 0xFF
end
```

## Description

*:action_identifier*  
Always has the value `0x02`.

*:zero*  
The 3 bytes following *:action_identifier* are unused.

*:target_id*  
The ID of the targeted object.

*:selection_count*  
The number of selected units. Always `0x01`.

*:zero2*  
The three bytes following *:selection_count* are unused.

*:x_coord*  
The x-coordinate of the targeted position.

*:y_coord*  
The y-coordinate of the targeted position.

*:selected_ids*  
The IDs of the selected units.

## Examples

`02 00 00 00 21 1f 00 00 01 00 00 00 00 80 36 43 00 80 0f 43 72 1e 00 00`

>`02` &mdash; action_identifier  
>`00 00 00` &mdash; zero  
>`21 1f 00 00` &mdash; target_id  
>`01` &mdash; selection_count  
>`00 00 00` &mdash; zero2  
>`00 80 36 43` &mdash; x_coord  
>`00 80 0f 43` &mdash; y_coord  
>`72 1e 00 00` &mdash; selected_id

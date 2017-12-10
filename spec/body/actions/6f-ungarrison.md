# Ungarrison

Used for unloading units from transport ships or rams and ungarrisoning units.

### Definition

```ruby
class Ungarrison
  int8 :action_identifier
  int8 :selection_count
  int16 :zero
  float :x_coord
  float :y_coord
  int8 :ungarrison_type
  byte24 :zero2
  int32 :release_id
  array :selected_ids,
		:type => int32,
		:length => :selection_count
end
```

## Description

*:action_identifier*  
Always has the value `0x6f`.

*:selection_count*  
The number of selected units.

*:zero*  
The 2 bytes following *:selection_count* are unused.

*:x_coord*  
The x-coordinate represented as a 32-bit float. Values have to be read backwards, so `ab 0a d3 41` translates to `0x41d30aab` or `26.3802f`. When ungarrisoning from a building this value will always be `00 00 80 bf` = `-1.0f`.

*:y_coord*  
The y-coordinate represented as a 32-bit float. Values have to be read backwards, so `ab 3e 22 43` translates to `0x43223eab` or `162.245f`. When ungarrisoning from a building this value will always be `00 00 80 bf` = `-1.0f`.

*:ungarrison_type*

Is used to reflect the use of hotkeys to release only a certain type of units.

Hotkey                   | Hex Value | Action
-------------------------|-----------|--------
G                        | 0x00      | Release all
Mouse-BTN                | 0x03      | Release unit that was clicked on
SHIFT + Mouse-BTN        | 0x04      | Release units of the same type
CTRL + Mouse-BTN         | 0x05      | Release all except unit that was clicked on
CTRL + SHIFT + Mouse-BTN | 0x06      | Release all not of the same type

*:release_id*

The unit that was clicked on in the garrison queue. Value is `0xFFFFFFFF` if *:ungarrison_type* is `0x00`.

*:selected_ids*

The IDs of the rams, transport ships or buildings the units are released from.

## Examples

Unloading a transport ship.

`6f 01 00 00 00 c0 c7 41 55 4d 3f 43 00 00 00 00 ff ff ff ff 4c 1a 00 00`

>`6f` &mdash; action_identifier  
>`01` &mdash; selection_count  
>`00 00` &mdash; zero  
>`00 c0 c7 41` &mdash; x_coord  
>`55 4d 3f 43` &mdash; y_coord  
>`00` &mdash; ungarrison_type  
>`00 00 00` &mdash; zero2  
>`ff ff ff ff` &mdash; release_id  
>`4c 1a 00 00` &mdash; selected_id

Ungarrisoning all units from a building.

`6f 01 00 00 00 00 80 bf 00 00 80 bf 00 00 00 00 ff ff ff ff 4b 17 00 00`

>`6F` &mdash; action_identifier  
>`01` &mdash; selection_count  
>`00 00` &mdash; zero  
>`00 00 80 bf` &mdash; x_coord  
>`00 00 80 bf` &mdash; y_coord  
>`00` &mdash; ungarrison_type  
>`00 00 00` &mdash; zero2  
>`ff ff ff ff` &mdash; release_id  
>`4b 17 00 00` &mdash; selected_id  

Ungarrisoning with `CTRL + SHIFT`.

`6f 01 00 00 00 00 80 bf 00 00 80 bf 06 00 00 00 5a 1a 00 00 4b 17 00 00`

>`6F` &mdash; action_identifier  
>`01` &mdash; selection_count  
>`00 00` &mdash; zero  
>`00 00 80 bf` &mdash; x_coord  
>`00 00 80 bf` &mdash; y_coord  
>`06` &mdash; ungarrison_type  
>`00 00 00` &mdash; zero2  
>`5a 1a 00 00` &mdash; release_id  
>`4b 17 00 00` &mdash; selected_id  

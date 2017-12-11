# Garrison

Used for garrisoning units into buildings as well as packing and unpacking of trebuchets.

## Definition

```ruby
def Garrison
  int8 :action_identifier
  int8 :selection_count
  int16 :zero
  int32 :building_id
  int8 :garrison_type
  byte24 :zero
  float :x_coord
  float :y_coord
  int32 :const
  array :selected_ids,
		:type => int32,
		:length => :selection_count
end
```

## Description

*:action_identifier*  
Always has the value `0x75`.

*:selection_count*  
The number of selected units.

*:zero*  
The 2 bytes following *:selection_count* are unused.

*:building_id*  
The ID of a building, ram or transport ship which the units will be garrisoned in. When packing/unpacking a trebuchet, this value is always `0xFFFFFFFF`.

*:garrison_type*

Hex Value | Action
----------|--------
0x01      | Pack trebuchet
0x02      | Unpack trebuchet
0x05      | Garrison units into building, ram or transport ship

*:zero2*  
The 3 bytes following *:garrison_type* are unused.

*:x_coord*  
The x-coordinate represented as a 32-bit float. Value is always `00 00 00 00` when *:garrison_type* is `0x01` and  `00 00 80 bf` = `-1.0f` when it is `0x02` and `0x05`.

*:y_coord*  
The x-coordinate represented as a 32-bit float. Value is always `00 00 00 00` when *:garrison_type* is `0x01` and  `00 00 80 bf` = `-1.0f` when it is `0x02` and `0x05`.

*:const*  
This value was always `0xFFFFFFFF` in testing.

*:selected_ids*  
The IDs of the rams, transport ships or buildings the units are released from.

## Examples

Packing a trebuchet.

`75 01 00 00 ff ff ff ff 01 00 00 00 00 00 00 00 00 00 00 00 ff ff ff ff 65 1a 00 00`

>`75` &mdash; action_identifier  
>`01` &mdash; selection_count  
>`00 00` &mdash; zero  
>`ff ff ff ff` &mdash; building_id  
>`01` &mdash; garrison_type  
>`00 00 00` &mdash; zero2  
>`00 00 00 00` &mdash; x_coord  
>`00 00 00 00` &mdash; y_coord  
>`ff ff ff ff` &mdash; const  
>`65 1a 00 00` &mdash; selected_id  

Unpacking a trebuchet.

`75 01 00 00 ff ff ff ff 02 00 00 00 00 00 80 bf 00 00 80 bf ff ff ff ff 65 1a 00 00`

>`75` &mdash; action_identifier  
>`01` &mdash; selection_count  
>`00 00` &mdash; zero  
>`ff ff ff ff` &mdash; building_id  
>`02` &mdash; garrison_type  
>`00 00 00` &mdash; zero2  
>`00 00 80 bf` &mdash; x_coord  
>`00 00 80 bf` &mdash; y_coord  
>`ff ff ff ff` &mdash; const  
>`65 1a 00 00` &mdash; selected_id  

Garrisoning units into a building.

`75 02 00 00 46 17 00 00 05 00 00 00 00 00 80 bf 00 00 80 bf ff ff ff ff 6f 1a 00 00 6d 1a 00 00`

>`75` &mdash; action_identifier  
>`02` &mdash; selection_count  
>`00 00` &mdash; zero  
>`46 17 00 00` &mdash; building_id  
>`05` &mdash; garrison_type  
>`00 00 00` &mdash; zero2  
>`00 00 80 bf` &mdash; x_coord  
>`00 00 80 bf` &mdash; y_coord  
>`ff ff ff ff` &mdash; const  
>`6f 1a 00 00` &mdash; selected_id  
>`6d 1a 00 00` &mdash; selected_id

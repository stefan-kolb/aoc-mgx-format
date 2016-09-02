# Research

This structure is used when researching upgrades and technologies.

## Definition

```ruby
def Research
	int8 :command
	int24 :zero?
	int32 :object_id
	int16 :player_id
	int16 :technology_id
	int32 :constant?
end
```

## Description

*:command*
The command identifier for the action attack will always be `0x65`.

*:player_id*
The *player_id* may range from `0x01` - `0x08`.

## Examples

Standard

>`65` &mdash; command
>`00 00 00` &mdash; zero?
>`73 06 00 00` &mdash; object_id
>`01 00` &mdash; player_id
>`65 00` &mdash; technology_id
>`FF FF FF FF` &mdash; const?

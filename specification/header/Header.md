# Header

Description

## Definition

```ruby
def Header
	string :version,
		:length => 8
end
```

## Description

*:command*  
The command identifier for the action attack will always be `0x00`.

## Examples

Standard

>`00` &mdash; command  
>`01` &mdash; player id  
>`00 00` &mdash; zero  
>`D2 07 00 00` &mdash; target id  
>`02 00 00 00` &mdash; selected units count  
>`00 00 5A 42` &mdash; x-coordinate  
>`00 00 F0 40` &mdash; y-coordinate    
>`62 07 00 00` &mdash; attacker id  
>`63 07 00 00` &mdash; attacker id   


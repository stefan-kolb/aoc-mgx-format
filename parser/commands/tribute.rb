require 'bindata'

class Tribute < BinData::Record
	endian :little
	
	int8 :player_id_from
	int8 :player_id_to
	int8 :resource_type
	float :amount
end
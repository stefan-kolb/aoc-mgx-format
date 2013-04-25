require 'bindata'

class Buy < BinData::Record
	endian :little
	
	int8 :player_id
	int8 :resource_type
	int8 :amount
	int16 :obj_id
	int8 :zero
end

#stone 149-110, wood 115-85, food 115-85 -> wood 82 110, 83 113 , 109-147
require 'bindata'

class Unload < BinData::Record
	endian :little
	
	int8 :player_id
	int16 :zero
	int32 :unknown1
	int32 :unknown2
	int32 :unknown3
	int32 :constant
	int32 :unknown5
end
require 'bindata'

class Townbell < BinData::Record
  endian :little
	
	int24 :zero
	int32 :obj_id
	int32 :active
end
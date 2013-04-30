require 'bindata'

class Stop < BinData::Record
	endian :little
	
	int8 :selected_count
	array :obj_id,
		:type => :int32,
		:length => :selected_count
end
require_relative '../mgx_record'

class Townbell < Mgx::Record
	int24 :zero
	int32 :obj_id
	int32 :active
end
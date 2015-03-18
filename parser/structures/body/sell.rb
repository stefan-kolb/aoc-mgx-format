require_relative '../mgx_record'

class Sell < Mgx::Record
	int8 :player_id
	int8 :resource_type
	int8 :amount
	int16 :obj_id
	int8 :zero
end
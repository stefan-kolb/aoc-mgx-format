require_relative '../mgx_record'

class Delete < Mgx::Record
  int24 :zero
  int32 :obj_id
  int32 :player_id
end

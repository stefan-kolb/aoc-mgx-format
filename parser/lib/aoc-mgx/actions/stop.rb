require_relative '../mgx_record'

class Stop < Mgx::Record
  int8 :selection_count
  array :obj_ids, type: :int32, initial_length: :selection_count
end

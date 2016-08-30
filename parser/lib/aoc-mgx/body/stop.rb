require_relative '../mgx_record'

class Stop < Mgx::Record
  int8 :selected_count
  array :obj_id,
        type: :int32,
        length: :selected_count
end

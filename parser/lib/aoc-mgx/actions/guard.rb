require_relative '../mgx_record'

class Guard < Mgx::Record
  int8 :selected_units_count
  int16 :zero
  int32 :guarded_unit
  array :units, type: :int32, initial_length: :selected_units_count
end

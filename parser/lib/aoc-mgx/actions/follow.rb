require_relative '../mgx_record'

class Follow < Mgx::Record
  int16 :zero
  int32 :selected_units_count
  int32 :followed_unit
  array :units, type: :int32, initial_length: :selected_units_count
end

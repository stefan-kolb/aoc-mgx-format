require_relative '../mgx_record'

class Stance < Mgx::Record
  int8 :selected_units_count
  int8 :stance
  array :unit_ids, type: :int32, initial_length: :selected_units_count
end

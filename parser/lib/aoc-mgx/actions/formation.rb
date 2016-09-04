require_relative '../mgx_record'

class Formation < Mgx::Record
  int8 :selected_units_count
  int8 :player_id
  int8 :zero
  int32 :formation
  array :unit_ids, type: :int32, initial_length: :selected_units_count
end

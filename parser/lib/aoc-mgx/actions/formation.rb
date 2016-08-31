require 'bindata'

class Formation < Mgx::Record
  int8 :command
  int8 :selected_units_count
  int16 :player_id
  int32 :formation
  array :unit_ids, type: :int32, read_until: -> { index + 1 == selected_units_count }
end

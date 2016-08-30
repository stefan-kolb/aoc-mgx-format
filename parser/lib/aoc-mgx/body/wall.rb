require_relative '../mgx_record'

class Wall < Mgx::Record
  int8 :selected_count
  int8 :player_id
  float :x_coordinate
  float :y_coordinate
  int32 :obj_id
  int32 :const
  array :unit_ids, type: :int32, initial_length: :selected_count
end

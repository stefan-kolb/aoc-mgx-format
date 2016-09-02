require_relative '../mgx_record'

class Gather < Mgx::Record
  int8 :selected_count
  int16 :zero
  int32 :target_id
  int32 :target_type
  float :x_coordinate
  float :y_coordinate
  array :objects, type: :int32, initial_length: :selected_count
end

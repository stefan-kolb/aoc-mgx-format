require_relative '../mgx_record'

class AttackGround < Mgx::Record
  int8 :selected_units_count
  int16 :zero
  float :x_coordinate
  float :y_coordinate
  array :unit_ids, type: :int32,
                   length: :selected_units_count
end

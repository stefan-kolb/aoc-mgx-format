require_relative '../mgx_record'

class Attack < Mgx::Record
  # X & Y coordinates, status, action, facing and damage
  int8 :player_id
  int16 :zero
  int32 :target_id # when ffffff? no target?
  int8 :selected_units_count # when ff? same selection?!
  int24 :zero2
  float :x_coordinate
  float :y_coordinate
  array :attacker_ids,
        type: :int32,
        initial_length: :selected_units_count,
        onlyif: -> { selected_units_count < 0xFF }
end

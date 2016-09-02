require_relative '../mgx_record'

class Flare < Mgx::Record
  int24 :zero
  int32 :const
  array :send_to_player, type: :int8, initial_length: 8
  int24 :zero2
  float :x_coordinate
  float :y_coordinate
  int8 :player_id
  int8 :player_number
  int24 :zero3
end

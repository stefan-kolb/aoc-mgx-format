require_relative '../mgx_record'

class Waypoint < Mgx::Record
  int8 :player_id
  int8 :selected_units_count
  int8 :unknown1 # tile coordinates x?
  int8 :unknown2 # tile coordinates y?
  float :x_coordinate
  float :y_coordinate
  array :units,
        type: :int32,
        initial_length: :selected_units_count,
        onlyif: -> { selected_units_count < 0xFF }
end

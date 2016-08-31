require_relative '../mgx_record'

class Move < Mgx::Record
  int8 :command
  int8 :player_id
  skip length: 2
  int32 :const
  int32 :units_selected_count
  float :x_coordinate
  float :y_coordinate
  array :numbers, type: :uint8, onlyif: :has_units?, initial_length: :units_selected_count

  def has_units?
    units_selected_count != 255
  end
end

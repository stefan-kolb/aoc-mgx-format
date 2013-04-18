require 'bindata'

class Move < BinData::Record
  endian :little
	
  int8 :command
  int8 :player_id
	skip :length => 2
	int32 :const
	int32 :units_selected_count
	float :x_coordinate
	float :y_coordinate
	array :numbers, :type => :uint8, :onlyif => :has_units?, :read_until => lambda { index = :units_selected_count - 1 }

  def has_units?
    units_selected_count != 255
  end
end
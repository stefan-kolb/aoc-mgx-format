require 'bindata'

class Flare < Mgx::Record
  int8 :zero1
	int8 :zero2
	int8 :zero3
	int32 :const
	array :send_to_player, :type => :int8, :initial_length => 9
	int8 :zero4
	int8 :zero5
	int8 :zero6
	float :x_coordinate
	float :y_coordinate
	int8 :player_id
	int8 :player_number
  int8 :zero7
	int8 :zero8
end
require_relative '../mgx_record'

require_relative 'map'

class RecordedGame < Mgx::Record
  string :game_version, :length => 8
  skip :length => 4
  int32 :include_ai
  # skip ai if necessary
  skip :length => 4
  int32 :game_speed1
  skip :length => 4
  int32 :game_speed2
  skip :length => 29
  int16 :rec_owner
  int8 :player_count
  skip :length => 62
  int32 :map_size_x
  int32 :map_size_y
  int32 :u_len
  skip :length => :u_len
  # skip unknown  if necessary
  skip :length => 2
  array :map_data, :type => :map, :read_until => lambda { index + 1 == map_size_x * map_size_y }
  skip :length => 120
  int32 :map_size_x2
  int32 :map_size_y2
  skip :length => lambda { map_size_x * map_size_y }
  skip :length => 15
  # player info
  array :player_info, :type => :player, :read_until => lambda { index + 1 == player_count }
end

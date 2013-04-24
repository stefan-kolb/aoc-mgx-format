require 'minitest/autorun'
require 'bindata'

class Move < BinData::Record
  endian :little
	
	int32 :len
  int8 :command
  int8 :player_id
	skip :length => 2
	int32 :const
	int32 :units_selected_count
	float :x_coordinate
	float :y_coordinate
	array :numbers, :type => :uint8, :onlyif => :has_units?, :read_until => lambda { index = units_selected_count - 1 }
	int32 :ender
	
  def has_units?
    units_selected_count != 255
  end
end

class TestMove < MiniTest::Unit::TestCase
	
	def test_move_structure
		Dir.glob(__dir__ + '/../parser/data/move/*.dump') do |dump|
			io = File.open(dump)
			struct = Move.read(io)
			
			assert_equal(struct.command, 0x03, "Command not 0x03")
			assert_match(/[1-8]/, struct.player_id.to_s, "Player id not in range") # gaia hat wohl kein move
			assert_match(/[1-9]|[0-4][0-9]|255/, struct.units_selected_count.to_s, "unit coundt")
		end
	end
end
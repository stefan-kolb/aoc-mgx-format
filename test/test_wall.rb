require 'minitest/autorun'
require 'bindata'
require_relative '../parser/commands/wall'

class TestTribute < MiniTest::Unit::TestCase
	
	def test_structure
		Dir.glob(__dir__ + '/../parser/data/wall/*.dump') do |dump|
			io = File.open(dump)
			struct = Wall.read(io)
			
			# selected count range [1;40]
			assert((1..40).member?(struct.selected_count), "Cannot select more than 40 units: " + struct.selected_count.to_s)
			# player id range [1;8]
			assert((1..8).member?(struct.player_id), "Player ID out of range [1;8]: " + struct.player_id.to_s + dump)
			# coordinate ranges
			# object id only palisade (0x48000000) and stonewall (0x????????)
			assert([0x48000000].member?(struct.obj_id), "Object not palisade or stonewall: " + struct.obj_id.to_s + dump)
			# constant = 0xFFFFFFFF
			assert_equal(struct.constant, -1, "Constant not 0xFFFFFFFF" + dump) 
		end
	end
end
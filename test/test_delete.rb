require 'minitest/autorun'
require 'bindata'
require '../parser/commands/delete'

class TestDelete < MiniTest::Unit::TestCase
	
	def test_structure
		Dir.glob(__dir__ + '/../parser/data/delete/*.dump') do |dump|
			io = File.open(dump)
			struct = Delete.read(io)
			
			assert_equal(0, struct.zero1, "1st byte not zero")
			assert_equal(0, struct.zero2, "2nd byte not zero")
			assert_equal(0, struct.zero3, "3rd byte not zero")
			#assert((1..1000000).member?(struct.obj_id), "Object id dunno...")
			assert((1..8).member?(struct.player_id), "Player ID not in range!" + struct.player_id.to_s)
		end
	end
end
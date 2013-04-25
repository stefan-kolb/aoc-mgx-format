require 'minitest/autorun'
require 'bindata'
require '../parser/commands/attackground'

class TestTribute < MiniTest::Unit::TestCase
	
	def test_structure
		Dir.glob(__dir__ + '/../parser/data/tribute/*.dump') do |dump|
			io = File.open(dump)
			struct = Tribute.read(io)
			
			assert((1..8).member?(struct.player_id_from), "Player id not in range: " + struct.player_id_from.to_s) 
			assert((1..8).member?(struct.player_id_to), "Player number not in range: " + struct.player_id_to.to_s)
			refute_equal(struct.player_id_to, struct.player_id_from, "Player from to are equal") 		
			assert((0..4).member?(struct.resource_type), "Resource type not in range" + dump) 
			assert((0..9999).member?(struct.amount), "Amount type not in range" + dump)
		end
	end
end
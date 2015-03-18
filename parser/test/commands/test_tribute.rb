require_relative '../../../parser/structures/body/tribute'

require_relative '../test_helper'

class TestTribute < MiniTest::Test
  def setup
    @files = Dir.glob(__dir__ + '/../fixtures/tribute/*.dump')
  end
	
	def test_structure
		Dir.glob(__dir__ + '/../parser/data/tribute/*.dump') do |dump|
			io = File.open(dump)
			struct = Tribute.read(io)
			
			# player id range [1;8]
			assert((1..8).member?(struct.player_id_from), "Player ID out of range [1;8]: " + struct.player_id_from.to_s) 
			assert((1..8).member?(struct.player_id_to), "Player ID out of range [1;8]: " + struct.player_id_to.to_s)
			# tributes must be sent from and to different players
			refute_equal(struct.player_id_to, struct.player_id_from, "Player IDs from and to may not be equal") 		
			# resource range [0;3] (excluding gold)
			assert((0..3).member?(struct.resource_type), "Resource type not in range" + dump) 
			# market fee range [0;1]
			assert((0..1).member?(struct.fee), "Market fee not in range" + dump)
			# amount range
			assert((1..9999).member?(struct.amount), "Amount type not in range" + dump)
		end
	end
end
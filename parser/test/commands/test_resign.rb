require_relative '../../../parser/structures/body/resign'

require_relative '../test_helper'

class TestResign < MiniTest::Test
  def setup
    @files = Dir.glob(__dir__ + '/../fixtures/resign/*.dump')
  end
	
	def test_structure
		Dir.glob(__dir__ + '/../parser/data/resign/*.dump') do |dump|
			io = File.open(dump)
			struct = Resign.read(io)
			
			assert((1..8).member?(struct.player_id), "Player id not in range: " + struct.player_id.to_s)
			assert((1..8).member?(struct.player_id), "Player number not in range: " + struct.player_id.to_s) 
			assert((0..1).member?(struct.zero), "Last byte not zero!" + dump) # manchmal auch 1, vll wenn jemand dropped/timeout? immer nur wenn resign von einem player öfter vorkommt, network server host?
		end
	end
end
require 'minitest/autorun'
require 'bindata'
require '../parser/commands/buy'

class TestBuy < MiniTest::Unit::TestCase
	
	def test_structure
		Dir.glob(__dir__ + '/../parser/data/buy/*.dump') do |dump|
			io = File.open(dump)
			struct = Buy.read(io)
			
			assert((1..8).member?(struct.player_id), "Player id not in range: " + struct.player_id.to_s) 		
			assert((0..4).member?(struct.resource_type), "Resource type not in range" + dump) 
			assert((0..9999).member?(struct.amount), "Amount type not in range" + dump)
			assert_equal(0, struct.zero, "Last 4 Bytes not zero" + struct.zero.to_s)
			puts struct.price1.to_s
			puts struct.price2.to_s
			
		end
	end
end
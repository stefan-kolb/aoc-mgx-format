require_relative '../../../parser/lib/aoc-mgx/body/flare'

require_relative '../test_helper'

class TestFlare < MiniTest::Test
  def setup
    @files = Dir.glob(__dir__ + '/../fixtures/flare/*.dump')
  end
	
	def test_structure
		Dir.glob(__dir__ + '/../parser/data/flare/*.dump') do |dump|
			io = File.open(dump)
			struct = Flare.read(io)
			
			# int8 :zero1
			assert(struct.zero1.zero?, "zero1 not zero: " + struct.zero1.to_s + " " + dump)
			#int8 :zero2
			assert(struct.zero2.zero?, "zero2 not zero: " + struct.zero2.to_s + " " + dump)
			#int8 :zero3
			assert(struct.zero3.zero?, "zero3 not zero: " + struct.zero3.to_s + " " + dump)
			# constant = 0xFFFFFFFF
			assert_equal(struct.const, -1, "Constant not 0xFFFFFFFF" + dump) 
			struct.send_to_player.each_with_index do |to,index|
				if index == 0
					assert(0 == to, "Error: Never send flare to gaia")
				end
				assert((0..1).member?(to), "array structure not correct")
			end
			#int8 :zero4
			assert(struct.zero4.zero?, "zero4 not zero: " + struct.zero4.to_s + " " + dump)
			#int8 :zero5
			assert(struct.zero5.zero?, "zero5 not zero: " + struct.zero5.to_s + " " + dump)
			#int8 :zero6
			assert(struct.zero6.zero?, "zero6 not zero: " + struct.zero6.to_s + " " + dump)
			#float :x_coordinate
			#float :y_coordinate
			# player id range [1;8]
			assert((1..8).member?(struct.player_id), "Player ID out of range [1;8]: " + struct.player_id.to_s + dump)
			# player number range [1;8]
			#assert((1..8).member?(struct.player_number), "Player number out of range [1;8]: " + struct.player_number.to_s + dump)
			#int8 :zero7
			#assert(struct.zero7.zero?, "zero7 not zero: " + struct.zero7.to_s + " " + dump)
			#int8 :zero8
			#assert(struct.zero8.zero?, "zero8 not zero: " + struct.zero8.to_s + " " + dump)
		end
	end
end
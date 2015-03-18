require_relative '../../../parser/structures/body/townbell'

require_relative '../test_helper'

class TestTownbell < MiniTest::Test
  def setup
    @files = Dir.glob(__dir__ + '/../fixtures/townbell/*.dump')
  end
	
	def test_structure
		Dir.glob(__dir__ + '/../parser/data/townbell/*.dump') do |dump|
			io = File.open(dump)
			struct = Townbell.read(io)
			
			# zero[3]
			assert(struct.zero.zero?, "First three bytes are not zero: " + struct.zero.to_s)
			# object id
			# active { 0,1}
			assert((0..1).member?(struct.active), "Active not 0 or 1: " + struct.active.to_s + dump)
		end
	end
end
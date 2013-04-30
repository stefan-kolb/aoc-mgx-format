require 'minitest/autorun'
require 'bindata'
require '../parser/commands/stop'

class TestStop < MiniTest::Unit::TestCase
	
	def test_structure
		Dir.glob(__dir__ + '/../parser/data/stop/*.dump') do |dump|
			io = File.open(dump)
			struct = Stop.read(io)
			
			assert((1..40).member?(struct.selected_count), "Selected count not in range 1..40: " + dump) 
			#assert(struct.obj_id.nonzero?, "Obj ID zero: " + dump) 
		end
	end
end
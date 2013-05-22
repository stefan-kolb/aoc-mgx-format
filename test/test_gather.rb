require 'minitest/autorun'
require 'bindata'
require_relative '../parser/commands/gather'

class TestGather < MiniTest::Unit::TestCase
	
	def test_structure
		Dir.glob(__dir__ + '/../parser/data/gather/*.dump') do |dump|
			io = File.open(dump)
			struct = Gather.read(io)
			
			# selected count range [1;40]
			assert((1..40).member?(struct.selected_count), "Cannot select more than 40 units: " + struct.selected_count.to_s)
			# int16 :zero
			assert(struct.zero.zero?, "Zero not zero!" + dump)
			# int32 :target_id
			# int32 :target_type
			# float :x_coordinate
			# float :y_coordinate
			# array :objects, :type => :int32, :initial_length => :selected_count
		end
	end
end
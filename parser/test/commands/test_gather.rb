require_relative '../../../parser/lib/aoc-mgx/body/gather'

require_relative '../test_helper'

class TestGather < MiniTest::Test
  def setup
    @files = Dir.glob(__dir__ + '/../fixtures/gather/*.dump')
  end
	
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
	
	def test_length
		Dir.glob(__dir__ + '/../parser/data/gather/*.dump') do |dump|
			io = File.open(dump)
			struct = Gather.read(io)
			expected = (4*32+8+16+ struct.selected_count * 32)
			is = File.size(dump) *8
			
			assert(((expected == is) || (expected + 3*32) == is), "Expected length of " + expected.to_s + " but is " + is.to_s + " - file: " + dump)
		end
	end
end
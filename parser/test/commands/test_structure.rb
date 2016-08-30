require_relative '../../../parser/lib/aoc-mgx/body/unload'
require 'set'

require_relative '../test_helper'

class TestStructure < MiniTest::Test
  def setup
    @files = Dir.glob(__dir__ + '/../fixtures/structure/*.dump')
  end
	
	def test_structure
		@set = Set.new()
		
		Dir.glob(__dir__ + '/../parser/data/unload/*.dump') do |dump|
			io = File.open(dump)
			struct = Unload.read(io)
			
			@set.add(struct.unknown5)
		
		end
	end
	
	def teardown
		@set.each do |e|
			puts e
		end
	end
end
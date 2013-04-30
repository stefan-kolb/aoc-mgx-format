require 'minitest/autorun'
require 'bindata'
require '../parser/commands/unload'
require 'set'

class TestStructure < MiniTest::Unit::TestCase
	
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
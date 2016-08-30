require_relative '../../../parser/lib/aoc-mgx/body/attackground'

require_relative '../test_helper'

class TestTribute < MiniTest::Test
  def setup
    @files = Dir.glob(File.join(__dir__, '..', 'fixtures/attackground/*.dump'))
  end
	
	def test_structure
		@files.each do |dump|
			io = File.open(dump)
			struct = AttackGround.read(io)
		end
	end
end
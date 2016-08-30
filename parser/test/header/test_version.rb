require_relative '../test_helper'

class TestVersion < MiniTest::Test
  def setup
    @files = Dir.glob(File.join(__dir__, '..', 'fixtures/header/version/*.txt'))
  end
	
	def test_structure
		@files.each do |dump|
			io = File.open(dump)

			version?(io.readline(), dump)
		end
	end
end
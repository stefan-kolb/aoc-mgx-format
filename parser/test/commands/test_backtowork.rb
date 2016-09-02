require_relative '../../../parser/lib/aoc-mgx/actions/backtowork'

require_relative '../test_helper'

class TestTownbell < MiniTest::Test
  def setup
    @files = Dir.glob(File.join(__dir__, '..', 'fixtures/backtowork/*.dump'))
  end

  def test_structure
    @files.each do |dump|
      io = File.open(dump)
      struct = Backtowork.read(io)

      unused_bytes? struct.zero, dump
      # active
      #bool_value? struct.active, dump
    end
  end
end

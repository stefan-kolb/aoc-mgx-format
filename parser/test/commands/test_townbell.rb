require_relative '../../../parser/lib/aoc-mgx/actions/townbell'

require_relative '../test_helper'

class TestTownbell < MiniTest::Test
  def setup
    @files = Dir.glob(File.join(__dir__, '..', 'fixtures/7f/*.dump'))
  end

  def test_structure
    @files.each do |dump|
      io = File.open(dump)
      struct = Townbell.read(io)

      unused_bytes? struct.zero, dump
      bool_value? struct.active, dump
    end
  end
end

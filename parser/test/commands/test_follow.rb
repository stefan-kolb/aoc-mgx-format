require_relative '../../../parser/lib/aoc-mgx/actions/follow'

require_relative '../test_helper'

class TestFollow < MiniTest::Test
  def setup
    @files = Dir.glob(File.join(__dir__, '..', 'fixtures/follow/*.dump'))
  end

  def test_structure
    @files.each do |dump|
      io = File.open(dump)
      struct = Follow.read(io)

      unused_bytes? struct.zero, dump
      unit_selection? struct.selected_units_count, dump
      object? struct.followed_unit, dump
      # TODO units
    end
  end
end

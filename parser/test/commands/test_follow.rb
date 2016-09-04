require_relative '../../../parser/lib/aoc-mgx/actions/follow'

require_relative '../test_helper'

class TestFollow < MiniTest::Test
  def setup
    @files = Dir.glob(File.join(__dir__, '..', 'fixtures/14/*.dump'))
  end

  def test_structure
    @files.each do |dump|
      io = File.open(dump)
      struct = Follow.read(io)

      unit_selection? struct.selected_units_count, dump
      unused_bytes? struct.zero, dump
      object? struct.followed_unit, dump
      assert_equal(struct.selected_units_count, struct.units.length)
      struct.units { |id| object? id, dump }
    end
  end
end

require_relative '../../../parser/lib/aoc-mgx/actions/stance'

require_relative '../test_helper'

class TestStance < MiniTest::Test
  def setup
    @files = Dir.glob(File.join(__dir__, '..', 'fixtures/12/*.dump'))
  end

  def test_structure
    @files.each do |dump|
      io = File.open(dump)
      struct = Stance.read(io)

      unit_selection? struct.selected_units_count, dump
      stance? struct.stance, dump
      assert_equal(struct.selected_units_count, struct.unit_ids.length)
      struct.unit_ids { |id| object? id, dump }
    end
  end
end

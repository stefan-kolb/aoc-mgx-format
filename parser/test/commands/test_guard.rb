require_relative '../../../parser/lib/aoc-mgx/actions/guard'

require_relative '../test_helper'

class TestGuard < MiniTest::Test
  def setup
    @files = Dir.glob(File.join(__dir__, '..', 'fixtures/13/*.dump'))
  end

  def test_structure
    @files.each do |dump|
      io = File.open(dump)
      struct = Guard.read(io)

      unit_selection? struct.selected_units_count, dump
      unused_bytes? struct.zero, dump
      object? struct.guarded_unit, dump
      assert_equal(struct.selected_units_count, struct.units.length)
      struct.units { |id| object? id, dump }
    end
  end
end

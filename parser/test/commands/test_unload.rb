require_relative '../../../parser/lib/aoc-mgx/actions/unload'

require_relative '../test_helper'

class TestBuy < MiniTest::Test
  def setup
    @files = Dir.glob(File.join(__dir__, '..', 'fixtures/6f/*.dump'))
  end

  def test_structure
    @files.each do |dump|
      io = File.open(dump)
      struct = Unload.read(io)

      unit_selection? struct.selected_units_count, dump
      unused_bytes? struct.zero, dump
      assert(struct.obj_id.positive? || unused_flag?(struct.obj_id, dump))
      assert([1, 2, 4, 5].include?(struct.action), "No known garrison action type #{dump}")
      # puts struct.unknown1
      # puts struct.unknown3
      unused_flag? struct.const, dump
      assert_equal(struct.selected_units_count, struct.units.length)
      struct.units { |id| object? id, dump }
    end
  end
end

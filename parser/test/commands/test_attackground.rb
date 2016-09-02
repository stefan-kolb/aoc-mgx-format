require_relative '../../../parser/lib/aoc-mgx/actions/attackground'

require_relative '../test_helper'

class TestTribute < MiniTest::Test
  def setup
    @files = Dir.glob(File.join(__dir__, '..', 'fixtures/attackground/*.dump'))
  end

  def test_structure
    @files.each do |dump|
      io = File.open(dump)
      struct = AttackGround.read(io)

      unit_selection? struct.selected_units_count, dump
      assert(struct.zero.zero?, 'Bytes not unused')
      coordinate? struct.x_coordinate, dump
      coordinate? struct.y_coordinate, dump
      assert_equal(struct.selected_units_count, struct.unit_ids.size, 'Amount of unit IDs not equal to selection count')
    end
  end
end

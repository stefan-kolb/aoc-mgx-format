require_relative '../../../parser/lib/aoc-mgx/actions/attack'

require_relative '../test_helper'

class TestDelete < MiniTest::Test
  def setup
    @files = Dir.glob(File.join(__dir__, '..', 'fixtures/00/*.dump'))
  end

  def test_structure
    @files.each do |dump|
      io = File.open(dump)
      struct = Attack.read(io)

      player? struct.player_id, dump
      unused_bytes? struct.zero, dump
      assert(struct.target_id.positive? || struct.target_id == -1)
      unit_selection? struct.selected_units_count, dump
      unused_bytes? struct.zero2, dump
      coordinate? struct.x_coordinate, dump
      coordinate? struct.y_coordinate, dump
      assert_equal(struct.selected_units_count, struct.attacker_ids.length) unless struct.selected_units_count == -1
      struct.attacker_ids { |id| object? id, dump }
    end
  end
end

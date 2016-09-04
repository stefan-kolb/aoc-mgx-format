require_relative '../../../parser/lib/aoc-mgx/actions/formation'

require_relative '../test_helper'

class TestFollow < MiniTest::Test
  def setup
    @files = Dir.glob(File.join(__dir__, '..', 'fixtures/17/*.dump'))
  end

  def test_structure
    @files.each do |dump|
      io = File.open(dump)
      struct = Formation.read(io)

      unit_selection? struct.selected_units_count, dump
      player? struct.player_id, dump
      unused_bytes? struct.zero, dump
      formation? struct.formation, dump
      assert_equal(struct.selected_units_count, struct.unit_ids.length)
      struct.unit_ids { |id| object? id, dump }
    end
  end
end

require_relative '../../../parser/lib/aoc-mgx/actions/waypoint'

require_relative '../test_helper'

class TestDelete < MiniTest::Test
  def setup
    @files = Dir.glob(File.join(__dir__, '..', 'fixtures/10/*.dump'))
  end

  def test_structure
    @files.each do |dump|
      begin
      io = File.open(dump)
      struct = Waypoint.read(io)

      player? struct.player_id, dump
      unit_selection? struct.selected_units_count, dump
      # unused_bytes? struct.zero, dump
      # assert(struct.target_id.positive? || struct.target_id == -1)
      # unused_bytes? struct.zero2, dump
      #coordinate? struct.x_coordinate, dump
      #coordinate? struct.y_coordinate, dump
      #assert_equal(struct.selected_units_count, struct.units.length) unless struct.selected_units_count == -1
      #struct.units { |id| object? id, dump }
      rescue EOFError
        puts dump
        end
    end
  end
end

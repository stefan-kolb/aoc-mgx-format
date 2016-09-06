require_relative '../../../parser/lib/aoc-mgx/actions/stop'

require_relative '../test_helper'

class TestStop < MiniTest::Test
  def setup
    @files = Dir.glob(File.join(__dir__, '..', 'fixtures/01/*.dump'))
  end

  def test_structure
    @files.each do |dump|
      io = File.open(dump)
      struct = Stop.read(io)

      unit_selection? struct.selection_count, dump
      assert_equal(struct.selection_count, struct.obj_ids.length) unless struct.selection_count == -1
      struct.obj_ids { |id| object? id, dump }
    end
  end
end

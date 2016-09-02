require_relative '../../../parser/lib/aoc-mgx/actions/guard'

require_relative '../test_helper'

class TestGuard < MiniTest::Test
  def setup
    @files = Dir.glob(File.join(__dir__, '..', 'fixtures/guard/*.dump'))
  end

  def test_structure
    @files.each do |dump|
      io = File.open(dump)
      struct = Guard.read(io)

      unused_bytes? struct.zero, dump
      unit_selection? struct.selected_units_count, dump
      object? struct.guarded_unit, dump
      # TODO units
    end
  end
end

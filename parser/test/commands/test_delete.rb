require_relative '../../../parser/lib/aoc-mgx/actions/delete'

require_relative '../test_helper'

class TestDelete < MiniTest::Test
  def setup
    @files = Dir.glob(File.join(__dir__, '..', 'fixtures/delete/*.dump'))
  end

  def test_structure
    @files.each do |dump|
      io = File.open(dump)
      struct = Delete.read(io)

      unused_bytes? struct.zero, dump
      object? struct.obj_id, dump
      player? struct.player_id, dump
    end
  end
end

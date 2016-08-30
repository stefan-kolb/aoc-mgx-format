require_relative '../../../parser/lib/aoc-mgx/body/delete'

require_relative '../test_helper'

class TestDelete < MiniTest::Test
  def setup
    @files = Dir.glob(File.join(__dir__, '..', 'fixtures/delete/*.dump'))
  end

  def test_structure
    @files.each do |dump|
      io = File.open(dump)
      struct = Delete.read(io)

      assert_equal(0, struct.zero, 'Bytes not unused')
      # assert(struct.obj_id, "Gebäude id keine Nummer #{struct.obj_id.class}")
      player? struct.player_id, dump
    end
  end
end

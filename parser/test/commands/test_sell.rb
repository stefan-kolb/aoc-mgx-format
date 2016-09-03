require_relative '../../../parser/lib/aoc-mgx/actions/sell'

require_relative '../test_helper'

class TestSell < MiniTest::Test
  def setup
    @files = Dir.glob(File.join(__dir__, '..', 'fixtures/7a/*.dump'))
  end

  def test_structure
    @files.each do |dump|
      io = File.open(dump)
      struct = Sell.read(io)

      player? struct.player_id, dump
      resource? struct.resource_type, dump
      assert([1, 5].member?(struct.amount), "Amount not in range #{dump})")
      object? struct.obj_id, dump
    end
  end
end

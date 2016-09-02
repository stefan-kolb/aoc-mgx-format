require_relative '../../../parser/lib/aoc-mgx/actions/sell'

require_relative '../test_helper'

class TestSell < MiniTest::Test
  def setup
    @files = Dir.glob(File.join(__dir__, '..', 'fixtures/sell/*.dump'))
  end

  def test_structure
    @files.each do |dump|
      io = File.open(dump)
      struct = Sell.read(io)

      player? struct.player_id, dump
      resource? struct.resource_type, dump
      assert([1, 5].member?(struct.amount), "Amount type not in range #{dump})")
      assert(struct.zero?, 'Last bytes not unused')
    end
  end
end

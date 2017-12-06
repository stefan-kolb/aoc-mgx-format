require_relative '../../../parser/lib/aoc-mgx/actions/tribute'

require_relative '../test_helper'

class TestTribute < MiniTest::Test
  def setup
    @files = Dir.glob(File.join(__dir__, '..', 'fixtures/6c/*.dump'))
  end

  def test_structure
    @files.each do |dump|
      io = File.open(dump)
      struct = Tribute.read(io)

      player? struct.player_id_from, dump
      player? struct.player_id_to, dump
      refute_equal(struct.player_id_to, struct.player_id_from, 'Tributes must be sent from and to different players')
      assert((0..3).cover?(struct.resource_type), 'Resource range must be excluding gold')
      assert(struct.amount.positive?, 'Amount not positive')
      assert(struct.fee.between?(0.0, 1.0), 'Market fee not in range')
    end
  end
end

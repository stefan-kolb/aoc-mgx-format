require_relative '../../../parser/lib/aoc-mgx/actions/flare'

require_relative '../test_helper'

class TestFlare < MiniTest::Test
  def setup
    @files = Dir.glob(File.join(__dir__, '..', 'fixtures/73/*.dump'))
  end

  def test_structure
    @files.each do |dump|
      io = File.open(dump)
      struct = Flare.read(io)

      unused_bytes? struct.zero, dump
      # constant = 0xFFFFFFFF
      assert_equal(struct.const, -1, 'Constant not 0xFFFFFFFF' + dump)
      struct.send_to_player.each_with_index do |to, index|
        assert(to.zero?, 'Error: Never send flare to gaia') if index.zero?
        assert((0..1).member?(to), 'array structure not correct')
      end
      unused_bytes? struct.zero2, dump
      coordinate? struct.x_coordinate, dump
      coordinate? struct.y_coordinate, dump
      player? struct.player_id, dump
      player? struct.player_number, dump
      unused_bytes? struct.zero3, dump
    end
  end
end

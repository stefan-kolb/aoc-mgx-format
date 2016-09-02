require_relative '../../../parser/lib/aoc-mgx/actions/unload'

require_relative '../test_helper'

class TestBuy < MiniTest::Test
  def setup
    @files = Dir.glob(File.join(__dir__, '..', 'fixtures/unload/*.dump'))
  end

  def test_structure
    @files.each do |dump|
      io = File.open(dump)
      struct = Unload.read(io)

      #player? struct.player_id, dump
      unused_bytes? struct.zero, dump
      #assert_equal(-1, struct.const, "No const #{dump}")
      #coordinate? struct.x_coordinate, dump
      #coordinate? struct.y_coordinate, dump
    end
  end
end

require_relative '../../../parser/lib/aoc-mgx/actions/resign'

require_relative '../test_helper'

class TestResign < MiniTest::Test
  def setup
    @files = Dir.glob(File.join(__dir__, '..', 'fixtures/0b/*.dump'))
  end

  def test_structure
    @files.each do |dump|
      io = File.open(dump)
      struct = Resign.read(io)

      player? struct.player_id, dump
      player? struct.player_number, dump
      bool_value? struct.disconnect, dump
    end
  end
end

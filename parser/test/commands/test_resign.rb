require_relative '../../../parser/lib/aoc-mgx/body/resign'

require_relative '../test_helper'

class TestResign < MiniTest::Test
  def setup
    @files = Dir.glob(File.join(__dir__, '..', 'fixtures/resign/*.dump'))
  end

  def test_structure
    @files.each do |dump|
      io = File.open(dump)
      struct = Resign.read(io)

      player? struct.player_id, dump
      player? struct.player_number, dump
      assert((0..1).member?(struct.zero), 'Last byte not zero!' + dump) # manchmal auch 1, vll wenn jemand dropped/timeout? immer nur wenn resign von einem player öfter vorkommt, network server host?
    end
  end
end

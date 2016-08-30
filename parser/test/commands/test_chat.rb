require_relative '../../../parser/structures/body/chat'

require_relative '../test_helper'

class TestChat < MiniTest::Test
  def setup
    @files = Dir.glob(File.join(__dir__, '..', 'fixtures/chat/*.dump'))
  end
	
	def test_structure
		@files.each do |dump|
			io = File.open(dump)
			struct = Chat.read(io)
			
			assert(struct.chat_len.nonzero?, "Chat length is null." + dump) 
			assert_equal("@", struct.message[0], "First char of message not @" + dump)
			assert_equal("#", struct.message[1], "Second char of message not #" + dump)
			player_or_gaia? struct.message[2], dump
		end
	end
end
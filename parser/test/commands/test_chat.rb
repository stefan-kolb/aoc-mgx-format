require_relative '../../../parser/structures/body/chat'

require_relative '../test_helper'

class TestChat < MiniTest::Test
  def setup
    @files = Dir.glob(__dir__ + '/../fixtures/chat/*.dump')
  end
	
	def test_structure
		Dir.glob(__dir__ + '/../parser/data/chat/*.dump') do |dump|
			io = File.open(dump)
			struct = Chat.read(io)
			
			assert(struct.chat_len.nonzero?, "Chat length is null." + dump) 
			assert_equal("@", struct.message[0], "First char of message not @" + dump)
			assert_equal("#", struct.message[1], "Second char of message not #" + dump)
			assert_match(/[0-8]/, struct.message[2], "Third char of message not a player number or gaia" + dump)
		end
	end
end
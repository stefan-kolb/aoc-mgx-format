require 'bindata'

class Chat < BinData::Record
  endian :little
	
	int32 :chat_len
	stringz :message, :length => :chat_len

  def to_s
    "Chat Message: #{message}"
  end
end
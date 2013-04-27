require 'bindata'

class Chat < BinData::Record
  endian :little
	
	int32 :chat_len
	stringz :message, :length => :chat_len
end
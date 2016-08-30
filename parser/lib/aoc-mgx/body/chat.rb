require 'bindata'

class Chat < Mgx::Record
  int32 :chat_len
  stringz :message, length: :chat_len

  def to_s
    "Chat Message: #{message}"
  end
end

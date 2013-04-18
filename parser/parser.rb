require './commands/move'
require './commands/gamestart'
require './commands/chat'
require 'bindata'

class Header < BinData::Record
	endian :little
	
  int32 :header_len
	skip :length => lambda { header_len - 4 }
end

class Command < BinData::Record
	endian :little
	
  int32 :type
end

class Sync < BinData::Record
	endian :little
	
	int32 :time
	int32 :unknown
	skip :length => 28, :onlyif => lambda { unknown == 0 }
	skip :length => 12
end

class Action < BinData::Record
	endian :little
	
	int32 :len
	skip :length => lambda { len + 4 }
end

io = File.open('rec.mgx')
Header.read(io)

until BinData::Record::count_bytes_remaining == 0 do
	ope = Command.read(io)
	
	if ope.type == 4
		puts "4"
		vier = Command.read(io)
		if vier.type == 0x000001F4
			puts "Gamestart"
			Gamestart.read(io)
		elsif vier.type == -1
			puts "Chat"
			c = Chat.read(io)
			puts c.message
			gets
		else
			puts "Unknown 4"
			puts vier.type
			gets
		end
	elsif ope.type == 2
		puts "2"
		Sync.read(io)
	elsif ope.type == 1
		puts "1"
		Action.read(io)
	else
		puts "?"
		gets
	end
end

# wow its like 100000000 times shorter than the old java version
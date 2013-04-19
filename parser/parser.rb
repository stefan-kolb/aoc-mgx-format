require './commands/move'
require './commands/gamestart'
require './commands/chat'
require './commands/commands'

require 'bindata'
require 'zlib'

class Header < BinData::Record
	endian :little
	
  int32 :header_len
	int32 :next_header
	string :data, :length => lambda { header_len - 8 }
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
	
	uint8 :cmd

  #choice :action, :selection => :cmd do
  #  move Commands::MOVE
  #end
	#skip :length => 4
	string :data, :length => lambda { len + 3 }
end

io = File.open('rec.mgx')
head_comp = Header.read(io)
#uncompressed_data = Zlib::Inflate.new(-Zlib::MAX_WBITS).inflate(head_comp.data)
#puts uncompressed_data

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
		Sync.read(io)
	elsif ope.type == 1
		a = Action.read(io)
		
		case a.cmd
		when Commands::ATTACK
			puts "Attack"
		when Commands::MOVE
			puts "Move"
		when 	Commands::RESIGN
			puts Commands::RESIGN
			puts "Resign"
		when Commands::STOP
			puts "Stop"
		when Commands::DELETE
			puts "Delete"
		when Commands::GROUNDATTACK
			puts "Groundattack"
		when Commands::TRIBUTE
			puts "Tribute"
		when Commands::UNGARRISON
			puts "UNgarrison"
		when Commands::SELL
			puts "Sell"
		when Commands::BUY
			puts "Buy"
		when Commands::TOWNBELL
			puts "Townbell"
		when Commands::AGGRO
			puts "Aggro"
		when Commands::GUARD
			puts "Guard"
		when Commands::FOLLOW
			puts "Follow"
		when Commands::PATROL
			puts "Patrol"
		when Commands::FORMATION
			puts "Formation"
		when Commands::TECH
			puts "Tech"
		when Commands::BUILD
			puts "Build"
		when Commands::GAMESPEED
			puts "Gamespeed"
		when Commands::FLARE
			puts "Flare"
		when Commands::GARRISON
			puts "Garrison"
		when Commands::TRAIN
			puts "Train"
		when Commands::GATHER
			puts "Gather"
		when Commands::BACKTOWORK
			puts "Backtowork"
		else
			puts "You gave me #{a.cmd} -- I have no idea what to do with that."
			gets
		end
	else
		puts "? error!"
		gets
	end
end

# wow its like 100000000 times shorter than the old java version
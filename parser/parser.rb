require 'require_all'
require 'bindata'
require 'zlib'

require_all 'commands'

# temporary disable stdout
#module Kernel; def puts(*args) end end

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
	string :data, :length => lambda { len - 1}
	skip :length => 4
end

class Rem < BinData::Record
  count_bytes_remaining :remi
end

count = 1

# create debug dump dirs
Commands.constants.each do |c|
  Dir.mkdir("data/#{c}") unless File.directory?("data/#{c}")
end

Dir.glob('recs/*.mgx') do |file|
  # do work

time = 0
io = File.open(file)
head_comp = Header.read(io)
#uncompressed_data = Zlib::Inflate.new(-Zlib::MAX_WBITS).inflate(head_comp.data)
#puts uncompressed_data

until Rem.read(io).remi == 0 do
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
			out = File.new("data/chat/#{ope.type}" << "_" << count.to_s << ".dump", "w+")
			c.write(out)
			count += 1
		else
			puts "Unknown 4"
			puts vier.type
			gets
		end
	elsif ope.type == 2
		t = Sync.read(io)
		time += t.time
	elsif ope.type == 1
		a = Action.read(io)
		
		case a.cmd
		when Commands::ATTACK
			puts "Attack"
		when Commands::MOVE
			puts "Move"
		when 	Commands::RESIGN
			puts "Resign"
			out = File.new("data/resign/#{a.cmd}" << "_" << count.to_s << ".dump", "w+")
			c = Resign.read(a.data)
			c.write(out)
			count += 1
		when Commands::STOP
			puts "Stop"
			out = File.new("data/stop/#{a.cmd}" << "_" << count.to_s << ".dump", "w+")
			c = Stop.read(a.data)
			c.write(out)
			count += 1			
		when Commands::DELETE
			puts "Delete"
			out = File.new("data/delete/#{a.cmd}" << "_" << count.to_s << ".dump", "w+")
			c = Delete.read(a.data)
			c.write(out)
			count += 1
		when Commands::ATTACKGROUND
			puts "Groundattack"
			out = File.new("data/attackground/#{a.cmd}" << "_" << count.to_s << ".dump", "w+")
			c = AttackGround.read(a.data)
			c.write(out)
			count += 1
		when Commands::TRIBUTE
			puts "Tribute"
			out = File.new("data/tribute/#{a.cmd}" << "_" << count.to_s << ".dump", "w+")
			c = Tribute.read(a.data)
			c.write(out)
			count += 1
		when Commands::UNLOAD
			puts "Unload"
			out = File.new("data/unload/#{a.cmd}" << "_" << count.to_s << ".dump", "w+")
			c = Unload.read(a.data)
			c.write(out)
			count += 1
		when Commands::SELL
			puts "Sell"
			out = File.new("data/sell/#{a.cmd}" << "_" << count.to_s << ".dump", "w+")
			c = Sell.read(a.data)
			c.write(out)
			count += 1
		when Commands::BUY
			puts "Buy"
			out = File.new("data/buy/#{a.cmd}" << "_" << count.to_s << ".dump", "w+")
			c = Buy.read(a.data)
			c.write(out)
			count += 1
		when Commands::TOWNBELL
			puts "Townbell"
			out = File.new("data/townbell/#{a.cmd}" << "_" << count.to_s << ".dump", "w+")
			out.write(a.data)
			count += 1	
		when Commands::AGGRO
			puts "Aggro"
		when Commands::GUARD
			puts "Guard"
			out = File.new("data/guard/#{a.cmd}" << "_" << count.to_s << ".dump", "w+")
			c.write(out)
			count += 1
		when Commands::FOLLOW
			puts "Follow"
			out = File.new("data/follow/#{a.cmd}" << "_" << count.to_s << ".dump", "w+")
			c.write(out)
			count += 1
		when Commands::PATROL
			puts "Patrol"
		when Commands::FORMATION
			puts "Formation"
		when Commands::TECH
			puts "Tech"
		when Commands::BUILD
			puts "Build"
		when Commands::WALL
			puts "Waller :("
			out = File.new("data/wall/#{a.cmd}" << "_" << count.to_s << ".dump", "w+")
			out.write(a.data)
			count += 1			
		when Commands::GAMESPEED
			puts "Gamespeed"
		when Commands::FLARE
			puts "Flare"
			out = File.new("data/flare/#{a.cmd}" << "_" << count.to_s << ".dump", "w+")
			out.write(a.data)
			count += 1
		when Commands::GARRISON
			puts "Garrison"
		when Commands::TRAIN
			puts "Train"
		when Commands::GATHER
			puts "Gather"
			out = File.new("data/gather/#{a.cmd}" << "_" << count.to_s << ".dump", "w+")
			out.write(a.data)
			count += 1	
		when Commands::BACKTOWORK
			puts "Backtowork"
		when Commands::WAYPOINT
			puts "Waypoint"
			out = File.new("data/waypoint/#{a.cmd}" << "_" << count.to_s << ".dump", "w+")
			out.write(a.data)
			count += 1
		when Commands::MULTISAVE
			puts "Multiplayer Save"
		else
			puts "You gave me #{a.cmd} -- I have no idea what to do with that."
			puts (time / 1000 / 60).to_s << "." << (time / 1000 % 60).to_s
			out = File.new("unknown/#{a.cmd}" << "_" << count.to_s << ".dump", "w+")
			a.write(out)
			out.close
			count += 1
			#gets
		end
	else
		puts "? error!" << file.basename
		gets
	end
	
end

end
require 'require_all'
require 'bindata'
require 'zlib'

require_all 'lib/aoc-mgx/body'

require_relative 'lib/aoc-mgx/header/recorded_game'

# temporary disable stdout
# module Kernel; def puts(*args) end end

class Header < BinData::Record
  endian :little

  int32 :header_len
  int32 :next_header
  string :data, length: -> { header_len - 8 }
end

class Command < BinData::Record
  endian :little

  int32 :type
end

class Sync < BinData::Record
  endian :little

  int32 :time
  int32 :unknown
  skip length: 28, onlyif: -> { unknown.zero? }
  skip length: 12
end

class Action < BinData::Record
  endian :little

  int32 :len

  uint8 :cmd

  # choice :action, :selection => :cmd do
  #  move Commands::MOVE
  # end
  # skip :length => 4
  string :data, length: -> { len - 1 }
  skip length: 4
end

class Rem < BinData::Record
  count_bytes_remaining :remi
end

count = 1

# create debug dump dirs
FIXTURES = 'test/fixtures'.freeze
Commands.constants.each do |c|
  Dir.mkdir("#{FIXTURES}/#{c}") unless File.directory?("#{FIXTURES}/#{c}")
end

Dir.glob('recs/aoc/*.*') do |file|
  # do work

  time = 0
  io = File.open(file, 'rb')
  head_comp = Header.read(io)
  uncompressed_data = Zlib::Inflate.new(-Zlib::MAX_WBITS).inflate(head_comp.data)
  # puts uncompressed_data
  # BinData::trace_reading do
  header = RecordedGame.read(uncompressed_data)
  # end
  # out = File.new("#{FIXTURES}/header/version/" << count.to_s << ".txt", "wb+")
  # File.write(out, header.game_version)
  # count += 1
  puts header.game_version
  puts header.patch_version
  puts header.game_speed1
  puts header.game_speed2
  puts header.rec_owner
  puts header.player_count
  puts header.map_size_x
  puts header.map_size_y
  puts header.unknown_num
  puts header.map_size_x2
  puts header.map_size_y2
  puts header.trigger_info.each do |t|
    puts t.description
    puts t.text
  end
  puts header.pregame_chat.each, &:message
  out = File.new("#{FIXTURES}/header/" << count.to_s << '.dump', 'wb+')
  header.write(out)
  count += 1

  # until Rem.read(io).remi == 0 do
  # 	ope = Command.read(io)
  #
  # 	if ope.type == 4
  # 		puts "4"
  # 		vier = Command.read(io)
  # 		if vier.type == 0x000001F4
  # 			puts "Gamestart"
  # 			Gamestart.read(io)
  # 		elsif vier.type == -1
  # 			c = Chat.read(io)
  # 			out = File.new("#{FIXTURES}/chat/#{ope.type}" << "_" << count.to_s << ".dump", "wb+")
  # 			c.write(out)
  #       puts c
  # 			count += 1
  # 		else
  # 			puts "Unknown 4"
  # 			puts vier.type
  # 			gets
  # 		end
  # 	elsif ope.type == 2
  # 		t = Sync.read(io)
  # 		time += t.time
  # 	elsif ope.type == 1
  # 		a = Action.read(io)
  #
  # 		case a.cmd
  # 		when Commands::ATTACK
  # 			puts "Attack"
  # 		when Commands::MOVE
  # 			puts "Move"
  # 		when 	Commands::RESIGN
  # 			out = File.new("#{FIXTURES}/resign/#{a.cmd}" << "_" << count.to_s << ".dump", "wb+")
  # 			c = Resign.read(a.data)
  # 			out.write(a.data)
  #       puts c
  # 			count += 1
  # 		when Commands::STOP
  # 			puts "Stop"
  # 			out = File.new("#{FIXTURES}/stop/#{a.cmd}" << "_" << count.to_s << ".dump", "wb+")
  # 			c = Stop.read(a.data)
  # 			c.write(out)
  # 			count += 1
  # 		when Commands::DELETE
  # 			puts "Delete"
  # 			out = File.new("#{FIXTURES}/delete/#{a.cmd}" << "_" << count.to_s << ".dump", "wb+")
  # 			c = Delete.read(a.data)
  # 			c.write(out)
  # 			count += 1
  # 		when Commands::ATTACKGROUND
  # 			puts "Groundattack"
  # 			out = File.new("#{FIXTURES}/attackground/#{a.cmd}" << "_" << count.to_s << ".dump", "wb+")
  # 			c = AttackGround.read(a.data)
  # 			c.write(out)
  # 			count += 1
  # 		when Commands::TRIBUTE
  # 			puts "Tribute"
  # 			out = File.new("#{FIXTURES}/tribute/#{a.cmd}" << "_" << count.to_s << ".dump", "wb+")
  # 			c = Tribute.read(a.data)
  # 			c.write(out)
  # 			count += 1
  # 		when Commands::UNLOAD
  # 			puts "Unload"
  # 			out = File.new("#{FIXTURES}/unload/#{a.cmd}" << "_" << count.to_s << ".dump", "wb+")
  # 			c = Unload.read(a.data)
  # 			c.write(out)
  # 			count += 1
  # 		when Commands::SELL
  # 			puts "Sell"
  # 			out = File.new("#{FIXTURES}/sell/#{a.cmd}" << "_" << count.to_s << ".dump", "wb+")
  # 			c = Sell.read(a.data)
  # 			c.write(out)
  # 			count += 1
  # 		when Commands::BUY
  # 			puts "Buy"
  # 			out = File.new("#{FIXTURES}/buy/#{a.cmd}" << "_" << count.to_s << ".dump", "wb+")
  # 			c = Buy.read(a.data)
  # 			c.write(out)
  # 			count += 1
  # 		when Commands::TOWNBELL
  # 			puts "Townbell"
  # 			out = File.new("#{FIXTURES}/townbell/#{a.cmd}" << "_" << count.to_s << ".dump", "wb+")
  # 			out.write(a.data)
  # 			count += 1
  # 		when Commands::AGGRO
  # 			puts "Aggro"
  # 		when Commands::GUARD
  # 			puts "Guard"
  # 			out = File.new("#{FIXTURES}/guard/#{a.cmd}" << "_" << count.to_s << ".dump", "wb+")
  # 			c.write(out)
  # 			count += 1
  # 		when Commands::FOLLOW
  # 			puts "Follow"
  # 			out = File.new("data/follow/#{a.cmd}" << "_" << count.to_s << ".dump", "wb+")
  # 			c.write(out)
  # 			count += 1
  # 		when Commands::PATROL
  # 			puts "Patrol"
  # 		when Commands::FORMATION
  # 			puts "Formation"
  # 		when Commands::TECH
  # 			puts "Tech"
  # 		when Commands::BUILD
  # 			puts "Build"
  # 		when Commands::WALL
  # 			puts "Waller :("
  # 			out = File.new("#{FIXTURES}/wall/#{a.cmd}" << "_" << count.to_s << ".dump", "wb+")
  # 			out.write(a.data)
  # 			count += 1
  # 		when Commands::GAMESPEED
  # 			puts "Gamespeed"
  # 		when Commands::FLARE
  # 			puts "Flare"
  # 			out = File.new("#{FIXTURES}/flare/#{a.cmd}" << "_" << count.to_s << ".dump", "wb+")
  # 			out.write(a.data)
  # 			count += 1
  # 		when Commands::GARRISON
  # 			puts "Garrison"
  # 		when Commands::TRAIN
  # 			puts "Train"
  # 		when Commands::GATHER
  # 			puts "Gather"
  # 			out = File.new("#{FIXTURES}/gather/#{a.cmd}" << "_" << count.to_s << ".dump", "wb+")
  # 			out.write(a.data)
  # 			count += 1
  # 		when Commands::BACKTOWORK
  # 			puts "Backtowork"
  # 		when Commands::WAYPOINT
  # 			puts "Waypoint"
  # 			out = File.new("#{FIXTURES}/waypoint/#{a.cmd}" << "_" << count.to_s << ".dump", "wb+")
  # 			out.write(a.data)
  # 			count += 1
  # 		when Commands::MULTISAVE
  # 			puts "Multiplayer Save"
  # 		else
  # 			puts "You gave me #{a.cmd} -- I have no idea what to do with that."
  # 			puts (time / 1000 / 60).to_s << "." << (time / 1000 % 60).to_s
  # 			out = File.new("unknown/#{a.cmd}" << "_" << count.to_s << ".dump", "wb+")
  # 			a.write(out)
  # 			out.close
  # 			count += 1
  # 			#gets
  # 		end
  # 	else
  # 		puts "? error!" << file.basename
  # 		gets
  # 	end
  # end
end

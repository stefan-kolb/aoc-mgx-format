require 'require_all'
require 'bindata'
require 'zlib'
require 'hitimes'

require_all 'lib/aoc-mgx/actions'
require_all 'lib/aoc-mgx/body'

require_relative 'lib/aoc-mgx/mgx_record'
require_relative 'lib/aoc-mgx/header/recorded_game'

# temporary disable stdout
# module Kernel; def puts(*args) end end

class Header < Mgx::Record
  int32 :len
  int32 :next_header
  string :data, length: -> { len - 8 }
end

class Message < Mgx::Record
  int32 :tag

  choice :action, selection: :tag do
    gamestart 0x000001F4
    chat -1
  end
end

class Synch < Mgx::Record
  # ms of game time
  int32 :interval
  int32 :unknown
  # Each client would also measure a round trip ‘ping time’ periodically from it to the
  # other clients. It would also send the longest average ping time it was seeing to
  # any of the clients with the ‘Turn Done’ message. (Total of 2 bytes was used for speed control)
  # Each turn the designated host would analyze the ‘done’ messages, figure out a
  # target frame rate and adjustment for Internet latency. The host would then send
  # out a new frame rate and communications turn length to be used.
  # maybe unknown is synch to self? 0x03 always at the end
  # other player synch? cuz max 7 others array is [7]
  # random numbers were seeded and synchronized as well
  # speed control for terms?
  array :synch_data, type: :int32, initial_length: 7, onlyif: -> { unknown.zero? }
  float :view_x
  float :view_y
  int32 :player_id
end

class ActionCmd < Mgx::Record
  int32 :len
  uint8 :tag

  choice :action, selection: :tag,
                  choices: {
                    Commands::RESIGN => :resign,
                    # Commands::ATTACKGROUND => :attack_ground,
                    # Commands::BUY => :buy,
                    # Commands::DELETE => :delete,
                    # Commands::FLARE => :flare,
                    # Commands::FORMATION => :formation,
                    Commands::GATHER => Unknown.new(data_len: -> { len - 1 }),
                    # Commands::MOVE => :move,
                    # Commands::SELL => :sell,
                    # Commands::STOP => :stop,
                    Commands::TOWNBELL => :townbell,
                    Commands::BACKTOWORK => Unknown.new(data_len: -> { len - 1 }),
                    # Commands::TRIBUTE => :tribute,
                    # Commands::UNLOAD => :unload,
                    # Commands::WALL => :wall,
                    :default => Unknown.new(data_len: -> { len - 1 })
                  }
  # maybe end synch? always 150ms (action window?!) ahead of recent game time
  # So commands issued during turn 1000 would be scheduled for execution during
  # turn 1002. On turn 1001 commands that were issued on turn 0999 would be executed
  # exec at or done at?
  int32 :exec_at
end

class Remaining < Mgx::Record
  # file end, same length 2 bytes + 2 zero + tag, tag? or just 2 ints for what?
  # onlyif you win and others resign?!
    count_bytes_remaining :rem
    string :data, length: -> { rem }
  end

  class Command < Mgx::Record
    int32 :tag

    choice :action, selection: :tag do
      action_cmd 1
      synch 2
      message 4
      remaining :default
  end
end



class Rem < BinData::Record
  count_bytes_remaining :remi
end

def dump(file, data)
  File.open(file, 'wb+') do |out|
    out.write(data)
  end
end

count = 1

# create debug dump dirs
FIXTURES = 'test/fixtures'.freeze
Commands.constants.each do |c|
  Dir.mkdir("#{FIXTURES}/#{c}") unless File.directory?("#{FIXTURES}/#{c}")
end

duration = Hitimes::Interval.measure do
  Dir.glob('recs/aoc/*.*') do |file|
    # do work
    # TODO: maybe some synch infos are also in gamestart
    gametime = 0 # TODO: maybe some gamestart info is missing and it does not start at 0

    File.open(file, 'rb') do |io|
      head_comp = Header.read(io)
      #uncompressed_data = Zlib::Inflate.new(-Zlib::MAX_WBITS).inflate(head_comp.data)
      # out = File.new("#{FIXTURES}/header/" << File.basename(file) << ".dump", "wb+")
      # File.write(out, uncompressed_data)
      # out.close
      #puts uncompressed_data
      # BinData::trace_reading do
      #header = RecordedGame.read(uncompressed_data)
      # end

      # count += 1
      #   puts header.game_version
      #   puts header.patch_version
      #   puts header.game_speed1
      #   puts header.game_speed2
      #   puts header.rec_owner
      #   puts header.player_count
      #   puts header.map_size_x
      #   puts header.map_size_y
      #   puts header.unknown_num
      #   puts header.map_size_x2
      #   puts header.map_size_y2
      #   puts header.trigger_info.each do |t|
      #     puts t.description
      #     puts t.text
      #   end
      #   out = File.new("#{FIXTURES}/header/" << count.to_s << '.dump', 'wb+')
      #   header.write(out)
      #   count += 1

      until Rem.read(io).remi.zero?
        # BinData::trace_reading do
        ope = Command.read(io)
        if ope.tag == 2
          gametime += ope.action.interval
          if ope.action.unknown.zero?
            #puts ope.action.synch_data.inspect
            # gets
          end
        end

        # unless [1,2,4].include?(ope.action.selection)
        #   puts ope.tag
        #   dump("tag#{count}", ope.tag)
        #   dump(count, ope.action.data)
        # end

        if ope.action.respond_to?(:tag) && ope.action.tag == Commands::GAMESPEED
          dump("#{FIXTURES}/gamespeed/#{count}.dump", ope.action.action.data)
        end
        #puts "Time #{gametime}"
        # specify command types that should be logged
        puts ope.inspect if [].include?(ope.tag)
        # if ope.tag == 1
        #  puts "Cmd Synch #{ope.action.exec_at}"
        # end
        # end
      end
    end

    count += 1
  end
end

puts duration
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
# end

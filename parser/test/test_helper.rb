require 'minitest/autorun'
require 'bindata'

def player_or_gaia?(data, file)
  assert_match(/[0-8]/, data, "Third char of message not a player number or gaia (#{file})")
end

def player?(data, file)
  assert((1..8).member?(data), "Player number not in range (#{file})")
end

def resource?(data, file)
  assert((0..4).member?(data), "Resource type not in range (#{file})")
end

def version?(data, file)
  assert(['VER 9.C'].member?(data), "Unexpected AOC version string (#{file})")
end

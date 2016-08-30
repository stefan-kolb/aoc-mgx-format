require_relative '../lib/aoc-mgx/header/version'

module AoC
  module Assertions
    def player_or_gaia?(data, file)
      assert_match(/[0-8]/, data, "Third char of message not a player number or gaia (#{file})")
    end

    def player?(data, file)
      assert((1..8).member?(data), "PlayerInfo number not in range (#{file})")
    end

    def resource?(data, file)
      assert((0..4).member?(data), "Resource type not in range (#{file})")
    end

    def version?(data, file)
      puts data
      assert(VERSIONS.value?(data), "Unexpected AOC version string (#{file})")
    end

    VERSIONS = {
      aok: 'VER 9.3',
      aoc: 'VER 9.4',
      trial: 'TRL 9.3',
      aofe: 'VER 9.5',
      aoc_up_12: 'VER 9.8',
      aoc_up_13: 'VER 9.9',
      aoc_up_rc1: 'VER 9.A',
      aoc_up_rc2: 'VER 9.B',
      aoc_up_14: 'VER 9.C'
    }.freeze
  end
end

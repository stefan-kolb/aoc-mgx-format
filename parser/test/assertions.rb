require_relative '../lib/aoc-mgx/header/version'
require_relative '../lib/aoc-mgx/constants/formations'
require_relative '../lib/aoc-mgx/constants/stances'

module AoC
  module Assertions
    def player_or_gaia?(data, file)
      assert_match((0..8).include?(data), "Not a player number or gaia (#{file})")
    end

    def player?(data, file)
      assert((1..8).include?(data), "Player number not in range (#{file})")
    end

    def resource?(data, file)
      assert((0..4).include?(data), "Resource type not in range (#{file})")
    end

    def object?(data, file)
      assert(data.positive?, "Object ID is not positive (#{file})")
    end

    def unit_selection?(data, file)
      assert((-1..40).include?(data), "Not a unit selection count (#{file})")
    end

    def unused_bytes?(data, file)
      assert_equal(0, data, "Bytes not unused #{file}")
    end

    def unused_flag?(data, file)
      assert_equal(-1, data, "Not a divider constant #{file}")
    end

    def formation?(data, file)
      formations = Formations.constants.collect { |c| Formations.const_get(c) }
      assert(formations.include?(data), "Not a formation (#{file})")
    end

    def stance?(data, file)
      stances = Stances.constants.collect { |c| Stances.const_get(c) }
      assert(stances.include?(data), "Not a stance (#{file})")
    end

    # 120x120 - Tiny (2 players)
    # 144x144 - Small (3 players)
    # 168x168 - Medium (4 players)
    # 200x200 - Normal (6 players)
    # 220x220 - Large (8 players)
    # 240x240 - Giant
    # 480x480 - LudiKRIS
    def coordinate?(data, file)
      assert((0..220).include?(data), "Not a x/y coordinate (#{file})")
    end

    def bool_value?(data, file)
      assert([0,1].include?(data), "Not a boolean value (#{file})")
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

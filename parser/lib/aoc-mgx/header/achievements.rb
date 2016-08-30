require_relative '../mgx_record'

class Achievements < Mgx::Record
  mandatory_parameter :num_players

  skip length: -> { num_players * 1817 }
end

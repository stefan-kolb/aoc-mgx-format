require_relative '../mgx_record'

class PlayerInfo < Mgx::Record
  mandatory_parameter :num_players

  skip length: -> { num_players * 1 }
  skip length: 36
  skip length: 5
  stringz :name, length: 20
end

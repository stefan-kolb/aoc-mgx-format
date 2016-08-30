require_relative '../mgx_record'

class Version < Mgx::Record
  string :game_version, length: 8
end

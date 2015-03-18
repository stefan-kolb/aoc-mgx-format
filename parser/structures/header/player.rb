require_relative '../mgx_record'

class Player < Mgx::Record
  skip :length => 41
  string :name, :length => 4
end
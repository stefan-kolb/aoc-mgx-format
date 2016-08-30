require_relative '../mgx_record'

class Gamestart < Mgx::Record
	skip :length => 20
end
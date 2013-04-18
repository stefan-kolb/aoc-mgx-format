require 'bindata'

class Gamestart < BinData::Record
  endian :little
	
	skip :length => 20
end
require 'bindata'

class Resign < BinData::Record
    int8 :player_id
    int8 :player_number
    int8 :zero
end
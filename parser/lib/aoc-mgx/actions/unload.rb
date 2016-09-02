require_relative '../mgx_record'

class Unload < Mgx::Record
  int8 :player_id
  int16 :zero
  float :x_coordinate
  float :y_coordinate
  int32 :zero2 # # if 00 then const, if 03 then other, seen this somewhere before
  int32 :const
  int32 :obj_id
end

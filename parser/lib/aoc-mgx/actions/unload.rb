require_relative '../mgx_record'

class Unload < Mgx::Record
  int8 :selected_units_count
  int16 :zero
  float :u1
  float :u2
  int32 :zero2 # if 00 then const, if 03 then other
  int32 :const
  int32 :obj_id
end

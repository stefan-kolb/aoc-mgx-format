require_relative '../mgx_record'

class Garrison < Mgx::Record
  int8 :selected_units_count
  int16 :zero
  int32 :obj_id
  int8 :action # 1 pack , 2 = unpack, 4 = ?ally building?, 5 = garrison
  int24 :unknown1
  #int16 :zero2 #player id? + 2 zero?
  float :unknown2
  float :unknown3
  int32 :const
  array :units, type: :int32, initial_length: :selected_units_count
end

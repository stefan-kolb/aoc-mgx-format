require 'bindata'

class Delete < Mgx::Record
  int8 :zero1
  int8 :zero2
  int8 :zero3
  int32 :obj_id
  int32 :player_id
end
require_relative '../mgx_record'

class Backtowork < Mgx::Record
  int24 :zero
  int32 :unknown1 # 4 or only 1 int32
  int32 :unknown2 # obj_id and 4 more is enemy structure?
  int32 :unknown3
  int32 :unknown4
end

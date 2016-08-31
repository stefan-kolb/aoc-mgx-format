require_relative '../mgx_record'

class Gamestart < Mgx::Record
  # player_id of server order?
  int32 :unknown1 # 1 in 1on1 (also 0) -> bool?
  int32 :rec_owner
  int32 :unknown3 # 0 in 1on1 (also 1) -> bool?
  int32 :unknown4 # 0 in 1on1
  int32 :unknown5 # 0 in 1on1
end

require 'bindata'

require_relative '../../../../parser/lib/aoc-mgx/mgx_record'

class Buy < Mgx::Record
  int8 :player_id
  int8 :resource_type
  int8 :amount
  int32 :obj_id
end

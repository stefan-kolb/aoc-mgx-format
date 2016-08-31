require 'bindata'

require_relative '../../../../parser/lib/aoc-mgx/mgx_record'

class Buy < Mgx::Record
  int8 :player_id
  int8 :resource_type
  int8 :amount
  int16 :obj_id
  int8 :zero
end

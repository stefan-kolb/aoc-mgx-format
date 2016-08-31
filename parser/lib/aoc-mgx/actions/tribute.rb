require_relative '../mgx_record'

class Tribute < Mgx::Record
  int8 :player_id_from
  int8 :player_id_to
  int8 :resource_type
  float :amount
  float :fee
end

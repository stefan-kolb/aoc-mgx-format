require_relative '../mgx_record'

class Map < Mgx::Record
  int8 :terrain_id
  int8 :elevation
end

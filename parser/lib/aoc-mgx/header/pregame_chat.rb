require_relative '../mgx_record'

class PregameChat < Mgx::Record
  int32 :len
  string :message, length: :length
end

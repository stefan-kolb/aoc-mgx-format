require_relative '../mgx_record'

class Unknown < Mgx::Record
  mandatory_parameter :data_len

  string :data, length: -> { data_len }
end

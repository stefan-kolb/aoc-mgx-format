require_relative '../mgx_record'

require_relative 'effect'

class Trigger < Mgx::Record
  skip length: 14
  int32 :desc_len
  string :description, length: -> { desc_len }
  int32 :name_len
  string :name, length: -> { name_len }
  int32 :num_effect
  array :effects, type: :effect, read_until: -> { index + 1 == num_effect }
  skip length: -> { num_effect * 4 }
  int32 :num_condition
  skip length: -> { num_condition * 72 }
  skip length: -> { num_condition * 4 }
end

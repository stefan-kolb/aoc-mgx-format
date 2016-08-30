require_relative '../mgx_record'

require_relative 'effect'

class Trigger < Mgx::Record
  skip :length => 14
  int32 :desc_len
  string :description, :length => lambda { desc_len }
  int32 :name_len
  string :name, :length => lambda { name_len }
  int32 :num_effect
  array :effects, :type => :effect, :read_until => lambda { index + 1 == num_effect }
  skip :length => lambda { num_effect * 4 }
  int32 :num_condition
  skip :length => lambda { num_condition * 72 }
  skip :length => lambda { num_condition * 4 }
end
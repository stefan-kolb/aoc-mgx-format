require_relative '../mgx_record'

class Effect < Mgx::Record
  skip :length => 24
  int32 :num_selected
  skip :length => 72
  int32 :text_len
  string :text, :length => lambda { text_len }
  int32 :sound_len
  string :sound, :length => lambda { sound_len }
  skip :unit_ids, :length => lambda { num_selected * 4 }
end
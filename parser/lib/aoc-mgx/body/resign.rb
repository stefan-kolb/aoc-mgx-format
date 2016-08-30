require_relative '../mgx_record'

class Resign < Mgx::Record
    int8 :player_id
    int8 :player_number
    int8 :zero

  def to_s
    "Player #{player_number} resigned."
  end
end
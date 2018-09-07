# Additions to core class to support printing etc
class TowerOfHanoi
  attr_reader :to_tower
  
  def print
    puts \
    "From: #{@from_tower.print}\n" \
    "Via:  #{@aux_tower.print}\n"  \
    "To:   #{@to_tower.print}\n"   \
    "Move counter: #{@move_counter}\n"
  end
end

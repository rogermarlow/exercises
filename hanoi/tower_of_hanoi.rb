require_relative './tower'
class TowerOfHanoi

  def initialize(n)
    @from_tower     = Tower.new(n)
    @to_tower       = Tower.new(0)
    @aux_tower      = Tower.new(0)
    @move_counter = 0
  end
  
  def solve
    move_discs(@from_tower.height,
               @from_tower,
               @to_tower,
               @aux_tower) unless @from_tower.height == 0
  end

  private
  
  def move_discs(number_of_discs, from, to, via)
    if number_of_discs == 1
      to.add_disc(from.get_top_disc)
      @move_counter = @move_counter + 1
    else
      move_discs(number_of_discs - 1, from, via, to)
      move_discs(1, from, to, via)
      move_discs(number_of_discs-1,via, to, from)
    end
  end  
end

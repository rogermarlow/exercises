require_relative './tower_of_hanoi'

class TowerOfHanoi
  alias :solve_unbounded :solve
  def solve
    if @from_tower.height > 30 then
      raise "This algorithm is O(2^N). Moving more than 30 discs will take too long."
    end
    solve_unbounded
  end
end

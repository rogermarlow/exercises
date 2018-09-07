require 'minitest/autorun'
require_relative '../tower_of_hanoi'
require_relative '../tower_of_hanoi_reporting'
require_relative '../tower_of_hanoi_safeguard'

class TestTowerOfHanoi < Minitest::Test
  def test_trivial_case
    game = TowerOfHanoi.new(0)
    game.solve
    assert Tower.new(0) == game.to_tower
  end

  def test_base_case
    game = TowerOfHanoi.new(1)
    game.solve
    assert Tower.new(1) == game.to_tower
  end

  def test_stress
    (2..20).each do |x|
      game = TowerOfHanoi.new(x)
      game.solve
      assert Tower.new(x) == game.to_tower
    end
  end

  def test_dont_allow_unbounded_calcs
    too_big = TowerOfHanoi.new(35)
    assert_raises RuntimeError do
      too_big.solve
    end
  end

  def test_printing_initial
    game = TowerOfHanoi.new(5)
    out, err = capture_io do
      game.print
    end
    assert_equal out, <<-EOS
From: 5-4-3-2-1
Via:  .
To:   .
Move counter: 0
    EOS
  end

  def test_printing_solved
    game = TowerOfHanoi.new(6)
    game.solve
    out, err = capture_io do
      game.print
    end
    assert_equal out, <<-EOS
From: .
Via:  .
To:   6-5-4-3-2-1
Move counter: 63
    EOS
  end
end

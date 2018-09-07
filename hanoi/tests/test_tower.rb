require 'minitest/autorun'
require_relative '../tower'

class TestPeg < Minitest::Test
  def setup
    @empty_tower = Tower.new(0)
    @three_tower = Tower.new(3)
  end

  def test_init_with_sane_discs
    refute @three_tower.empty?
  end
        
  def test_init_cannot_make_tower_with_neg_discs
    assert_raises(RuntimeError) { Tower.new(-3) }
  end

  def test_get_top_disc
    assert_raises(RuntimeError) {@empty_tower.get_top_disc}
    assert_equal @three_tower.get_top_disc, 1
  end

  def test_add_disc_to_populated_tower
    assert_equal @three_tower.add_disc(0).get_top_disc, 0
  end

  def test_add_disc_to_empty_tower
    assert_equal @empty_tower.add_disc(4).get_top_disc, 4
  end

  def test_add_disc_cant_add_larger_disc
    assert_raises(RuntimeError) { @three_tower.add_disc 2 }
  end

  def test_print
    assert_equal @three_tower.print,"3-2-1"
    assert_equal @empty_tower.print,"."
  end

  def test_height
    assert_equal @three_tower.height, 3
    assert_equal @empty_tower.height, 0
  end
  
  def test_manipulate_tower
    # [3,2,1] remove 1, remove 2, add 1 = [3,1]
    @three_tower.get_top_disc
    @three_tower.get_top_disc
    @three_tower.add_disc(1)
    assert_equal @three_tower.get_top_disc, 1
    assert_equal @three_tower.get_top_disc, 3
    assert @three_tower.empty?
  end

  def test_equality_with_array
    assert @three_tower==Array(1..3).reverse
  end
  
  def test_equality_with_tower
    tower_of_three = Tower.new(3)
    assert tower_of_three==@three_tower
  end
end

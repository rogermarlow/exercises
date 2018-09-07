require "minitest/autorun"
require_relative "../reverser"

class TestReverser < Minitest::Test
  def setup
    @long_string = "abcdefghijklmnopqrstuvwxyz"
    @short_string = "a"
    @reverser = Reverser.new
  end

  def test_one_char
    assert(@reverser.reverse(@short_string) == @short_string)
  end

  def test_multi_char
    assert(@reverser.reverse(@long_string) == @long_string.reverse)
  end
end

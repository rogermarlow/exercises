require "minitest/autorun"
require_relative "../reverser"

describe Reverser do
  before do
    @long_string = "abcdefghijklmnopqrstuvwxyz"
    @short_string = "a"
    @reverser = Reverser.new
  end

  describe "when asked to reverse a long string" do
    it "must reverse that string" do
      @reverser.reverse(@long_string).must_equal @long_string.reverse
    end
  end
end

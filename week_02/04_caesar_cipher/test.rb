require "minitest/autorun"
require_relative "./solution"

class Test < Minitest::Test
  def setup
    @solution = Solution.new
  end

  def test_scramble
    input = "rohit"
    expected_output = "vslmx"
    assert_equal expected_output, @solution.scramble(input, 4)
  end

  def test_unscramble
    input = "vslmx"
    expected_output = "rohit"
    assert_equal expected_output, @solution.unscramble(input, 4)
  end
end

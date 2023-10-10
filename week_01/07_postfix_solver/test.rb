require "minitest/autorun"
require_relative "./solution"

class Test < Minitest::Test
  def setup
    @solution = Solution.new
  end

  def test_small_expression
    input = [4, 2, "/"]
    expected_output = 2
    assert_equal expected_output, @solution.call(input)
  end

  def test_large_expression
    input = [5, 2, 4, "*", "+", 7, "-"]
    expected_output = 6
    assert_equal expected_output, @solution.call(input)
  end
end

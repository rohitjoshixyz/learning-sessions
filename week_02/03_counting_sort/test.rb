require "minitest/autorun"
require_relative "./solution"

class Test < Minitest::Test
  def setup
    @solution = Solution.new
  end

  def test_counting_sort
    input = [5, 2, 4, 6, 1, 3]
    expected_output = [1, 2, 3, 4, 5, 6]
    assert_equal expected_output, @solution.call(input)
  end
end

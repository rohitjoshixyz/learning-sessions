require "minitest/autorun"
require_relative "./solution"

class Test < Minitest::Test
  def setup
    @solution = Solution.new
  end

  def test_unsorted_array
    input = [5, 1, 6, 2, 3, 4]
    expected_output = [1, 2, 3, 4, 5, 6]
    assert_equal expected_output, @solution.call(input)
  end
end

require "minitest/autorun"
require_relative "./solution"

class Test < Minitest::Test
  def setup
    @solution = Solution.new
  end

  def test_unsorted_array
    input = [5, 2, 4, 6, 1, 3]
    expected_output = [1, 2, 3, 4, 5, 6]
    assert_equal expected_output, @solution.call(input)
  end

  def test_reversed_sorted_array
    input = [9, 8, 7, 6, 5, 4, 3, 2, 1]
    expected_output = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    assert_equal expected_output, @solution.call(input)
  end

  def test_empty_array
    input = []
    expected_output = []
    assert_equal expected_output, @solution.call(input)
  end

  def test_one_element
    input = [1]
    expected_output = [1]
    assert_equal expected_output, @solution.call(input)
  end
end

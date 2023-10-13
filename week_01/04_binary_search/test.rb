require "minitest/autorun"
require_relative "./solution"

class Test < Minitest::Test
  def setup
    @solution = Solution.new
  end

  def test_non_recursive_binary_search
    array = [1, 2, 4, 5, 7, 9]
    key = 9
    expected_output = 5
    assert_equal expected_output, @solution.non_recursive_binary_search(array, key)
  end

  def test_non_recursive_binary_search_with_missing_element
    array = [1, 2, 4, 5, 7, 9]
    key = 10
    assert_nil @solution.non_recursive_binary_search(array, key)
  end

  def test_non_recursive_binary_search_on_left_edge
    array = [1, 2, 4, 5, 7, 9]
    key = 1
    expected_output = 0
    assert_equal expected_output, @solution.non_recursive_binary_search(array, key)
  end

  def test_recursive_binary_search
    array = [1, 2, 4, 5, 7, 9]
    key = 4
    expected_output = 2
    assert_equal expected_output, @solution.call_recursive_binary_search(array, key)
  end
end

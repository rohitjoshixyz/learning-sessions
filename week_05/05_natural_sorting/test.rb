require "minitest/autorun"
require_relative "./solution"

class Test < Minitest::Test
  def setup
    @solution = Solution.new
  end

  def test_unsorted_array
    input = %w(item1 item12 item7 item2 item3 item4 item10 item11)
    expected_output = %w(item1 item2 item3 item4 item7 item10 item11 item12)
    assert_equal expected_output, @solution.call(input)
  end

  def test_sorted_array
    input = %w(item1 item2 item3 item4 item7 item10 item11 item12)
    expected_output = %w(item1 item2 item3 item4 item7 item10 item11 item12)
    assert_equal expected_output, @solution.call(input)
  end

  def test_empty_array
    input = []
    expected_output = []
    assert_equal expected_output, @solution.call(input)
  end

  def test_one_element
    input = ["item1"]
    expected_output = ["item1"]
    assert_equal expected_output, @solution.call(input)
  end

  def test_reversed_sorted_array
    input = %w(item12 item11 item10 item7 item4 item3 item2 item1)
    expected_output = %w(item1 item2 item3 item4 item7 item10 item11 item12)
    assert_equal expected_output, @solution.call(input)
  end
end

require "minitest/autorun"
require_relative "./solution"

class Test < Minitest::Test
  def setup
    @solution = Solution.new
  end

  def test_matrix_with_3_rows_and_4_columns
    input = [
      [1, 2, 3, 4],
      [5, 6, 7, 8],
      [44, 55, 66, 77]
    ]
    expected_output = [
      [1, 5, 44],
      [2, 6, 55],
      [3, 7, 66],
      [4, 8, 77]
    ]
    assert_equal expected_output, @solution.call(input)
  end
end

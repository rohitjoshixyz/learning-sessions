require "minitest/autorun"
require_relative "./solution"

class Test < Minitest::Test
  def setup
    @solution = Solution.new
  end

  def test_factorial
    assert_equal 120, @solution.factorial(5)
  end

  def test_recursive_binary_search
    assert_equal 55, @solution.fibonacci(10)
  end
end

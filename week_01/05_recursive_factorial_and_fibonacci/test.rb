require "minitest/autorun"
require_relative "./solution"

class Test < Minitest::Test
  def setup
    @solution = Solution.new
  end

  def test_factorial
    assert_equal 1, @solution.factorial(0)
    assert_equal 1, @solution.factorial(1)
    assert_equal 2, @solution.factorial(2)
    assert_equal 120, @solution.factorial(5)
  end

  def test_recursive_binary_search
    assert_equal 0, @solution.fibonacci(0)
    assert_equal 1, @solution.fibonacci(1)
    assert_equal 1, @solution.fibonacci(2)
    assert_equal 2, @solution.fibonacci(3)
    assert_equal 55, @solution.fibonacci(10)
  end
end

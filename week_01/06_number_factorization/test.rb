require "minitest/autorun"
require_relative "./solution"

class Test < Minitest::Test
  def setup
    @solution = Solution.new
  end

  def test_prime_factorize_composite_number
    input = 48
    expected_output = [2, 2, 2, 2, 3]
    assert_equal expected_output, @solution.call(input)
  end

  def test_prime_factorize_prime_number
    input = 13
    expected_output = [13]
    assert_equal expected_output, @solution.call(input)
  end
end

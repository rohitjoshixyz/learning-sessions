# Simple recursive functions (factorial, fibonacci)
class Solution
  def factorial(n)
    return 1 if [0, 1].include?(n)

    n * factorial(n - 1)
  end

  def fibonacci(n)
    return n if [0, 1].include?(n)

    fibonacci(n - 1) + fibonacci(n - 2)
  end
end

# use memoization, to increase efficiency
# Try to solve iteratively

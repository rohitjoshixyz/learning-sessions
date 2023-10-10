# Simple recursive functions (factorial, fibonacci)
class Solution
  def factorial(n)
    if [0, 1].include?(n)
      return 1
    end
    n * factorial(n - 1)
  end

  def fibonacci(n)
    if [0, 1].include?(n)
      return n
    end
    fibonacci(n - 1) + fibonacci(n - 2)
  end
end

# use memoization, to increase efficiency
# Try to solve iteratively

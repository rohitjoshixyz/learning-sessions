# Simple recursive functions (factorial, fibonacci)

def factorial(n)
  if [0, 1].include?(n)
    return 1
  end
  n * factorial(n - 1)
end
factorial(100)

def fibonacci(n)
  if [0, 1].include?(n)
    return n
  end
  fibonacci(n - 1) + fibonacci(n - 2)
end
fibonacci(2)

# Number factorization (converting a number into multiplication of prime numbers)

# 12 = 2 * 2 * 3

# Go until square root

# list out prime numbers that divide

# # 48
# 24
# 12
# 6
# 3
# 1

# {2: 4, 3: 1}
# Add one to above values and multiply it, it will give you the number of divisors
# 5*2 =  10 divisors
class Solution
  def call(input)
    prime_factorize(input)
  end

  def prime_factorize(value)
    return [] if value <= 1
    number = value
    factors = []
    upper_bound = Math.sqrt(number).ceil
    factor_found = false
    while number > 1
      (2..upper_bound).each do |factor|
        if number % factor == 0
          factors << factor
          number = number / factor
          factor_found = true
          break
        end
      end
      break unless factor_found
    end
    if factor_found
      divisors = factors.tally.values.map { |count| count + 1 }.inject(:*)
      puts "#{factors} are the prime factors of #{value}. It has #{divisors} total divisors"
      factors
    else
      puts "#{value} is a prime number"
      [value]
    end
  end
end


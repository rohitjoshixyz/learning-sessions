banks = File.readlines("ADVENT_OF_CODE_2025/day_03/input_1.txt").map(&:strip)

def find_max_2_digit_number_maintaining_order(num)
  digits = num.chars.map(&:to_i)
  max_number = 0

  (0...(digits.length - 1)).each do |i|
    first_digit = digits[i]
    max_second_digit = digits[(i + 1)..].max

    two_digit_number = first_digit * 10 + max_second_digit
    max_number = [max_number, two_digit_number].max
  end

  max_number
end

max_numbers = []
banks.each do |bank|
  max_numbers << find_max_2_digit_number_maintaining_order(bank)
end
p max_numbers.sum

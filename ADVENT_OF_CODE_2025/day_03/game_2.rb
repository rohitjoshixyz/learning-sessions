banks = File.readlines("ADVENT_OF_CODE_2025/day_03/input_1.txt").map(&:strip)
bank_score = []
for bank in banks
  digits = bank.chars.map(&:to_i)
  n = digits.length
  k = 12
  start_index = 0
  chosen_digits = []
  chosen_digits_index = []

  for i in 0..(k - 1)
    last_index = n - (k - i)

    max_digit = 0
    max_digit_index = start_index

    (start_index..last_index).each do |idx|
      if digits[idx] > max_digit
        max_digit = digits[idx]
        max_digit_index = idx
      end
    end
  
    # puts "For i = #{i}, start_index = #{start_index}, last_index = #{last_index}"
    # puts "  max_digit: #{max_digit} at #{max_digit_index}"
  
    chosen_digits << max_digit
    chosen_digits_index << max_digit_index
    start_index = max_digit_index + 1
  end

  p chosen_digits
  # p chosen_digits_index

  bank_score << chosen_digits.join("").to_i
end

p bank_score.sum

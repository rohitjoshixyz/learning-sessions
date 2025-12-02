ranges = File.readlines("ADVENT_OF_CODE_2025/day_02/input_1.txt").map(&:strip)
ranges = ranges.map { |range| range.split(",").map { |r| r.split("-").map(&:to_i) } }.flatten(1)
p ranges

invalid_numbers = []

ranges.each do |range|
  (range[0]..range[1]).each do |number|
    number_length = number.to_s.length

    first_half = number.to_s[0..(number_length / 2 - 1)]
    second_half = number_length > 1 ? number.to_s[(number_length / 2)..] : ""

    # puts "first_half: #{first_half}"
    # puts "second_half: #{second_half}"

    if first_half == second_half
      puts "Invalid number: #{number}"
      invalid_numbers << number
    end
  end
end
  puts "Invalid numbers sum: #{invalid_numbers.sum}"

# First guess: 12850231773 too high
# Second guess: 12850231698 too low
# Third guess:  128502316700 too high
# 4th guess: 12850231699 INCORRECT
# 5th guess: 12850231731 CORRECT

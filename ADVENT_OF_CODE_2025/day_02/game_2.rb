ranges = File.readlines("ADVENT_OF_CODE_2025/day_02/input_1.txt").map(&:strip)
ranges = ranges.map { |range| range.split(",").map { |r| r.split("-").map(&:to_i) } }.flatten(1)
p ranges

invalid_numbers = []
# ranges = [[11,22]]
ranges.each do |range|
  (range[0]..range[1]).each do |number|
    substring_length = 1
    while substring_length <= number.to_s.length / 2
      if number.to_s.chars.each_slice(substring_length).to_a.uniq.size == 1
        puts "Invalid number: #{number}"
        invalid_numbers << number
        break
      end
      substring_length += 1
    end
  end
end
puts "Invalid numbers sum: #{invalid_numbers.sum}"


line_length = File.readlines("ADVENT_OF_CODE_2023/day_03/test_input.txt", chomp: true).first.length
lines = File.readlines("ADVENT_OF_CODE_2023/day_03/test_input.txt", chomp: true)
grid = lines.map { |line| line.split("").map { |char| ["&", "*", "=", "@", "$", "-", "+", "#", "/", "%"].include?(char) ? "#" : char } }
# p grid.flatten.uniq.sort
part_number_array = []

def get_neighbours(x, y, grid)
  neighbours = []
  (-1..1).each do |i|
    (-1..1).each do |j|
      neighbours << grid[x + i][y + j] if (x + i) >= 0 && (y + j) >= 0 && (x + i) < grid.length && (y + j) < grid[0].length
    end
  end
  neighbours
end

lines.each_with_index do |line, line_index|
  number_and_index = []

  line.scan(/[\d]+/) do |number|  
    number_and_index << [number.to_i, Regexp.last_match.offset(0).first]
  end
  p number_and_index

  number_and_index.each do |number, index|
    # puts "Number: #{number}, index: #{line.index(number) + (line_index * line_length)}"
    number_index = index + (line_index * line_length)
    number_length = number.to_s.length
    "#{(number_index...(number_index + number_length))}"
    (number_index...(number_index + number_length)).each do |i|
      p "#{number_index} #{number_length} #{i} X=#{i / line_length} Y=#{i % line_length} #{number}"
      if get_neighbours(i / line_length, i % line_length, grid).include?("#")
        part_number_array << number
        break
      end
    end
  end
end
p part_number_array.map(&:to_i).sum

# 553156
# 553087
# 554003

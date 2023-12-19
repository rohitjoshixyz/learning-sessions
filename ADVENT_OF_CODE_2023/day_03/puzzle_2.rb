
line_length = File.readlines("ADVENT_OF_CODE_2023/day_03/input_1.txt", chomp: true).first.length
lines = File.readlines("ADVENT_OF_CODE_2023/day_03/input_1.txt", chomp: true)
grid = lines.map { |line| line.split("").map { |char| ["&", "=", "@", "$", "-", "+", "#", "/", "%"].include?(char) ? "#" : char } }
# p grid.flatten.uniq.sort
part_number_array = []

def get_neighbours(x, y, grid)
  neighbours = []
  (-1..1).each do |i|
    (-1..1).each do |j|
      if (x + i) >= 0 && (y + j) >= 0 && (x + i) < grid.length && (y + j) < grid[0].length
        neighbours << grid[x + i][y + j] 
      else
        neighbours << nil
      end
    end
  end
  neighbours
end

indices_of_numbers = {}
sum = 0

lines.each_with_index do |line, line_index|
  number_and_index = []
  line.scan(/[\d]+/) do |number|
    indices = []
    number.length.times do |i|
      index = Regexp.last_match.offset(0).first + (line_index * line_length) + i
      indices_of_numbers[index] = number.to_i
      grid[line_index][index % line_length] = number.to_i
    end
  end
end

lines.each_with_index do |line, line_index|
  star_indices = []
  line.scan(/[*]/) do |star|
    star_indices << Regexp.last_match.offset(0).first + (line_index * line_length)
  end

  star_indices.each do |i|
    star_neighbours = get_neighbours(i / line_length, i % line_length, grid)
    if star_neighbours.uniq.filter{|num|num.is_a?(Integer)}.count == 2
      sum += star_neighbours.uniq.filter{|num|num.is_a?(Integer)}.reduce(:*)
    end
  end
end
pp grid
pp indices_of_numbers
p sum


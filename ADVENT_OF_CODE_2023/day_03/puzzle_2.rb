
line_length = File.readlines("ADVENT_OF_CODE_2023/day_03/test_input.txt", chomp: true).first.length
lines = File.readlines("ADVENT_OF_CODE_2023/day_03/test_input.txt", chomp: true)
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


lines.each_with_index do |line, line_index|
  number_and_index = []

  # line.scan(/[\d]+/) do |number|  
  #   grid[line_index][Regexp.last_match.offset(0).first + i] = number.to_i
  # end

  line.scan(/[\d]+/) do |number|
    indices = []
    number.length.times do |i|
      indices << Regexp.last_match.offset(0).first + i
      grid[line_index][Regexp.last_match.offset(0).first + i] = number.to_i
    end
    number_and_index << [number.to_i, indices]
  end

  star_indices = []
  line.scan(/[*]/) do |star|
    star_indices << Regexp.last_match.offset(0).first + (line_index * line_length)
  end
  # p star_indices

  star_indices.each do |i|
    
    number_index = i + (line_index * line_length)
    neighbours = get_neighbours(i / line_length, i % line_length, grid)
    
    if neighbours.select{ |char| char&.match(/\d+/)&.to_a&.count == 2 }
      p neighbours.select{ |char| char&.match(/\d+/)&.to_a&.count == 2 }
    end
  end
end
# pp grid


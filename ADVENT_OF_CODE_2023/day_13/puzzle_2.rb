patterns = File.read("ADVENT_OF_CODE_2023/day_13/test_input.txt").split("\n\n").map { |pattern| pattern.split("\n").map { |line| line.split("").map {|char| char == "#" ? 1 : 0 } } }

def find_horizontal_mirror(pattern)
  mirror_position = 0
  while mirror_position < pattern.length do
    top = mirror_position
    bottom = mirror_position + 1

    i = 0
    result = []
    while i < pattern.length do
     
      p pattern[i]
      i += 1
    end

    p result
    # if result.tally[1] == 1 && result.tally[0] == pattern[top].length - 1
    #   return mirror_position + 1
    # end
    mirror_position += 1
  end
end

def transpose(grid)
  output = Array.new(grid.first.length) do
    Array.new(grid.length)
  end

  grid.each_with_index do |row, row_index|
    row.each_with_index do |_, elem_index|
      output[elem_index][row_index] = grid[row_index][elem_index]
    end
  end
  output
end

def find_vertical_mirror(pattern_array)
  find_horizontal_mirror(transpose(pattern_array))
end


horizontal_mirrors = []
vertical_mirrors = []

patterns.each_with_index do |pattern, index|
  h = find_horizontal_mirror(pattern)
  v = find_vertical_mirror(pattern)

  if h.to_i > v.to_i
    horizontal_mirrors << h
  elsif h.to_i < v.to_i
    vertical_mirrors << v
  else
    vertical_mirrors << h
  end
end

p horizontal_mirrors.count
p vertical_mirrors.count


p horizontal_mirrors.sum * 100 + vertical_mirrors.sum

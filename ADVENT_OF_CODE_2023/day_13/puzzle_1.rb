patterns = File.read("ADVENT_OF_CODE_2023/day_13/input_1.txt").split("\n\n").map { |pattern| pattern.split("\n").map { |line| line.split("") } }

def find_horizontal_mirror(pattern_array)
  mirror_position = 0
  ok = true

  while mirror_position < pattern_array.length do
    top = mirror_position
    bottom = mirror_position + 1
    ok = true
    # puts "Mirror pos:#{mirror_position}, top: #{top}, bottom:#{bottom} pattern top: #{pattern_array[top]} pattern bottom: #{pattern_array[bottom]}"

    while top >= 0 || bottom < pattern_array.length
      if pattern_array[top] == pattern_array[bottom]
        return mirror_position + 1
      else
        break
      end
      top -= 1
      bottom += 1
    end

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


#48244 is too high
#55627 is too high
#27786 is not correct
#29202
#7247 is low

# 29213 was the answer

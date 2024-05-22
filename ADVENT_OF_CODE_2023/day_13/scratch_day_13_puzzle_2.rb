patterns = File.read("ADVENT_OF_CODE_2023/day_13/test_input.txt").split("\n\n").map { |pattern| pattern.split("\n").map { |line| line.split("") } }

def find_horizontal_mirror(pattern_array)
  mirror_position = 0
  while mirror_position < pattern_array.length do
    top = mirror_position
    bottom = mirror_position + 1
    # puts "Mirror pos:#{mirror_position}, top: #{top}, bottom:#{bottom} pattern top: #{pattern_array[top]} pattern bottom: #{pattern_array[bottom]}"
    while true

      if pattern_array[top] == pattern_array[bottom]
        top -= 1
        bottom += 1
        if top == 0 || bottom == pattern_array.length
          # puts "Condtition true"
          return mirror_position + 1
        end

      else
        # puts "Else called"
        break
      end
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
  end
end

p horizontal_mirrors
p vertical_mirrors


p horizontal_mirrors.compact.sum * 100 + vertical_mirrors.compact.sum


#48244 is too high
#55627 is too high
#27786 is not correct
#7247 is low

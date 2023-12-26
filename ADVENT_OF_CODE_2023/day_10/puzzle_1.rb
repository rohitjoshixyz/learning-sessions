lines = File.readlines("ADVENT_OF_CODE_2023/day_10/input_1.txt", chomp: true)
grid = lines.map { |line| line.split("") }

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

s_index = nil
grid.each_with_index do |row, row_index|
  row.each_with_index do |cell, cell_index|
    if cell == "S"
      s_index = [row_index, cell_index]
      break
    end
  end
end

s_neighbours = get_neighbours(s_index[0], s_index[1], grid)



def right(neighbours)
  ["J", "-", "7"].include?(neighbours[5])
end

def left(neighbours)
  ["L", "-", "F"].include?(neighbours[3])
end

def up(neighbours)
  ["7", "|", "F"].include?(neighbours[1])
end

def down(neighbours)
  ["J", "|", "L"].include?(neighbours[7])
end

def is_f(neighbours)
  right(neighbours) && down(neighbours)
end

def is_7(neighbours)
  left(neighbours) && down(neighbours)
end

def is_j(neighbours)
  left(neighbours) && up(neighbours)
end

def is_l(neighbours)
  right(neighbours) && up(neighbours)
end

def is_vertical(neighbours)
  up(neighbours) && down(neighbours)
end

def is_horizontal(neighbours)
  left(neighbours) && right(neighbours)
end

def find_s(neighbours)
  if right(neighbours) && down(neighbours)
    puts "F pipe condition satisfied"
    "F"
  elsif left(neighbours) && down(neighbours)
    puts "7 pipe condition satisfied"
    "7"
  elsif left(neighbours) && up(neighbours)
    puts "J pipe condition satisfied"
    "J"
  elsif right(neighbours) && up(neighbours)
    puts "L pipe condition satisfied"
    "L"
  elsif up(neighbours) && down(neighbours)
    puts "| pipe condition satisfied"
    "|"
  elsif left(neighbours) && right(neighbours)
    puts "- pipe condition satisfied"
    "-"
  end
end

point = find_s(s_neighbours)
grid[s_index[0]][s_index[1]] = point

def traverse(x, y, direction, grid)
  case direction
  when "E"
    new_x, new_y = x, y + 1
  when "W"
    new_x, new_y = x, y - 1
  when "N"
    new_x, new_y = x - 1, y
  when "S"
    new_x, new_y = x + 1, y
  end

  new_direction = next_direction(new_x, new_y, direction, grid)
  # puts "x: #{x}, y: #{y}, direction: #{direction}, char:#{grid[x][y]}, new_x: #{new_x} new_y: #{new_y}, new_char:#{grid[new_x][new_y]} , new_direction: #{new_direction}"
  [[new_x, new_y], new_direction]
end

def next_direction(x, y, direction, grid)
  if grid[x][y] == "7"
    case direction
    when "E"
      "S"
    when "N"
      "W"
    end
  elsif grid[x][y] == "J"
    case direction
    when "E"
      "N"
    when "S"
      "W"
    when "N"
      
    end
  elsif grid[x][y] == "L"
    case direction
    when "W"
      "N"
    when "S"
      "E"
    end
  elsif grid[x][y] == "F"
    case direction
    when "W"
      "S"
    when "S"
      "E"
    when "E"
      direction
    when "N"
      "E"
    end
  elsif grid[x][y] == "|"
    direction
  elsif grid[x][y] == "-"
    direction
  end
end

visited = []
x = s_index[0]
y = s_index[1]
direction = "E"

while true do
  next_point, next_direction = traverse(x, y, direction, grid)
  break if visited.include?(next_point)
  visited << next_point
  x = next_point[0]
  y = next_point[1]
  direction = next_direction
end

p visited.count / 2

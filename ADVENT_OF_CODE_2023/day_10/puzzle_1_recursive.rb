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

p s_index
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

s = find_s(s_neighbours)
puts "s: #{s}"

grid[s_index[0]][s_index[1]] = s


def find_path_length(x, y, grid,visited = [])
  neighbours = get_neighbours(x, y, grid)
  # puts "neighbours of #{x}, #{y}: #{neighbours}"
  
  visited << [x, y]
  char = grid[x][y]
  return visited if visited[0] == [x, y] && visited.length > 1

  case char
  when "F"
    if right(neighbours) && !visited.include?([x, y + 1])
      find_path_length(x, y + 1, grid, visited)
    elsif down(neighbours) && !visited.include?([x + 1, y])
      find_path_length(x + 1, y, grid, visited)
    end
  when "7"
      if left(neighbours) && !visited.include?([x, y - 1])
        find_path_length(x, y - 1, grid, visited)
      elsif down(neighbours) && !visited.include?([x + 1, y])
        find_path_length(x + 1, y, grid, visited)
      end
  when "J"
      if left(neighbours) && !visited.include?([x, y - 1])
        find_path_length(x, y - 1, grid, visited)
      elsif up(neighbours) && !visited.include?([x - 1, y])
        find_path_length(x - 1, y, grid, visited)
      end
  when "L"
      if right(neighbours) && !visited.include?([x, y + 1])
        find_path_length(x, y + 1, grid, visited)
      elsif up(neighbours) && !visited.include?([x - 1, y])
        find_path_length(x - 1, y, grid, visited)
      end
  when "|"
      if up(neighbours) && !visited.include?([x - 1, y])
        find_path_length(x - 1, y, grid, visited)
      elsif down(neighbours) && !visited.include?([x + 1, y])
        find_path_length(x + 1, y, grid, visited)
      end
  when "-"
      if left(neighbours) && !visited.include?([x, y - 1])
        find_path_length(x, y - 1, grid, visited)
      elsif right(neighbours) && !visited.include?([x, y + 1])
        find_path_length(x, y + 1, grid, visited)
      end
  end

  # if up(neighbours) && !visited.include?([x - 1, y])
  #   puts "up"
  #   find_path_length(x - 1, y, grid, visited)
  # elsif down(neighbours) && !visited.include?([x + 1, y])
  #   puts "down"
  #   find_path_length(x + 1, y, grid, visited)
  # elsif left(neighbours) && !visited.include?([x, y - 1])
  #   find_path_length(x, y - 1, grid, visited)
  # elsif right(neighbours) && !visited.include?([x, y + 1])
  #   puts "right"
  #   find_path_length(x, y + 1, grid, visited) && !visited.include?([x, y + 1])
  # end
  visited
end

visited = find_path_length(s_index[0], s_index[1], grid)
p visited.inspect

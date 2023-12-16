grid = File.read("ADVENT_OF_CODE_2023/day_10/input_1.txt").split("\n").map {|line| line.split("")}

def name_galaxies(grid)
  count = 1
  grid.each_with_index do |row, row_index|
    row.each_with_index do |column, column_index|
      if column == "#"
        # puts "#{count}: #{row_index}, #{column_index}"
        grid[row_index][column_index] = count
        count += 1
      end
    end
  end
  grid
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

def expand_empty_rows(grid)
  expanded_grid = []
  grid.each_with_index do |row, index|
    expanded_grid << row
    if row.all? {|elem| elem == "."}
      expanded_grid << row
    end
  end
  expanded_grid
end


def distance(x1, y1, x2, y2)
  ((x2 - x1).abs + (y2 - y1).abs)
end

named = name_galaxies(grid)
transposed_grid = transpose(named)
grid_with_columns_expanded = expand_empty_rows(transposed_grid)
transposed_grid = transpose(grid_with_columns_expanded)
expanded_grid = expand_empty_rows(transposed_grid)
pp expanded_grid

coordinates = {}
expanded_grid.each_with_index do |row, row_index|
  row.each_with_index do |column, column_index|
    if column.is_a?(Integer)
      coordinates[column] = [row_index, column_index]
    end
  end
end
p coordinates


def find_distances(galaxy, coordinates)
  distances = {}
  coordinates.keys.combination(2).to_a.each do |x2, y2|
    distance(coordinates[galaxy][0], coordinates[galaxy][1], x2, y2)
  end
  distances
end

pairs = coordinates.keys.combination(2).to_a

answer = pairs.map do |pair|
  x1, y1 = coordinates[pair[0]]
  x2, y2 = coordinates[pair[1]]
  distance(x1, y1, x2, y2)
end.sum
p answer

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
  million_rows = []
  grid.each_with_index do |row, index|
    expanded_grid << row
    if row.all? { |elem| elem.is_a?(String) }
      expanded_grid[index] = row.map { |elem| "..." }
      million_rows << index
    end
  end
  [expanded_grid, million_rows]
end

def distance(x1, y1, x2, y2, million_rows, million_columns)
  distance_to_add = 0

  [x1, x2].min.upto([x1, x2].max) do |x|
    distance_to_add += 999_999 if million_rows.include?(x)
  end

  [y1, y2].min.upto([y1, y2].max) do |y|
    distance_to_add += 999_999 if million_columns.include?(y)
  end

  ((x2 - x1).abs + (y2 - y1).abs) + distance_to_add
end

named = name_galaxies(grid)
transposed_grid = transpose(named)
grid_with_columns_expanded, million_columns = expand_empty_rows(transposed_grid)
transposed_grid = transpose(grid_with_columns_expanded)
expanded_grid, million_rows = expand_empty_rows(transposed_grid)
p expanded_grid

coordinates = {}
expanded_grid.each_with_index do |row, row_index|
  row.each_with_index do |column, column_index|
    if column.is_a?(Integer)
      coordinates[column] = [row_index, column_index]
    end
  end
end
# p coordinates

pairs = coordinates.keys.combination(2).to_a

answer = pairs.map do |pair|
  x1, y1 = coordinates[pair[0]]
  x2, y2 = coordinates[pair[1]]
  distance(x1, y1, x2, y2, million_rows, million_columns)
end.sum

p answer
p million_rows
p million_columns

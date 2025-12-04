def count_neighbours(row, col, map)
  neighbours = 0
  # Check top left
  if row - 1 >= 0 && col - 1 >= 0 && map[row - 1][col - 1] == "@"
    neighbours += 1
  end

  # Check top
  if row - 1 >= 0 && map[row - 1][col] == "@"
    neighbours += 1
  end

  # Check top right
  if row - 1 >= 0 && col + 1 < map[row].length && map[row - 1][col + 1] == "@"
    neighbours += 1
  end

  # Check left
  if col - 1 >= 0 && map[row][col - 1] == "@"
    neighbours += 1
  end

  # Check right
  if col + 1 < map[row].length && map[row][col + 1] == "@"
    neighbours += 1
  end

  # Check bottom left
  if row + 1 < map.length && col - 1 >= 0 && map[row + 1][col - 1] == "@"
    neighbours += 1
  end

  # Check bottom
  if row + 1 < map.length && map[row + 1][col] == "@"
    neighbours += 1
  end

  # Check bottom right
  if row + 1 < map.length && col + 1 < map[row].length && map[row + 1][col + 1] == "@"
    neighbours += 1
  end
  neighbours
end

map = File.readlines("ADVENT_OF_CODE_2025/day_04/input_1.txt").map(&:strip).map(&:chars)

neighbout_count = []
for row in 0..map.length - 1
  for col in 0..map[row].length - 1
    neighbout_count << count_neighbours(row, col, map) if map[row][col] == "@"
  end
end

p neighbout_count.select{ |count| count < 4 }.length

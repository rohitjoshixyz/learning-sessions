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

def remove_roll(map)
  removed_count = 0
  for row in 0..map.length - 1
    for col in 0..map[row].length - 1
      count = count_neighbours(row, col, map)
      if map[row][col] == "@" && count < 4
        removed_count += 1
        map[row][col] = "."
      end
    end
  end
  [removed_count, map]
end

map = File.readlines("ADVENT_OF_CODE_2025/day_04/input_1.txt").map(&:strip).map(&:chars)
total_removed_count = 0

while true
  removed_count, new_map = remove_roll(map)
  map = new_map
  total_removed_count += removed_count
  break if removed_count == 0
end

p total_removed_count

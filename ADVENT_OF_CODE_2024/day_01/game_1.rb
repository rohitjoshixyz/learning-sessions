lines = File.readlines("ADVENT_OF_CODE_2024/day_01/test_input.txt", chomp: true)

data = lines.map { |line| line.split("\s").map(&:to_i) }
# [[3, 4], [4, 3], [2, 5], [1, 3], [3, 9], [3, 3]]

array_1 = []
array_2 = []

data.each do |num_1, num_2|
  array_1 << num_1
  array_2 << num_2
end

array_1.sort!
array_2.sort!

sum_of_distances = 0
array_1.each_with_index do |num, index|
  sum_of_distances += (num - array_2[index]).abs
end

p sum_of_distances
# 1882714

lines = File.readlines("ADVENT_OF_CODE_2024/day_01/test_input.txt", chomp: true)

data = lines.map { |line| line.split("\s").map(&:to_i) }
# [[3, 4], [4, 3], [2, 5], [1, 3], [3, 9], [3, 3]]

array_1 = []
array_2 = []

data.each do |num_1, num_2|
  array_1 << num_1
  array_2 << num_2
end

array_1_tally = array_1.tally
array_2_tally = array_2.tally

result = []
array_1_tally.each do |key, value|
  result << key * (array_1_tally[key] || 0) * (array_2_tally[key] || 0)
end

p result.sum

# 19437052

points = []
File.readlines("ADVENT_OF_CODE_2023/day_04/input_1.txt", chomp: true).each do |line|
  card, input = line.split(":")
  winning_numbers, my_numbers = input.strip.split("|").map do |str|
    str.strip.split(/\s+/)
  end
  count = winning_numbers.intersection(my_numbers).count
  p count
  if count == 0
  elsif count == 1
    points << 1
  else
    points << (2 ** (count - 1))
  end
end
p points
p points.sum

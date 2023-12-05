card_counts = Hash.new(1)
lines = File.readlines("ADVENT_OF_CODE_2023/day_04/test_input.txt", chomp: true)
lines.each do |line|
  card, input = line.split(":")
  card_number = card.split(" ").last
  winning_numbers, my_numbers = input.strip.split("|").map do |str|
    str.strip.split(/\s+/)
  end
  count = winning_numbers.intersection(my_numbers).count
  # 1: 2 3 4 5
  # 2: 3 4 3 4
  # 3: 4 5 4 5 4 5 4 5
  # 4: 4

  i = 1

  while(i <= count) do
    card_counts[card_number.to_i + i] += count
    i += 1
  end
end
p card_counts

# 7445 is low

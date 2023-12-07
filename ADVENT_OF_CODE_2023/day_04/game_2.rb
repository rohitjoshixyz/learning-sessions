card_and_win_map = {}
card_and_count_map = {}
lines = File.readlines("ADVENT_OF_CODE_2023/day_04/input_1.txt", chomp: true)
lines.each do |line|
  card, input = line.split(":")
  card_number = card.split(" ").last
  winning_numbers, my_numbers = input.strip.split("|").map do |str|
    str.strip.split(/\s+/)
  end
  count = winning_numbers.intersection(my_numbers).count
  card_and_count_map[card_number.to_i] = 1
  card_and_win_map[card_number.to_i] = count

end

card_and_win_map.each do |card, win|
  card_and_count_map[card].times do |i|
    win.times do |j|
      card_and_count_map[card + j + 1] += 1 if card_and_count_map[card + j + 1]
    end
  end
end
p card_and_count_map.values.sum
# 7445 is low

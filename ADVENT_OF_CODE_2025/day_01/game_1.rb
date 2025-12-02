moves = File.readlines("ADVENT_OF_CODE_2025/day_01/test_input.txt").map(&:strip)

zero_count = 0
position = 50

moves.map do |move|
  direction, click_count = move.split("", 2)
  click_count = click_count.to_i.modulo(100)

  if direction == "L"
    new_position = position - click_count
    new_position += 100 if position - click_count < 0
    position = new_position
  end
  if direction == "R"
    new_position = position + click_count
    new_position -= 100 if position + click_count >= 100
    position = new_position
  end
  p new_position
  zero_count += 1 if position == 0
end
p zero_count

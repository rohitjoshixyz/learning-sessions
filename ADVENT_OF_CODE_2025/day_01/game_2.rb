moves = File.readlines("ADVENT_OF_CODE_2025/day_01/input_1.txt").map(&:strip)
position = 50
zero_crossed = 0

moves.each do |move|
  direction, clicks = move.split("", 2)
  clicks = clicks.to_i
  full_rotations = clicks / 100
  zero_crossed += full_rotations
  step = direction == "R" ? 1 : -1

  remainder = clicks.modulo(100)

  remainder.times do
    position = (position + step).modulo(100)
    zero_crossed += 1 if position == 0
  end
end

puts "Final position: #{position}"
puts "zero_crossed: #{zero_crossed}"

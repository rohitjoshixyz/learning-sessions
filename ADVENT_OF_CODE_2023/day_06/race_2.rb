input = File.read("ADVENT_OF_CODE_2023/day_06/input_1.txt")
time, current_record_distance =  input.split(/\n/).map { |str| str.split(":").map(&:strip).last.split(/\s/).reject{|str| str == ""}.join("").to_i }

# p time
# p current_record_distance
# index = charge_time = speed

arr = []
ways_to_win = 0
(0..(time)).each do |index|
  if index * (time - index) > current_record_distance
    # p index
    ways_to_win += 1
  end
end
p ways_to_win

input = File.read("ADVENT_OF_CODE_2023/day_06/input_1.txt")
times, current_record_distances =  input.split(/\n/).map { |str| str.split(":").map(&:strip).last.split(/\s/).reject{|str| str == ""}.map(&:to_i) }


time = 7
current_record_distance = 9

# index = charge_time = speed

arr = []
(0...(times.length)).each do |i|
  ways_to_win = 0
  (0..(times[i])).each do |index|
    if index * (times[i] - index) > current_record_distances[i]
      # p index
      ways_to_win += 1
    end
  end
  arr << ways_to_win
end
p arr.inject(:*)

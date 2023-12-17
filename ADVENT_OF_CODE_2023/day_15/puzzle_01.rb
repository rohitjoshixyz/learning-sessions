array = File.read("ADVENT_OF_CODE_2023/day_15/input_1.txt").chomp.split(",").map{|str| str.split("")}
# p array

seq = "HASH".split("")
current_value = 0


def calculate(word, index, current_value)
  if index == word.length
    return current_value
  end
  current_value += word[index].ord
  current_value *= 17
  current_value = current_value % 256
  calculate(word, index + 1, current_value)
end

sum = array.map do |seq|
  # puts "#{seq} #{calculate(seq, 0, 0)}"
  calculate(seq, 0, 0)
end.sum

p sum


exit
array.each do |sequence|

end

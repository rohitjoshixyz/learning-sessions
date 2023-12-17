array = File.read("ADVENT_OF_CODE_2023/day_15/input_1.txt").chomp.split(",")

def calculate(word, index, current_value)
  if index == word.length
    return current_value
  end
  current_value += word[index].ord
  current_value *= 17
  current_value = current_value % 256
  calculate(word, index + 1, current_value)
end

ht = {}
256.times do |i|
  ht[i] = {}
end

array.each do |seq|
  word = seq.match(/\w+/)&.[](0)
  operation = seq.match(/[=\-]/)&.[](0)
  focal_length = seq.match(/\d+/)&.[](0)
  key = calculate(word, 0, 0)

  # puts "word:#{word} key:#{key} operation:#{operation} focal_length:#{focal_length}"

  ht[key][word] = focal_length

  if operation == "="
    ht[key][word] = focal_length
  elsif operation == "-"
    ht[key].delete(word)
  end
end

total = 0
ht.each do |box_number, slots|
  a = box_number + 1
  b = slots.to_a.map.with_index do |lens, index|
    (index + 1) * lens[1].to_i
  end.sum
  total = total + a * b
end
p total

# 264021 is the answer

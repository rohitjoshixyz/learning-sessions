sum = 0
File.readlines("ADVENT_OF_CODE_2023/day_01/input_1.txt").each do |line|
  puts line
  word = line.split("")
  left = 0
  right = word.length - 1
  while left < word.length do
    if word[left].match(/[[:digit:]]/)
      break
    end
    left += 1
  end

  while right >= 0 do
    if word[right].match(/[[:digit:]]/)
      break
    end
    right -= 1
  end
  puts "#{word[left]}#{word[right]}".to_i
  sum += "#{word[left]}#{word[right]}".to_i
end
puts sum


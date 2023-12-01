sum = 0
File.readlines("ADVENT_OF_CODE_2023/day_01/input_2.txt").each do |line|
  puts "Original: #{line}"
  line.gsub!("one", "on1e")
  line.gsub!("two", "tw2o")
  line.gsub!("three", "thr3ee")
  line.gsub!("four", "fo4ur")
  line.gsub!("five", "fi5ve")
  line.gsub!("six", "s6ix")
  line.gsub!("seven", "se7ven")
  line.gsub!("eight", "ei8ght")
  line.gsub!("nine", "ni9ne")
  line.gsub!("zero", "ze0ro")
  puts "Modified: #{line}"

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
  puts
  sum += "#{word[left]}#{word[right]}".to_i
end
puts sum


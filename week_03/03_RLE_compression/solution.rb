# RLE compression
input = "aaaaaabbbbzzzz"

def compress(input)
  return input if input.length < 2

  array = input.split("")
  output = ""
  current_char = array[0]
  current_count = 1
  array.each do |char|
    if char != current_char
      output << current_char
      output << current_count.to_s unless current_count == 1
      current_char = char
      current_count = 1
    else
      current_count += 1
    end
  end
  output << current_char
  output << current_count.to_s unless current_count == 1
  output
end

def extract(input)
  array = input.split("")
  output = ""
  stack = []
  array.each do |char|
    if char.match(/^[[:alpha:]]$/)
      stack.push(char)
    else
      while stack.length > 1
        output << stack.shift
      end
      letter_to_repeat = stack.pop()
      output << letter_to_repeat * char.to_i
    end
  end
  output
end

puts compress("aaaaaabbbbzzzzsasfdsssxyz")
puts extract("a7b4z4sasfds3xyz")
puts compress("a")
puts extract("a6b4z4")
puts extract("a6b4kwmvz4")

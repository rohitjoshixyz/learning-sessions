# RLE compression
require "strscan"

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
  scanner = StringScanner.new(input)
  output = ""
  stack = []

  while !scanner.eos?
    if char = scanner.scan(/[[:alpha:]]/)
      stack.push(char)
    elsif num = scanner.scan(/\d+/)
      while stack.length > 1
        output << stack.shift
      end
      letter_to_repeat = stack.pop()
      output << letter_to_repeat * num.to_i
    else
      scanner.pos += 1
    end
  end

  output << stack.join
  output
end

puts extract("a7b4z4sasfds3xyz")
puts compress("aaaaaabbbbzzzzsasfdsssxyz")
puts extract("a7b4z4sasfds3xyz")
puts compress("a")
puts extract("a16b14z4")
puts extract("a6b4kwmvz4")

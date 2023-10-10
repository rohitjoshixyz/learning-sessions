require "benchmark/ips"

def compress_v1(input)
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

def compress_v2(input)
  return input if input.length < 2
  output = ""
  current_char = input[0]
  current_count = 1
  input.each_char do |char|
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

def compress_v3(input)
  return input if input.length < 2
  output = ""
  current_char = input[0].ord
  current_count = 1
  input.each_byte do |char|
    if char != current_char
      output << current_char.chr
      output << current_count.to_s unless current_count == 1
      current_char = char
      current_count = 1
    else
      current_count += 1
    end
  end
  output << current_char.chr
  output << current_count.to_s unless current_count == 1
  output
end

def compress_v4(input)
  return input if input.length < 2
  output = []
  current_char = input[0].ord
  current_count = 1
  input.each_byte do |char|
    if char != current_char
      output << current_char.chr
      output << current_count.to_s unless current_count == 1
      current_char = char
      current_count = 1
    else
      current_count += 1
    end
  end
  output << current_char.chr
  output << current_count.to_s unless current_count == 1
  output.join
end

# With lookup table
ASCII_LOOKUP = (0..255).to_a.map(&:chr)

def compress_v5(input)
  return input if input.length < 2
  output = []
  current_char = input[0].ord
  current_count = 1
  input.each_byte do |char|
    if char != current_char
      output << ASCII_LOOKUP[current_char]
      output << current_count.to_s unless current_count == 1
      current_char = char
      current_count = 1
    else
      current_count += 1
    end
  end
  output << ASCII_LOOKUP[current_char]
  output << current_count.to_s unless current_count == 1
  output.join
end

input = File.read("input.txt")
output = File.read("output.txt")

Benchmark.ips do |ips|
  ips.report("version_1") do
    compress_v1(input) != output && raise("There is a bug")
  end

  ips.report("version_2") do
    compress_v2(input) != output && raise("There is a bug")
  end

  ips.report("version_3") do
    compress_v3(input) != output && raise("There is a bug")
  end

  ips.report("version_4") do
    compress_v4(input) != output && raise("There is a bug")
  end

  ips.report("version_5") do
    compress_v5(input) != output && raise("There is a bug")
  end
end

def count_allocated_objects
  before = GC.stat[:total_allocated_objects]
  yield
  after = GC.stat[:total_allocated_objects]
  puts (after - before)
end


puts "Version 1 GC total_allocated_objects"
count_allocated_objects do
  compress_v1(input)
end

puts "Version 2 GC total_allocated_objects"
count_allocated_objects do
  compress_v2(input)
end

puts "Version 3 GC total_allocated_objects"
count_allocated_objects do
  compress_v3(input)
end

puts "Version 4 GC total_allocated_objects"
count_allocated_objects do
  compress_v4(input)
end

puts "Version 5 GC total_allocated_objects"
count_allocated_objects do
  compress_v5(input)
end

sequence, map = File.read("ADVENT_OF_CODE_2023/day_08/input_1.txt").split("\n\n")
sequence = sequence.split("")
map = map.split("\n").map { |line| line.split(" = ") }.to_h
map = map.each { |key, value| map[key] = value.match(/\((\w{3}), (\w{3})\)/).captures }

a = map.select { |key, value| key.end_with?("A") }
z = map.select { |key, value| key.end_with?("Z") }
# p a
# p z

count_array = []
a.keys.each do |output|
  count = 0
  while !output.end_with?("Z") do
    operation = sequence[count % sequence.length]
    # p operation
    if operation == "L"
      output = map[output].first
    else
      output = map[output].last
    end
    count += 1
  end
  # p count
  count_array << count
end

def gcd(a, b)
  while b != 0
    a, b = b, a % b
    # p a
    # p b
  end
  a
end

def lcm(a, b)
  (a * b) / gcd(a, b)
end

# p count_array
# p count_array.inject(&:*)

numbers = [21883, 13019, 11911, 16897, 19667, 18559]
num1 = 21883
num_2 = 13019
answer = lcm(num1, num_2)
i = 2
while i < numbers.length
  answer = lcm(answer, numbers[i])
  i += 1
end
p answer

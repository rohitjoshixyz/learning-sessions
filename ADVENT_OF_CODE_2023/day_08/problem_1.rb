sequence, map = File.read("ADVENT_OF_CODE_2023/day_08/input_1.txt").split("\n\n")
sequence = sequence.split("")
map = map.split("\n").map { |line| line.split(" = ") }.to_h
map = map.each { |key, value| map[key] = value.match(/\((\w{3}), (\w{3})\)/).captures }

output = "AAA"
count = 0
while output != "ZZZ" do
  operation = sequence[count % sequence.length]
  p operation
  if operation == "L"
    output = map[output].first
  else
    output = map[output].last
  end
  count += 1
end
p count

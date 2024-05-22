require "pry-byebug"

def split_range(input, mappings)
  output = []
  # p input
  # p mappings
  mappings.each do |range, offset|
    # p [input.begin, input.end, range.begin, range.end].inspect
    if range.end < input.begin
      next
      # puts "Range is completely less than input range"
    elsif range.begin > input.end
      next
      # puts "Range is completely greater than input range"
    elsif range.begin >= input.begin && range.end <= input.end
      # puts "Range is completely inside the input range"
      output << [(range.begin)..(range.end), true, offset]
    elsif range.begin < input.begin && range.end >= input.begin && range.end <= input.end
      # puts "Range is overlapping the input range from left"
      output << [(input.begin)..(range.end), true, offset]
    elsif range.begin >= input.begin && range.begin <= input.end && range.end > input.end
      # puts "Range is overlapping the input range from right"
      output << [(range.begin)..(input.end), true, offset]
    elsif range.begin < input.begin && range.end > input.end
      # puts "Range is greater than input on both ends"
      output << [(input.begin)..(input.end), true, offset]
    else
      puts "Unhandled case Range #{range} Input #{input}"
      exit
    end
  end

  if output.empty?
    return [input]
  end

  false_ranges = []
  output = output.sort do |a, b|
    a[0].begin <=> b[0].begin
  end
  # This loop is to find the gaps between the ranges for the output
  # If we have 1..10 and 15..20, we need to find the gap between 10 and 15 and add a false range 11..14
  output.each_cons(2) do |pair|
    range_1 = pair[0][0]
    range_2 = pair[1][0]
    next if range_2.begin - range_1.end == 1
    false_ranges << [(range_1.end + 1)..(range_2.begin - 1), false]
  end

  if input.begin < output[0][0].begin
    false_ranges << [(input.begin)..(output[0][0].begin - 1), false]
  end

  if output.last[0].end < input.end
    false_ranges << [(output.last[0].end + 1)..(input.end), false]
  end
  
  output = output.concat(false_ranges).sort do |a, b|
    a[0].begin <=> b[0].begin
  end

  output = output.map do |range, bool, offset|
    if bool == true
      (range.begin + offset)..(range.end + offset)
    else
      range
    end
  end

  output.sort do |a, b|
    a.begin <=> b.begin
  end
end

input = File.read("ADVENT_OF_CODE_2023/day_05/input_1.txt")
seeds = input.match(/^seeds: (.*)seed-to-soil map:$/m)[1].strip.split(" ").map(&:to_i)
seed_to_soil = input.match(/^seed-to-soil map:(.*)soil-to-fertilizer map:$/m)[1].strip.split("\n").map{|str| str.split(" ").map(&:to_i)}

soil_to_fertilizer = input.match(/^soil-to-fertilizer map:(.*)fertilizer-to-water map:$/m)[1].strip.split("\n").map{|str| str.split(" ").map(&:to_i)}

fertilizer_to_water = input.match(/^fertilizer-to-water map:(.*)water-to-light map:$/m)[1].strip.split("\n").map{|str| str.split(" ").map(&:to_i)}
water_to_light = input.match(/^water-to-light map:(.*)light-to-temperature map:$/m)[1].strip.split("\n").map{|str| str.split(" ").map(&:to_i)}
light_to_temperature = input.match(/^light-to-temperature map:(.*)temperature-to-humidity map:$/m)[1].strip.split("\n").map{|str| str.split(" ").map(&:to_i)}
temperature_to_humidity = input.match(/^temperature-to-humidity map:(.*)humidity-to-location map:$/m)[1].strip.split("\n").map{|str| str.split(" ").map(&:to_i)}
humidity_to_location = input.match(/^humidity-to-location map:(.*)$/m)[1].strip.split("\n").map{|str| str.split(" ").map(&:to_i)}

def get_offset_array(mappings)
  mappings.map do |dest, source, range|
    offset = dest - source
    [source..(source + range - 1), offset]
  end.sort do |a, b|
    a[0].begin <=> b[0].begin
  end

end


# p split_range(79..92, get_offset_array(seed_to_soil))
# p split_range(55..67, get_offset_array(seed_to_soil))

seed_ranges = seeds.each_slice(2).map do |(start, length)|
  start..(start + length - 1)
end

all_mappings = [seed_to_soil, soil_to_fertilizer, fertilizer_to_water, water_to_light, light_to_temperature,temperature_to_humidity,
  humidity_to_location]

# p seed_ranges
all_mappings.each do |mapping|
  new_ranges = []

  seed_ranges.each do |seed_range|
    new_ranges.concat(split_range(seed_range, get_offset_array(mapping)))
  end

  seed_ranges = new_ranges
  # p seed_ranges
end

p seed_ranges.map { |range| range.begin }.min

# 1048396245 is too high
# 1267802202 is too high

# 28965817

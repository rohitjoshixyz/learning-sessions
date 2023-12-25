def split_range(input, mappings)
  output = []
  # p input
  p mappings
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
      output << [range, true]
    elsif range.begin < input.begin && range.end >= input.begin && range.end <= input.end
      # puts "Range is overlapping the input range from left"
      output << [(input.begin)..(range.end), true]
    elsif range.begin >= input.begin && range.begin <= input.end && range.end > input.end
      # puts "Range is overlapping the input range from right"
      output << [(range.begin)..(input.end), true]
    elsif range.begin < input.begin && range.end > input.end
      # puts "Range is greater than input on both ends"
      output << [(input.begin)..(input.end), true]
    else
      puts "Unhandled case Range #{range} Input #{input}"
      exit
    end
  end
  false_ranges = []
  output.each_cons(2) do |pair|
    range_1 = pair[0][0]
    range_2 = pair[1][0]
    next if range_1.end == range_2.begin + 1
    false_ranges << [(range_1.end + 1)..(range_2.begin - 1), false]
  end


  if input.begin < output[0][0].begin
    false_ranges << [(input.begin)..(output[0][0].begin - 1), false]
  end

  if output.last[0].end < input.end
    false_ranges << [(output.last[0].end + 1)..(input.end), false]
  end
  
  output.concat(false_ranges).sort do |a, b|
    a[0].begin <=> b[0].begin
  end
end

input = File.read("ADVENT_OF_CODE_2023/day_05/test_input.txt")
seeds = input.match(/^seeds: (.*)seed-to-soil map:$/m)[1].strip.split(" ").map(&:to_i)
seed_to_soil = input.match(/^seed-to-soil map:(.*)soil-to-fertilizer map:$/m)[1].strip.split("\n").map{|str| str.split(" ").map(&:to_i)}
p seed_to_soil
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
  end
end

all_mappings = [seed_to_soil, soil_to_fertilizer, fertilizer_to_water, water_to_light,
  water_to_light, light_to_temperature, temperature_to_humidity,
  humidity_to_location]


p split_range(79..92, get_offset_array(seed_to_soil))
p split_range(55..67, get_offset_array(seed_to_soil))


# locations = []
# i = 0
# min = ranged_seeds.min
# max = ranged_seeds.max
# while i < ranged_seeds.length do
#   if i % 2 == 0
#     if in_range?(ranged_seeds[i], ranged_seeds[i+1], min, max)
#       ((ranged_seeds[i])..(ranged_seeds[i+1])).each do |number|
#         seed = number
#         soil = next_seed(seed, seed_to_soil)
#         fertilizer = next_seed(soil, soil_to_fertilizer)
#         water = next_seed(fertilizer, fertilizer_to_water)
#         light = next_seed(water, water_to_light)
#         temperature = next_seed(light, light_to_temperature)
#         humidity = next_seed(temperature, temperature_to_humidity)
#         location = next_seed(humidity, humidity_to_location)
#         puts "Seed#{number} -> Soil#{soil} -> Fertilizer#{fertilizer} -> Water#{water} -> Light#{light} -> Temperature#{temperature} -> Humidity#{humidity} -> Location#{location}"
#         locations << location
#       end
#     end
#   end
#   i += 2
# end
# # p locations.min

# Add a method to

# 1048396245 is too high
# 1267802202 is too high

# 28965817

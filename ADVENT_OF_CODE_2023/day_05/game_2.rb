
input = File.read("ADVENT_OF_CODE_2023/day_05/input_1.txt")
p seeds = input.match(/^seeds: (.*)seed-to-soil map:$/m)[1].strip.split(" ").map(&:to_i)
p seed_to_soil = input.match(/^seed-to-soil map:(.*)soil-to-fertilizer map:$/m)[1].strip.split("\n").map{|str| str.split(" ").map(&:to_i)}
p soil_to_fertilizer = input.match(/^soil-to-fertilizer map:(.*)fertilizer-to-water map:$/m)[1].strip.split("\n").map{|str| str.split(" ").map(&:to_i)}

p fertilizer_to_water = input.match(/^fertilizer-to-water map:(.*)water-to-light map:$/m)[1].strip.split("\n").map{|str| str.split(" ").map(&:to_i)}
p water_to_light = input.match(/^water-to-light map:(.*)light-to-temperature map:$/m)[1].strip.split("\n").map{|str| str.split(" ").map(&:to_i)}
p light_to_temperature = input.match(/^light-to-temperature map:(.*)temperature-to-humidity map:$/m)[1].strip.split("\n").map{|str| str.split(" ").map(&:to_i)}
p temperature_to_humidity = input.match(/^temperature-to-humidity map:(.*)humidity-to-location map:$/m)[1].strip.split("\n").map{|str| str.split(" ").map(&:to_i)}
p humidity_to_location = input.match(/^humidity-to-location map:(.*)$/m)[1].strip.split("\n").map{|str| str.split(" ").map(&:to_i)}
puts

mappings = [seed_to_soil, soil_to_fertilizer, fertilizer_to_water, water_to_light,
            water_to_light, light_to_temperature, temperature_to_humidity,
            humidity_to_location]

def next_seed(seed, mapping)
  mapping.each do |map|
    dest, source, range  = map
    offset = dest - source
    if (source < seed) && seed < (source + range)
      return seed + offset
    end
  end
  seed
end

locations = seeds.map do |seed|
  seed = next_seed(seed, seed_to_soil)
  seed = next_seed(seed, soil_to_fertilizer)
  seed = next_seed(seed, fertilizer_to_water)
  seed = next_seed(seed, water_to_light)
  seed = next_seed(seed, light_to_temperature)
  seed = next_seed(seed, temperature_to_humidity)
  seed = next_seed(seed, humidity_to_location)
end
puts locations.min


input = File.read("ADVENT_OF_CODE_2023/day_05/test_input.txt")
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
    index = (source..(source+range)).to_a.index(seed)
    if index
      return (dest..(dest+range)).to_a[index]
    end
  end
  seed
end

locations = seeds.map do |number|
  # puts seed
  seed = number
  soil = next_seed(seed, seed_to_soil)
  fertilizer = next_seed(soil, soil_to_fertilizer)
  water = next_seed(fertilizer, fertilizer_to_water)
  light = next_seed(water, water_to_light)
  temperature = next_seed(light, light_to_temperature)
  humidity = next_seed(temperature, temperature_to_humidity)
  location = next_seed(humidity, humidity_to_location)
  puts "Seed#{number} -> Soil#{soil} -> Fertilizer#{fertilizer} -> Water#{water} -> Light#{light} -> Temperature#{temperature} -> Humidity#{humidity} -> Location#{location}"
end

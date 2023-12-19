
input = File.read("ADVENT_OF_CODE_2023/day_05/input_1.txt")
seeds = input.match(/^seeds: (.*)seed-to-soil map:$/m)[1].strip.split(" ").map(&:to_i)
seed_to_soil = input.match(/^seed-to-soil map:(.*)soil-to-fertilizer map:$/m)[1].strip.split("\n").map{|str| str.split(" ").map(&:to_i)}
soil_to_fertilizer = input.match(/^soil-to-fertilizer map:(.*)fertilizer-to-water map:$/m)[1].strip.split("\n").map{|str| str.split(" ").map(&:to_i)}

fertilizer_to_water = input.match(/^fertilizer-to-water map:(.*)water-to-light map:$/m)[1].strip.split("\n").map{|str| str.split(" ").map(&:to_i)}
water_to_light = input.match(/^water-to-light map:(.*)light-to-temperature map:$/m)[1].strip.split("\n").map{|str| str.split(" ").map(&:to_i)}
light_to_temperature = input.match(/^light-to-temperature map:(.*)temperature-to-humidity map:$/m)[1].strip.split("\n").map{|str| str.split(" ").map(&:to_i)}
temperature_to_humidity = input.match(/^temperature-to-humidity map:(.*)humidity-to-location map:$/m)[1].strip.split("\n").map{|str| str.split(" ").map(&:to_i)}
humidity_to_location = input.match(/^humidity-to-location map:(.*)$/m)[1].strip.split("\n").map{|str| str.split(" ").map(&:to_i)}

ranged_seeds = seeds.map.with_index do |number, index|
  if index % 2 == 1
    seeds[index - 1] + number
  else
    number
  end
end
p ranged_seeds

def in_range?(start_index, last_index, total_range_start_index, total_range_last_index)
  if (start_index <= total_range_last_index) and (last_index <= total_range_last_index)
    return true
  else
    return false
  end
end

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

locations = []
i = 0
min = ranged_seeds.min
max = ranged_seeds.max
while i < ranged_seeds.length do
  if i % 2 == 0
    if in_range?(ranged_seeds[i], ranged_seeds[i+1], min, max)
      ((ranged_seeds[i])..(ranged_seeds[i+1])).each do |number|
        seed = number
        soil = next_seed(seed, seed_to_soil)
        fertilizer = next_seed(soil, soil_to_fertilizer)
        water = next_seed(fertilizer, fertilizer_to_water)
        light = next_seed(water, water_to_light)
        temperature = next_seed(light, light_to_temperature)
        humidity = next_seed(temperature, temperature_to_humidity)
        location = next_seed(humidity, humidity_to_location)
        # puts "Seed#{number} -> Soil#{soil} -> Fertilizer#{fertilizer} -> Water#{water} -> Light#{light} -> Temperature#{temperature} -> Humidity#{humidity} -> Location#{location}"
        locations << location
      end
    end
  end
  i += 2
end
p locations.min

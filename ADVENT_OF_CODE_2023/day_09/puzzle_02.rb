sequences = File.read("ADVENT_OF_CODE_2023/day_09/input_1.txt").split("\n").map{|line| line.split(" ").map(&:to_i)}
# p sequences

series = Hash.new([])
sequences.each_with_index do |sequence, index|
  next_sequence = sequence
  output_sequence = sequence
  output_sequence_array = [output_sequence]
  
    while !next_sequence.all?(0) do
      i = 0
      j = i + 1
      output_sequence = []
      while i < (next_sequence.length - 1)
        output_sequence << next_sequence[j] - next_sequence[i]
        i += 1
        j += 1
      end
      next_sequence = output_sequence
      output_sequence_array << output_sequence
    end
    # p series
    series[index] = output_sequence_array
end

# puts
series.each do |key, sequences|
  input = sequences.reverse
  input.first.unshift(0)
  # p input

  i = 1
  while i < (input.length - 1)
    input[i + 1].unshift(input[i + 1].first - input[i].first)
    # p input
    i += 1
  end

  # p input
  series[key] = input.reverse
end
# p series

p series.map{|key, array| array.first.first }.sum


line_length = File.readlines("ADVENT_OF_CODE_2023/day_03/test_input.txt", chomp: true).first.length
lines = File.readlines("ADVENT_OF_CODE_2023/day_03/test_input.txt", chomp: true)
grid = lines.map{|line| line.split("") }
part_number_array = []

padded_grid = []
line_length.times { padded_grid << "." }
grid.each do |row|
  padded_grid << "."
  padded_grid = padded_grid + row
  padded_grid << "."
end
line_length.times { padded_grid << "." }

# p padded_grid

# grid_length = grid.length # 140 * 140
# p line_length
lines.each_with_index do |line, line_index|
  numbers = line.split(/[\.&*=@$-+#\-\/]+/).reject(&:empty?)
  symbols = line.split(/[\d\.]+/).reject(&:empty?)

  numbers.each do |number|
    # puts "Number: #{number}, index: #{line.index(number) + (line_index * line_length)}"
    number_index = line.index(number) + (line_index * line_length)
    number_length = number.length

    # i = 0
    # while i < number_length + 2 do
    #   j = 0
    #   while j < 3 do
    #     if (i == 0 || i == number_length + 2 || j == 0 || j == 2)
    #       print "*"
    #     else
    #       print "-"
    #     end
    #     j += 1
    #   end
    #   puts ""
    #   i += 1
    # end


    (-1..(number_length)).each do |i| # prev
      [-1, 0, 1].each do |j|
  
        index_to_check = number_index + i + j * line_length
        p index_to_check
        # next if index_to_check < (line_index * line_length) || index_to_check > (line_index * line_length + line_length)


          if symbols.include?(grid[index_to_check])
            part_number_array << number
          end
          if symbols.include?(grid[index_to_check])
            part_number_array << number
          end
        # end

      end
    end
  end
end
p part_number_array.map(&:to_i).sum

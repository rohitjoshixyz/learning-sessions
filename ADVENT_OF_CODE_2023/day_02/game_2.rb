
power_array = []
File.readlines("ADVENT_OF_CODE_2023/day_02/input_1.txt", chomp: true).each do |line|
  game = line.split(":")[0].strip
  moves = line.split(":").drop(1).map(&:strip)
  game_number = game.split(" ").last.strip
  puts "Game number: #{game_number}"
 
  moves = moves.map { |move| move.split(";").map(&:strip) }
  moves.map do |move|
    min_red = 0
    min_green = 0
    min_blue = 0
    move.map do |set|
      move_array = []
      set.split(", ").map do |count_and_color|
        move_array.push(
          count_and_color.split(" ")
        )
      end
      puts "Moves array: #{move_array}"
      move_array.each do |count, color|
        count = count.to_i
        min_red = [count, min_red].max if color == "red"
        min_green = [count, min_green].max if color == "green"
        min_blue = [count, min_blue].max if color == "blue"
      end
    end
    power_array << min_red * min_green * min_blue
  end
  puts "Moves: #{moves}"
end

p power_array.sum


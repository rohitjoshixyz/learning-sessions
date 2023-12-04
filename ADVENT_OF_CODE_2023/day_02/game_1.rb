impossible_game_ids = []

File.readlines("ADVENT_OF_CODE_2023/day_02/input_1.txt", chomp: true).each do |line|
  game = line.split(":")[0].strip
  moves = line.split(":").drop(1).map(&:strip)
  game_number = game.split(" ").last.strip
  puts "Game number: #{game_number}"
 
  moves = moves.map { |move| move.split(";").map(&:strip) }
  moves.map do |move|
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
        if color == "red" && count > 12 || color == "green" && count > 13 || color == "blue" && count > 14
          impossible_game_ids << game_number.to_i
        end
      end
    end
  end
  puts "Moves: #{moves}"
end

p (5050 - impossible_game_ids.uniq.sum)

# 2330 is low
# 5050

games = File.readlines("ADVENT_OF_CODE_2024/day_01/day_02/test_input.txt").map(&:strip)
games = games.map do |game|
  game.split(" ").map(&:to_i)
end

def safe_game?(game)
  safe = true
  index = 0
  if game.sort.reverse == game || game.sort_by{|num| num} == game
    while index < (game.length - 1)
      if (game[index] - game[index + 1]).abs > 3 || (game[index] - game[index + 1]).abs == 0
        safe = false
        unsafe_element = index
        break
      end
      index += 1
    end
  else
    safe = false
  end
  safe
end

safe_games = 0
games.map do |game|
  safe_games += 1 if safe_game?(game)
end

puts safe_games

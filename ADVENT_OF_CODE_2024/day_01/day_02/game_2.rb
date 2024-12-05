games = File.readlines("ADVENT_OF_CODE_2024/day_01/day_02/test_input.txt").map(&:strip)
games = games.map do |game|
  game.split(" ").map(&:to_i)
end

def ascending_game?(game)
  game.sort_by{|num| num} == game
end

def descending_game?(game)
  game.sort.reverse == game
end

def sorted_game?(game)
  ascending_game?(game) || descending_game?(game)
end

def unsafe_index_by_diff(game)
  index = 0
  unsafe_index = nil
  while index < (game.length - 1)
    if (game[index] - game[index + 1]).abs > 3 || (game[index] - game[index + 1]).abs == 0
      unsafe_index = index
      break
    end
    index += 1
  end
  unsafe_index
end

def safe_game?(game)
  sorted_game?(game) && unsafe_index_by_diff(game).nil?
end

def safe_game_with_one_removal?(game)
  game.each_with_index do |num, index|
    new_game = game.dup
    new_game.delete_at(index)
    return true if safe_game?(new_game)
  end
  false
end

def check_game(game)
  if safe_game?(game)
    true
  elsif safe_game_with_one_removal?(game)
    true
  else
    false
  end
end

safe_games = 0
games.map do |game|
  # puts "game: #{game} safe: #{check_game(game)}"
  safe_games += 1 if check_game(game)
end

puts safe_games


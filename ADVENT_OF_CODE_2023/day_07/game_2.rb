hands = File.read("ADVENT_OF_CODE_2023/day_07/input_1.txt").split("\n").map {|line| line.split(" ")}.to_h

class Hand
  attr_reader :hand, :bid
  def initialize(hand, bid)
    @hand = hand.split("")
    @bid = bid.to_i
  end

  def card_points
    {
      "J" => 1,
      "2" => 2,
      "3" => 3,
      "4" => 4,
      "5" => 5,
      "6" => 6,
      "7" => 7,
      "8" => 8,
      "9" => 9,
      "T" => 10,
      "Q" => 12,
      "K" => 13,
      "A" => 14
    }
  end

  def first_ordering
    tally_values = hand.tally.values
    if tally_values.max == 5
      # p "Five of a kind"
      return 7
    elsif tally_values.max == 4
      # p "Four of a kind"
      if hand.count("J") == 1
        return 7
      elsif hand.count("J") == 4
        return 7
      else
        return 6
      end
    elsif tally_values.count(3) == 1 && tally_values.count(2) == 1
      # p "Full house"
      if hand.count("J") == 3
        return 7
      elsif hand.count("J") == 2
        return 7
      else
        return 5
      end
    elsif tally_values.max == 3
      # p "Three of a kind"
      if hand.count("J") == 3
        return 6
      elsif hand.count("J") == 1
        return 6
      else
        return 4
      end
    elsif tally_values.count(2) == 2
      # p "Two pair"
      if hand.count("J") == 2
        return 6
      elsif hand.count("J") == 1
        return 5
      else
        return 3
      end
    elsif tally_values.count(2) == 1
      # p "One pair"
      return hand.include?("J") ?  4 : 2
    else
      # p "High card"
     return hand.include?("J") ?  2 : 1
    end
  end

  def second_ordering
    hand.map do |card|
      card_points[card]
    end
  end

  def total_score
    [first_ordering, second_ordering]
  end

  def <=>(other)
    total_score <=> other.total_score
  end
end

hand_objects = hands.map do |hand, bid|
  Hand.new(hand, bid)
end

sum = hand_objects.sort.map.with_index do |hand, index|
  # p hand.hand
  (index + 1) * hand.bid
end.sum

p sum
# 247721830 is low
# 247656957 is low
# 248256639 should be correct

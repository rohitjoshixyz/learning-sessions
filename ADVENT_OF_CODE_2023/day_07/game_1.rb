hands = File.read("ADVENT_OF_CODE_2023/day_07/input_1.txt").split("\n").map {|line| line.split(" ")}.to_h

class Hand
  attr_reader :hand, :bid
  def initialize(hand, bid)
    @hand = hand.split("")
    @bid = bid.to_i
  end

  def card_points
    {
      "2" => 2,
      "3" => 3,
      "4" => 4,
      "5" => 5,
      "6" => 6,
      "7" => 7,
      "8" => 8,
      "9" => 9,
      "T" => 10,
      "J" => 11,
      "Q" => 12,
      "K" => 13,
      "A" => 14
    }
  end

  def first_ordering
    tally_values = hand.tally.values

    if tally_values.max == 5
      # p "Five of a kind"
      return 70000000000000
    elsif tally_values.max == 4
      # p "Four of a kind"
      return 60000000000000
    elsif tally_values.count(3) == 1 && tally_values.count(2) == 1
      # p "Full house"
      return 50000000000000
    elsif tally_values.max == 3
      # p "Three of a kind"
      return 40000000000000
    elsif tally_values.count(2) == 2
      # p "Two pair"
      return 30000000000000
    elsif tally_values.count(2) == 1
      # p "One pair"
      return 20000000000000
    else
      # p "High card"
      return 10000000000000
    end
  end

  def second_ordering
    index = 0
    weight = 4
    score = 0

    while index <= 4 do
      score = score + card_points[hand[index]] * ("1" + "00" * weight).to_i
      # puts "#{hand[index]} :#{score}"
      index += 1
      weight -= 1
    end
    score
  end

  def total_score
    first_ordering + second_ordering
  end

  def <=>(other)
    total_score <=> other.total_score
  end
end

hand_objects = hands.map do |hand, bid|
  Hand.new(hand, bid)
end


keys = hand_objects.sort.map {|obj| obj.hand.join("")}
p keys
answer_array = []
answer = keys.each_with_index do |key, index|

  rank = index + 1
  bid = hands[key].to_i

  answer_array << rank * bid
end

p answer_array.sum

# 246416873 is low
# 246416951 is low
# 254583627 is high
# 246416873
# 246400861
# 246424613 should be the answer

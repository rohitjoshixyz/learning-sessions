# Week 2:

# - Bubble sort
# - Counting sort (stable algorithms)
# - Implement Caesar cipher
# - Implement List data structure in Ruby
# - Implement Enumerable for List
# - Implement Duration value object in Ruby (try to make it behave like a number, add Comparable, + - operators)
# - Parse XML with pure Ruby (no gems)
class Solution
  def call(input)
    len = input.length
    while len > 1
      j = 0
      while j < len - 1
        # puts "j=#{j} input[j],input[j+1] = #{input[j]},#{input[j + 1]}"
        if input[j] > input[j + 1]
          input[j], input[j + 1] = input[j + 1], input[j]
        end
        j += 1
      end
      len -= 1
    end
    input
  end
end


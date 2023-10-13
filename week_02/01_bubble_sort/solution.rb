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

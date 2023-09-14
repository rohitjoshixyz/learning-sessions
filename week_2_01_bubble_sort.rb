def bubble_sort
  input = [4, 3, 78, 2, 0, 2]
  len = input.length
  while len > 1
    j = 0
    while j < len - 1
      puts "j=#{j} input[j],input[j+1] = #{input[j]},#{input[j + 1]}"
      if input[j] > input[j + 1]
        input[j], input[j + 1] = input[j + 1], input[j]
      end
      j += 1
    end
    len -= 1
  end
  puts input.inspect
end
bubble_sort

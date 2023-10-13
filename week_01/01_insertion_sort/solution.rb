class Solution
  def call(input)
    list = input
    i = 1

    while i < list.length
      key = list[i] # We will start picking up cards from 2nd card as first card is in the sorted part and already sorted
      j = i - 1 # But we need to check in the sorted part (left of key) only where does the card fit in

      while j >= 0 && key < list[j] # key is at the immediate rightmost outside the sorted array here by default and key < list[j] will compare it one by on with elements to the left until j>=0 and if jth element is > then we shift it to the right of the key
        list[j + 1] = list[j] # [j+1] is actually i (list[i] is key) in the first pass that means if key is smaller then it is overwritten by jth element but it is outside the sorted array so its okay and the sorted array will increase by 1 element after we insert the key in the correct position
        j -= 1
      end

      j += 1
      list[j] = key
      i += 1
    end

    list
  end
end

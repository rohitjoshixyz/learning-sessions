class Solution
  def call(input)
    if input == ""
      list = [5, 2, 4, 6, 1, 3]
    else
      list = input.split(",").map(&:strip).reject { |e| e == "" }.map(&:to_i)
    end

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

class CommandLineInterface
  def initialize(input = $stdin, output = $stdout)
    @input = input
    @output = output
  end

  def print_out(string)
    @output.print(string)
  end

  def read_input
    puts "Week 1: Insertion sort"
    puts "Enter comma separated list like 5, 2, 4, 6, 1, 3 for custom unsorted array, or press just press enter to use the example array"
    @input.gets.chomp
  end
end

p Solution.new.call(CommandLineInterface.new.read_input) unless __FILE__ != $PROGRAM_NAME
# Implement the wikipedia version later https://en.wikipedia.org/wiki/Insertion_sort

# Try to use for loop and each with range

require_relative "node"
require_relative "min_heap"

class Solution
  def encode(input)
    nodes = []
    input.each_char.tally.each do |symbol, freq|
      nodes << Node.new(symbol, freq)
    end

    min_heap = MinHeap.new(nodes)
    min_heap.build

    while min_heap.size > 1
      left = min_heap.extract
      right = min_heap.extract
      new_node = Node.new(left.symbol + right.symbol, left.freq + right.freq, left, right)

      min_heap.insert(new_node)
    end

    p print_codes(min_heap.extract)
  end

  def print_codes(node, path = "", codes = {})
    if node.left.nil? && node.right.nil?
      codes[node.symbol] = path
    end

    print_codes(node.left, path + "0", codes) if node.left
    print_codes(node.right, path + "1", codes) if node.right

    codes
  end

  def decode(input)
    nodes = []
    input.each_char.tally.each do |symbol, freq|
      nodes << Node.new(symbol, freq)
    end

    min_heap = MinHeap.new(nodes)
    min_heap.build

    while min_heap.size > 1
      left = min_heap.extract
      right = min_heap.extract
      new_node = Node.new(left.symbol + right.symbol, left.freq + right.freq, left, right)

      min_heap.insert(new_node)
    end
  end
end

sol = Solution.new
sol.encode("aaabccdeeeeeffg")
puts "------------------------"
sol.encode("aaabbb")
puts "------------------------"
sol.encode("aaabbccc")

# Output
# a 000
# g 0010
# b 00110
# d 00111
# c 010
# f 011
# e 1

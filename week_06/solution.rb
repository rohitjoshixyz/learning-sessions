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

    print_codes(min_heap.extract)
  end

  def print_codes(node, path = "")
    if node.left.nil? && node.right.nil?
      puts "#{node.symbol} #{path}"
      return
    end

    print_codes(node.left, path + "0") if node.left
    print_codes(node.right, path + "1") if node.right
  end
end

sol = Solution.new
sol.encode("aaabccdeeeeeffg")

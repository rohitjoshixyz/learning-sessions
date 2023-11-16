require_relative "node"

class Solution
  def encode(input)
    nodes = []
    input.each_char.tally.each do |symbol, freq|
      nodes << Node.new(symbol, freq)
    end

    while nodes.size > 1
      nodes = nodes.sort

      left = nodes.shift
      right = nodes.shift

      new_node = Node.new(left.symbol + right.symbol, left.freq + right.freq, left, right)
      nodes.push(new_node)
    end

    print_codes(nodes.first)
  end

  def print_codes(node, path = "")
    codes = {}
    if node.left.nil? && node.right.nil?
      puts "#{node.symbol} #{path}"
      return
    end

    print_codes(node.left, path + "0") if node.left
    print_codes(node.right, path + "1") if node.right
    codes
  end
end

sol = Solution.new
input = File.read("./input.txt")
sol.encode(input)

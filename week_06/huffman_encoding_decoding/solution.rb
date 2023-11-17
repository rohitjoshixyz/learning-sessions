require_relative "node"
require_relative "min_heap"

class Solution
  def build_huffman_tree(input)
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

    min_heap.peek # return the root node of the huffman tree
  end

  def get_codes(node, path = "", codes = {})
    if node.left.nil? && node.right.nil?
      codes[node.symbol] = path
    end

    get_codes(node.left, path + "0", codes) if node.left
    get_codes(node.right, path + "1", codes) if node.right
    codes
  end

  def encode(input, codes)
    input.each_char.map do |char|
      codes[char]
    end.join("")
  end

  def decode(encoded_string, root)
    current = root
    decoded_string = ""

    encoded_string.each_char do |char|
      if char == "0"
        current = current.left
      else
        current = current.right
      end

      if current.left.nil? && current.right.nil? # if leaf node
        decoded_string += current.symbol
        current = root # reset current to root
      end
    end

    decoded_string
  end
end

sol = Solution.new
# sol.build_huffman_tree("aaabccdeeeeeffg")
# puts "------------------------"
# sol.build_huffman_tree("aaabbb")
# puts "------------------------"

# root = sol.build_huffman_tree("aaabbccc")
# codes = sol.get_codes(root)
# encoded_string = sol.encode("aaabbccc", codes)
# decoded_string = sol.decode(encoded_string, root)

# p codes
# p encoded_string
# p decoded_string
# puts "------------------------"
# root = sol.build_huffman_tree("aaabccdeeeeeffg")
# codes = sol.get_codes(root)
# encoded_string = sol.encode("aaabccdeeeeeffg", codes)
# decoded_string = sol.decode(encoded_string, root)

# p codes
# p encoded_string
# p decoded_string

input = File.read("./input.txt")
# p input.each_char.tally
solution = Solution.new
root = solution.build_huffman_tree(input)
codes = solution.get_codes(root)

# encoded_string = solution.encode(input, codes)
# File.write("output.txt", [encoded_string].pack("b*"))


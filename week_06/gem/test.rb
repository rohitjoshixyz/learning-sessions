require "minitest/autorun"
require_relative "./bin/huffman"

class Test < Minitest::Test
  def test_michal_input
    input = File.read("bin/input.txt")
    expected_codes = {}
    solution = Solution.new
    root = solution.build_huffman_tree(input)
    puts root
    actual_codes = solution.get_codes(root)
    actual_encoding = solution.encode(input, actual_codes)
    actual_decoding = solution.decode(actual_encoding, root)

    assert_equal expected_codes, actual_codes
    assert_equal expected_encoding, actual_encoding
    assert_equal expected_decoding, actual_decoding
  end
end

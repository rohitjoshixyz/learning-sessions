require "minitest/autorun"
require_relative "./solution"

class Test < Minitest::Test
  # def test_single_character
  #   input = ""
  #   expected_codes = { "a" => "0" }
  #   expected_encoding = "0"
  #   expected_decoding = "a"

  #   solution = Solution.new
  #   root = solution.build_huffman_tree(input)
  #   puts root
  #   actual_codes = solution.get_codes(root)
  #   actual_encoding = solution.encode(input, actual_codes)
  #   actual_decoding = solution.decode(actual_encoding, root)

  #   assert_equal expected_codes, actual_codes
  #   assert_equal expected_encoding, actual_encoding
  #   assert_equal expected_decoding, actual_decoding
  # end

  # def test_two_characters
  #   input = "aa"
  #   expected_codes = { "a" => "0" }
  #   expected_encoding = "00"
  #   expected_decoding = "aa"

  #   solution = Solution.new
  #   root = solution.build_huffman_tree(input)
  #   puts root
  #   actual_codes = solution.get_codes(root)
  #   actual_encoding = solution.encode(input, actual_codes)
  #   actual_decoding = solution.decode(actual_encoding, root)

  #   assert_equal expected_codes, actual_codes
  #   assert_equal expected_encoding, actual_encoding
  #   assert_equal expected_decoding, actual_decoding
  # end

  # def test_two_different_characters
  #   input = "ab"
  #   expected_codes = { "a" => "0", "b" => "1" }
  #   expected_encoding = "01"
  #   expected_decoding = "ab"

  #   solution = Solution.new
  #   root = solution.build_huffman_tree(input)
  #   puts root
  #   actual_codes = solution.get_codes(root)
  #   actual_encoding = solution.encode(input, actual_codes)
  #   actual_decoding = solution.decode(actual_encoding, root)

  #   assert_equal expected_codes, actual_codes
  #   assert_equal expected_encoding, actual_encoding
  #   assert_equal expected_decoding, actual_decoding
  # end

  # def test_three_different_characters
  #   input = "abc"
  #   expected_codes = { "a" => "0", "b" => "10", "c" => "11" }
  #   expected_encoding = "01011"
  #   expected_decoding = "abc"

  #   solution = Solution.new
  #   root = solution.build_huffman_tree(input)
  #   puts root
  #   actual_codes = solution.get_codes(root)
  #   actual_encoding = solution.encode(input, actual_codes)
  #   actual_decoding = solution.decode(actual_encoding, root)

  #   assert_equal expected_codes, actual_codes
  #   assert_equal expected_encoding, actual_encoding
  #   assert_equal expected_decoding, actual_decoding
  # end

  # def test_two_different_characters_repeated
  #   input = "aaabbab"
  #   expected_codes = { "a" => "0", "b" => "1" }
  #   expected_encoding = "00011101"
  #   expected_decoding = "aaabbab"

  #   solution = Solution.new
  #   root = solution.build_huffman_tree(input)
  #   puts root
  #   actual_codes = solution.get_codes(root)
  #   actual_encoding = solution.encode(input, actual_codes)
  #   actual_decoding = solution.decode(actual_encoding, root)

  #   assert_equal expected_codes, actual_codes
  #   assert_equal expected_encoding, actual_encoding
  #   assert_equal expected_decoding, actual_decoding
  # end

  def test_michal_input
    input = "aaabbab"
    expected_codes = { "a" => "0", "b" => "1" }
    expected_encoding = "00011101"
    expected_decoding = "aaabbab"

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

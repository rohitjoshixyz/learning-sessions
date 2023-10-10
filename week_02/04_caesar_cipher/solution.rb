

# https://www.rubyguides.com/2019/05/ruby-ascii-unicode/

class Solution
  def scramble(plaintext, shift)
    ascii_array = plaintext.bytes # [114, 111, 104, 105, 116]
    ascii_array.map { |ascii_code| (ascii_code + shift).chr }.join
  end
  
  def unscramble(ciphertext, shift)
    ascii_array = ciphertext.bytes # [114, 111, 104, 105, 116]
    ascii_array.map { |ascii_code| (ascii_code - shift).chr }.join
  end
end


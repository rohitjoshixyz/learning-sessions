# The Caesar cipher is a simple encryption technique that was used by Julius Caesar to send secret messages to his allies.
# It works by shifting the letters in the plaintext message by a certain number of positions, known as the “shift” or “key”

# https://www.rubyguides.com/2019/05/ruby-ascii-unicode/

def scramble(plaintext, shift)
  ascii_array = plaintext.bytes # [114, 111, 104, 105, 116]
  ascii_array.map { |ascii_code| (ascii_code + shift).chr }.join
end

def unscramble(ciphertext, shift)
  ascii_array = ciphertext.bytes # [114, 111, 104, 105, 116]
  ascii_array.map { |ascii_code| (ascii_code - shift).chr }.join
end

scramble("rohit", 4) #=> "vslmx"
unscramble("vslmx", 4) #=> "rohit"

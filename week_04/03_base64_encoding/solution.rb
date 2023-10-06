require "base64"

def convert_to_ascii_binary(string, spaces: false)
  binary_representation = ""
  string.each_char.with_index do |char, index|
    ascii_value = char.ord
    binary_value = ascii_value.to_s(2)
    padded_binary = binary_value.rjust(8, "0")
    binary_representation << padded_binary
    binary_representation << " " if spaces
  end
  binary_representation.chomp
end

def base64_encode(string)
  base64_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
  base64_lookup_table = {}
  base64_chars.each_char.with_index do |char, index|
    base64_lookup_table[index] = char
  end

  binary_ascii = convert_to_ascii_binary(string)
  base64_binary_chars = binary_ascii.split("").each_slice(6).to_a.map { |e| e.join("").ljust(6, "0") }
  p base64_binary_chars
  output = base64_binary_chars.map do |binary_char|
    decimal_char = binary_char.to_i(2)
    base64_chars[decimal_char]
  end.join("")
  output

  if base64_binary_chars.length % 3 == 1
    output << "=="
  elsif base64_binary_chars.length % 3 == 2
    output << "="
  end
  output
end

def base64_decode(base64_string) # Um9oaXRKbw==

end

puts binary_ascii = convert_to_ascii_binary("RohitJo")
puts base64_encode("RohitJos")
puts Base64.encode64("RohitJos")

puts base64_encode("A")
puts Base64.strict_encode64("A")

# puts base64_encode("=")
puts Base64.strict_encode64(" ")

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

  binary_ascii = convert_to_ascii_binary(string)
  base64_binary_chars = binary_ascii.split("").each_slice(6).to_a.map { |e| e.join("").ljust(6, "0") }
  output = base64_binary_chars.map do |binary_char|
    decimal_char = binary_char.to_i(2)
    base64_chars[decimal_char]
  end.join("")
  output

  if string.length % 3 == 1
    output << "=="
  elsif string.length % 3 == 2
    output << "="
  end
  output
end

def base64_decode(base64_string) # Um9oaXRKb3M=
  base64_string = base64_string.gsub(/=+$/, "")
  base64_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
  base64_chars_hash = {}
  base64_chars.each_char.with_index do |char, index|
    base64_chars_hash[char] = index
  end

  base64_binary_chars = base64_string.chars.map do |char|
    base64_chars_hash[char].to_s(2).rjust(6, "0")
  end

  base64_binary_chars = base64_binary_chars.join("")

  decoded_string = ""
  base64_binary_chars.split("").each_slice(8).with_index do |char_group, index|
    decoded_string << char_group.join("").to_i(2).chr
  end
  decoded_string
end


puts convert_to_ascii_binary("RohitJos", spaces: true)
puts base64_encode("RohitJos")
puts Base64.encode64("RohitJos")

puts base64_encode("A")
puts Base64.strict_encode64("A")

puts base64_decode("Um9oaXRKb3M=")
puts Base64.decode64("Um9oaXRKb3M=")

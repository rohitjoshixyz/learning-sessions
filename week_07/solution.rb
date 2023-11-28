class Solution
  attr_accessor :input, :binary_input, :binary_input_length, :j, :k, :l, :m

  def initialize(input)
    @input = input
    @binary_input = []
    @j = 0x67425301
    @k = 0xEDFCBA45
    @l = 0x98CBADFE
    @m = 0x13DCE476
  end

  def add_padding_bits
    i = 0
    binary_input = input.unpack("B*").first.split("")
    @binary_input_length = binary_input.length

    binary_input.push("1")
    padding_length = 1
    while (@binary_input_length + padding_length + 64) % 512 != 0 do
      padding_length += 1
      binary_input.push("0")
    end
    puts padding_length
    binary_input
  end

  def append_length_bits
    length = @binary_input_length.to_s(2).rjust(64, "0")
    binary_input.push(length)
  end

  def call
    add_padding_bits
    append_length_bits
  end
end


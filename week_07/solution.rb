class Solution
  attr_accessor :input, :binary_input, :binary_input_length

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

  def f(k, l, m)
    (k & l) | (~k & m)
  end

  def g(k, l, m)
    (k & l) | (l & ~m)
  end

  def h(k, l, m)
    k ^ l ^ m
  end

  def i(k, l, m)
    l ^ (k | ~m)
  end

  def add_modulo_32(a, b)
    (a + b) % 2**32
  end

  def round_f(a, b, c, d, k, s, i)
    a = add_modulo_32(a, f(b, c, d))
    a = add_modulo_32(a, binary_input[k].to_i(2))
    a = add_modulo_32(a, i)
    a = a << s | a >> (32 - s)
    a = add_modulo_32(a, b)
  end

  def round_g(a, b, c, d, k, s, i)
    a = add_modulo_32(a, g(b, c, d))
    a = add_modulo_32(a, binary_input[k].to_i(2))
    a = add_modulo_32(a, i)
    a = a << s | a >> (32 - s)
    a = add_modulo_32(a, b)
  end

  def round_h(a, b, c, d, k, s, i)
    a = add_modulo_32(a, h(b, c, d))
    a = add_modulo_32(a, binary_input[k].to_i(2))
    a = add_modulo_32(a, i)
    a = a << s | a >> (32 - s)
    a = add_modulo_32(a, b)
  end

  def round_i(a, b, c, d, k, s, i)
    a = add_modulo_32(a, i(b, c, d))
    a = add_modulo_32(a, binary_input[k].to_i(2))
    a = add_modulo_32(a, i)
    a = a << s | a >> (32 - s)
    a = add_modulo_32(a, b)
  end

  def call
    add_padding_bits
    append_length_bits
  end
end


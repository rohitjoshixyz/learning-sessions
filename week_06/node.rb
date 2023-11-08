class Node
  attr_accessor :symbol, :freq, :left, :right, :huff
  include Comparable

  def initialize(symbol, freq, left = nil, right = nil)
    @symbol = symbol
    @freq = freq
    @left = left
    @right = right
  end

  def <=>(other)
    @freq <=> other.freq
  end

  def to_s
    "#{symbol}#{freq}"
  end

  def to_str
    "#{symbol}#{freq}"
  end
end

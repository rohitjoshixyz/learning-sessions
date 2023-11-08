class MinHeap
  attr_reader :data, :size

  def initialize(array)
    @data = array
    @size = array.size
  end

  def heapify(x) # heapifies the root node x's subtrees into a min heap (smallest on top)
    return if @size < x

    l_root = left(x)
    r_root = right(x)
    smallest = x

    if l_root <= @size && get(l_root) < get(x)
      smallest = l_root
    end

    if r_root <= @size && get(r_root) < get(smallest)
      smallest = r_root
    end

    if smallest != x
      swap(smallest, x)
      heapify(smallest)
    end
  end

  def build
    (@size / 2).downto(1) do |x|
      heapify(x)
    end
  end

  def delete(x)
    return if @size < x

    swap(x, @size)
    @size -= 1
    heapify(x)
    nil
  end

  def extract
    return nil if @size < 1

    min = get(1)
    swap(1, @size)
    @size -= 1
    heapify(1)

    min
  end

  def insert(value)
    @size += 1
    set(@size, value)

    i = @size

    while i > 1 && get(i) > get(parent(i))
      swap(i, parent(i))
      i = parent(i)
    end
  end

  def peek
    return nil if @size < 1

    get(1)
  end

  def sort
    (@size - 1).times do
      swap(1, @size)
      @size -= 1
      heapify(1)
    end
    @data.reverse
  end

  def to_a
    @data
  end

  private
    def get(x)
      data[x - 1]
    end

    def set(x, value)
      @data[x - 1] = value
    end

    def swap(x, y)
      data[y - 1], data[x - 1] = data[x - 1], data[y - 1]
    end

    def left(i)
      2 * i
    end

    def right(i)
      2 * i + 1
    end

    def parent(i)
      i / 2
    end
end

#                  23
#          38             56
#      42      73     74      76
# 64 87   82 85
# heap = MinHeap.new([56, 87, 74, 42, 73, 23, 64, 38, 82, 85])

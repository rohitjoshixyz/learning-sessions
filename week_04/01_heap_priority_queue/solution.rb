class Heap
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
heap = Heap.new([56, 87, 74, 42, 73, 23, 64, 38, 82, 85])
heap.build
puts heap.to_a.inspect

heap2 = Heap.new([23, 38, 56, 42, 73, 74, 64, 87, 82, 85])
heap2.build
puts heap.to_a.inspect

#                  23
#          38             56
#      42      73     74      76
# 64 87   82 85


class Task
  include Comparable
  attr_reader :title, :priority

  def initialize(title, priority)
    @title = title
    @priority = priority
  end

  def <=>(other)
    @priority <=> other.priority
  end

  def to_s
    "#{priority}"
  end
end

tasks = [
  Task.new("Make suggested changes", 4),
  Task.new("Merge PR", 5),
  Task.new("Send EOD update", 6),
  Task.new("Rebase with develop", 1),
  Task.new("Raise PR", 2),
  Task.new("Self reveiew PR", 3),
]

task_heap = Heap.new(tasks)
task_heap.build
puts task_heap.extract
puts task_heap.peek
puts task_heap.to_a.map(&:to_s).inspect
puts task_heap.sort.map(&:to_s).inspect

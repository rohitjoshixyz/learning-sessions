class Node
  attr_accessor :data, :next_node

  def initialize(data, next_node = nil)
    @data = data
    @next_node = next_node
  end
end

class List
  def initialize
    @head = nil
  end

  def print
    pointer = @head

    while pointer != nil
      puts pointer.data
      pointer = pointer.next_node
    end
  end

  def insert(number)
    if @head == nil
      @head = Node.new(number, nil)
    else
      pointer = @head
      while pointer.next_node != nil
        pointer = pointer.next_node
      end
      pointer.next_node = Node.new(number, nil)
    end
  end
end

list = List.new
list.insert(5)
list.insert(6)
list.insert(7)
list.print

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
    output = []
    while pointer != nil
      output << pointer.data
      pointer = pointer.next_node
    end
    p output
  end

  def insert(value)
    if @head == nil
      @head = Node.new(value, nil)
    else
      pointer = @head
      while pointer.next_node != nil
        pointer = pointer.next_node
      end
      pointer.next_node = Node.new(value, nil)
    end
  end

  def delete(value)
    return if @head == nil

    if @head.data == value
      @head = @head.next_node
      return
    end

    pointer = @head
    while pointer.next_node != nil
      if pointer.next_node.data == value
        pointer.next_node = pointer.next_node.next_node
      else
        pointer = pointer.next_node
      end
    end
  end
end

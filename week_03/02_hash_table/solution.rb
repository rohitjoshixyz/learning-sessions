# We are going to use a simple modulo 1000 hashing algorithm and our linked list data structure from last week to implement a hash table.

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

  def retrieve(key)
    return if @head == nil

    if @head.data.first == key
      return @head.data.last
    end

    pointer = @head
    while pointer != nil
      if pointer.data.first == key
        return pointer.data.last
      else
        pointer = pointer.next_node
      end
    end
  end
end

class HashTable
  def initialize
    @buckets = Array.new(1000)
  end

  def hash(key)
    key % 1000
  end

  def set(key, value)
    if !@buckets[hash(key)].nil?
      @buckets[hash(key)].insert([key, value])
    else
      @buckets[hash(key)] = List.new
      @buckets[hash(key)].insert([key, value])
    end
  end

  def get(key)
    if !@buckets[hash(key)].nil?
      puts @buckets[hash(key)].retrieve(key)
    end
  end

  def print
    @buckets.compact.each do |bucket|
      bucket.print
    end
  end

  def delete(key)
    if !@buckets[hash(key)].nil?
      value = @buckets[hash(key)].retrieve(key)
      @buckets[hash(key)].delete([key, value])
    end
  end
end

ht = HashTable.new
ht.set(1005, 1)
ht.set(2005, 2)
ht.set(3005, 3)
ht.set(4005, 4)
ht.set(1007, 7)

ht.get(2005)
ht.get(1)
ht.get(1007)
ht.delete(4005)
ht.print

# 2
# 7
# [[1005, 1], [2005, 2], [3005, 3]]
# [[1007, 7]]

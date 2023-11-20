require_relative "node"

class TreeSerializer
  def self.serialize(root, serialized = [])
    if root.nil?
      serialized << nil
    else
      serialized << "#{root.symbol}|#{root.freq}"
      serialized = serialize(root.left, serialized)
      serialized = serialize(root.right, serialized)
    end
    serialized
  end

  def self.serialize(root)
    return "#" if root.nil?
    ["#{root.symbol}|#{root.freq}", serialize(root.left), serialize(root.right)].join(",")
  end

  def self.des_list(nodes)
    val = nodes.shift
    return nil if val == "#"

    symbol, freq = val.split("|")
    node = Node.new(symbol, freq.to_i, nil, nil)
    node.left = des_list(nodes)
    node.right = des_list(nodes)
    node
  end

  def self.deserialize(data)
    return nil if data.nil?

    des_list(data.split(","))
  end
end

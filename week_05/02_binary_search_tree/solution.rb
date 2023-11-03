class Node
  include Comparable
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def <=>(other)
    @data <=> other.data
  end
end

class BST
  attr_reader :root, :node_count

  def initialize
    @root = nil
  end

  def add(data)
    @root = add_node(@root, Node.new(data))
  end

  def remove(data)
    @root = remove_node(@root, data)
  end

  def traverse(type)
    result = []
    case type
    when "preorder"
      result = preorder(@root)
    when "inorder"
      result = inorder(@root)
    when "postorder"
      result = postorder(@root)
    end
    p result
  end

  private
    def add_node(root, new_node)
      return new_node if root.nil?

      if new_node < root
        root.left = add_node(root.left, new_node)
      elsif new_node > root
        root.right = add_node(root.right, new_node)
      end
      root
    end

    def remove_node(root, data)
      return root if root.nil?

      if data < root.data
        root.left = remove_node(root.left, data)
      elsif data > root.data
        root.right = remove_node(root.right, data)
      else
        if root.left.nil?
          return root.right
        elsif root.right.nil?
          return root.left
        end

        # minimum value of right subtree will be the inorder successor
        root.data = min_value(root.right)
        root.right = remove_node(root.right, root.data)
      end

      root
    end

    def min_value(node)
      current = node
      while current.left
        current = current.left
      end
      current.data
    end

    def preorder(root)
      return [] if root.nil?

      [root.data] + preorder(root.left) + preorder(root.right)
    end

    def inorder(root)
      return [] if root.nil?

      inorder(root.left) + [root.data] + inorder(root.right)
    end

    def postorder(root)
      return [] if root.nil?

      postorder(root.left) + postorder(root.right) + [root.data]
    end
end

tree = BST.new
tree.add(5)
tree.add(2)
tree.add(7)
tree.add(12)
puts tree.root.data
tree.traverse("preorder")
tree.traverse("inorder")
tree.traverse("postorder")
tree.remove(2)
tree.traverse("inorder")
tree.remove(7)
tree.traverse("inorder")

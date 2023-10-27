class Node
  # include Comparable
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  # def <=>(other)
  #   @data <=> other.data
  # end
end

class BST
  attr_reader :root, :node_count

  def initialize
    @root = nil
  end

  def add(data)
    @root = add_node(@root, data)
  end

  def remove(data)
    remove_node(@root, data)
  end

  def traverse(type)
    case type
    when "preorder"
      p preorder(@root, [])
    when "inorder"
      p inorder(@root, [])
    when "postorder"
      p postorder(@root, [])
    end
  end

  private
    def add_node(root, data)
      if root == nil
        return Node.new(data)
      end

      if data < root.data
        root.left = add_node(root.left, data)
      elsif data > root.data
        root.right = add_node(root.right, data)
      end
      root
    end

    # Incomplete
    def remove_node(root, data)
      if root == nil
        return root
      end

      if root < data
        remove_node(root.left, data)
      elsif root > data
        remove_node(root.right, data)
      end

      # We reach here when root is the node to be deleted
      if root.left == nil
        root.right
      elsif root.right == nil
        root.left
      else
        succ_parent = root
        succ = root.right;
        while succ.left != nil do
          succ_parent = succ
          succ = succ.left
        end
        succ = root.right
      end
    end

    def preorder(root, array)
      return array if root == nil

      array.push(root.data)
      preorder(root.left, array)
      preorder(root.right, array)
    end

    def inorder(root, array)
      return array if root == nil

      inorder(root.left, array)
      array.push(root.data)
      inorder(root.right, array)
    end

    def postorder(root, array)
      return array if root == nil

      postorder(root.left, array)
      postorder(root.right, array)
      array.push(root.data)
    end
end

tree = BST.new
tree.add(5)
tree.add(2)
tree.add(7)
tree.add(12)
# puts tree.root.data
tree.traverse("preorder")
tree.traverse("inorder")
tree.traverse("postorder")



#       5
# 2           7
#                 12

require "minitest/autorun"
require_relative "./solution"

class Test < Minitest::Test
  def test_adding_nodes
    tree = BST.new
    tree.add(5)
    tree.add(2)
    tree.add(7)
    tree.add(12)

    assert_equal [2, 5, 7, 12], tree.traverse("inorder")
  end

  def test_removing_root_node
    tree = BST.new

    tree.add(5)
    tree.remove(5)

    assert_equal [], tree.traverse("inorder")
  end

  def test_removing_leaf_node
    tree = BST.new
    tree.add(5)
    tree.add(2)
    tree.add(7)
    tree.add(12)

    tree.remove(12)

    assert_equal [2, 5, 7], tree.traverse("inorder")
  end

  def test_removing_node_with_one_child
    tree = BST.new
    tree.add(5)
    tree.add(2)
    tree.add(7)
    tree.add(12)

    tree.remove(7)

    assert_equal [2, 5, 12], tree.traverse("inorder")
  end

  def test_removing_node_with_two_children
    tree = BST.new
    tree.add(5)
    tree.add(2)
    tree.add(7)
    tree.add(12)
    tree.add(9)

    #     5
    #   /   \
    # 2      7
    #        / \
    #       9   12

    tree.remove(7)

    #     5
    #   /   \
    # 2      12
    #       /
    #       9

    assert_equal [2, 5, 9, 12], tree.traverse("inorder")
  end

  def test_traversals
    tree = BST.new
    tree.add(5)
    tree.add(2)
    tree.add(7)
    tree.add(12)
    tree.add(9)

    assert_equal [5, 2, 7, 12, 9], tree.traverse("preorder")
    assert_equal [2, 5, 7, 9, 12], tree.traverse("inorder")
    assert_equal [2, 9, 12, 7, 5], tree.traverse("postorder")
  end
end

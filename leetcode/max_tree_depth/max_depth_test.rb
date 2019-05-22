require 'minitest/autorun'
require_relative 'max_depth'

class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

class MaxDepthTest < Minitest::Test

  def setup
    @root = TreeNode.new(1)
    @tree2 = TreeNode.new(2)
    tree3 = TreeNode.new(3)
    tree4 = TreeNode.new(4)
    tree5 = TreeNode.new(5)
    tree6 = TreeNode.new(6)

    @root.left = @tree2
    @root.right = tree3

    @tree2.left = tree4
    @tree2.right = tree5

    tree5.right = tree6
  end

  def test_adding_node_to_bst
    new_tree_with_added_node =
    assert_equal new_tree_with_added_node, add_node(7)
  end

  def test_max_depth_method_for_tree
    assert_equal 4, max_depth(@root)
  end

  def test_max_depth_method_for_tree2
    assert_equal 3, max_depth(@tree2)
  end
end

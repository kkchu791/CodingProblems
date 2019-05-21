require 'minitest/autorun'
require_relative 'swap_nodes_in_pairs'

class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

class SwapNodesTest < Minitest::Test

  def setup
    @input = @head
    @head = ListNode.new(1)
    child1 = ListNode.new(2)
    child2 = ListNode.new(3)
    child3 = ListNode.new(4)

    @head.next = child1
    child1.next = child2
    child2.next = child3

    @output = @output_head
    @output_head = ListNode.new(4)
    child1 = ListNode.new(3)
    child2 = ListNode.new(2)
    child3 = ListNode.new(1)

    @output_head.next = child1
    child1.next = child2
    child2.next = child3
  end

  def test_swap_nodes
    assert_equal @output, swap_pairs(@input)
  end
end

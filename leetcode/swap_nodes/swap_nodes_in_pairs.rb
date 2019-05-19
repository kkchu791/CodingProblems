def swap_pairs(head)
    if head.nil? || head.next.nil?
      return head
    end

    next_node = head.next
    head.next = swap_pairs(next_node.next)
    next_node.next = head
    next_node
end

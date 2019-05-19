#iterative approach

def reverse_list(head)
  previous = nil
  while head
    next_node = head.next
    head.next = previous
    previous = head
    head = next_node
  end
  previous
end

#recursive approach

def reverse_list(head, previous = nil)
    if head.nil?
      return previous
    end

    next_node = head.next
    head.next = previous

    reverse_list(next_node, head)
end

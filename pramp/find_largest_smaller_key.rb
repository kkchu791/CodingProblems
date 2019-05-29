def find_largest_smaller_key(rootNode, num)
  find_best_candidate(rootNode, num) || -1
end

def find_best_candidate(node, target, best_candidate=nil)
  if node.nil?
    return best_candidate
  end

  if node.key > target
    next_node = node.left
  else
    next_node = node.right
    best_candidate = node.key
  end


  find_best_candidate(next_node, target, best_candidate)
end

Node = Struct.new(:key, :left, :right)

node_25 = Node.new(25)
node_9 = Node.new(
  9,
  Node.new(5),
  Node.new(
    12,
    Node.new(11),
    Node.new(14)
  )
)
node_20 = Node.new(20, node_9, node_25)

p find_largest_smaller_key(node_20, 5)

# time: O(log(N)) if tree is balanced, otherwise O(N)
# space: O(1)

class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

def construct_maximum_binary_tree(arr)
    if arr.empty?
        return nil
    end

    max = arr.max
    index = arr.find_index(max)

    left_arr = ((index-1) < 0) ? [] : arr.slice(0..(index-1))
    right_arr = arr.slice((index+1)..(arr.length-1))


    tree = TreeNode.new(max)
    tree.left = construct_maximum_binary_tree(left_arr)
    tree.right = construct_maximum_binary_tree(right_arr)
    tree
end

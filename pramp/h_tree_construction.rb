def drawHTree(x, y, length, depth)
    return if depth == 0

    x0 = x - length/2
    x1 = x + length/2
    y0 = y - length/2
    y1 = y + length/2

    drawLine(x0, y0, x0, y1) #left segment
    drawLine(x1, y0, x1, y1) #right segment
    drawLine(x0, y, x1, y)  #connecting segment

    newLength = Integer.sqrt(length)

    drawHTree(x0, y0, newLength, depth-1) #lower left H Tree
    drawHTree(x0, y1, newLength, depth-1) #upper left H Tree
    drawHTree(x1, y0, newLength, depth-1) #lower right H Tree
    drawHTree(x1, y1, newLength, depth-1) #upper right H Tree
end

# time: O(4^N)
# space: O(N)

# where N is depth, because we're recursively calling 4 times until depth is 0

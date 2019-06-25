def is_toeplitz(matrix)
  
  row = matrix.length
  col = matrix.first.length
  
  (0...col).each do |c|
    start = matrix[0][c]
    (0...[row, col - c].min).each do |i|
      if matrix[i][c + i] != start
        return false unless matrix[i][c + i].nil?
      end
    end
  end
  
  
  (0...row).each do |r|
    start = matrix[r][0]
    (0...[col, row - r].min).each do |i|
      if matrix[r + i][i] != start
        return false
      end
    end
  end
  
  true
  
end

matrix = [[1,2,3,4],[5,1,2,3],[6,5,1,2]]
  
is_toeplitz(matrix)
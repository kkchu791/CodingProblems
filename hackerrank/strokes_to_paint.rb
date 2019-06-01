def strokes_required(picture)
  p_matrix = picture_matrix(picture)
  stroke_count = 0

  row_index = 0
  col_index = 0

  while !draw_stroke(p_matrix, row_index, col_index).empty?
    next_coord = draw_stroke(p_matrix, row_index, col_index).first
    row_index = next_coord[0]
    col_index = next_coord[1]
    stroke_count += 1
  end

  stroke_count
end

def draw_stroke(matrix, row_index, col_index, prev_char=nil)

  return unless within_bounds(p_matrix, row_index, col_index)
  char = matrix[row_index][col_index]

  return [row_index, col_index] if char != prev_char && !prev_char.nil?
  return nil if char.nil?

  matrix[row_index][col_index] = nil

  test = [
    draw_stroke(matrix, row_index - 1, col_index, char), #up
    draw_stroke(matrix, row_index + 1, col_index, char), #down
    draw_stroke(matrix, row_index, col_index - 1, char), #left
    draw_stroke(matrix, row_index - 1, col_index + 1, char) #right
  ]

end

def picture_matrix(picture)
  picture.map { |string| string.split("") }
end

def within_bounds(p_matrix, row_index, col_index)
  (row_index < p_matrix[0].length && row_index >= 0) && (col_index < p_matrix.length && col_index >= 0)
end


p strokes_required(["aaaba", "ababa", "aaaca"])

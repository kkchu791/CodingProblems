def strokes_required(picture)
  matrix = picture_matrix(picture)
  stroke_count = 0

  row_index = 0
  col_index = 0

  while still_strokes_left_to_draw(matrix, row_index, col_index)
    next_coord = grab_next_coordinates(matrix, row_index, col_index)
    row_index = next_coord[0]
    col_index = next_coord[1]
    stroke_count += 1
  end

  stroke_count
end

def draw_stroke(matrix, row_index, col_index, prev_char=nil)
  return unless within_bounds(matrix, row_index, col_index) && not_visited_yet?(matrix, row_index, col_index)
  curr_char = matrix[row_index][col_index]
  return [row_index, col_index] if curr_char != prev_char && !prev_char.nil?
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

def grab_next_coordinates(matrix, row_index, col_index)
  draw_stroke(matrix, row_index, col_index).first
end

def row_index=(index)
  row_index ||= index
end

def col_index=(index)
  col_index ||= index
end

def still_strokes_left_to_draw(matrix, row_index, col_index)
  !draw_stroke(matrix, row_index, col_index).empty?
end

def picture_matrix(picture)
  picture.map { |string| string.split("") }
end

def within_bounds(matrix, row_index, col_index)
  (row_index < matrix[0].length && row_index >= 0) &&
  (col_index < matrix.length && col_index >= 0)
end


p strokes_required(["aaaba", "ababa", "aaaca"])

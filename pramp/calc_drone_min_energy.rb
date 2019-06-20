def calc_drone_min_energy(route)
  maxHeight = route[0][2]
  initial = route[0][2]

  route.each do |row|
     maxHeight = maxHeight < row[2] ? row[2] : maxHeight
  end

  maxHeight - initial

end

#not to focus on x and y coordinates
#generalize approach of algorithm

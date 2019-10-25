def move_zeroes(arr)
  count = 0
  new_arr = []
  arr.each do |el|
    if el != 0
      new_arr << el
    else
      count += 1
    end
  end
  
  
  zeroes = Array.new([0] * count)
  
  new_arr.push(zeroes)
  
  new_arr.flatten
  
end


arr = [1, 10, 0, 2, 8, 3, 0,0,0, 6, 4, 0, 5, 7, 0]
res = [1, 10, 2, 8, 3, 6, 4, 5, 7, 0]

p move_zeroes(arr)

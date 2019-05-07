def array_of_array_products(arr)
  return [] if arr.length < 2

  left = [1]
  right = [1]


  (0).upto(arr.length - 2) do |index|
    slice_arr = arr.slice(0..index)
    left.push(slice_arr.reduce(&:*))
  end

  (arr.length - 1).downto(1).each do |index|
    slice_arr = arr.slice(index..arr.length-1)
    right.unshift(slice_arr.reduce(&:*))
  end

  left.map.with_index { |el, index| left[index] * right[index] }
end

array_of_array_products([8, 10, 2]) == [20, 16, 80] 

def find_minimum_sum(parts)
  #parts = [17, 10, 13, 24]
  #parts = [10, 13, 17, 24]
  arr = parts.sort
  index = 0
  sum_counter = 0

  while index <= arr.length - 1
    sum = arr[index] + (arr[index + 1] || 0)
    #increment our sum sum_counter
    sum_counter =+ sum
    #remove elements from the array
    arr.shift(2)
    #merge in the sum
    arr.push(sum)
    # sort the array
    arr.sort
    p sum_counter
  end

  sum_counter
end


p find_minimum_sum([17, 10, 13, 24])])

def get_different_number(arr)  
  n  = arr.length
  index = 0
  while index < n
    temp = arr[index]
    while temp != arr[temp] && temp < n
       arr[temp], temp = temp, arr[temp]
    end

    index += 1
  end
  
  arr.each_with_index do |el, index|
    if el != index
      return index
    end
  end
  n  
end

get_different_number([7,0,5,4,1,3,6,2]) == 8


Time: O(N)
Space: O(1)
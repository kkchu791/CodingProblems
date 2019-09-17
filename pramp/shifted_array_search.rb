def shifted_arr_search(shiftArr, num)
  # your code goes here
  if shiftArr[0] < shiftArr[-1]
      return bisect(shiftArr, num, 0, shiftArr.length-1)
  end
  
  pivotIndex = findPivot(shiftArr)
  if shiftArr[0] < num
    bisect(shiftArr, num, 0, pivotIndex)
  else
    bisect(shiftArr, num, pivotIndex, shiftArr.length-1)
  end
  
end
# [9, 12, 17] [1, 4, 5, 6, 7], target = 17 using modified binary search -> O(log n )
#  0   1   2  3  4  5 -> return -1
#  O(n) - O(log n) -> index of a number in sorted O(log n)

#total = 8
#8/2 = 4
#target = 3

#[9, 12, 17, 18] [2, 4, 5]

def findPivot(shiftArr)
    if shiftArr.length == 1
        return 0
    end
    if shiftArr[0] < shiftArr[-1]
        return 0
    end
    left = 0
    right = shiftArr.length - 1
    while left <= right
      middle = (left + right)/2
      if shiftArr[middle] > shiftArr[middle+1]
          return middle + 1
      elsif shiftArr[middle] < shiftArr[left]
          right = middle - 1
      else
          left = middle + 1
      end
    end
      
end

def bisect(sortedArr, num, left, right)
  
  while left <= right
     middle = (left + right) / 2
    
     if sortedArr[middle] == num
       return middle
     elsif sortedArr[middle] > num
       right = middle - 1
     else
       left = middle + 1
     end
  end
  -1        
  
end

p findPivot([9,12,17,2,4,5,6])
   

# [2, 4, 5, 9, 12, 17, 18], 4
#           m   l       r  

# Given a sorted array arr of distinct integers, write a function indexEqualsValueSearch
# that returns the lowest index i for which arr[i] == i. Return -1 if there is no such index.
# Analyze the time and space complexities of your solution and explain its correctness.

def index_equals_value_search(arr)
  start = 0
  finish = arr.length - 1

  while start <= finish
    middle = (start + finish)/2

    if middle == arr[middle]
      return middle
    elsif middle < arr[middle]
      finish = middle - 1
    else
      start = middle + 1
    end
  end

  -1
end

#O(log n)

index_equals_value_search([-8,0,2,5]) == 2

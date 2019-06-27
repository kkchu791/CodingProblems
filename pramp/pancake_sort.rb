def pancake_sort(arr)
  (arr.length).downto(1).each do |i|
    maxIndex = find_max_index(arr, i) + 1
    flip(arr, maxIndex)
    flip(arr, i)
  end

  arr
end

def flip(arr, k)
  i = 0
  j = k - 1

  while i < j
    arr[i], arr[j] = arr[j], arr[i]

    i += 1
    j -= 1
  end

  arr
end

def find_max_index(arr, i)
  max = arr.sort[i - 1]
  arr.index(max)
end


#time: o(n^2)
#space: o(1)

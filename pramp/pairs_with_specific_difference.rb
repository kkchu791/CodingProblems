def find_pairs_with_given_difference(arr, k)
  hash = {}
  res = []

  arr.each do |el|
    hash[el - k] = el
  end

  arr.each do |el|
    if hash[el]
     res << [hash[el], el]
    end
  end

  res
end

# time: O(N)
# space: O(N)

def deletion_distance(str1, str2)
  return 0 if str1 == str2

  arr1 = str1.split("")
  arr2 = str2.split("")

  similarities = arr1 & arr2

  return 1 if similarities.length == arr1.length

  similarities.each do |char|
    arr1.delete(char)
    arr2.delete(char)
  end

  (arr1 + arr2).length
end

str1 = "abc"
str2 = "cab"
p deletion_distance(str1, str2) == 1


#time complexity = O(N)
#space complexity =  O(N)

# @param {Integer[]} nums
# @return {Integer}
def array_nesting(arr)
    list_of_lengths = []

    0.upto(arr.length - 1).each do |index|
      hash = {}
      num = index
      count = 0
      while !hash[num]
        hash[num] = true
        num = arr[num]
        count += 1
      end
      list_of_lengths << count
    end

    list_of_lengths.max
end

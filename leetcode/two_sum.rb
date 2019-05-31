def two_sum(nums, target)
    arr = nums.sort

    first_pos = 0
    last_pos = arr.length - 1

    while first_pos < last_pos
        sum = sorted_array[i] + sorted_array[j]
        if sum == target
            val1 = arr[first_pos]
            val2 = arr[last_pos]
            break;
        elsif sum < target
            first_pos += 1
        else
          last_pos -= 1
        end
    end

    [nums.index(val1), nums.rindex(val2)]

end

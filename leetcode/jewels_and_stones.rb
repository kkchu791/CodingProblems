def num_jewels_in_stones(j, s)
    jewels = {}
    counter = 0

    j.each_char do |jewel|
        jewels[jewel] = true
    end

    s.each_char do |stone|
        if jewels[stone]
            counter += 1
        end
    end

    counter
end

p num_jewels_in_stones("aAbc", "aAAbbbb") == 7


# time complexity of O(N + M)
# you are reading jewels and creating a hash table
# you are reading through stones and incrementing counter if current stone matches a key in the jewel table

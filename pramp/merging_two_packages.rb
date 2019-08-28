def get_indices_of_item_weights(arr, limit)
  hash = {}
  arr.each_with_index do |el, index|
      if hash[el]
        return [index, hash[el]]
      else
        hash[limit - el] = index
      end
  end

  []
end

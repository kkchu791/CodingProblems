#yelp challenge

def get_businesses_by_location(businesses, location)
  businesses = remove_dups(businesses)
  businesses = select_by_location(businesses, location)
  business_count_arr = count_businesses(businesses)
  sorted_businesses = sort_businesses(business_count_arr)
  reformat_list_of_obj(sorted_businesses)
end

def remove_dups(businesses)
  businesses.uniq! {|el| el[:id] }
end

def select_by_location(businesses, location)
  businesses.select { |el| el[:location] == location}
end

def count_businesses(businesses)
  businesses.group_by{ |el| el[:name]}
            .map {|k,v| [k, v.size] }
end

def sort_businesses(business_count_array)
  business_count_array.sort do |a, b|
    custom_sort_by_freq_and_then_by_name(a, b)
  end
end


def custom_sort_by_freq_and_then_by_name(a, b)
  if b[1] > a[1]
   return 1
  else
    if b[0][0] < a[0][0]
      return 1
    end
  end
  0
end

def reformat_list_of_obj(businesses)
  businesses.map do |name, count|
    hash = {}
    hash[name] = count
    hash
  end
end


businesses = [
  {name: 'Starbucks', location: 'Seattle', id: 101},
  {name: 'Peets Coffee', location: 'San Francisco', id: 102},
  {name: 'Starbucks', location: 'San Francisco', id: 104},
  {name: 'Starbucks', location: 'Austin', id: 106},
  {name: 'Peets Coffee', location: 'Austin', id: 105},
  {name: 'Whole Foods', location: 'Austin', id: 103},
  {name: 'Whole Foods', location: 'Austin', id: 103},
  {name: 'Whole Foods', location: 'Austin', id: 107},
]

location = "Austin"

p get_businesses_by_location(businesses, location)

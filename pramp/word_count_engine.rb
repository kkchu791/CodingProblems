def word_count_engine(document)
  string = strip_out_punctuations(document)
  
  arr = string.split(" ")
  
  hash = {}
  
  arr.each do |el|
    
    if hash[el]
      hash[el] += 1
    else
      hash[el] = 1
    end
  end  
  
  res = hash.sort do |a, b|
    b[1] <=> a[1]
  end
  
  res.each_with_index {|el, index| res[index][1] = res[index][1].to_s }
  
  res
    
end
  

def strip_out_punctuations(document)
  document.gsub(/[^A-Za-z0-9\s]/i, '').downcase
end

document = "Practice makes perfect. you'll only
                    get Perfect by practice. just practice!"

p word_count_engine(document)


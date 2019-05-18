# input:  dict = {
#             "Key1" : "1",
#             "Key2" : {
#                 "a" : "2",
#                 "b" : "3",
#                 "c" : {
#                     "d" : "3",
#                     "e" : {
#                         "" : "1"
#                     }
#                 }
#             }
#         }
#
# output: {
#             "Key1" : "1",
#             "Key2.a" : "2",
#             "Key2.b" : "3",
#             "Key2.c.d" : "3",
#             "Key2.c.e" : "1"
#         }


def flatten_dictionary(hash, prev_key = nil)
  result = Hash.new()

  hash.each do |key, value|
    if value.class != Hash
      result[create_key(key, prev_key)] = value
    else
      result.merge!(flatten_dictionary(value, create_key(key, prev_key)))
    end
  end

  result
end

def create_key(curr_key, prev_key)
  if prev_key.nil?
    curr_key.to_s
  else
    prev_key.to_s + "." + curr_key.to_s
  end
end

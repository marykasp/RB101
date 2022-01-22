# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

sorted_arr = arr.sort do |a, b|
  b.to_i <=> a.to_i
end

p arr
p sorted_arr

# need to convert the string values to an integer before comparing
# sort the array in reverse order - switch the order of b and a in the block

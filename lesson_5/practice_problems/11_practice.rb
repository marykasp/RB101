arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

# return a new array but containing only the integers that are multiples of 3

new_arr = arr.map do |subarr|
  subarr.select do |num|
    num % 3 == 0
  end
end

p new_arr

# want to return a new array so map can be called on original array
# select on nested arrays to return only elements that meet the criteria, those values will then be used as the transformed values in the new array returned from map

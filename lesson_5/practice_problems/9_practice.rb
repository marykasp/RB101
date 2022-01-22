arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# return a new array with the subarrays being ordered in descending order

sorted_arr = arr.map do |subarr|
  subarr.sort do |a, b|
    b <=> a
  end
end

p sorted_arr

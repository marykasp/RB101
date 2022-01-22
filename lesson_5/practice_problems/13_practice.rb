arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

# return a new array with the same subarrays but ordered logically, with only odd numbers

sorted_arr = arr.sort_by do |subarr|
  subarr.select do |num|
    num.odd?
  end
end

# original array but sorted only based on the odd numbers in the subarrays
p sorted_arr

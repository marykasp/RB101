# merge([1, 2, 3], [4, 5, 6]) # => [1, 4, 2, 5, 3, 6]

def merge(arr1, arr2)
  new_arr = arr1 + arr2
  return new_arr
end

p merge([1,2,3], [4,5,6])

# ** write a method that counts the number of occurrences of each element in a given array
# input: array
# output: hash { array element: number of occurrences }
# explicit requirements: case-sensitive
# create a new empty hash, iterate over each unique element in the array, use the element to create a new key in the hash, and Array#count to count the number of occurrences of that element as the keys value
 # - then iterate over the hash, print out the key:value pairs using string interpolation

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(array)
  occurrences = {}
  # loop through every unique element of the array
  # set the element as the key in the hash and use Array.count to count the number of elements with the same value
  array.uniq.each do |element|
    # will count on the original vehicles array not on the new unique array
    occurrences[element] = array.count(element)
  end

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end

count_occurrences(vehicles)

# ** write a method that takes an array of integers, returns the average of all the numbers in the array

# input: array
# output: integer
# requirements: array will never be empty and always will be positive integers
# create a total variable that will hold the sum of the array, iterate over the array and add the total to the number in the array. Then calculate the average by taking the total/# of elements in array. Return that average

# def average(array)
#   sum = 0
#   array.each do |num|
#     sum += num
#   end
#   sum / array.size
# end

# simple using Array methods
def average(arr)
  # returns an integer, convert to float to return a Float
  arr.sum.to_f / arr.size.to_f
end

puts average([1, 6])
puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])

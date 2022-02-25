# ** Write a method that returns an Array that contains every other element of an Array that is passed in an an argument

def oddities(arr)
  # returns a new array - evaluates the return value of the block, if evaluates to true that element is added to the new array which is returned from the select method
  arr.select.with_index do |num, index|
    num if index.even?
  end
end

numbers = [1, 2, 3, 4, 5, 6]
p oddities([2, 3, 4, 5, 6])
p oddities(numbers)
p numbers # remains unmodified
p oddities(['abc'])
p oddities([123])
p oddities([])

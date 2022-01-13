numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
# => [1, 2, 2, 3] since uniq does not modify the caller

# add a ! to end of uniq to modify the original array
numbers.uniq!
p numbers

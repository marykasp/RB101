numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1) # removes the element at index 1, removes 2
p numbers

numbers.delete(1) # will delete the first occurance of the element 1 if it is in the array
p numbers # => [2, 3, 4, 5]

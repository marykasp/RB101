a = 2 # integer
b = [5, 8] # array so elements in the array can be modified
arr = [a, b]

arr[0] += 2 # assigning a new object at that index so a is not affected
arr[1][0] -= a # b is an array and this modifies that array by assigning a new value at index 0

p arr
# what are final values of a and b

# a = 2
# b = [3, 8]
# arr = [4, [3, 8]]

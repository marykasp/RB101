# ** Create a method that takes two arguments, multiples them together and returns the result

def multiply(num1, num2)
  num1 * num2
end

puts multiply(5, 3) == 15

# a new array is returned containing the elements repeated 2 times
p multiply([1, 2], 2) == [1, 2, 1, 2]

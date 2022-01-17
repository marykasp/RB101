# ** Write a method that takes one argument, positive integer, and returns a list of the digits in the number

# input: integer
# output: array of integers
# convert the number to a string, use chars method to convert into an array of numeric characteres. Iterate over the array with map and convert each character back to an integer

def digit_list(number)
  number.to_s.chars.map { |char| char.to_i }
end

p digit_list(1234)

puts digit_list(12345) == [1, 2, 3, 4, 5]
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]

# another method
def digits_array(number)
  digits = []
  loop do
    # divmod returns 2 values: the whole number and the remainder
    number, remainder = number.divmod(10)
    # push the remainder to the new digits array
    digits.unshift(remainder)
    break if number == 0
  end
  digits # return the digits array
end

# ** write a method that takes on argument, positive integer, and returns a string of alternating 1s and 0s always starting with 1. the length of the string should match the given integer

# input: integer
# output: string
# use integer#times method to perform a task as many times as the number passed in as the argument. create an empty array where the numbers will go. if the index is even (0, 2, 4) then add 1 if not add 0. Push that number to the numbers array. Use Array#join to convert the array to a string

def stringy(number)
  numbers = []

  number.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end

  numbers.join
end

def stringy_string(number)
  stringy = ''

  number.times do |index|
    index.even? ? (stringy << '1') : (stringy << '0')
  end
  stringy
end

puts stringy_string(6)
puts stringy_string(9)
# puts stringy(6)
# puts stringy(9)

def string_method(integer)
  numbers = []
  counter = 0

  loop do
    counter.even? ? (numbers << 0) : (numbers << 1)
    counter += 1

    break if numbers.size == integer
  end

  numbers.join
end

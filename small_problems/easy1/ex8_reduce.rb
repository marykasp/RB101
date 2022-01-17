# Enumerable#reduce or #inject combines all the elements in an array by applying a binary operation - can be passed in by a block or symbol

def average(numbers)
  sum = numbers.reduce { |sum, num| sum + num }
  # numbers.reduce(:+)
  # calculate the average
  sum / numbers.count
end

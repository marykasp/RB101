# method that returns the sum of an integers digits

# input: integer
# output: integer
# - convert the integer to a string, string to an array usingstring#chars,
# - then interate through the string and calculate sum or can use Array#sum (need to first convert the character to an integer, char.to_i)
# - return the sum value

def sum(number)
  sum = 0

  number.to_s.chars.each do |char|
    sum += char.to_i
  end
  sum
end

# convert number to an array of string digits, convert each string digit to an integer by creating a new array using #map. Then use #sum method on the array returned from map
def sum(number)
  number.to_s.chars.map { |char| char.to_i }.sum
end

# method chaining
# def sum(number)
#   number.to_s.chars.map {|char| char.to_i }.reduce(:+)
# end

puts sum(23)
puts sum(496)
puts puts sum(123_456_789)

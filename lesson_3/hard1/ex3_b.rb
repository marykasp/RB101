# local variables point to same object in memmory
def mess_with_vars(one, two, three)
  # reassignment means the local variables are now pointing to a new String object in memory
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

# pass by reference of value
mess_with_vars(one, two, three)

puts "one is: #{one}" #=> "one"
puts "two is: #{two}" #=> "two"
puts "three is: #{three}" #=> "three"

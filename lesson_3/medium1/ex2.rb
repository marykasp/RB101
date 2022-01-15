#puts "the value of 40 + 2 is " + (40 + 2)

# this will throw a TypeError because you can't concatenate a string value and an integer
# need to convert to a string value first
puts "the value of 40 + 2 is " + (40+2).to_s

# string interpolation - can insert any expression into a string, will do implicit type conversion
puts "the value of 40 + 2 is #{40 + 2}"

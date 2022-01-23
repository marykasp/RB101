# ask user for the length and width of the room in meters

# puts "What is the length of the room (in meters)?"
# length = gets.chomp.to_f

# puts "What is the width of the room?"
# width = gets.chomp.to_f

# SQMETERS_TO_SQFEET = 10.7639
# square_meters = (length * width).round(2)
# square_feet = square_meters * SQMETERS_TO_SQFEET

# puts "The area of the room is #{square_meters} square meters (#{square_feet} square feet)"

# MODIFICATION
SQ_FEET_TO_SQ_INCHES = 144
SQ_INCHES_TO_SQ_CENT = 6.4516
puts "What is the length in feet?"
length = gets.chomp.to_f

puts "What is the width in feet?"
width = gets.chomp.to_f

square_feet = (length * width).round(2)
square_inches = square_feet * SQ_FEET_TO_SQ_INCHES
square_centimeters = square_inches * SQ_INCHES_TO_SQ_CENT

puts "The area of the room is #{square_feet} square feet. #{square_inches} square inches. And #{square_centimeters} in centimeters."

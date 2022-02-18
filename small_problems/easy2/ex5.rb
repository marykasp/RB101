# ** Write a program that will ask for user's name - the program will greet the user. If the user writes name! then the computer yells back to the user

puts "What is your name?"
name = gets.chomp

if name[-1] == "!"
  puts "Hello #{name.chop.upcase}. Why are we screaming?".upcase
else
  puts "Hello #{name}"
end

# Begin by asking for and obtaining the user's name. We then test the last character of the user's name using String#[] to see if it is equal to an exclamation mark

# If the last character is equal to an exclamation mark we chop that exclamation from the name and print the SHOUTING version of the greeting. Otherwise we just print a normal greeting.

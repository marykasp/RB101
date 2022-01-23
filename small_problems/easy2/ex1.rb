# ** Write a program that randomly generates and prints Teddy's age

age = rand(20..200)
puts "Teddy is #{age} years old!"

# use Kernel#rannd with a range of (20..200) as its argument
# print the interpolated string to the screenn

# modify the program to ask for a name

def age
  puts "What is your name? "
  name = gets.chomp
  (name = "Teddy") if name.empty?
  age = rand(20..200)
  puts "#{name} is #{age} years old!"
end

age()

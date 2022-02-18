# ** Write a program that ask the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all nunbers between 1 and the entered integer

def prompt(msg)
  puts ">> #{msg}"
end

number = nil
loop do
  prompt "Please enter an integer greater than 0:"
  number = gets.chomp.to_i
  break if number.to_s.to_i == number && number > 0
  prompt "Please enter a valid number"
end

operation = nil
loop do
  prompt "Enter 's' to compute the sum, 'p' to compute the product."
  operation = gets.chomp.downcase
  break if ['s', 'p'].include?(operation)
  prompt "Please either enter 's' or 'p' only"
end

# calculate the sum of the integers between 1 and number
if operation == 's'
  sum = (1..number).reduce { |total, num| total + num }
  puts "The sum of the integers between 1 and #{number} is #{sum}"
elsif operation == 'p'
  product = (1..number).reduce(:*)
  puts "The product of the integers between 1 and #{number} is #{product}"
else
  puts "Unknown operation"
end

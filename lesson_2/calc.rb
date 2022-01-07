puts "Please enter a number:"
num1 = gets.chomp.to_i

puts "Please enter another number:"
num2 = gets.chomp.to_i

puts "What type of operation would you like to perform: (+, -, *, /) "
operation = gets.chomp.downcase


if operation == 'add'
  result = num1 + num2
elsif operation == 'subtract'
  result = num1 - num2
elsif operation == "multiply"
  result num1 * num2
else
  result = num1.to_f / num2.to_f
end

puts "The result is #{result}"

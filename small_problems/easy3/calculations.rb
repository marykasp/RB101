# ** Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers
# addition, subtraction, product, quotient, remainder, and power

def addition(num1, num2)
  sum = num1 + num2
  puts "#{num1} + #{num2} = #{sum}"
end

def subtraction(num1, num2)
  puts "#{num1} - #{num2} = #{num1 - num2}"
end

def multiplication(num1, num2)
  puts "#{num1} * #{num2} = #{num1 * num2}"
end

def division(num1, num2)
  puts "#{num1} / #{num2} = #{num1 / num2}"
end

def prompt(msg)
  puts ">>> #{msg}"
end

def valid?(number)
  number.to_s.to_i == number && number > 0
end

prompt "Enter the first positive number: "
number1 = gets.chomp.to_i

number2 = nil
loop do
  prompt "Enter the second positive number: "
  number2 = gets.chomp.to_i
  break if valid?(number2)
  prompt "Number can't be 0!!"
end

addition(number1, number2)
subtraction(number1, number2)
multiplication(number1, number2)
division(number1, number2)

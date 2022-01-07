# ask user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result to the screen
#gets() and puts() method in Kernel module


Kernel.puts("Welcome to Calculator!")

Kernel.puts("What's the first number?")
number1 = Kernel.gets().chomp() # chomp removes the newline character at end


Kernel.puts("What's the second number?")
number2 = Kernel.gets().chomp()

Kernel.puts("What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide")
operator = Kernel.gets().chomp()

if operator == '1'
  result = number1.to_i + number2.to_i
elsif operator == '2'
  result = number1.to_i - number2.to_i
elsif operator == '3'
  result = number1.to_i * number2.to_i
else
  # need to convert numbers to floats for division
  result = number1.to_f / number2.to_f
end

# result variable is visible outside the block
Kernel.puts("The result is #{result}")

# Kernel.puts(number1.inspect) # shows that the value is a string

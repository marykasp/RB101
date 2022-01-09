def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(number)
  number.to_i() != 0
end

def operation_to_message(operator)
  case operator
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

# every input needs a loop to validate the input
prompt("Welcome to Calculator. Enter your name:")

# loop outside main game since don't want to ask user for name every time
name = ''
loop do
  name = Kernel.gets().chomp()

  break unless name.empty?()

  # if name.empty?()
  #   prompt("Make sure to use a valid name.")
  # else
  #   break
  # end
end

prompt("Hi #{name}")

loop do # main loop
  # initialize number variable outode of block to access it
  number1 = ''
  loop do
    prompt("What is the first number?")
    number1 = Kernel.gets().chomp()

    break if valid_number?(number1)
    prompt("Hmm.. that doesn't look like a valid number.")
  end

  number2 = ''
  loop do
    prompt("What is the second number?")
    number2 = Kernel.gets().chomp()

    break if valid_number?(number2)
    prompt("Hmm.. that doesn't look like a valid number.")
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG
  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")
  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f / number2.to_f()
           end

  prompt("The result is #{result}")
  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the calculator! Goodbye!")

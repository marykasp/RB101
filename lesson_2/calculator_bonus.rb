# set default language for program
LANGUAGE = 'en'
# require yaml
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
# puts MESSAGES.inspect

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  puts("=> #{message}")
end

# better integer validation
def integer?(input)
  # number.to_i() != 0
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

# create a method that tests whether the input is either a number or a float
def number?(input)
  integer?(input) || float?(input)
end

# return the result of the case statement as lasts line in method
def operation_to_message(operator)
  word = case operator
         when '1'
           'Adding'
         when '2'
           'Subtracting'
         when '3'
           'Multiplying'
         when '4'
           'Dividing'
         end

  word
end

# every input needs a loop to validate the input
prompt(messages('welcome', LANGUAGE))

# loop outside main game since don't want to ask user for name every time
name = ''
loop do
  name = gets().chomp()

  break unless name.empty?()
  prompt(messages('valid_name'))
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
    prompt(messages('first_number'))
    number1 = gets().chomp()

    break if number?(number1)
    prompt(messages('valid_number'))
  end

  number2 = ''
  loop do
    prompt(messages('second_number'))
    number2 = gets().chomp()

    break if number?(number2)
    prompt(messages('valid_number'))
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
    operator = gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages('valid_operation'))
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
  prompt(messages('another_calculation'))
  answer = gets().chomp()

  break unless answer.downcase().start_with?('y')
end

prompt(messages('goodbye'))

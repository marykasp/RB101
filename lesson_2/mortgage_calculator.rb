LANGUAGE = 'en'
require 'yaml'
MESSAGES = YAML.load_file('mortgage_messages.yml')

# ---- METHODS ------
def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  puts ">> #{message}"
end

# Check for valid number
def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def valid_number?(input)
  integer?(input) || float?(input)
end

# validate if input is a positive number
def positive_number?(input)
  input.to_i >= 0 || input.to_f >= 0
end

def generate_apr(interest)
  interest.to_f / 100
end

def calc_payment(amount, monthly_interest, months)
  amount.to_f * (monthly_interest / (1 - (1 + monthly_interest)**(-months)))
end

def get_name
  prompt(messages('name'))
  name = ''
  loop do
    name = gets.chomp

    break unless name.empty?
    prompt("Please enter a valid name.")
  end

  prompt("Hello #{name}!")
end

def get_loan_amount
  loan_amount = ''
  loop do
    prompt(messages('loan_amount'))
    loan_amount = gets.chomp

    if valid_number?(loan_amount) && positive_number?(loan_amount)
      return loan_amount
    else
      prompt(messages('valid_number'))
    end
  end
end

def get_loan_duration
  years = ''
  loop do
    prompt(messages('loan_duration'))
    years = gets.chomp

    if valid_number?(years) && positive_number?(years)
      return years
    else
      prompt(messages('valid_number'))
    end
  end
end

def get_interest_rate
  interest_rate = ''
  loop do
    prompt(messages('interest_rate'))
    prompt(messages('rate_example'))
    interest_rate = gets.chomp

    if valid_number?(interest_rate) && positive_number?(interest_rate)
      return interest_rate
    else
      prompt(messages('valid_number'))
    end
  end
end

def display_payment(amount, monthly_interest, months)
  monthly_payment = calc_payment(amount, monthly_interest, months)
  puts "Your monthly payment is $#{format('%.2f', monthly_payment)}"
end

def replay?(string)
  string.downcase.start_with?('y')
end

# ------ WELCOME ------
prompt(messages('welcome'))
get_name()

# ------ MAIN PROGRAM ------
loop do
  loan_amount = get_loan_amount()
  years = get_loan_duration()
  interest_rate = get_interest_rate()

  # calculate annual interest rate (APR)
  annual_interest_rate = generate_apr(interest_rate)
  # calculate the monthly interest rate using the APR
  monthly_interest_rate = annual_interest_rate / 12
  # calculate the loan duration in months
  months = years.to_i * 12

  # method that calculates and displays monthly payment
  display_payment(loan_amount, monthly_interest_rate, months)

  prompt(messages('again'))
  answer = gets.chomp
  break unless replay?(answer)
end

prompt(messages('closing_message'))
prompt("Goodbye!")

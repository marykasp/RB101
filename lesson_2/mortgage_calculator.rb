#NOTE NEED TO FIGURE OUT IF LOAN DURATION IS not a full year
LANGUAGE = 'en'
require 'yaml'
MESSAGES = YAML.load_file('mortgage_messages.yml')

# ---- METHODS ------
def messages(message, lang=LANGUAGE)
  MESSAGES[lang][message]
end

def prompt(message)
  puts ">> #{message}"
end

# Check for valid number
def number?(input)
  input.to_i.to_s == input || input.to_f.to_s == input
end

def positive_number?(input)
  input.to_i >= 0 || input.to_f >= 0
end

# Calculations
def get_apr(interest)
  interest.to_f / 100
end

def payment(amount, monthly_interest, months)
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

  return name
end

def get_loan_amount
  loan_amount = ''
  loop do
    prompt(messages('loan_amount'))
    loan_amount = gets.chomp

    if number?(loan_amount) && positive_number?(loan_amount)
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

    if number?(years) && positive_number?(years)
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

    if number?(interest_rate) && positive_number?(interest_rate)
      break
    else
      prompt(messages('valid_number'))
    end
  end

  return get_apr(interest_rate)
end

def display_payment(amount, monthly_interest, months)
  monthly_payment = payment(amount, monthly_interest, months)
  if monthly_interest == 0
    prompt("Your monthly payment is $#{format('%.2f', (amount.to_f / months))}")
  else
    prompt("Your monthly payment is $#{format('%.2f', monthly_payment)}")
  end
end

def replay?(string)
  string.downcase == 'y' || string.downcase == 'yes'
end

# ------ WELCOME ------
prompt(messages('welcome'))
name = get_name()
prompt("Hello #{name.strip()}!")

# ------ MAIN PROGRAM ------
loop do
  loan_amount = get_loan_amount()
  months = get_loan_duration().to_i() * 12
  # calculate annual interest rate (APR)
  annual_interest_rate = get_interest_rate()
  # calculate the monthly interest rate using the APR
  monthly_interest_rate = annual_interest_rate / 12

  # method that calculates and displays monthly payment
  display_payment(loan_amount, monthly_interest_rate, months)

  prompt(messages('again'))
  answer = gets.chomp
  break unless replay?(answer)
end

# ------ CLOSING MESSAGE ------
prompt("#{messages('closing_message')} #{name}!")
prompt("Goodbye!")

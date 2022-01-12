# user makes a choice
# computer makes a choice
# winner is displayed

# -------- METHODS/CONSTANTS --------
VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts "=> #{message}"
end

def get_name
  loop do
    prompt("What is your name?")
    name = gets.chomp

    if name.empty?
      prompt("Please enter a name")
    else
      return name.strip
    end
  end
end

def get_user_choice
  loop do
    prompt("Please pick: #{VALID_CHOICES.join(", ")}")
    user_choice = gets.chomp.downcase
    if VALID_CHOICES.include?(user_choice)
      return user_choice
    else
      prompt("That's not a valid choice")
    end
  end
end

def get_computer_choice(choices)
  computer_choice = choices.sample()
  return computer_choice
end

# returns a boolean value
def replay?
  prompt("Would you like to play again? (y to continue)")
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

# -------- WELCOME --------
prompt("Welcome to Rock Paper Scissors Game!")
name = get_name()
prompt("Hello #{name}")

# -------- MAIN GAME --------
loop do
  user_choice = get_user_choice()

  prompt("Now the computer is picking...")
  computer_choice = get_computer_choice(VALID_CHOICES)

  prompt("You choose: #{user_choice}")
  prompt("The computer's choice is: #{computer_choice}")

  if user_choice == computer_choice
    prompt("Its a tie!!")
  elsif user_choice == 'rock' && computer_choice == 'scissors'
    prompt("User wins!!")
  elsif user_choice == 'paper' && computer_choice == 'rock'
    prompt("User wins!")
  elsif user_choice == 'scissors' && computer_choice == 'paper'
    prompt('User wins!')
  elsif computer_choice == 'rock' && user_choice == 'scissors'
    prompt("Computer wins")
  elsif computer_choice == 'paper' && user_choice == 'rock'
    prompt("Computer wins!")
  elsif computer_choice == 'scissors' && user_choice == 'paper'
    prompt("Computer wins!")
  end

  break unless replay?()
end

prompt("Thanks for playing Rock, Paper, Scissors!")
prompt("Goodbye #{name}")

# user makes a choice
# computer makes a choice
# winner is displayed

# -------- METHODS/CONSTANTS --------
VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts "=> #{message}"
end

def get_name
  name = ''
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

def display_results(player, computer)
  if (player == 'rock' && computer == 'scissors') || (player == 'paper' && computer == 'rock') || (player == 'scissors' && computer == 'paper')
    prompt("You won!")
  elsif (player == 'rock' && computer == 'paper') || (player == 'paper' && computer == 'scissors') || (player == 'scissors' && computer == 'rock')
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
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
prompt("Hello #{name}!!")

# -------- MAIN GAME --------
loop do
  user_choice = get_user_choice()

  prompt("Now the computer is picking...")
  computer_choice = get_computer_choice(VALID_CHOICES)

  prompt("You chose: #{user_choice}; computer chose: #{computer_choice}")

  display_results(user_choice, computer_choice)

  if replay?()
    system 'clear'
  else
    break
  end
end
# -------- EXIT MAIN GAME --------
prompt("Thanks for playing Rock, Paper, Scissors!")
prompt("Goodbye #{name}")

# rock beats scissors and lizard
# paper beats rock and spock
# scissors beats paper and lizard
# lizard beats spock and paper
# spock beats rock and scissors
VALID_CHOICES = ['rock', 'paper', 'scissor', 'lizard', 'spock']
GAME = {
  :rock => ['scissors', 'lizard'],
  :paper => ['rock', 'spock'],
  :scissor => ['paper', 'lizard'],
  :lizard => ['spock', 'paper'],
  :spock => ['rock', 'scissors']
}

def prompt(message)
  puts "=> #{message}"
end

def get_name
  name = ''
  loop do
    prompt("What is your name?")
    name = gets.chomp

    break unless name.empty?
    prompt("Please enter a valid name")
  end
  return name
end

def get_user_choice
  loop do
    prompt("Please enter rock, paper, scissor, lizard, spock")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      return choice.downcase.to_sym
    else
      prompt("Please pick a valid choice")
    end
  end
end

def display_result(player, computer)
  if player == computer
    prompt("It's a tie!")
  elsif GAME[player].include?(computer)
    prompt("User wins!")
  else
    prompt("Computer wins!!")
  end
end

def replay?
  prompt("Would you like to play again? ('y' to continue")
  answer = gets.chomp.downcase
  answer.start_with?('y')
end


prompt("Welcome to rock, paper, lizard, and spock game!")
name = get_name()
prompt("Hello and good luck #{name}!")

# -------- MAIN GAME  --------
loop do
  user_choice = get_user_choice()
  computer_choice = VALID_CHOICES.sample()

  prompt("The user chose: #{user_choice}; computer chose: #{computer_choice}")

  display_result(user_choice, computer_choice)

  if replay?()
    system 'clear'
  else
    break
  end
end

prompt("Thank your for playing #{name}!")
prompt("Goodbye!")

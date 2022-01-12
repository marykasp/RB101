# ask user to make a choice
VALID_CHOICES = ['rock', 'paper', 'scissors']
def prompt(message)
  puts "=> #{message}"
end

def display_results(player, computer)
  if (player == 'rock' && computer == 'scissors') || (player == 'paper' && computer == 'rock') || (player == 'scissors' && computer == 'paper')
    prompt('You won')
  elsif (player == 'rock' && computer == 'paper') || (player == 'paper' && computer == 'scissors') || (player == 'scissors' && computer == 'rock')
    prompt('Computer won!')
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice!")
    end
  end

  # returns a random element from the array
  computer_choice = VALID_CHOICES.sample()

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  # prints the winner to the screen
  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing! Good bye!")

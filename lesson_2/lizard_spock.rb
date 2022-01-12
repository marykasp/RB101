# -------- CONSTANTS --------
ROUNDS = 3

VALID_CHOICES = {
  'rock' => 'r',
  'paper' => 'p',
  'scissor' => 's',
  'spock' => 'sp',
  'lizard' => 'l'
}
# VALID_CHOICES = ['rock', 'paper', 'scissor', 'lizard', 'spock']

GAME = {
  :rock => ['scissor', 'lizard', 's', 'l'],
  :paper => ['rock', 'spock', 'r', 's'],
  :scissor => ['paper', 'lizard', 'p', 'l'],
  :lizard => ['spock', 'paper', 's', 'p'],
  :spock => ['rock', 'scissor', 'r', 's']
}

# -------- FORMATTED MESSAGES --------
rules = <<-MSG
          Scissors cuts paper,
          paper covers rock,
          rock crushes lizard,
          lizard poisons Spock,
          Spock smashes scissors,
          scissors decapitates lizard,
          lizard eats paper,
          paper disproves Spock,
          Spock vaporizes rock,
          and as it always has, rock crushes scissors.
MSG

def prompt(message)
  puts "=> #{message}"
end

# returns a boolean
def user_reponse_yes_or_no
  answer = gets.chomp
  continue = ['y', 'yes']
  continue.include?(answer.downcase)
end

def display_rules(answer, rules)
  if answer
    puts(rules)
    prompt("hit any key to continue to game")
    key = gets.chomp
    system 'clear' if key
  else
    system 'clear'
  end
end

def get_name
  name = ''
  loop do
    prompt("What is your name?")
    name = gets.chomp

    break unless name.empty?
    prompt("Please enter a valid name")
  end
  name
end

def get_user_choice
  loop do
    prompt("Please enter #{VALID_CHOICES.keys.join(', ')} or #{VALID_CHOICES.values.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice) || VALID_CHOICES.value?(choice)
      return choice
    else
      prompt("Please pick a valid choice")
    end
  end
end

def get_unabbreviated_choice(choice)
  VALID_CHOICES.key(choice) || choice
end

def win?(player1, player2)
  GAME[player1.to_sym].include?(player2)
end

def display_result(player, computer, round)
  if win?(player, computer)
    prompt("USER WINS round #{round}!!!")
  elsif win?(computer, player)
    prompt("COMPUTER wins round #{round}!")
  else
    prompt("It's a tie this round!")
  end
end

def display_winner(score1, score2)
  prompt("You won the match! Congrats :)") if score1 == ROUNDS
  prompt("You lost, computer wins :(") if score2 == ROUNDS
end

def rematch?
  prompt("Would you like to play again? ('y' to continue)")
  user_reponse_yes_or_no()
end

# -------- WELCOME MESSAGE/DISPLAY RULES --------
prompt("Welcome to rock, paper, lizard, and spock game! First to #{ROUNDS} is the winner!")
name = get_name()

prompt("Would you like to see the rules #{name}? (y or n)")
display_rules(user_reponse_yes_or_no, rules)

prompt("Hello and good luck #{name}!")

# -------- MAIN GAME  --------
loop do
  round = 1
  player_score = 0
  computer_score = 0
  tie_count = 0

  loop do
    # if user chose abbreviated value return the full word,
    user_choice = get_unabbreviated_choice(get_user_choice())
    computer_choice = VALID_CHOICES.keys.sample()

    prompt("The user chose: #{user_choice}; computer chose: #{computer_choice}")
    if win?(user_choice, computer_choice)
      player_score += 1
    elsif win?(computer_choice, user_choice)
      computer_score += 1
    else
      tie_count += 1
    end

    display_result(user_choice, computer_choice, round)
    # add a round
    round += 1
    prompt("Player score: #{player_score}; Computer score: #{computer_score}")
    # display winner only when one score equates to 3
    display_winner(player_score, computer_score)

    break if player_score == 3 || computer_score == 3
  end

  rematch? ? (system 'clear') : (break)
end

# -------- GOODBYE MESSAGE  --------
prompt("Thank your for playing #{name}!")
prompt("Goodbye!")

require 'yaml'
MESSAGES = YAML.load_file('lizard_spock_messages.yml')

# -------- CONSTANTS --------
ROUNDS = 3

VALID_CHOICES = {
  'rock' => 'r',
  'paper' => 'p',
  'scissor' => 'sc',
  'spock' => 'sp',
  'lizard' => 'l'
}
# VALID_CHOICES = ['rock', 'paper', 'scissor', 'lizard', 'spock']

GAME = {
  'rock': ['scissor', 'lizard', 'sc', 'l'],
  'paper': ['rock', 'spock', 'r', 'sp'],
  'scissor': ['paper', 'lizard', 'p', 'l'],
  'lizard': ['spock', 'paper', 'sp', 'p'],
  'spock': ['rock', 'scissor', 'r', 'sc']
}

# -------- FORMATTED MESSAGES --------
RULES = <<-MSG
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

welcome_message = <<-MSG
Welcome to rock, paper, lizard, and spock game!
First to #{ROUNDS} is the winner!
MSG

# -------- METHODS --------
def messages(message)
  MESSAGES[message]
end

def prompt(message)
  puts "=> #{message}"
end

# returns a boolean
def user_reponse_yes
  answer = gets.chomp
  continue = ['y', 'yes']
  continue.include?(answer.downcase)
end

def display_rules(answer)
  if answer
    puts(RULES)
    prompt(messages('any_key'))
    key = gets.chomp
    system 'clear' if key
  else
    system 'clear'
  end
end

def get_name
  name = ''
  loop do
    prompt(messages('name'))
    name = gets.chomp

    break unless name.empty?
    prompt(messages('valid_name'))
  end
  name
end

def get_user_choice
  loop do
    prompt("Please enter #{VALID_CHOICES.keys.join(', ')}")
    puts("Or: #{VALID_CHOICES.values.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice) || VALID_CHOICES.value?(choice)
      return choice
    else
      prompt(messages('valid'))
    end
  end
end

def get_unabbreviated_choice(choice)
  VALID_CHOICES.key(choice) || choice
end

def win?(player1, player2)
  GAME[player1.to_sym].include?(player2)
end

def update_score(player, computer, player_score, computer_score)
  if win?(player, computer)
    player_score += 1
  elsif win?(computer, player)
    computer_score += 1
  end
  return player_score, computer_score
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
  prompt(messages('user_wins')) if score1 == ROUNDS
  prompt(messages('computer_wins')) if score2 == ROUNDS
end

def rematch?
  prompt(messages('play_again'))
  system 'clear' if user_reponse_yes()
end

# -------- WELCOME MESSAGE/DISPLAY RULES --------
prompt(welcome_message)
prompt(messages('view_rules'))
display_rules(user_reponse_yes())

name = get_name()
prompt("#{messages('hello')} #{name}!")

# -------- MAIN GAME  --------
loop do
  round = 1
  player_score = 0
  computer_score = 0

  loop do
    # if user chose abbreviated value return the full word,
    user_choice = get_unabbreviated_choice(get_user_choice())
    computer_choice = VALID_CHOICES.keys.sample()
    system 'clear'

    prompt("The user chose: #{user_choice}; computer chose: #{computer_choice}")
    player_score, computer_score =
      update_score(user_choice, computer_choice, player_score, computer_score)
    display_result(user_choice, computer_choice, round)

    # add a round
    round += 1
    prompt("Player score: #{player_score}; Computer score: #{computer_score}")

    if player_score == 3 || computer_score == 3
      display_winner(player_score, computer_score)
      break
    end
  end

  break unless rematch?
end

# -------- GOODBYE MESSAGE  --------
prompt("Thank your for playing #{name}!")
prompt("Goodbye!")

require 'yaml'
MESSAGES = YAML.load_file('lizard_spock_messages.yml')

# -------- CONSTANTS --------
MAX_WINS = 3

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
First to #{MAX_WINS} is the winner!
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
  answer = gets.chomp.downcase
  puts answer
  ['y', 'yes', 'yup'].include?(answer)
end

def display_rules(answer)
  if answer
    puts(RULES)
    prompt(messages('any_key'))
    key = gets.chomp
    system 'clear' if key
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
  # returns the key of value passed in or just returns the key
  VALID_CHOICES.key(choice) || choice
end

def win?(player1, player2)
  GAME[player1.to_sym].include?(player2)
end

def update_score(player, computer, scores)
  if win?(player, computer)
    scores[:player] += 1
  elsif win?(computer, player)
    scores[:computer] += 1
  end
  return scores
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
  prompt(messages('user_wins')) if score1 == MAX_WINS
  prompt(messages('computer_wins')) if score2 == MAX_WINS
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
  # player_score = 0
  # computer_score = 0
  scores = { player: 0, computer: 0 }

  loop do
    # if user chose abbreviated value return the full word,
    user_choice = get_unabbreviated_choice(get_user_choice())
    computer_choice = VALID_CHOICES.keys.sample()
    system 'clear'

    prompt("The user chose: #{user_choice}; computer chose: #{computer_choice}")
    update_score(user_choice, computer_choice, scores)
    display_result(user_choice, computer_choice, round)
    prompt("Player score: #{scores[:player]}; Computer score: #{scores[:computer]}")

    # add a round
    round += 1
    if scores[:player] == MAX_WINS || scores[:computer]== MAX_WINS
      display_winner(scores[:player], scores[:computer])
      break
    end
  end

  break unless rematch?
end

# -------- GOODBYE MESSAGE  --------
prompt("Thank your for playing #{name}!")
prompt("Goodbye!")

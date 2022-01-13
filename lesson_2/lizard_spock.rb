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

CHOICE_EMOJIS = {
  rock: "🪨",
  paper: "📃",
  scissor: "✂️",
  lizard: "🦎",
  spock: "🖖"
}

GAME = {
  rock: ['scissor', 'lizard'],
  paper: ['rock', 'spock'],
  scissor: ['paper', 'lizard'],
  lizard: ['spock', 'paper'],
  spock: ['rock', 'scissor']
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
  puts ">> #{message}"
end

# returns a boolean
def user_reponse_yes
  answer = gets.chomp.downcase
  ['y', 'yes'].include?(answer)
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

def format_choice(choice)
  # returns the key of value passed in or just returns the key
  VALID_CHOICES.key(choice) || choice
end

def get_user_choice
  loop do
    prompt("Please enter #{VALID_CHOICES.keys.join(', ')}  "\
      "(Or: #{VALID_CHOICES.values.join(', ')})")

    choice = gets.chomp
    choice = format_choice(choice)
    if VALID_CHOICES.include?(choice)
      return choice
    else
      prompt(messages('valid'))
    end
  end
end

def win?(player1, player2)
  GAME[player1.to_sym].include?(player2)
end

# updating the elements in the scores collection
def update_score(player, computer, scores)
  if win?(player, computer)
    scores[:player] += 1
  elsif win?(computer, player)
    scores[:computer] += 1
  end
end

def display_round_result(player, computer, round)
  if win?(player, computer)
    prompt("USER WINS round #{round}!!!")
  elsif win?(computer, player)
    prompt("COMPUTER wins round #{round}!")
  else
    prompt("It's a tie this round!")
  end
end

def display_winner(score1, score2, name)
  prompt("#{name} #{messages('user_wins')}") if score1 == MAX_WINS
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
    # if user chose abbreviated value return the full word
    user_choice = get_user_choice()
    computer_choice = VALID_CHOICES.keys.sample()
    system 'clear'

    prompt("#{name}:#{user_choice} #{CHOICE_EMOJIS[user_choice.to_sym]}  "\
      "Computer:#{computer_choice} #{CHOICE_EMOJIS[computer_choice.to_sym]}")

    update_score(user_choice, computer_choice, scores)
    display_round_result(user_choice, computer_choice, round)

    prompt("Player: #{scores[:player]} // Computer: #{scores[:computer]}")

    round += 1
    if scores[:player] == MAX_WINS || scores[:computer] == MAX_WINS
      display_winner(scores[:player], scores[:computer], name)
      break
    end
  end

  break unless rematch?
end

# -------- GOODBYE MESSAGE  --------
prompt("Thank your for playing #{name}!")
prompt("Goodbye!")

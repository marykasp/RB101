require 'yaml'

# CONSTANTS
# =========================================================
MESSAGES = YAML.load_file('tictactoe_messages.yml')
INITIAL_MARKER = " "
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_NUMBER = 3
MAX_SCORE = 5

GREETING = <<-MSG
***** Welcome to tic tac toe! *****
Your mark is 'X'. The first player to get to 5 wins, is the champion.

If you've never played before type 'help' for game rules.
If you're ready press 'Enter'.
MSG

BOARD_DESIGN = <<-MSG
Squares are numbered 1 - 9 from left to right and in descending rows

                      1 | 2 | 3
                      --+---+--
                      4 | 5 | 6
                      --+---+--
                      7 | 8 | 9
MSG

RULES = <<-MSG
--------
Tic Tac Toe is a 2 player game played on a 3x3 board. Each player takes a turn and marks a square on the board. First player to reach 3 squares in a row, including diagonals, wins. If all 9 squares are marked and no player has 3 squares in a row, then the game is a tie. You #{PLAYER_MARKER} will be playing the computer #{COMPUTER_MARKER}.

#{BOARD_DESIGN}
Have fun playing!
--------
MSG

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

def greeting
  answer = ''
  loop do
    prompt GREETING
    answer = gets.chomp.downcase
    break if answer == 'help' || answer.empty?
    prompt "Please enter a valid choice"
  end

  if answer == 'help'
    puts RULES
  end
end

def new_round
  system 'clear'
  greeting
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

# default parameters
def joinor(arr, delimiter=", ", word="or")
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def valid_integer?(players_choice)
  players_choice.to_s.to_i == players_choice
end

def decide_current_player
  loop do
    prompt "Who should go first? 1) player 2) computer 3) random"
    answer = gets.chomp
    case answer
    when '1' then return 'player'
    when '2' then return 'computer'
    when '3' then return ['player', 'computer'].sample
    end
  end
end

def alternate_player(active_player)
  return 'computer' if active_player == 'player'
  return 'player' if active_player == 'computer'
end

# MOVES
def place_piece!(brd, current_player)
  if current_player == 'player'
    player_places_piece!(brd)
  elsif current_player == 'computer'
    computer_places_piece!(brd)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a position to place a piece: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square) && valid_integer?(square)
    prompt MESSAGES['valid_choice']
  end

  brd[square] = PLAYER_MARKER
end

def choose_random_square(brd)
  empty_squares(brd).sample
end

def find_at_risk_squares(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    # returns keys included in the winning line as an array
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def computer_offense(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_squares(line, brd, COMPUTER_MARKER)
    break if square
  end
  square
end

# find an empty square on a winning line with 2 player markers and one empty
def computer_defense(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_squares(line, brd, PLAYER_MARKER)
    break if square
  end
  square
end

def computer_places_piece!(brd)
  square = if computer_offense(brd)
             computer_offense(brd)
           elsif computer_defense(brd)
             computer_defense(brd)
           else
             choose_random_square(brd)
           end

  brd[square] = COMPUTER_MARKER
end

def empty_squares(brd)
  # returns an array of keys that have empty spaces
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def board_full?(brd)
  # returns a boolean value
  empty_squares(brd).empty?
end

# detect winner for each round
def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == WINNING_NUMBER
      return "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == WINNING_NUMBER
      return "Computer"
    end
  end
  nil
end

def game_won?(brd)
  !!detect_winner(brd)
end

def game_over?(brd)
  game_won?(brd) || board_full?(brd)
end

# PLAY GAME
def play_game!(brd, current_player)
  loop do
    display_board(brd)
    # current player makes move
    place_piece!(brd, current_player)
    # change current player
    current_player = alternate_player(current_player)
    break if game_over?(brd)
  end
end

def update_score(score, brd)
  if detect_winner(brd) == "Player"
    score[:player] += 1
  elsif detect_winner(brd) == "Computer"
    score[:computer] += 1
  end
end

def display_score(score, game)
  prompt("** Set ##{game} - Player: #{score[:player]}. "\
   "Computer: #{score[:computer]} **")
end

def ultimate_winner?(score)
  score[:player] == MAX_SCORE || score[:computer] == MAX_SCORE
end

def display_champion(score)
  if score[:player] == MAX_SCORE
    prompt MESSAGES['player_winner']
  elsif score[:computer] == MAX_SCORE
    prompt MESSAGES['computer_winner']
  else
    prompt "The set is tied!"
  end
end

def play_again?
  answer = ''
  loop do
    prompt MESSAGES['rematch']
    answer = gets.chomp
    break if ['n', 'no', 'y', 'yes'].include?(answer)
    prompt MESSAGES['valid_choice']
  end
  ['y', 'yes'].include?(answer)
end
# MAIN GAME
# =========================================================

# Game starts here
new_round

loop do
  score = { player: 0, computer: 0 }
  current_player = decide_current_player
  game = 1

  # play game - round of 5 games
  loop do
    board = initialize_board
    play_game!(board, current_player)

    update_score(score, board)
    display_score(score, game)
    game += 1

    break if ultimate_winner?(score)
  end

  # display ultimate winner
  display_champion(score)

  break unless play_again?
end

system 'clear'
prompt MESSAGES['goodbye']

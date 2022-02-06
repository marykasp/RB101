require 'pry-byebug'
# CONSTANTS
# =========================================================
INITIAL_MARKER = " "
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
GAME = 5

GREETING= <<-MSG
***** Welcome to tic tac toe! *****
Your mark is 'X'. The first player to get to 5 wins, is the champion.

If you've never played before type 'help' for game rules.
If you're ready press 'Enter'.
MSG

RULES = <<-MSG
--------
Tic Tac Toe is a 2 player game played on a 3x3 board. Each player takes a turn and marks a square on the board. First player to reach 3 squares in a row, including diagonals, wins. If all 9 squares are marked and no player has 3 squares in a row, then the game is a tie. You #{PLAYER_MARKER} will be playing the computer #{COMPUTER_MARKER}.

The first to 5 games is the ultimate winner! Have fun playing!
--------
MSG

BOARD_DESIGN = <<-MSG
Squares are numbered 1 - 9 from left to right and in descending rows

                      1 | 2 | 3
                      --+---+--
                      4 | 5 | 6
                      --+---+--
                      7 | 8 | 9
MSG

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals
# WINNING_LINES = [
#   %w(1 2 3),
#   %w(4 5 6),
#   %w(7 8 9),
#   %w(1 4 7),
#   %w(2 5 8),
#   %w(3 6 9),
#   %w(1 5 9),
#   %w(3 5 7)
# ]

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

def empty_squares(brd)
  # returns an array of keys that have empty spaces
  brd.keys.select { |num| brd[num] == INITIAL_MARKER}
end

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

def place_piece!(brd, current_player, player_choices, computer_choices)
  if current_player == 'player'
    square = user_move(brd)
    player_places_piece!(brd, square)
    update_player_squares!(brd, square, player_choices)
  elsif current_player == 'computer'
    computer_places_piece!(brd)
  end
end

def user_move(brd)
  square = ''
  loop do
    prompt "Choose a position to place a piece: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Please choose a valid square choice"
  end

  square
end

def player_places_piece!(brd, square)
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def update_player_squares!(brd, choice, player_squares)
    player_squares << choice
    player_squares.sort!
end

def board_full?(brd)
  # returns a boolean value
  empty_squares(brd).empty?
end

# detect winner for each round
def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end

  nil
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def update_score(score, brd)
  if detect_winner(brd) == "Player"
    score[:player] += 1
  elsif detect_winner(brd) == "Computer"
    score[:computer] += 1
  end
end

def display_score(score, set)
  prompt "** Set ##{set} - Player: #{score[:player]}, Computer: #{score[:computer]} **"
end

def determine_champion(score)
  if score[:player] > score[:computer]
    return 'Player'
  elsif score[:computer] > score[:player]
    return 'Computer'
  else
    prompt "The set is tied!"
  end
end

# MAIN GAME
# =========================================================

# Game starts here
# Score needs initialize before main loop
new_round
loop do
  score = { :player => 0, :computer => 0 }
  game = 1

  while score[:player] < GAME && score[:computer] < GAME
    board = initialize_board
    current_player = decide_current_player
    player_squares = []
    computer_squares = []

    loop do
      display_board(board)
      place_piece!(board, current_player, player_squares, computer_squares)
      current_player = alternate_player(current_player)

      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      system 'clear'
      update_score(score, board)
      display_score(score, game)
      # puts "#{player_squares}"
    elsif board_full?(board)
      prompt "It's a tie!"
    end
    # update set number on
    game += 1
  end


  # display the champion of the matches
  prompt "#{determine_champion(score)} is the champion!"

  prompt "Rematch? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

system 'clear'
prompt "Thanks for playing Tic Tac Toe! Good bye!"
